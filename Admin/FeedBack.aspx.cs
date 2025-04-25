using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;


namespace WebApplication11.Admin
{
    public partial class FeedBack : System.Web.UI.Page
    {
        Class2 cs;
        SqlDataAdapter da;
        DataSet ds;
        private CrystalDecisions.CrystalReports.Engine.ReportDocument cr = new CrystalDecisions.CrystalReports.Engine.ReportDocument();
        static string Crypath = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            connection();
            showFeedBack();
        }

        void connection()
        {
            cs = new Class2();
            cs.StartCon();
        }

        void showFeedBack()
        {
            da = new SqlDataAdapter("select * from Feedback", cs.StartCon());
            ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            /*connection();
            da = new SqlDataAdapter("select * from Feedback", cs.StartCon());
            ds = new DataSet();
            da.Fill(ds);
            string xml = @"C:/Users/adity/source/repos/WebApplication11";
            ds.WriteXmlSchema(xml);*/

        }
    }
}