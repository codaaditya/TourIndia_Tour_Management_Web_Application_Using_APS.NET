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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        Class1 cs;
        string s = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            connection();
        }
        void connection()
        {
            cs = new Class1();
            cs.startcon();
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            connection();
            cmd= new SqlCommand("select Id,Name,ProfileImage,PhoneNo, Gender, State, City, PostalCode, Place1, Place2, Place3, Place4, Place5 from tour_users where email='" + txtEmail.Text + "' and password='" + txtPassword.Text + "'", cs.startcon());
            SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    string nm = dr["Name"].ToString();
                    string name = nm.Split(' ')[0];
                    Session["name"] = name;
                    Session["UserId"] = dr["Id"].ToString();
                    Session["profileImage"] = dr["ProfileImage"].ToString();
                    Session["email"] = txtEmail.Text;
                    Session["password"] = txtPassword.Text;

                    Session["mobile"] = dr["PhoneNo"].ToString();
                    Session["gender"] = dr["Gender"].ToString();
                    Session["state"] = dr["State"].ToString();
                    Session["city"] = dr["City"].ToString();
                    Session["postalCode"] = dr["PostalCode"].ToString();
                    Session["touristPlaces"] = dr["Place1"].ToString();
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid Email or Password";
                }
        }
          
    }
}