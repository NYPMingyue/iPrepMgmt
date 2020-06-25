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
    public partial class StudentLoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click (object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\Admin\Desktop\iPrepMgmt\iPrepMgmt\App_Data\iPrepMgmt.mdf; Integrated Security = True");
            SqlCommand cmd = new SqlCommand("select * from Student where SID=@SID and PIN=@PIN", con);
            cmd.Parameters.AddWithValue("@SID", TextBox_user_name.Text);
            cmd.Parameters.AddWithValue("PIN", TextBox_password.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (dt.Rows.Count > 0)
            {
                Session["id"] = TextBox_user_name.Text;

                //create a new GUID and save into the session
                string guid = Guid.NewGuid().ToString();
                Session["AuthToken"] = guid;

                //now create a new cookie w this guid value
                Response.Cookies.Add(new HttpCookie("AuthToken", guid));

                Response.Redirect("AfterLoginStudent.aspx");
                //Session.RemoveAll();


            }
            else
            {
                Label1.Text = "Invalid input. Please try again!";
                Label1.ForeColor = System.Drawing.Color.Red;
            }


        }
    }
}