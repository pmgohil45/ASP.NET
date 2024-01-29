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
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cnum"] != null && Session["Password"] != null)
            {
                string sel1 = "select * from userDetail where cnum = '" + Session["Cnum"] + "'";
                SqlDataAdapter sda1 = new SqlDataAdapter(sel1, Class1.scn);
                DataTable dt1 = new DataTable();
                sda1.Fill(dt1);
                if (dt1.Rows[0]["gender"].ToString() == "Male")
                {
                    labelWelcome.Text = "Mr." + dt1.Rows[0]["userName"].ToString();
                }
                else
                {
                    labelWelcome.Text = "Mrs." + dt1.Rows[0]["userName"].ToString();
                }

                string sel = "select * from generateBill where cnum = '"+ Session["Cnum"] +"'";
                SqlDataAdapter sda = new SqlDataAdapter(sel,Class1.scn);
                DataTable dt = new DataTable(); 
                if (sda.Fill(dt) == 0)
                {
                    btnShowBill.Visible = false; 
                }

                string select = "select * from oldBill where cnum = '" + Session["Cnum"] + "' ";
                SqlDataAdapter sdaSelectDate = new SqlDataAdapter(select, Class1.scn);
                DataTable dtSelect = new DataTable();
                sdaSelectDate.Fill(dtSelect);
                if (sda.Fill(dt) == 0)
                {
                    btnShowBill.Visible = false;
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
   

        protected void btnShowBill_Click(object sender, EventArgs e)
        {
            Response.Redirect("showBill.aspx?Cnum" + Session["Cnum"]);
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Delete Cookies
            HttpCookie myCookie = new HttpCookie("userCookie");
            myCookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(myCookie);

            Session["Cnum"] = null;
            Session["Password"] = null;
            Session.Abandon();
            Response.Redirect("login.aspx");
        }

        protected void btnHome_Click1(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx?Cnum" + Session["Cnum"]);
        }
    }
}