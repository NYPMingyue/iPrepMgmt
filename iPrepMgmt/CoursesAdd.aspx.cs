using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Windows;

namespace iPrepMgmt
{
    public partial class CoursesAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_courses_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("INSERT INTO Courses(PFID, Start, EndDate, Title, PricePerPax,Claim, NoOfPax, Status, Date_Last_Action, Exam, PreApproved, Comments) " +
                "values(@pfid, @start, @end, @title, @claim, @price,@pax, @status, @lastaction, @exam, @approved, @comments)", con);
            cmd1.Parameters.AddWithValue("@pfid", ddl_pid.Text);
            cmd1.Parameters.AddWithValue("@start", c_start.SelectedDate.ToString("MM/dd/yyyy"));
            cmd1.Parameters.AddWithValue("@end", c_end.SelectedDate.ToString("MM/dd/yyyy"));
            cmd1.Parameters.AddWithValue("@title", tb_title.Text);
            cmd1.Parameters.AddWithValue("@claim", tb_claim.Text);
            cmd1.Parameters.AddWithValue("@price", tb_price.Text);
            cmd1.Parameters.AddWithValue("@pax", tb_noofpax.Text);
            cmd1.Parameters.AddWithValue("@status", ddl_status.Text);
            cmd1.Parameters.AddWithValue("@lastaction", c_lastaction.SelectedDate.ToString("MM/dd/yyyy"));
            cmd1.Parameters.AddWithValue("@exam", ddl_exam.Text);
            cmd1.Parameters.AddWithValue("@approved", ddl_preapproved.Text);
            cmd1.Parameters.AddWithValue("@comments", tb_comments.Text);

            cmd1.ExecuteNonQuery();
            cmd1.Parameters.Clear();
            Response.Redirect("CoursesView.aspx");
        }

        protected void c_start_DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime pastday = e.Day.Date;
            DateTime date = DateTime.Now;
            int year = date.Year;
            int month = date.Month;
            int day = date.Day;
            DateTime today = new DateTime(year, month, day);
            if (pastday.CompareTo(today) < 0)
            {
                e.Cell.BackColor = System.Drawing.Color.Gray;
                e.Day.IsSelectable = false;
            }
        }

        protected void c_end_DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime pastday = e.Day.Date;
            DateTime date = DateTime.Now;
            int year = date.Year;
            int month = date.Month;
            int day = date.Day;
            DateTime today = new DateTime(year, month, day);
            if (pastday.CompareTo(today) < 0)
            {
                e.Cell.BackColor = System.Drawing.Color.Gray;
                e.Day.IsSelectable = false;
            }
        }

        protected void c_lastaction_DayRender(object sender, DayRenderEventArgs e)
        {
            DateTime pastday = e.Day.Date;
            DateTime date = DateTime.Now;
            int year = date.Year;
            int month = date.Month;
            int day = date.Day;
            DateTime today = new DateTime(year, month, day);
            if (pastday.CompareTo(today) < 0)
            {
                e.Cell.BackColor = System.Drawing.Color.Gray;
                e.Day.IsSelectable = false;
            }
        }

    }
}