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
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con;
        DataSet ds;
        SqlCommand cmd;
        Class1 cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            connection();
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
        protected void btnSend_Click(object sender, EventArgs e)
        {
            connection();
            cmd = new SqlCommand("insert into Contact (Name,Email,Subject,Message) values('" + txtName.Text + "','" + txtEmail.Text + "','" + txtSubject.Text + "','" + txtMessage.Text + "')", cs.startcon());
            int row = cmd.ExecuteNonQuery();
            if (row > 0)
            {
                lblMessage.Text = "Message send successfully";
            }
            else
            {
                lblMessage.Text = "Having some problem";
            }
            empty();
        }

        void empty()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }
    }
}