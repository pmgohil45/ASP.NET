using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace webService
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public string[] search(string con, string table, string id)
        {
            //@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\prakash\asp.net\webService\webService\studInfo.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True";
            
            SqlConnection scn = new SqlConnection(con);
            string sel = "select * from "+table+" where id = "+ id +"";
            SqlDataAdapter sda = new SqlDataAdapter(sel, scn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string[] arrData = new string[8];
            if (dt.Rows.Count > 0)
            {
                for (int i = 1; i < arrData.Length; i++)
                { 
                    arrData[i] = dt.Rows[0][i].ToString();
                }
            }else {
                
            }
            return arrData;
        }
    }
}
