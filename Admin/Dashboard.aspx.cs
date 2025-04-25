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
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlDataAdapter da;
        DataSet ds;
        Class2 cs;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            

            displayBooking();

        }
        void connection()
        {
            cs = new Class2();
            cs.StartCon();
        }

        void displayBooking()
        {
            connection();
            cmd = new SqlCommand("select count(Booking_Id) from Booking", cs.StartCon());
            int totalbookings = Convert.ToInt32(cmd.ExecuteScalar());
            cmd = new SqlCommand("select count(Id) from tour_users", cs.StartCon());
            int registeredUsers = Convert.ToInt32(cmd.ExecuteScalar());
            cmd = new SqlCommand("SELECT SUM(TRY_CAST(TotalPrice AS DECIMAL(18,2))) FROM Booking", cs.StartCon());

            object result = cmd.ExecuteScalar();
            decimal totalPrice = result != DBNull.Value ? Convert.ToDecimal(result) : 0;


            totalBooking.Text = totalbookings.ToString();
            regUsers.Text = registeredUsers.ToString();
            totalrev.Text = "₹"+ totalPrice.ToString();
            
        }
    }
}