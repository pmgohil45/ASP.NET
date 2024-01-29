using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace CaptchaDemo
{
    public class Class1
    {
        public static SqlConnection scn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\captchaDB.mdf;Integrated Security=True");
    }
}