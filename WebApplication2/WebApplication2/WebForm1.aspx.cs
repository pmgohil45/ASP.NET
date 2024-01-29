using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlog_Click(object sender, EventArgs e)
        {
            
            if (txtname.Text == "ab" && txtpwd.Text == "cd")
            {
                Session["User"] = "ab";
                Response.Redirect("home.aspx");
            }
            
        }
    }
}