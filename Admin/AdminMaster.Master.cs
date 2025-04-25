using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication11.Admin
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (Session["Username"] == null)
            {
                Response.Redirect("Admin.aspx");
            }*/
            /*if (!IsPostBack)
            {
                if (Session["adminuser"] != null)
                {
                    txtAdmin.Text = Session["adminuser"].ToString();
                }
                else
                {
                    Response.Redirect("Admin.aspx");
                }
            }*/
            if (!IsPostBack)
            {
                // Get the current page name
                string currentPage = Request.Url.AbsolutePath.ToLower();

                // Remove session when visiting AdminRegister.aspx
                if (currentPage.Contains("adminregister.aspx"))
                {
                    Session.Clear();
                    Session.Abandon();
                }

                // Prevent infinite redirect loop
                if (Session["adminuser"] == null && !(currentPage.Contains("admin.aspx") || currentPage.Contains("adminregister.aspx")))
                {
                    Response.Redirect("Admin.aspx");
                }
                else if (Session["adminuser"] != null)
                {
                    txtAdmin.Text = Session["adminuser"].ToString();
                }
            }


        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Admin.aspx");
        }
    }
}