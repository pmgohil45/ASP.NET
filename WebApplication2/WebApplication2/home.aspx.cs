using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null) 
            {
                Response.Write("welcome " + Session["user"].ToString());
            }
            else
            {
                Response.Redirect("WebForm1.aspx");
            }
            Session["user"] = null
        }
        
        protected void login_Click(object sender, EventArgs e)
        {

            if (Session["user"] == null) 
            {
                Response.Write("okay"); 
            }
            else
            {
                Session.Abandon();
                Response.Redirect("WebForm1.aspx");
            }
        }
    }
}