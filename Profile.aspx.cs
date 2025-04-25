using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication11
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblFullName.Text = Session["name"].ToString();
                lblPhone.Text = Session["mobile"].ToString();
                lblEmail.Text = Session["email"].ToString();
                lblGender.Text = Session["gender"].ToString();
                lblState.Text = Session["state"].ToString();
                lblCity.Text = Session["city"].ToString();
                lblCode.Text = Session["postalCode"].ToString();
                lblTouristPlaces.Text = Session["touristPlaces"].ToString();
                imgProfilePic.ImageUrl=Session["profileImage"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

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

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}