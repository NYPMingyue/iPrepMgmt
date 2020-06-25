using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iPrepMgmt
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["id"] != null && Session["AuthToken"] != null && Request.Cookies["AuthToken"] != null)
            //{
            //    if (!Session["AuthToken"].ToString().Equals(Request.Cookies["AuthToken"].Value))
            //    {
            //        Response.Redirect("Home.aspx", false);

            //    }
            //}
            //else
            //{
            //    Label1.Text = "Hello " + Session["id"].ToString();
            //}

            if (Session["id"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                Label1.Text = "Welcome Back, " + Session["id"].ToString();



            }
        }

    }
}