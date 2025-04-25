using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication11.Admin
{
    public partial class BookingDetails : System.Web.UI.Page
    {
        Class2 cs;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            connection();
            bookingdetails();
        }

        void connection()
        {
            cs = new Class2();
            cs.StartCon();
        }

        void bookingdetails()
        {
            
            connection();
            da = new SqlDataAdapter("select * from Booking", cs.StartCon());
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
                cmd = new SqlCommand("DELETE FROM Booking WHERE Booking_Id='" + id + "'", cs.StartCon());
                cmd.ExecuteNonQuery();
            }
        }
    }
}