using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace WebApplication11
{
    public partial class PackageBooking : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Class1 cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            connect();
            fillBooking();

            if (Session["name"] != null)
            {

                lblUser.Text = Session["name"].ToString();
                pImage.ImageUrl = Session["profileImage"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        void connect()
        {
            cs = new Class1();
            cs.startcon();
        }

        void fillBooking()
        {
            connect();
            string userId = Session["UserId"]?.ToString();
            if (userId != null)
            {
                da = new SqlDataAdapter("SELECT * FROM Booking WHERE User_Id='" + userId + "'", cs.startcon());
                ds = new DataSet();
                da.Fill(ds);
                gvBookingReport.DataSource = ds;
                gvBookingReport.DataBind();
            }
        }
    }
}