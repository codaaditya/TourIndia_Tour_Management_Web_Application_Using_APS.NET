using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebApplication11.Admin
{
    public partial class ViewUsers : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string s = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            connection();
            fillgrid();
        }

        void connection()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        void fillgrid()
        {
            connection();
            da = new SqlDataAdapter("select * from tour_users", con);
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_Delete")
            {
                connection();
                int id = Convert.ToInt16(e.CommandArgument);
                cmd = new SqlCommand("DELETE FROM tour_users WHERE Id='" + id + "'", con);
                cmd.ExecuteNonQuery();
            }
        }
    }
}