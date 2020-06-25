using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iPrepMgmt
{
    public partial class InnovativePoly : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            Session.RemoveAll();


            if (Response.Cookies["ASP.Net_SessionId"] != null)
            {
                Response.Cookies["ASP.NET_SessionId"].Value = string.Empty; 
                Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddMonths(-20); 
            }
            if (Response.Cookies["AuthToken"] != null)
            {
                Response.Cookies["AuthToken"].Value = string.Empty;
                Response.Cookies["AuthToken"].Expires = DateTime.Now.AddMonths(-20);
            }
        }
    }
}