using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebApplication11.Admin
{
    public partial class Admin : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        Class2 cs;
        int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            cs = new Class2();
        }

        void connection()
        {
            cs.StartCon();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            /* string username = txtUsername.Text;
             string password = txtPassword.Text;

             if(username=="Admin" && password == "Admin123"){
                 Session["adminuser"] = username;
                 Response.Redirect("Dashboard.aspx");

             }
             else
             {
                 lblMessage.Text = "Invalid Username Or Password";
             }*/

            connection();
            cmd = new SqlCommand("select count(*) from admin1 where " +
                "Adminname='" + txtUsername.Text + "'" +
                " and Password='" + txtPassword.Text + "'", cs.StartCon());
            i = Convert.ToInt16(cmd.ExecuteScalar());

            if (i > 0)
            {
                Session["adminuser"] = txtUsername.Text;
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Data not Featched";
            }

        }
    }
}