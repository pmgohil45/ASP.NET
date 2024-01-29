using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace useWebService
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            localhost.WebService1 ws1 = new localhost.WebService1();
            string con = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\prakash\asp.net\webService\webService\studInfo.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
            string table = "stud";
            string [] request = ws1.search(con, table, txtId.Text);
            Response.Write("<table border=1px>" + "<th>Name</th><th>Course</th><th>Division</th><th>Semester</th><th>Roll Number</th><th>Number</th><th>City</th>" + "<tr>" + "<td>");
            Response.Write(request[1]);
            Response.Write("</td>" + "<td>");
            Response.Write(request[2]);
            Response.Write("</td>" + "<td>");
            Response.Write(request[3]);
            Response.Write("</td>" + "<td>");
            Response.Write(request[4]);
            Response.Write("</td>" + "<td>");
            Response.Write(request[5]);
            Response.Write("</td>" + "<td>");
            Response.Write(request[6]);
            Response.Write("</td>" + "<td>");
            Response.Write(request[7]);
            Response.Write("</td>" + "</tr>" + "</table>");
        }
    }
}