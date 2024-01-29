using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElectricityBill
{
    public partial class adminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUserName.Text == "prakash" && txtPasswrod.Text == "1012")
            {
                Session["adminNm"] = txtUserName.Text;
                Session["adminPwd"] = txtPasswrod.Text;
                Response.Redirect("createBill.aspx?AdminName=" + Session["adminNm"]);
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}