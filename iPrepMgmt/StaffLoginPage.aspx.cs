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
    public partial class StaffLoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\Admin\Desktop\iPrepMgmt\iPrepMgmt\App_Data\iPrepMgmt.mdf; Integrated Security = True");
            SqlCommand cmd = new SqlCommand("select * from Account where UserID=@UserID and Password=@Password", con);
            cmd.Parameters.AddWithValue("@UserID", TextBox1.Text);
            cmd.Parameters.AddWithValue("Password", TextBox2.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (dt.Rows.Count > 0)
            {
                Session["id"] = TextBox1.Text;
                Response.Redirect("AfterLoginStaff.aspx");
                Session.RemoveAll();
            }
            else
            {
                Label1.Text = "You're username or word is incorrect";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
        }



    }
    }