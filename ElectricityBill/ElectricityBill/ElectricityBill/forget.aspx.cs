using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace ElectricityBill
{
    public partial class forget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string upd = "update userDetail set password='" + txtNpwd.Text + "', repassword='" + txtRpwd.Text + "' where Cnum = '"+ txtCnum.Text +"' ";
            SqlDataAdapter sda = new SqlDataAdapter(upd, Class1.scn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Response.Redirect("login.aspx");
            
        }
    }
}