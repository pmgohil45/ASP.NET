using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace crudOperation
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void signIn_Click1(object sender, EventArgs e)
        {
            string sel = "select * from data where email='" + txtEmail.Text + "' and password='" + txtPass.Text + "'";
            SqlDataAdapter sda = new SqlDataAdapter(sel, Class1.scn);
            DataTable dt = new DataTable();
            int a = sda.Fill(dt);
            if(a > 0)
            {
                Session["Email"] = txtEmail.Text;
                Session["Password"] = txtPass.Text;
                Response.Redirect("home.aspx?Cnum" + Session["Email"]);
            }
            else
            {
                Response.Write("<script>alert('Login Unsuccess...');</script>");
            }

        }
    }
}