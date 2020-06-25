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
    public partial class CoursesView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
                BindCourses();

        }
        protected void BindCourses()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            con.Open();
            string query = "SELECT * FROM Courses";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Connection = con;
            SqlDataReader rd = cmd.ExecuteReader();
            gv_courses.DataSource = rd;
            gv_courses.DataBind();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CoursesAdd.aspx");
        }



        protected void gv_courses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lbl = gv_courses.Rows[e.RowIndex].FindControl("Label4") as Label;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "DELETE FROM Courses WHERE Title=@id";
            cmd.Parameters.AddWithValue("@id", lbl.Text);
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            BindCourses();
        }

        protected void gv_courses_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_courses.EditIndex = e.NewEditIndex;
            BindCourses();
        }

        protected void gv_courses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_courses.EditIndex = -1;
            BindCourses();

        }

        protected void gv_courses_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label cid = gv_courses.Rows[e.RowIndex].FindControl("Label14") as Label;
            Label pfid = gv_courses.Rows[e.RowIndex].FindControl("Label13") as Label;
            Calendar start = gv_courses.Rows[e.RowIndex].FindControl("Calendar1") as Calendar;
            Calendar end = gv_courses.Rows[e.RowIndex].FindControl("Calendar2") as Calendar;
            TextBox title = gv_courses.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
            TextBox pax = gv_courses.Rows[e.RowIndex].FindControl("TextBox5") as TextBox;
            TextBox claim = gv_courses.Rows[e.RowIndex].FindControl("TextBox6") as TextBox;
            TextBox noofpax = gv_courses.Rows[e.RowIndex].FindControl("TextBox7") as TextBox;
            DropDownList status = gv_courses.Rows[e.RowIndex].FindControl("DropDownList1") as DropDownList;
            Calendar lastaction = gv_courses.Rows[e.RowIndex].FindControl("Calendar3") as Calendar;
            DropDownList exam = gv_courses.Rows[e.RowIndex].FindControl("DropDownList2") as DropDownList;
            DropDownList approved = gv_courses.Rows[e.RowIndex].FindControl("DropDownList3") as DropDownList;
            TextBox comments = gv_courses.Rows[e.RowIndex].FindControl("TextBox12") as TextBox;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["iPrepMgmt"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "UPDATE [Courses] SET PFID=@pfid, Start=@start, EndDate=@end, Title=@title, PricePerPax=@pax, Claim=@claim,NoOfPax=@noofpax, Status=@status, Date_Last_Action=@lastaction,Exam=@exam," +
                "PreApproved=@approved, Comments=@comments WHERE CID=@cid";
            cmd.Parameters.AddWithValue("@cid", cid.Text);
            cmd.Parameters.AddWithValue("@pfid", pfid.Text);
            cmd.Parameters.AddWithValue("@start", start.SelectedDate.ToString("yyyy/MM/dd"));
            cmd.Parameters.AddWithValue("@end", end.SelectedDate.ToString("yyyy/MM/dd"));
            cmd.Parameters.AddWithValue("@title", title.Text);
            cmd.Parameters.AddWithValue("@pax", pax.Text);
            cmd.Parameters.AddWithValue("@claim", claim.Text);
            cmd.Parameters.AddWithValue("@noofpax", noofpax.Text);
            cmd.Parameters.AddWithValue("@status", status.Text);
            cmd.Parameters.AddWithValue("@lastaction", lastaction.SelectedDate.ToString("yyyy/MM/dd"));
            cmd.Parameters.AddWithValue("@exam", exam.Text);
            cmd.Parameters.AddWithValue("@approved", approved.Text);
            cmd.Parameters.AddWithValue("@comments", comments.Text);
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            gv_courses.EditIndex = -1;
            BindCourses();
            Response.Write("<script>alert('Update Successful!');</script>");
        }

        protected void calender1_DayRender(object sender, DayRenderEventArgs e)
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

        protected void calender2_DayRender(object sender, DayRenderEventArgs e)
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

        protected void calender3_DayRender(object sender, DayRenderEventArgs e)
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

        protected void gv_courses_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = gv_courses.SelectedIndex;
            Session["CID"] = gv_courses.DataKeys[index].Values[0].ToString();
            Session["PFID"] = gv_courses.DataKeys[index].Values[1].ToString();
            Session["Start"] = gv_courses.DataKeys[index].Values[2].ToString();
            Session["EndDate"] = gv_courses.DataKeys[index].Values[3].ToString();
            Session["Title"] = gv_courses.DataKeys[index].Values[4].ToString();
            Session["PricePerPax"] = gv_courses.DataKeys[index].Values[5].ToString();
            Session["Claim"] = gv_courses.DataKeys[index].Values[6].ToString();
            Session["NoOfPax"] = gv_courses.DataKeys[index].Values[7].ToString();
            Session["Status"] = gv_courses.DataKeys[index].Values[8].ToString();
            Session["DateLastAction"] = gv_courses.DataKeys[index].Values[9].ToString();
            Session["Exam"] = gv_courses.DataKeys[index].Values[10].ToString();
            Session["PreApproved"] = gv_courses.DataKeys[index].Values[11].ToString();
            Session["Comments"] = gv_courses.DataKeys[index].Values[12].ToString();

            Response.Redirect("~/CoursesUpdate.aspx");

        }

    }
}