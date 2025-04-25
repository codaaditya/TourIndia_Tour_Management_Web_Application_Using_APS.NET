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
    
    public partial class ContactMesg : System.Web.UI.Page
    {
        SqlDataAdapter da;
        DataSet ds;
        Class2 cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            connection();
            showMessage();
            
        }

        void connection()
        {
            cs = new Class2();
            cs.StartCon();
        }

        void showMessage()
        {
            da = new SqlDataAdapter("select * from Contact", cs.StartCon());
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
}