using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebApplication11
{
    public partial class Signup : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string fnm, p1, p2, p3, p4, p5;
        string[] tp = new string[5];
        Class1 cs;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                connection();
                //fillgrid();
            }
        }
        void connection()
        {
            cs = new Class1();
            cs.startcon();

        }

        void filltext()
        {

            cs = new Class1();
            connection();
            tplace();
            ds = new DataSet();
            ds = cs.select(Convert.ToInt32(ViewState["id"]));
            txtFullName.Text = ds.Tables[0].Rows[0][1].ToString();
            txtPhone.Text = ds.Tables[0].Rows[0][2].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0][3].ToString();
            ddlState.SelectedValue = ds.Tables[0].Rows[0][7].ToString();
            txtCity.Text = ds.Tables[0].Rows[0][8].ToString();
            txtCode.Text = ds.Tables[0].Rows[0][9].ToString();


            if (ds.Tables[0].Rows[0][6].ToString() == "Male")
            {
                rbGender.Items[0].Selected = true;
            }
            if (ds.Tables[0].Rows[0][6].ToString() == "Female")
            {
                rbGender.Items[1].Selected = true;
            }
            if (ds.Tables[0].Rows[0][6].ToString() == "Other")
            {
                rbGender.Items[2].Selected = true;
            }

            if (ds.Tables[0].Rows[0][10].ToString() == "Pilgrimage")
            {
                chkPlace.Items[0].Selected = true;
            }
            else
            {
                chkPlace.Items[0].Selected = false;
            }

            if (ds.Tables[0].Rows[0][11].ToString() == "Adventure Tour")
            {
                chkPlace.Items[1].Selected = true;
            }
            else
            {
                chkPlace.Items[1].Selected = false;
            }

            if (ds.Tables[0].Rows[0][12].ToString() == "Family Trip")
            {
                chkPlace.Items[2].Selected = true;
            }
            else
            {
                chkPlace.Items[2].Selected = false;
            }

            if (ds.Tables[0].Rows[0][13].ToString() == "Honeymoon")
            {
                chkPlace.Items[3].Selected = true;
            }
            else
            {
                chkPlace.Items[3].Selected = false;
            }

            if (ds.Tables[0].Rows[0][14].ToString() == "Hill Station")
            {
                chkPlace.Items[4].Selected = true;
            }
            else
            {
                chkPlace.Items[4].Selected = false;
            }

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //connection();
            //uploadimg();
            //tplace();
            //cs = new Class1();
            if (btnRegister.Text == "Register")
            {
                connection();
                uploadimg();
                tplace();



                for (int i = 0; i < 1; i++)
                {
                    if (tp[i] == "Pilgrimage")
                    {
                        p1 = "Pilgrimage";
                        i++;
                    }
                    else
                    {
                        p1 = "Null";
                        i++;
                    }

                    if (tp[i] == "Adventure Tour")
                    {
                        p2 = "Adventure Tour";
                        i++;
                    }
                    else
                    {
                        p2 = "Null";
                        i++;
                    }
                    if (tp[i] == "Family Trip")
                    {
                        p3 = "Family Trip";
                        i++;
                    }
                    else
                    {
                        p3 = "Null";
                        i++;
                    }
                    if (tp[i] == "Honeymoon")
                    {
                        p4 = "Honeymoon";
                        i++;
                    }
                    else
                    {
                        p4 = "Null";
                        i++;
                    }

                    if (tp[i] == "Hill Station")
                    {
                        p5 = "Hill Station";

                    }
                    else
                    {
                        p5 = "Null";
                    }
                }

                //cmd = new SqlCommand("insert into tour_users" + "(Name,PhoneNo,Email,Password,ConPassword,Gender,State,City,PostalCode,Place1,Place2,Place3,Place4,Place5,ProfileImage) values('" + txtFullName.Text + "','" + txtPhone.Text + "','" + txtEmail.Text + "','" + txtPassword.Text + "','" + txtConPassword.Text + "','" + rbGender.Text + "','" + ddlState.SelectedValue + "','" + txtCity.Text + "','" + txtCode.Text + "','" + p1 + "','" + p2 + "','" + p3 + "','" + p4 + "','" + p5 + "','" + fnm + "')", con);

                    int row=cs.insert(txtFullName.Text, txtPhone.Text, txtEmail.Text, txtPassword.Text, txtConPassword.Text,
                    rbGender.SelectedItem.Text, ddlState.SelectedValue, txtCity.Text, txtCode.Text,
                    p1, p2, p3, p4, p5, fnm);

                    //fillgrid();

                if (row > 0)
                {
                    // Call only if insert is successful
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    lblMessage.Text = "Registration failed. Please try again.";
                }
            }
            else
            {
                cs = new Class1();
                connection();
                tplace();

                for (int i = 0; i < 1; i++)
                {
                    if (tp[i] == "Pilgrimage")
                    {
                        p1 = "Pilgrimage";
                        i++;
                    }
                    else
                    {
                        p1 = "Null";
                        i++;
                    }

                    if (tp[i] == "Adventure Tour")
                    {
                        p2 = "Adventure Tour";
                        i++;
                    }
                    else
                    {
                        p2 = "Null";
                        i++;
                    }
                    if (tp[i] == "Family Trip")
                    {
                        p3 = "Family Trip";
                        i++;
                    }
                    else
                    {
                        p3 = "Null";
                        i++;
                    }
                    if (tp[i] == "Honeymoon")
                    {
                        p4 = "Honeymoon";
                        i++;
                    }
                    else
                    {
                        p4 = "Null";
                        i++;
                    }
                    if (tp[i] == "Hill Station")
                    {
                        p5 = "Hill Station";
                    }
                    else
                    {
                        p5 = "Null";
                    }

                }


                //cmd = new SqlCommand("UPDATE tour_users SET Name='" + txtFullName.Text + "', PhoneNo='" + txtPhone.Text + "', Email='" + txtEmail.Text + "', Password='" + txtPassword.Text + "', ConPassword='" + txtConPassword.Text + "', Gender='" + rbGender.Text + "', State='" + ddlState.SelectedValue + "', City='" + txtCity.Text + "', PostalCode='" + txtCode.Text + "', Place1='" + p1 + "', Place2='" + p2 + "', Place3='" + p3 + "', Place4='" + p4 + "', Place5='" + p5 + "' WHERE Id='" + ViewState["id"] + "'", con);
                //cmd.ExecuteNonQuery();
                cs.update(Convert.ToInt16(ViewState["id"]), txtFullName.Text, txtPhone.Text, txtEmail.Text,
                txtPassword.Text, txtConPassword.Text, rbGender.Text, ddlState.SelectedValue,
                txtCity.Text, txtCode.Text, p1, p2, p3, p4, p5);
                //fillgrid();
                empty();

            }
        }

        void empty()
        {
            txtFullName.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtConPassword.Text = "";
            rbGender.ClearSelection();
            ddlState.ClearSelection();
            txtCity.Text = "";
            txtCode.Text = "";
            chkPlace.ClearSelection();
            btnRegister.Text = "Register";
        }

        protected void Unnamed1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
            if (e.CommandName == "cmd_Edit")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                btnRegister.Text = "Update";
                filltext();


            }
            else if (e.CommandName == "cmd_Delete")
            {
                cs = new Class1();
                connection();
                int id = Convert.ToInt16(e.CommandArgument);
                //ViewState["id"]=id;
                cs.delete(id);
                //fillgrid();
            }
        }

        protected void Unnamed1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        /*void fillgrid()
        {
            cs = new Class1();
            connection();
            GridView1.DataSource = cs.filldata();
            GridView1.DataBind();
        }*/

        void uploadimg()
        {
            if (ProfilePic.HasFile)
            {
                fnm = "image/" + ProfilePic.FileName;
                ProfilePic.SaveAs(Server.MapPath(fnm));
            }
        }
        void tplace()
        {
            for (int i = 0; i < tp.Length; i++)
            {
                if (chkPlace.Items[i].Selected == true)
                {
                    tp[i] = chkPlace.Items[i].Text;
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
           
            if (e.CommandName == "cmd_Edit")
            {
                int id = Convert.ToInt16(e.CommandArgument);
                ViewState["id"] = id;
                btnRegister.Text = "Update";
                filltext();


            }
            else if(e.CommandName=="cmd_Delete")
            {
                cs = new Class1();
                connection();
                int id = Convert.ToInt16(e.CommandArgument);
                cs.delete(id);
                //fillgrid();
            }
        }
    }
}