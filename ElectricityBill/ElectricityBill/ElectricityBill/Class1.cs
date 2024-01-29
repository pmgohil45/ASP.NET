using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace ElectricityBill
{
    public class Class1
    {
        public static SqlConnection scn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\91951\source\repos\ElectricityBill\ElectricityBill\electricity.mdf;Integrated Security=True;Connect Timeout=30");
        public static int Cnum;
    }
}