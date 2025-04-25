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
    public partial class AdminRegister : System.Web.UI.Page
    {
        Class2 cs;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            getcon();
        }
        void getcon()
        {
            cs = new Class2();
            cs.StartCon();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int row=cs.reginsert(txtFullName.Text, txtEmail.Text, txtPhone.Text, txtPassword.Text);

            if (row > 0)
            {
                Response.Redirect("Admin.aspx");
            }
            else
            {
                lblMessage.Text = "Data not inserted";
            }
        }
    }
}