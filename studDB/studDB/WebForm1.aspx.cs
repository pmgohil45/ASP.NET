using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace studDB
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public static SqlConnection scn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\prakash\asp.net\studDB\studDB\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            showData();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ins = "insert into stud(snm,course,div,rlno) values('"+txtSnm.Text+"','"+ddlC.Text+"','"+ddlD.Text+"','"+txtRlno.Text+"')";
            SqlDataAdapter sda = new SqlDataAdapter(ins, scn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            showData();
        }
        public void showData() 
        {
            string sel = "select * from stud";
            SqlDataAdapter sdaS = new SqlDataAdapter(sel, scn);
            DataTable dtS = new DataTable();
            int a = sdaS.Fill(dtS);
            if (dtS.Rows.Count > 0)
            {
                GridView1.DataSource = dtS;
                GridView1.DataBind();
            }
        }
    }
}