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
    public partial class Addpackages : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Class2 cs;
        string fnm;
        protected void Page_Load(object sender, EventArgs e)
        {
            getcon();
            if (!IsPostBack)
            {
                filltrip();
            }
        }
        void getcon()
        {
            cs = new Class2();
            cs.StartCon();
        }
        void uploadimg()
        {
            if (fileUpload.HasFile)
            {
                fnm = "pimg/" + fileUpload.FileName;
                fileUpload.SaveAs(Server.MapPath(fnm));
            }
        }


        void filltrip()
        {
            getcon();
            ddlTrip.Items.Clear();
            da = new SqlDataAdapter("select * from Category", cs.StartCon());
            ds = new DataSet();
            da.Fill(ds);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                ddlTrip.Items.Add(ds.Tables[0].Rows[i][1].ToString());
            }
        }




        protected void btnSave_Click1(object sender, EventArgs e)
        {
            getcon();
            uploadimg();
            cs.pkginsert(txtPackageName.Text, txtTouristPlaces.Text, int.Parse(txtNoOfDays.Text), int.Parse(txtNoOfNights.Text), txtDescription.Text, txtTourDate.Text, int.Parse(ddlNoOfPerson.SelectedValue), ddlHotels.SelectedValue, ddlFoodType.SelectedValue,ddlTravel.SelectedValue, float.Parse(txtAdultAmount.Text), float.Parse(txtChildAmount.Text), fnm, Convert.ToInt32(ViewState["id"]));

            Message.Text = "Package Add Sucessfully";

            ClearFields();
            
        }

        private void ClearFields()
        {
            txtPackageName.Text = "";
            txtTouristPlaces.Text = "";
            txtNoOfDays.Text = "";
            txtNoOfNights.Text = "";
            txtDescription.Text = "";
            txtTourDate.Text = "";
            ddlNoOfPerson.SelectedIndex = 0; 
            ddlHotels.SelectedIndex = 0;
            ddlFoodType.SelectedIndex = 0;
            ddlTravel.SelectedIndex = 0;
            txtAdultAmount.Text = "";
            txtChildAmount.Text = "";
        }

        protected void ddlTrip_SelectedIndexChanged(object sender, EventArgs e)
        {
            da = new SqlDataAdapter("select * from Category where PackageTypes='" + ddlTrip.SelectedItem.ToString() + "'", cs.StartCon());
            ds = new DataSet();
            da.Fill(ds);
            ViewState["id"] = Convert.ToInt16(ds.Tables[0].Rows[0][0]);
        }
    }
}