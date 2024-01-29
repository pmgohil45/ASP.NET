using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;

namespace ElectricityBill
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string sel = "select * from userDetail where Cnum = '" + txtCnum.Text + "' and password = '" + txtPasswrod.Text + "'";
            SqlDataAdapter sda = new SqlDataAdapter(sel, Class1.scn);
            DataTable dt = new DataTable();
            int a = sda.Fill(dt);
            if (a == 1)
            {
                Session["Cnum"] = txtCnum.Text;
                Session["Password"] = txtPasswrod.Text;
                Response.Redirect("home.aspx?Cnum" + Session["Cnum"]);
            }
            else
            {
                Response.Write("<script>alert('Invalid Details...');</script>");
            }
        }

        protected void ragistrationLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("registration.aspx");
        }

        protected void forgetLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("forget.aspx");
        }

        protected void adminLink_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminLogin.aspx");
        }
    }
}
