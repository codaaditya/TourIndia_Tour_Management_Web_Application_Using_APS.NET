using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data.SqlClient;
using System.Data;



namespace WebApplication11
{
    
    public partial class PackageTicket : System.Web.UI.Page
    {
        SqlDataAdapter da;
        DataSet ds;
        Class1 cs;
        //private ReportDocument cr = new ReportDocument();

        //static string Crypath = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                lblFullName.Text = Request.QueryString["FullName"];
                lblEmail.Text = Request.QueryString["Email"];
                lblAmount.Text = Request.QueryString["Amount"];
                lblPaymentMethod.Text = Request.QueryString["PaymentMethod"];
                lblPackage.Text = Request.QueryString["PackageName"];
                lblTourDate.Text = Request.QueryString["TourDate"];
                lblNoOfPerson.Text = Request.QueryString["NoOfPerson"];

                string rawImage = Request.QueryString["ImagePath"];
                if (!string.IsNullOrEmpty(rawImage))
                {
                    imgPackage.ImageUrl = ResolveUrl("~/admin/" + rawImage);
                }
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

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            MemoryStream ms = new MemoryStream();
            Document doc = new Document();
            PdfWriter writer = PdfWriter.GetInstance(doc, ms);
            writer.CloseStream = false;

            doc.Open();

           
            string imagePath = Server.MapPath(imgPackage.ImageUrl); 
            if (File.Exists(imagePath))
            {
                iTextSharp.text.Image img = iTextSharp.text.Image.GetInstance(imagePath);
                img.ScaleToFit(200f, 200f); 
                img.Alignment = Element.ALIGN_CENTER;
                doc.Add(img);
            }
            doc.Add(new Paragraph("Tour Ticket"));
            doc.Add(new Paragraph(" "));
            doc.Add(new Paragraph("Name: " + lblFullName.Text));
            doc.Add(new Paragraph("Email: " + lblEmail.Text));
            doc.Add(new Paragraph("Amount: ₹" + lblAmount.Text));
            doc.Add(new Paragraph("Payment Method: " + lblPaymentMethod.Text));
            doc.Add(new Paragraph("Package: " + lblPackage.Text));
            doc.Add(new Paragraph("Tour Date: " + lblTourDate.Text));
            doc.Add(new Paragraph("Number of Persons: " + lblNoOfPerson.Text));
            doc.Close();

            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment; filename=Ticket.pdf");
            Response.BinaryWrite(ms.ToArray());
            Response.End();

            /*da = new SqlDataAdapter("select * from Booking", cs.startcon());
            ds = new DataSet();
            da.Fill(ds);
            string xm1 = @"search-ms:displayname=Search%20Results%20in%20repos&crumb=location:C%3A%5CUsers%5Cadity%5Csource%5Crepos\WebApplication11/ticket.xml";
            ds.WriteXmlSchema(xm1);
            string xm = @"C:\Users\adity\source\repos\WebApplication11\ticket.xml";
            ds.WriteXml(xm);
            /*ReportDocument cryRpt = new ReportDocument();
            cryRpt.Load(Server.MapPath("CrystalReport1.rpt"));
            cryRpt.SetDataSource(ds);
            cryRpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Ticket");
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment; filename=Ticket.pdf");*/

            /*1. Fetch data from the database
            da = new SqlDataAdapter("SELECT * FROM Booking", cs.startcon());
            ds = new DataSet();
            da.Fill(ds);
            string xmlPath = @"C:/Users/adity/source/repos/WebApplication11/ticket.xml";
            ds = new DataSet();
            ds.WriteXmlSchema(xmlPath); */
            

        }
    }
    
}