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
    public partial class createBill : System.Web.UI.Page
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
            if (txtCnum.Text != null && txtMeterStatus.Text != null && DropDownZone.Text != "Zone" && DropDownPhase.Text != "Phase")
            {
                string ins = "insert into getUnit(cnum,zone,phase,meterStatus) values('" + txtCnum.Text + "','" + DropDownZone.Text + "','" + DropDownPhase.Text + "','" + txtMeterStatus.Text + "')";
                SqlDataAdapter sda = new SqlDataAdapter(ins, Class1.scn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                //checkUser();
                Response.Redirect("downloadBill.aspx?Cnum=" + txtCnum.Text);
            }
            else 
            {
                string script = "alert(\"Please Enter a valid data..!\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }

        }

        public void checkUser()
        {
            string sel = "select * from generateBill where cnum = '" + Session["Cnum"] + "'";
            SqlDataAdapter sda = new SqlDataAdapter(sel, Class1.scn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            /*if (dt.Rows.Count > 0)
            {*/
            Response.Redirect("downloadBill.aspx?Cnum=" + txtCnum.Text);
            /*}
            else
            {
                Response.Write("already exist");
                Response.Redirect("createBill.aspx");
            }*/
        }
    }
}