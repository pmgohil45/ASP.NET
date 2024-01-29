using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;

namespace CaptchaDemo
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Random random = new Random(); 
            int count = random.Next(4,6);
            string captcha = "";
            int total = 0;
            do
            {
                int c = random.Next(48,123); //(charcter) //ASCII VALUE
                if (c >= 48 && c <= 57 || c >= 65 && c <= 90 || c >= 97 && c <= 122 )
                {
                    captcha = captcha + (char)  c;
                    total++;
                    if(total == count)
                    {
                        break;
                    }
                }
            }while(true);
            label1.Text = captcha;
        }
        protected void btnSub_Click(object sender, EventArgs e)
        {
            if (txtPwd.Text == rpwd.Text && label1.Text == txtCaptcha.Text)
            {
                String ins = "insert into captchaDB values ('" + txtUnm.Text + "','" + txtPwd.Text + "','" + rpwd.Text + "','" + label1.Text + "','" + txtCaptcha.Text + "')";
                SqlDataAdapter sda = new SqlDataAdapter(ins, Class1.scn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Response.Write("Good");
            }
            else 
            {
                Response.Write("does not match a captcha code.");
            }
        }

        
    }
}