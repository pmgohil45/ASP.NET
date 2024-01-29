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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sel = "select * from stud where rlno = '"+ txtRlno.Text +"'";
            SqlDataAdapter sdaS = new SqlDataAdapter(sel, Class1.scn);
            DataTable dtS = new DataTable();
            int a = sdaS.Fill(dtS);
            if (dtS.Rows.Count > 0)
            {
                Session["studNm"] = txtSnm.Text;
                Session["pwd"] = txtRlno.Text;
                Response.Redirect("home.aspx");
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("registration.aspx");
        }
    }
}