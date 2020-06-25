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
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
                BindProgrammeFunding();
        }

        protected void BindProgrammeFunding()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            con.Open();
            string query = "SELECT * FROM Programme_Funding";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Connection = con;
            SqlDataReader rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton1");
                lb.Attributes.Add("onclick", "return confirm('Are you sure you want to delete this ?');");

            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindProgrammeFunding();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindProgrammeFunding();

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lbl = GridView1.Rows[e.RowIndex].FindControl("Label6") as Label;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "DELETE FROM Programme_Funding WHERE Staff_In_Charge=@id";
            cmd.Parameters.AddWithValue("@id", lbl.Text);
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            BindProgrammeFunding();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label pid = GridView1.Rows[e.RowIndex].FindControl("lblpid") as Label;
            DropDownList faid = GridView1.Rows[e.RowIndex].FindControl("DropDownList2") as DropDownList;
            DropDownList staff = GridView1.Rows[e.RowIndex].FindControl("DropDownList1") as DropDownList;
            Label comments = GridView1.Rows[e.RowIndex].FindControl("lblcomments") as Label;
            Label progcode = GridView1.Rows[e.RowIndex].FindControl("lblprogcode") as Label;
            TextBox claim = GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
            TextBox noofpax = GridView1.Rows[e.RowIndex].FindControl("TextBox5") as TextBox;

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "UPDATE [Programme_Funding] SET FAID=@faid, Staff_In_Charge=@staff, Comments=@comments, Sub_Prog_Code=@progcode, ClaimPerPax=@claim, NoOfPax=@noofpax WHERE PID=@pid";
            cmd.Parameters.AddWithValue("@pid", pid.Text);
            cmd.Parameters.AddWithValue("@faid", faid.Text);
            cmd.Parameters.AddWithValue("@staff", staff.Text);
            cmd.Parameters.AddWithValue("@comments", comments.Text);
            cmd.Parameters.AddWithValue("@progcode", progcode.Text);
            cmd.Parameters.AddWithValue("@claim", claim.Text);
            cmd.Parameters.AddWithValue("@noofpax", noofpax.Text);
            cmd.Connection = con;
            cmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            BindProgrammeFunding();
            Response.Write("<script>alert('Update Successful!');</script>");


        }
    }
}