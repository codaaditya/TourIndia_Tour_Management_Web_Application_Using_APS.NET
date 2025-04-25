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
    public partial class Payment : System.Web.UI.Page
    {
        Class1 cs;
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd;
        int row = 0;


        protected void Page_Load(object sender, EventArgs e)
        {
            connection();
            if(!IsPostBack)
            {
               
                string packageImage = Request.QueryString["ImagePath"];
                string packageName = Request.QueryString["PackageName"];
                string noofPerson = Request.QueryString["NoOfPerson"];
                string amount = Request.QueryString["AdultAmount"];
                string tourDate = Request.QueryString["TourDate"];

                DataTable dt = new DataTable();
                dt.Columns.Add("ImagePath");
                dt.Columns.Add("PackageName");
                dt.Columns.Add("NoOfPerson");
                dt.Columns.Add("AdultAmount");
                dt.Columns.Add("TourDate");

                DataRow row = dt.NewRow();
                row["ImagePath"] = packageImage;
                row["PackageName"] = packageName;
                row["NoOfPerson"] = noofPerson;
                row["AdultAmount"] = amount;
                row["TourDate"] = tourDate;
                dt.Rows.Add(row);

                dlTourPackagepay.DataSource = dt;
                dlTourPackagepay.DataBind();

                txtAmount.Text = amount;

            }
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

        protected void btnPay_Click(object sender, EventArgs e)
        {
            connection();
            
            cmd = new SqlCommand("insert into payments (FullName,Email,Amount,PaymentMethod) values('" + txtName.Text + "','" + txtEmail.Text + "','" + txtAmount.Text + "','" + ddlPaymentMethod.SelectedValue + "')", cs.startcon());
            
            row=cmd.ExecuteNonQuery();

            if (row > 0)
            {
                
                    Response.Redirect("PackageTicket.aspx?FullName=" + txtName.Text +"&Email=" + txtEmail.Text +"&Amount=" + txtAmount.Text +
                                 "&PaymentMethod=" + ddlPaymentMethod.SelectedValue +"&PackageName=" + Request.QueryString["PackageName"] +
                                 "&TourDate=" + Request.QueryString["TourDate"] +"&NoOfPerson=" + Request.QueryString["NoOfPerson"] +
                                 "&ImagePath=" + Request.QueryString["ImagePath"]);
            }
       
            lblMessage.Text = "Payment Successful! Thank you for booking.";

        }

        protected void dlTourPackagepay_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }

        protected void dlTourPackagepay_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        
    }
}