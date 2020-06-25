using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.ComponentModel;
using System.Security.Claims;

namespace iPrepMgmt
{
    public partial class CoursesUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tb_cid.Text = (String)Session["CID"];
                tb_pfid.Text = (String)Session["PFID"];
                tb_startdate.Text = (String)Session["Start"];
                tb_enddate.Text = (String)Session["EndDate"];
                tb_title.Text = (String)Session["Title"];
                tb_price.Text = (String)Session["PricePerPax"];
                tb_claim.Text = (String)Session["Claim"];
                tb_noofpax.Text = (String)Session["NoOfPax"];
                tb_status.Text = (String)Session["Status"];
                tb_lastaction.Text = (String)Session["DateLastAction"];
                ddl_exam.Text = (String)Session["Exam"];
                ddl_preapproved.Text = (String)Session["PreApproved"];
                ta_comments.InnerText = (String)Session["Comments"];

            }

        }
        protected void btn_update_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "UPDATE [Courses] SET PFID=@pfid, Start=@start, EndDate=@end, Title=@title, PricePerPax=@pax, Claim=@claim,NoOfPax=@noofpax, Status=@status, Date_Last_Action=@lastaction,Exam=@exam," +
                "PreApproved=@approved, Comments=@comments WHERE CID=@cid";
            cmd.Parameters.AddWithValue("cid", tb_cid.Text);
            cmd.Parameters.AddWithValue("@pfid", tb_pfid.Text);
            cmd.Parameters.AddWithValue("@start", tb_startdate.Text);
            cmd.Parameters.AddWithValue("@end", tb_enddate.Text);
            cmd.Parameters.AddWithValue("@title", tb_title.Text);
            cmd.Parameters.AddWithValue("@pax", tb_price.Text);
            cmd.Parameters.AddWithValue("@claim", tb_claim.Text);
            cmd.Parameters.AddWithValue("@noofpax", tb_noofpax.Text);
            cmd.Parameters.AddWithValue("@status", tb_status.Text);
            cmd.Parameters.AddWithValue("@lastaction", tb_lastaction.Text);
            cmd.Parameters.AddWithValue("@exam", ddl_exam.Text);
            cmd.Parameters.AddWithValue("@approved", ddl_preapproved.Text);
            cmd.Parameters.AddWithValue("@comments", ta_comments.InnerText);
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Update Successful!');</script>");
            Response.Redirect("CoursesView.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CoursesView.aspx");
        }

    }
}