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
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] != null) 
            {

            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void bb_Click(object sender, EventArgs e)
        {
            string ddlf = ddlFrom.Text;
            string ddlt = ddlTo.Text;
            if (ddlf != ddlt && ddlf != "Select" && ddlt != "Select")
            {
                string ins = "insert into rootBooking(f,t,email) values('" + ddlFrom.Text + "','" + ddlTo.Text + "','" + Session["Email"] + "')";
                SqlDataAdapter sda = new SqlDataAdapter(ins, Class1.scn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
            }
            else 
            {
                Response.Write("Enter a valid value");
            }
        }

        protected void vt_Click(object sender, EventArgs e)
        {
            viewData();
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            string del = "delete from rootBooking where email='" + Session["Email"] + "' and f='" + ddlFrom.Text + "' and t='" + ddlTo.Text + "'";
            SqlDataAdapter sda = new SqlDataAdapter(del, Class1.scn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            viewData();
        }
        public void viewData()
        {
            string sel = "select * from rootBooking where email = '" + Session["Email"] + "'";
            SqlDataAdapter sda = new SqlDataAdapter(sel, Class1.scn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gridView.DataSource = dt;
            gridView.DataBind();
        }
        protected void update_Click1(object sender, EventArgs e)
        {
            string up = "update rootBooking set f='" + ddlFrom.Text + "', t='" + ddlTo.Text + "' where rid='" + txtRid.Text + "' ";
            SqlDataAdapter sda = new SqlDataAdapter(up, Class1.scn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Response.Redirect("modal.aspx");
            viewData();
        }
    }
}