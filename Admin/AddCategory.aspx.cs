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
    public partial class AddCategory : System.Web.UI.Page
    {
        Class2 cs;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            connection();
        }
        void connection()
        {
            cs = new Class2();
            cs.StartCon();
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("insert into Category (PackageTypes) values ('"+txtName.Text+"')", cs.StartCon());
            int row=cmd.ExecuteNonQuery();

            if (row > 0)
            {
                lblMessage.Text = "Category added successfully";
            }
            else
            {
                lblMessage.Text = "Category not added";
            }


        }
    }
}