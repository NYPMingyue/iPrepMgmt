using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Schema;

namespace iPrepMgmt
{
    public partial class fundAllocation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                if (Session["FID"] != null)
                {
                    if (!IsPostBack)
                    {

                        getAmount();
                        BindProductDetails();

                        editRepeater.Visible = false;

                        btnBack.Visible = false;
                        btnAdd.Visible = false;
                    }
                }
                else
                {
                    Response.Redirect("~/viewFunds.aspx");
                }
            }
        }
        private void BindProductDetails()
        {
            DBConnection dbCon = new DBConnection();
            SqlConnection con = dbCon.GetConnection();

            Int64 FID = Convert.ToInt64(Session["FID"]);


            string strCommandText = "select * from Funds_Allocation  where FID = @FID";

            SqlCommand cmd = new SqlCommand(strCommandText, con);
            cmd.Parameters.AddWithValue("@FID", FID);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dtfunds = new DataTable();
            sda.Fill(dtfunds);
            editRepeater.DataSource = dtfunds;
            editRepeater.DataBind();

            faidRepeater.DataSource = dtfunds;
            faidRepeater.DataBind();



        }


        private void getAmount()
        {
            DBConnection dbCon = new DBConnection();
            SqlConnection con = dbCon.GetConnection();

            Int64 FID = Convert.ToInt64(Session["FID"]);


            string strCommandText = "select * from Funds where FID = @FID";

            SqlCommand cmd = new SqlCommand(strCommandText, con);
            cmd.Parameters.AddWithValue("@FID", FID);


            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            reader.Read();


            string year = reader["Year"].ToString();
            lblyear.Text = "Year : " + year;

            int total = Convert.ToInt32(reader["Amount"]);
            lblamount.Text = "Total amount : $" + total.ToString();
            lblstore.Text = total.ToString();


            con.Close();
            con.Open();
            SqlCommand cmd2 = new SqlCommand("select SUM(Amt) from Funds_Allocation where FID = @FID", con);
            cmd2.Parameters.AddWithValue("@FID", FID);

            string totalAllocated = cmd2.ExecuteScalar().ToString();
            lblAllocated.Text = "Allocated amount: $" + totalAllocated;

            decimal n1 = 0;
            try
            {
                n1 = decimal.Parse(totalAllocated);

            }
            catch
            {
                n1 = 0;
                decimal remainder = total - n1;
                lblUnallocated.Text = "Unallocated Amount : $" + remainder.ToString();
            }
            finally
            {

                decimal remainder = total - n1;
                lblUnallocated.Text = "Unallocated Amount : $" + remainder.ToString();

            }
        }


        protected void faidRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            faidRepeater.Visible = false;
            btnEdit.Visible = false;
            btnBack1.Visible = false;

            editRepeater.Visible = true;
            btnBack.Visible = true;
            btnAdd.Visible = true;


        }


        protected void editRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            DBConnection dbCon = new DBConnection();
            SqlConnection con = dbCon.GetConnection();

            if (e.CommandName == "update")
            {

                TextBox txtDesc = e.Item.FindControl("txtDesc") as TextBox;
                String Description = txtDesc.Text;


                TextBox txtAmt = e.Item.FindControl("txtAmt") as TextBox;
                string amt = txtAmt.Text;
                int Amount = int.Parse(amt);

                string FAID = e.CommandArgument.ToString();
                int FAID1 = Convert.ToInt32(FAID);

                decimal totalFAID = 0;

                foreach (RepeaterItem item in editRepeater.Items)
                {

                    TextBox Te = (TextBox)item.FindControl("txtAmt");
                    string re = Te.Text;
                    try
                    {
                        totalFAID += Convert.ToDecimal(re);
                    }
                    catch
                    {
                        totalFAID = 0;
                    }

                }


                decimal totalFID = Convert.ToInt32(lblstore.Text);
                if (totalFAID > totalFID)
                {


                    decimal difference = System.Math.Abs(totalFID - totalFAID);

                    lblerror.Text = "Amount exceeded by $" + difference + "<br />" + "Please enter a valid amount.";

                }

                else
                {


                    try
                    {
                        updateDB(FAID1, Description, Amount);
                    }


                    catch (Exception ex)
                    {
                        lblresult.Text = ex.Message.ToString();
                    }
                    finally
                    {
                        getAmount();
                        btnAdd.Visible = true;
                        BindProductDetails();
                        con.Close();

                        Response.Redirect(Request.RawUrl);

                        //    decimal total = 0;

                    }
                }


            }


            else if (e.CommandName == "delete")
            {
                try
                {
                    string delete = e.CommandArgument.ToString();
                    int del = Convert.ToInt32(delete);



                    string strCommandText = "DELETE Funds_Allocation WHERE FAID = @del";

                    SqlCommand cmd = new SqlCommand(strCommandText, con);
                    cmd.Parameters.AddWithValue("@del", del);

                    con.Open();
                    int result = cmd.ExecuteNonQuery();

                }

                catch (Exception ex)
                {
                    lblresult.Text = ex.Message.ToString();
                }
                finally
                {
                    getAmount();
                    con.Close();
                    BindProductDetails();
                    faidRepeater.Visible = false;
                    editRepeater.Visible = true;
                    lblresult.Text = "Row deleted";
                }
            }
        }
        private void updateDB(int FAID, string Desc, int Amt)
        {
            DBConnection dbCon = new DBConnection();
            SqlConnection con = dbCon.GetConnection();

            string strCommandText = "UPDATE Funds_Allocation SET Pro_Desc=@Pro_Desc,Amt=@Amt WHERE FAID=@FAID";
            SqlCommand cmd = new SqlCommand(strCommandText, con);
            cmd.Parameters.AddWithValue("@FAID", FAID);
            cmd.Parameters.AddWithValue("@Amt", Amt);
            cmd.Parameters.AddWithValue("@Pro_Desc", Desc);

            cmd.Connection.Open();

            int result = cmd.ExecuteNonQuery();

        }




        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("fundAllocation.aspx");
        }



        protected void btnBack1_Click(object sender, EventArgs e)
        {
            Session["FID"] = null;
            Response.Redirect("~/viewFunds.aspx");
        }

        protected void btn_Submit(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DBConnection dbCon = new DBConnection();
            SqlConnection con = dbCon.GetConnection();

            try
            {
                string strCommandText = "INSERT INTO Funds_Allocation (FID,Amt,Pro_Desc)";
                strCommandText += "VALUES (@FID,@Amt,@Desc);";

                SqlCommand cmd = new SqlCommand(strCommandText, con);
                cmd.Parameters.AddWithValue("@FID", Session["FID"]);
                cmd.Parameters.AddWithValue("@Amt", 0);
                cmd.Parameters.AddWithValue("@Desc", " ");

                con.Open();
                int result = cmd.ExecuteNonQuery();
                lblresult.Text = "Row Added";

            }
            catch (Exception ex)
            {
                lblresult.Text = ex.Message.ToString();
            }
            finally
            {

                con.Close();

                editRepeater.Visible = true;
                BindProductDetails();
                btnAdd.Visible = false;
            }
        }

    }
}