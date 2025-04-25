using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebApplication11.Admin
{
    
    public class Class2
    {
        string s = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        /* public void StartCon()
         {
             con = new SqlConnection(s);
             con.Open();
         }*/
        public SqlConnection StartCon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        

        public int reginsert(string afnm,string aemail,string aphone,string pass)
        {
            int row = 0;
            StartCon();
            cmd = new SqlCommand("insert into admin1(Adminname,Email,Phoneno,Password)" + "values('" + afnm + "','" + aemail + "','" + aphone + "','" + pass + "')", con);
            row=cmd.ExecuteNonQuery();
            return row;
            
        }

        public void pkginsert(string pnm, string place, int nday, int night, string desc, string date, int nperson, string hstay, string ftype, string tby, float adamount, float camount, string image,int id)
        {

            StartCon();
            cmd = new SqlCommand("insert into TourPackages(PackageName, TouristPlaces, NoOfDays, NoOfNights, Description, TourDate, NoOfPerson, HotelStay, FoodType, TravelBy, AdultAmount, ChildAmount, ImagePath,Category_Id) " +
                                 "values('" + pnm + "','" + place + "'," + nday + "," + night + ",'" + desc + "','" + date + "'," + nperson + ",'" + hstay + "','" + ftype + "','" + tby + "','" + adamount + "','" + camount + "','" + image + "','"+id+"')", con);
            cmd.ExecuteNonQuery();
            con.Close();


        }

        public void Insert(string pnm,string place,int nday,int night,string desc,string date,int nperson,string hstay,string ftype,string tby,float adamount,float camount,string image )
        {
            
                StartCon();
                cmd = new SqlCommand("insert into TourPackages(PackageName, TouristPlaces, NoOfDays, NoOfNights, Description, TourDate, NoOfPerson, HotelStay, FoodType, TravelBy, AdultAmount, ChildAmount, ImagePath) " +
                                     "values('" + pnm + "','" + place + "'," + nday + "," + night + ",'" + desc + "','" + date + "'," + nperson + ",'" + hstay + "','" + ftype + "','" + tby + "','" + adamount + "','" + camount + "','" + image + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
            

        }

        public void Update(int id,string pnm, string place, int nday, int night, string desc, string date, int nperson, string hstay, string ftype, string tby, float adamount, float camount)
        {

            StartCon();
            cmd = new SqlCommand("update TourPackages set PackageName='" + pnm + "',TouristPlaces='" + place + "',NoOfDays=" + nday + ",NoOfNights=" + night + ",Description='" + desc + "',TourDate='" + date + "',NoOfPerson=" + nperson + ",HotelStay='" + hstay + "',FoodType='" + ftype + "',TravelBy='" + tby + "',AdultAmount='" + adamount + "',ChildAmount='" + camount + "' where Id=" + id + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public void Delete(int id)
        {
            StartCon();
            cmd = new SqlCommand("delete from TourPackages where Id=" + id + "", con);
            cmd.ExecuteNonQuery();
            con.Close();
            
        }

        public DataSet select(int id)
        {
            StartCon();
            da = new SqlDataAdapter("select * from TourPackages where Id='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;

        }

        public DataSet filldata()
        {
            StartCon();
            da = new SqlDataAdapter("select * from TourPackages", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        

    }
}