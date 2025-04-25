using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;  
using System.Configuration;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;




namespace WebApplication11.Admin
{
    public partial class ViewPaclage : System.Web.UI.Page
    {
        SqlCommand cmd;
        DataSet ds;
        SqlDataAdapter da;
        Class2 cs;
        string fnm;

        private CrystalDecisions.CrystalReports.Engine.ReportDocument cr = new CrystalDecisions.CrystalReports.Engine.ReportDocument();

        static string Crypath = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            connection();
            fillgrid();
            if (!IsPostBack)
            {
                // Step 1: Load the Crystal Report
                ReportDocument rpt = new ReportDocument();
                string cryPath = Server.MapPath("~/Admin/CrystalReport1.rpt"); // Ensure path is correct
                rpt.Load(cryPath);

                // Step 2: Get data dynamically
                DataTable dt = GetMyData();
                rpt.SetDataSource(dt); // Bind the data to the report

                // Step 3: Set the ReportSource to CrystalReportViewer
                CrystalReportViewer1.ReportSource = rpt;
                CrystalReportViewer1.DataBind();
            }
        }
    

        void connection()
        {
            
            cs = new Class2();
            cs.StartCon();
        }

        void fillgrid()
        {
            cs = new Class2();
            connection();
            GridView1.DataSource = cs.filldata();
            GridView1.DataBind();
        }

        void uploadimg()
        {
            if (fileUpload.HasFile)
            {
                fnm = "pimg/" + fileUpload.FileName;
                fileUpload.SaveAs(Server.MapPath(fnm));
            }
        }

        void filltext()
        {
            cs = new Class2();
            connection();
            ds = new DataSet();
            ds = cs.select(Convert.ToInt32(ViewState["id"]));
            txtPackageName.Text = ds.Tables[0].Rows[0]["PackageName"].ToString();
            txtTouristPlaces.Text = ds.Tables[0].Rows[0]["TouristPlaces"].ToString();
            txtNoOfDays.Text = ds.Tables[0].Rows[0]["NoOfDays"].ToString();
            txtNoOfNights.Text = ds.Tables[0].Rows[0]["NoOfNights"].ToString();
            txtDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();
            txtTourDate.Text = ds.Tables[0].Rows[0]["TourDate"].ToString();
            ddlNoOfPerson.SelectedValue = ds.Tables[0].Rows[0]["NoOfPerson"].ToString();
            ddlHotels.SelectedValue = ds.Tables[0].Rows[0]["HotelStay"].ToString();
            ddlFoodType.SelectedValue = ds.Tables[0].Rows[0]["FoodType"].ToString();
            ddlTravel.SelectedValue = ds.Tables[0].Rows[0]["TravelBy"].ToString();
            txtAdultAmount.Text = ds.Tables[0].Rows[0]["AdultAmount"].ToString();
            txtChildAmount.Text = ds.Tables[0].Rows[0]["ChildAmount"].ToString();

            
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_Edit")
            {
                ViewState["id"] = e.CommandArgument;
                filltext();
                btnSave.Text = "Update";
            }
            else if (e.CommandName == "cmd_Delete")
            {
                cs.Delete(Convert.ToInt32(e.CommandArgument));
                fillgrid();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            connection();
            uploadimg();
            if (btnSave.Text == "Save")
            {
                cs.Insert(txtPackageName.Text, txtTouristPlaces.Text, Convert.ToInt32(txtNoOfDays.Text), Convert.ToInt32(txtNoOfNights.Text), txtDescription.Text, txtTourDate.Text, Convert.ToInt32(ddlNoOfPerson.SelectedValue), ddlHotels.SelectedValue, ddlFoodType.SelectedValue, ddlTravel.SelectedValue, float.Parse(txtAdultAmount.Text), float.Parse(txtChildAmount.Text), fnm);
                fillgrid();
            }
            else
            {
                cs.Update(Convert.ToInt32(ViewState["id"]), txtPackageName.Text, txtTouristPlaces.Text, Convert.ToInt32(txtNoOfDays.Text), Convert.ToInt32(txtNoOfNights.Text), txtDescription.Text, txtTourDate.Text, Convert.ToInt32(ddlNoOfPerson.SelectedValue), ddlHotels.SelectedValue, ddlFoodType.SelectedValue, ddlTravel.SelectedValue, float.Parse(txtAdultAmount.Text), float.Parse(txtChildAmount.Text));
                fillgrid();

            }


        }




        protected void Button1_Click(object sender, EventArgs e)
        {
            CrystalReport1 rpt = new CrystalReport1();
            DataTable dt = GetMyData(); // your method to fill data
            rpt.SetDataSource(dt);
            CrystalReportViewer1.ReportSource = rpt;
            da = new SqlDataAdapter("SELECT Id, PackageName, AdultAmount, TourDate, TravelBy FROM TourPackages", cs.StartCon());
            ds = new DataSet();
            da.Fill(ds);

            string xml = Server.MapPath("~/Admin/package.xml"); // Portable path
            ds.WriteXmlSchema(xml);

            Crypath = Server.MapPath("~/Admin/CrystalReport1.rpt");
            cr.Load(Crypath);
            cr.SetDataSource(ds);  // Only this is enough

            CrystalReportViewer1.ReportSource = cr;
            CrystalReportViewer1.DataBind();
        }

        public DataTable GetMyData()
        {
            DataTable dt = new DataTable();

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TourDB.mdf;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Id, PackageName, AdultAmount, TourDate, TravelBy FROM TourPackages";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }

            return dt;
        }

        /*protected void Button1_Click(object sender, EventArgs e)
        {
            // Step 1: Get data dynamically
            DataTable dt = GetMyData();

            // Step 2: Create and load the report
            ReportDocument rpt = new ReportDocument();
            string cryPath = Server.MapPath("~/Admin/CrystalReport1.rpt"); // Ensure path is correct
            rpt.Load(cryPath);

            // Step 3: Set the DataSource to DataTable
            rpt.SetDataSource(dt);

            // Step 4: Set report to viewer
            CrystalReportViewer1.ReportSource = rpt;
            CrystalReportViewer1.DataBind();
        }

        public DataTable GetMyData()
        {
            DataTable dt = new DataTable();

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\TourDB.mdf;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Id, PackageName, AdultAmount, TourDate, TravelBy FROM TourPackages";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                }
            }

            return dt;
        }*/

    }
}