using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace session
{
    public class Class1
    {
        public static SqlConnection scn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\prakash\asp.net\session\session\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
    }
}