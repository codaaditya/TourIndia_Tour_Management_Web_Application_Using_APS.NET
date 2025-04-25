using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication11
{
    
    public partial class AddToCart : System.Web.UI.Page
    {
        Class1 cs;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                connection();
                loadcart();

            }
            //connection();
            //loadcart();

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

        void connection()
        {
            cs = new Class1();
            cs.startcon();
        }

        void loadcart()
        {
            connection();
            string userId = Session["UserId"]?.ToString();
            if (userId != null)
            {
                da = new SqlDataAdapter("SELECT * FROM addtocart WHERE User_Id='" + userId + "'", cs.startcon());
                ds = new DataSet();
                da.Fill(ds);
                dlCartPackages.DataSource = ds;
                dlCartPackages.DataBind();
            }
        }


        protected void dlCartPackages_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                connection();
                int cartId = Convert.ToInt32(e.CommandArgument);
                SqlCommand cmd = new SqlCommand("DELETE FROM addtocart WHERE Cart_Id=" + cartId, cs.startcon());
                cmd.ExecuteNonQuery();
                loadcart();
            }else if(e.CommandName== "BookPackage")
            {
                connection();
                int cartId = Convert.ToInt32(e.CommandArgument);
                cmd = new SqlCommand("SELECT User_Id, Package_Id, Package_info, NoOfPerson, TotalPrice,TourDate,PackageImage FROM addtocart WHERE Cart_Id='" + cartId + "'", cs.startcon());
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string userId = reader["User_Id"].ToString();
                    string packageId = reader["Package_Id"].ToString();
                    string packageName = reader["Package_info"].ToString();
                    string noOfPerson = (reader["NoOfPerson"]).ToString();
                    //decimal totalPrice = Convert.ToDecimal(reader["AdultAmount"]);
                    string totalPrice = reader["TotalPrice"].ToString();
                    string tourDate = reader["TourDate"].ToString();
                    string imagePath = reader["PackageImage"].ToString();


                    cmd = new SqlCommand("insert into Booking (User_Id,Package_Id,Package_info,NoOfPerson,TourDate,TotalPrice,PackageImage) values ('" + userId + "','" + packageId + "','" + packageName + "','" + noOfPerson + "','" + tourDate + "','" + totalPrice + "','" + imagePath + "')", cs.startcon());
                    cmd.ExecuteNonQuery();
                    


                    Response.Redirect("Payment.aspx?PackageName=" + packageName + "&NoOfPerson=" + noOfPerson + "&AdultAmount=" + totalPrice + "&TourDate=" + tourDate + "&ImagePath=" + imagePath);
                }
                //Response.Redirect("PackageBooking.aspx");

            }
        }

        protected void btnBookAll_Click(object sender, EventArgs e)
        {
           /* connection();
            if (Session["UserId"] != null)
            {
                da = new SqlDataAdapter("SELECT * FROM addtocart WHERE User_Id=" + Session["UserId"], cs.startcon());
                ds = new DataSet();
                da.Fill(ds);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    string tourDate = Convert.ToDateTime(dr["tourDate"]).ToString("yyyy-MM-dd");

                    cmd = new SqlCommand("INSERT INTO Booking (User_Id, Package_Id, Package_info, NoOfPerson, TourDate, TotalPrice, PackageImage) " +
                                         "VALUES (" + Session["UserId"] + ", " + dr["package_Id"] + ", '" + dr["Package_info"] + "', " + dr["NoOfPerson"] + ", '" + tourDate + "'," + dr["totalPrice"] + ", '" + dr["PackageImage"] + "')", cs.startcon());
                    cmd.ExecuteNonQuery();
                }
                Response.Redirect("PackageBooking.aspx");
            }*/
        }

    }
}