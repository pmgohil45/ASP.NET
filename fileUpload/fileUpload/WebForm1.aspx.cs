using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace fileUpload
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click1(object sender, EventArgs e)
        {
            string fnm, fp, f;
            f = Server.MapPath("./upload/");
            fnm = fu.PostedFile.FileName;
            fnm = Path.GetFileName(fnm);
            if (fu.ToString() != "")
            {
                if (!Directory.Exists(f))
                {
                    Directory.CreateDirectory(f);
                }
                fp = f + fnm;
                if (File.Exists(fp))
                {
                    lf.Text = fnm + " already exist";
                }
                else
                {
                    fu.PostedFile.SaveAs(fp);
                    lf.Text = fnm + " has been successfully uploaded";
                }
            }
            else
            {
                lf.Text = "Click 'Upload' to select the file to upload.";
            }
        }
    }
}