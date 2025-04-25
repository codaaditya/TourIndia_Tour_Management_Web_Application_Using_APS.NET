using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication11
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            /*  if (Session["name"] != null)
              {

                  lblUser.Text = Session["name"].ToString();
                  pImage.ImageUrl = Session["profileImage"].ToString();
              }
              else
              {
                  Response.Redirect("Login.aspx");
              }*/
        }
    }
}