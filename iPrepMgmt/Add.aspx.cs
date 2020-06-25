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
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
            con.Open();
            SqlCommand cmd1 = new SqlCommand("INSERT INTO Programme_Funding(FAID, Comments, Staff_In_Charge, Sub_Prog_Code, ClaimPerPax, NoOfPax) values(@faid, @comments, @staffincharge, @subprogcode,@claimperpax, @noofpax)", con);
            cmd1.Parameters.AddWithValue("@faid", ddl_fundallocation.Text);
            cmd1.Parameters.AddWithValue("@comments", TextArea1.InnerText.ToString());
            cmd1.Parameters.AddWithValue("@staffincharge", ddl_staff.Text);
            cmd1.Parameters.AddWithValue("@subprogcode", ddl_progcode.Text);
            cmd1.Parameters.AddWithValue("@claimperpax", tb_claimperpax.Text);
            cmd1.Parameters.AddWithValue("@noofpax", tb_noofpax.Text);
            cmd1.ExecuteNonQuery();
            cmd1.Parameters.Clear();



            //SqlCommand cmd2 = new SqlCommand("INSERT INTO Staff(Name) values(@name)");
            //cmd2.Parameters.AddWithValue("@name", tb_staff.Text);
            //cmd2.ExecuteNonQuery();
            //cmd2.Parameters.Clear();

            //SqlCommand cmd3 = new SqlCommand("INSERT INTO Sub_Prog_Code(ID) values(@id)");
            //cmd3.Parameters.AddWithValue("@id", ddl_progcode.Text);
            //cmd3.ExecuteNonQuery();
            //cmd3.Parameters.Clear();


            Response.Redirect("View.aspx");



        }

    }
}