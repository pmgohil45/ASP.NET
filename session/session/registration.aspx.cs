using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace session
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ins = "insert into stud(snm,course,div,rlno) values('" + txtSnm.Text + "','" + ddlC.Text + "','" + ddlD.Text + "','" + txtRlno.Text + "')";
            SqlDataAdapter sda = new SqlDataAdapter(ins, Class1.scn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Response.Redirect("login.aspx");
        }
    }
}