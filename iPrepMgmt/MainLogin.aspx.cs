using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using Microsoft.SqlServer.Server;

namespace iPrepMgmt
{
    public partial class MainLogin : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        string str, UserName, Password;
        SqlCommand com;
        SqlDataAdapter sqlda;
        DataTable dt;

        int RowCount;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //string strValue = Page.Request.Form["uid"].ToString();
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "Select * from Account";
            com = new SqlCommand(str);
            sqlda = new SqlDataAdapter(com.CommandText, con);
            dt = new DataTable();
            sqlda.Fill(dt);
            RowCount = dt.Rows.Count;


            for (int i = 0; i < RowCount; i++)

            {

                UserName = dt.Rows[i]["UserName"].ToString();

                Password = dt.Rows[i]["Password"].ToString();

                if (UserName == TextBox_user_name.Text && Password == TextBox_password.Text)

                {
                    Session["id"] = UserName;

                    if (dt.Rows[i]["Role"].ToString() == "Admin")

                        Response.Redirect("AfterLoginAdmin.aspx", false);

                    else if (dt.Rows[i]["Role"].ToString() == "Staff")

                        Response.Redirect("AfterLoginStaff.aspx", false);

                    //else if (dt.Rows[i]["Role"].ToString() == "PaidUser")

                    //    Response.Redirect("~/PaidUser/PaidUser.aspx");

                    //create a new GUID and save into the session
                    string guid = Guid.NewGuid().ToString();
                    Session["AuthToken"] = guid;

                    //now create a new cookie w this guid value 
                    Response.Cookies.Add(new HttpCookie("AuthToken", guid));


                }
                else
                {
                    Label1.Text="Invalid input. Please try again!";
                }

            }
        }
    }
}