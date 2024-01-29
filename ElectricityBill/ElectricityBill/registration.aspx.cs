using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace ElectricityBill
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Random random = new Random();
                int count = random.Next(6, 8);
                string captcha = "";
                int total = 0;
                do
                {
                    int c = random.Next(48, 122);//(c = Character) ASCII -> number 48-57 -> a to z 65-90 -> A to Z 97-122
                    if (c >= 48 && c <= 57 || c >= 65 && c <= 90 || c >= 97 && c <= 122)
                    {
                        captcha = captcha + (char)c;
                        total++;
                        if (total == count)
                        {
                            break;
                        }
                    }
                } while (true);
                labelCaptcha.Text = captcha;
            }
        }

        protected void btnSub_Click(object sender, EventArgs e)
        {
            if (labelCaptcha.Text == txtTypeCaptcha.Text)
            {
                string radioGender = string.Empty;
                if (radioGenderMale.Checked)
                {
                    radioGender = "Male";
                }
                else
                {
                    radioGender = "Female";
                }
                string ins = "insert into userDetail(userName,cnum,meterNumber,email,number,password,repassword,gender,address,village,taluka,district,pinCode,billType,captcha,typeCaptcha) values('" + txtUnm.Text + "','" + txtCnum.Text + "','" + txtMeterNumber.Text + "','" + txtEmail.Text + "','" + txtNumber.Text + "','" + txtPassword.Text + "','" + txtRepassword.Text + "','" + radioGender + "','" + txtAddress.Text + "','" + txtVillage.Text + "','" + txtTaluka.Text + "','" + txtDistrict.Text + "','" + txtPinCode.Text + "','" + dropDownBillType.Text + "','" + labelCaptcha.Text + "','" + txtTypeCaptcha.Text + "')";
                SqlDataAdapter sda = new SqlDataAdapter(ins, Class1.scn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Response.Redirect("login.aspx");
            }
            else
            {
                Response.Write("<script> alert('Captcha doesn't match!'); </script>");
            }
        }
    }
}