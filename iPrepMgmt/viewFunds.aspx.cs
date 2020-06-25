using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace iPrepMgmt
{
    public partial class viewFunds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindfunds();
            }
        }
        protected void startDate_SelectionChanged(object sender, EventArgs e)
        {
            txtStartDate.Text = startDate.SelectedDate.ToShortDateString();
        }

        protected void endDate_SelectionChanged(object sender, EventArgs e)
        {
            txtEndDate.Text = endDate.SelectedDate.ToShortDateString();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DBConnection dbCon = new DBConnection();
            SqlConnection con = dbCon.GetConnection();

            if (Page.IsValid)
            {
                string strCommandText = "INSERT INTO FUNDS ( Amount, Start_Date, End_Date, Year,Comments)";
                strCommandText += "VALUES (@AMT,@Start_Date,@End_Date,@Year,@Comments);";


                string start = DateTime.Parse(startDate.SelectedDate.ToShortDateString()).ToString("MM/dd/yyyy hh:mm tt");
                string end = DateTime.Parse(endDate.SelectedDate.ToShortDateString()).ToString("MM/dd/yyyy hh:mm tt");

                SqlCommand cmd = new SqlCommand(strCommandText, con);
                cmd.Parameters.AddWithValue("@AMT", this.txtAmt.Text);
                cmd.Parameters.AddWithValue("@Start_Date", start);
                cmd.Parameters.AddWithValue("@End_Date", end);
                cmd.Parameters.AddWithValue("@Year", this.txtYear.Text);
                cmd.Parameters.AddWithValue("@Comments", this.txtComments.Text);

                //SqlCommand cmd = new SqlCommand(strCommandText, con);
                //cmd.Parameters.AddWithValue("@AMT", this.txtAmt.Text);
                //cmd.Parameters.AddWithValue("@Start_Date", this.startDate.SelectedDate.ToShortDateString());
                //cmd.Parameters.AddWithValue("@End_Date", this.endDate.SelectedDate.ToShortDateString());
                //cmd.Parameters.AddWithValue("@Year", this.txtYear.Text);
                //cmd.Parameters.AddWithValue("@Comments", this.txtComments.Text);

                con.Open();
                int result = cmd.ExecuteNonQuery();
                lblResult.Text = "Record sucessfully inserted!";
                

                txtAmt.Text = "";
                txtYear.Text = "";
                txtComments.Text = "";

                startDate.SelectedDates.Clear();
                endDate.SelectedDates.Clear();
                txtStartDate.Text = "";
                txtEndDate.Text = "";


                bindfunds();
                con.Close();
            }
            //try
            //{
            //    string strCommandText = "INSERT INTO FUNDS ( AMT, Start_Date, End_Date, Year,Comments)";
            //    strCommandText += "VALUES (@AMT,@Start_Date,@End_Date,@Year,@Comments);";

            //    SqlCommand cmd = new SqlCommand(strCommandText, con);
            //    cmd.Parameters.AddWithValue("@AMT", this.txtAmt.Text);
            //    cmd.Parameters.AddWithValue("@Start_Date", this.startDate.SelectedDate.ToShortDateString());
            //    cmd.Parameters.AddWithValue("@End_Date", this.endDate.SelectedDate.ToShortDateString());
            //    cmd.Parameters.AddWithValue("@Year", this.txtYear.Text);
            //    cmd.Parameters.AddWithValue("@Comments", this.txtComments.Text);

            //    con.Open();
            //    int result = cmd.ExecuteNonQuery();
            //    lblResult.Text = "Record sucessfully inserted";


            //}
            //catch (Exception ex)
            //{
            //    lblResult.Text = ex.Message.ToString();
            //}
            //finally
            //{
            //    txtAmt.Text = "";
            //    txtYear.Text = "";

            //    bindfunds();
            //    con.Close();

            //}
        }

        private void bindfunds()
        {
            DBConnection dbCon = new DBConnection();
            SqlConnection con = dbCon.GetConnection();


            string strCommandText = "SELECT * FROM FUNDS";
            SqlCommand cmd = new SqlCommand(strCommandText, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dtfunds = new DataTable();
            sda.Fill(dtfunds);
            fundRepeater.DataSource = dtfunds;
            fundRepeater.DataBind();


        }


        protected void fundRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            if (e.CommandName == "edit")
            {

                Session["FID"] = e.CommandArgument.ToString();
                Response.Redirect("fundAllocation.aspx");
            }


        }

    }
}