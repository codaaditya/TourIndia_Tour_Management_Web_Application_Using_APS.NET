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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (Session["name"] != null)
            {
                
                lblUser.Text = Session["name"].ToString();
                pImage.ImageUrl =Session["profileImage"].ToString();
            }
            /*else
            {
                Response.Redirect("Login.aspx");
            }*/

            connect();

            if (!IsPostBack)
            {
                fillpackages();
            }
        }


        void connect()
        {
            con = new SqlConnection(strcon);
            con.Open();

        }

        void fillpackages()
        {
            connect();
            string query = "SELECT TOP 6 ImagePath, PackageName, TouristPlaces, NoOfDays, NoOfPerson, Description, AdultAmount, ChildAmount, Id FROM TourPackages";

            da = new SqlDataAdapter(query, con);
            ds = new DataSet();
            da.Fill(ds);
            rptPackages.DataSource = ds;
            rptPackages.DataBind();
        }


        protected void rptPackages_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectPackage")
            {
                int packageId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("PackageDetails.aspx?Id=" + packageId);
            }

        }
    }
}