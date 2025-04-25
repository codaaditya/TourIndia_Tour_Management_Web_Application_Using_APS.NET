using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace WebApplication11
{
    public class Class1
    {

        string s = ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        /*public void startcon()
        {
            con = new SqlConnection(s);
            con.Open();
        }*/
        public SqlConnection startcon()
        {
            con = new SqlConnection(s);
            con.Open();
            return con;
        }

        /*Package Booking Details Page method*/

        public DataSet fillPackageDetails(int id)
        {
            da = new SqlDataAdapter("select * from TourPackages where Id='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public int insert(string nm,string phno,string em,string ps,string cnps,string gen,
            string st,string ct,string pc,string p1,string p2,string p3,string p4, string p5,string img)
        {
            int row = 0;
            cmd = new SqlCommand("insert into tour_users" + "(Name,PhoneNo,Email,Password," +
                "ConPassword,Gender,State,City,PostalCode,Place1,Place2,Place3,Place4,Place5,ProfileImage) " +
                "values('" + nm + "','" + phno + "','" + em + "','" 
                + ps + "','" + cnps + "','" + gen + "','" 
                + st + "','" + ct + "','" + pc + "','" 
                + p1 + "','" + p2 + "','" + p3 + "','" + p4 + "','" + p5 + "','" + img + "')", con);
            row=cmd.ExecuteNonQuery();

            return row;
        }

        public void update(int id,string nm, string phno, string em, string ps, string cnps, string gen,
            string st, string ct, string pc, string p1, string p2, string p3, string p4, string p5)
        {
            cmd = new SqlCommand("update tour_users set Name='" + nm + "',PhoneNo='" + phno + "',Email='" + em + "'," +
                "Password='" + ps + "',ConPassword='" + cnps + "',Gender='" + gen + "',State='" + st + "',City='" + ct +
                "',PostalCode='" + pc + "',Place1='" + p1 + "',Place2='" + p2 + "',Place3='" + p3 + "',Place4='" + p4 +
                "',Place5='" + p5 + "' where Id='" + id + "'", con);

            cmd.ExecuteNonQuery();
        }

        public void delete(int id)
        {
            cmd = new SqlCommand("DELETE FROM tour_users WHERE Id='" + id + "'", con);
            cmd.ExecuteNonQuery();
        }
        public DataSet filldata()
        {
            da = new SqlDataAdapter("select * from tour_users", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet select(int id)
        {
            da = new SqlDataAdapter("select * from tour_users where Id='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

    }
}