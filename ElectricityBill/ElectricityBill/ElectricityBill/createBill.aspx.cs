using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace ElectricityBill
{
    public partial class createBill1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminNm"] != null && Session["adminPwd"] != null)
            {
               
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void btnGenerateBill_Click1(object sender, EventArgs e)
        {
            if (txtCnum.Text != "" && txtMeterStatus.Text != "" && DropDownZone.Text != "Zone" && DropDownPhase.Text != "Phase")
            {
                string ins = "insert into getUnit(cnum,zone,phase,meterStatus) values('" + txtCnum.Text + "','" + DropDownZone.Text + "','" + DropDownPhase.Text + "','" + txtMeterStatus.Text + "')";
                SqlDataAdapter sda = new SqlDataAdapter(ins, Class1.scn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Response.Redirect("downloadBill.aspx?Cnum=" + txtCnum.Text);
            }
            else
            {
                string script = "alert(\"Enter a valid values in textbox...!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
        }
    }
}