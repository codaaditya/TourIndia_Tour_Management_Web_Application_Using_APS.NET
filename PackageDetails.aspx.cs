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
    public partial class PackageDetails : System.Web.UI.Page
    {
        Class1 cs;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            connection();
            display();

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
        void display()
        {
            if (Convert.ToInt16(Request.QueryString["Id"]) != 0)
            {
                connection();
                da = new SqlDataAdapter("SELECT * FROM TourPackages WHERE Id=" + Request.QueryString["Id"], cs.startcon());
                ds = new DataSet();
                da.Fill(ds);
                dlTourPackage.DataSource = ds;
                dlTourPackage.DataBind();
            }
        }

        void addtocart()
        {
            connection();
            if (Convert.ToInt32(Request.QueryString["Id"]) != 0)
            {
                int packageId = Convert.ToInt32(Request.QueryString["Id"]);
                string userId = Session["UserId"]?.ToString();

                if (userId == null)
                {
                    Response.Redirect("Login.aspx");
                }
                if (packageId > 0)
                {
                    cmd = new SqlCommand("SELECT PackageName, NoOfPerson, AdultAmount,TourDate,ImagePath FROM TourPackages WHERE Id='" + packageId + "'", cs.startcon());
                  
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        string packageName = reader["PackageName"].ToString();
                        int noOfPerson = Convert.ToInt32(reader["NoOfPerson"]);
                        decimal totalPrice = Convert.ToDecimal(reader["AdultAmount"]);
                        string tourDate = reader["TourDate"].ToString();
                        string imagePath = reader["ImagePath"].ToString();
                        cmd = new SqlCommand("insert into addtocart (User_Id,Package_Id,Package_info,NoOfPerson,TotalPrice,PackageImage,TourDate) values ('" + userId + "','" + packageId + "','" + packageName + "','" + noOfPerson + "','" + totalPrice + "','"+imagePath+"','"+tourDate+"')", cs.startcon());
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Package in Cart Successfully";
                    }
                    Response.Redirect("AddToCart.aspx");
                }
            }
        }

        
        void BookNow()
        {
            connection();
            if (Convert.ToInt32(Request.QueryString["Id"]) != 0)
            {
                int packageId = Convert.ToInt32(Request.QueryString["Id"]);
                string userId = Session["UserId"]?.ToString();
                if (userId == null)
                {
                    Response.Redirect("Login.aspx");
                }
                if (packageId > 0)
                {
                    cmd = new SqlCommand("SELECT PackageName, NoOfPerson, AdultAmount,TourDate,ImagePath FROM TourPackages WHERE Id='" + packageId + "'", cs.startcon());
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        string packageName = reader["PackageName"].ToString();
                        int noOfPerson = Convert.ToInt32(reader["NoOfPerson"]);
                        //decimal totalPrice = Convert.ToDecimal(reader["AdultAmount"]);
                        string totalPrice = reader["AdultAmount"].ToString();

                        string tourDate = reader["TourDate"].ToString();
                        string imagePath = reader["ImagePath"].ToString();

                        cmd = new SqlCommand("insert into Booking (User_Id,Package_Id,Package_info,NoOfPerson,TourDate,TotalPrice,PackageImage) values ('" + userId + "','" + packageId + "','" + packageName + "','" + noOfPerson + "','" + tourDate +"','" + totalPrice + "','" + imagePath + "')", cs.startcon());
                        cmd.ExecuteNonQuery();
                        lblMessage.Text = "Package is Book Successfully";

                        //Response.Redirect($"Payment.aspx?PackageName={Server.UrlEncode(packageName)}&AdultAmount={Server.UrlEncode(totalPrice)}");

                        Response.Redirect("Payment.aspx?PackageName=" + packageName + "&NoOfPerson=" + noOfPerson + "&AdultAmount=" + totalPrice + "&TourDate=" + tourDate + "&ImagePath=" + imagePath );

                    }
                    //Response.Redirect("PackageBooking.aspx");
                }
            }
        }


        protected void dlTourPackage_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                addtocart();
                //int packageId = Convert.ToInt32(e.CommandArgument);
                //Response.Redirect("AddToCart.aspx?Id=" + packageId);
            }
            else if (e.CommandName == "BookPackage")
            {
                BookNow();
                //int packageId = Convert.ToInt32(e.CommandArgument);
                //Response.Redirect("Booking.aspx?Id=" + packageId);
            }
        }

        protected void dlTourPackage_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}