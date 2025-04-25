using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using WebApplication11.Admin;

namespace WebApplication11
{
    public partial class Package : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Class1 cs;
        int row, p;
        PagedDataSource pg;
       

        protected void Page_Load(object sender, EventArgs e)
        {
            connect();
            display1();
            if (!IsPostBack)
            {
                LoadCategories();
                LoadPackages(1);
            }

            if (Session["name"] != null)
            {

                lblUser.Text=Session["name"].ToString();
                pImage.ImageUrl=Session["profileImage"].ToString();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        void connect()
        {
            con=new SqlConnection(strcon);
            con.Open();
        }

        void display1()
        {
            connect();
            da = new SqlDataAdapter("SELECT * FROM TourPackages", con);
            ds = new DataSet();
            da.Fill(ds);
            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource();
            pg.AllowPaging = true;
            pg.PageSize = 6;
            pg.DataSource = ds.Tables[0].DefaultView;
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["Id"]);
            dlPackages.DataSource = pg;
            dlPackages.DataBind();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {

            btnPrev.Enabled = true;
            p += Convert.ToInt32(ViewState["Id"]) + 1;
            ViewState["Id"] = Convert.ToInt32(p);
            int temp = row / pg.PageSize;
            if (p == temp)
            {
                btnNext.Enabled = false;
            }
            display1();
        }

        protected void btnPrev_Click(object sender, EventArgs e)
        {

            btnPrev.Enabled = true;
            p += Convert.ToInt32(ViewState["Id"]) - 1;
            ViewState["Id"] = Convert.ToInt32(p);
            if (p == 0)
            {
                btnPrev.Enabled = false;
            }
            display1();
        }

        void LoadPackages(int categoryId)
        {
            connect();

            if (categoryId > 0)
            {

                cmd = new SqlCommand("select * from TourPackages where Category_Id='" + categoryId + "'", con);
            }
            else
            {
                cmd = new SqlCommand("select * from TourPackages", con);
                //cmd = new SqlCommand("select * from TourPackages where Category_Id='" + categoryId + "'", con);
            }
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            dlPackages.DataSource = ds;
            dlPackages.DataBind();
        }

        void LoadCategories()
        {
            connect();
            cmd = new SqlCommand("select * from Category", con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            ddlCategories.DataSource = ds;
            ddlCategories.DataBind();
            ddlCategories.DataTextField = "PackageTypes";
            ddlCategories.DataValueField = "Id";
            ddlCategories.DataBind();
            ddlCategories.Items.Insert(0, new ListItem("--Select Category--", "0"));

        }

        protected void dlPackages_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "SelectPackage")
            {
                int packageId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("PackageDetails.aspx?Id=" + packageId);
            }
        }

        protected void Unnamed2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(
            ddlCategories.SelectedValue);
            LoadPackages(Id);
        }

        

        protected void dlPackages_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}