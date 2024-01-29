using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;
using System.Globalization;
using System.Threading;
using System.Diagnostics;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

namespace ElectricityBill
{
    // from ak
    public partial class showBill : System.Web.UI.Page
    {
        public string issueBillDate, lError;
        DataTable dtSelect;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Cnum"] != null && Session["password"] != null)
                {
                    labelEndDate.Visible = false;
                    ddlDate.Visible = false;
                    btnShowBill.Visible = false;
                    btnHideCurentBill.Visible = false;
                    showBillPanel.Visible = false;
                    labelPay.Visible = false;

                    selectDataFromOldBill();
                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }
        protected void btnPay_Click1(object sender, EventArgs e)
        {
            if (DropDownPaymentType.Text == DDUPI.Text)
            {
              /*  string script = "alert(\"Pay bill on ' pmgohil45@oksbi ' UPI id.\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);*/
            }
            else if (DropDownPaymentType.Text == DDCash.Text)
            {
                string script = "alert(\"Pay bill in cash on your nearest PGVCL Office.\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
          server control at run time. */
        }
        protected void btnDownload_Click1(object sender, EventArgs e)
        {
            Response.ContentType = "applocation/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderBill.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            printBillPanel.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfdoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfdoc);
            PdfWriter.GetInstance(pdfdoc, Response.OutputStream);
            pdfdoc.Open();
            htmlparser.Parse(sr);
            pdfdoc.Close();
            Response.Write(pdfdoc);
            Response.End();

            /*Response.ContentType = "applocation/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderBill.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            printBillPanel.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfdoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfdoc);
            PdfWriter.GetInstance(pdfdoc, Response.OutputStream);
            pdfdoc.Open();
            htmlparser.Parse(sr);
            pdfdoc.Close();
            Response.Write(pdfdoc);
            Response.End();*/
            /*
                        IronPdf.AspxToPdf.RenderThisPageAsPdf(IronPdf.AspxToPdf.FileBehavior.InBrowser);
                        var AspxToPdfOptions = new IronPdf.PdfPrintOptions()
                        {
                            DPI = 200,
                            EnableJavaScript = true,
                            FirstPageNumber = 1,
                            Title = "Electricity Bill",
                            MarginBottom = 10,
                            MarginLeft = 10,
                            MarginRight = 10,
                            MarginTop = 10
                        };
                        IronPdf.AspxToPdf.RenderThisPageAsPdf(IronPdf.AspxToPdf.FileBehavior.Attachment, "ElectricitBill"+ Session["Cnum"] + ".pdf",AspxToPdfOptions);
            */
        }
        protected void btnShowBill_Click(object sender, EventArgs e)
        {
            showDataFromOldBill();
            showBillPanel.Visible = true;
        }
        public void fetchData()
        {
            string selUD = "select * from userDetail where cnum = '" + Session["Cnum"] + "'";
            SqlDataAdapter sdaUD = new SqlDataAdapter(selUD, Class1.scn);
            DataTable dtUD = new DataTable();
            sdaUD.Fill(dtUD);
            if (dtUD.Rows.Count > 0)
            {
                labelUserName.Text = dtUD.Rows[0]["userName"].ToString();
                labelNumber.Text = dtUD.Rows[0]["number"].ToString();
                labelNumber2.Text = labelNumber.Text;
                labelAddress.Text = dtUD.Rows[0]["address"].ToString();
                labelVillage.Text = dtUD.Rows[0]["village"].ToString();
                labelPinCode.Text = dtUD.Rows[0]["pinCode"].ToString();
                labelBillType.Text = dtUD.Rows[0]["billType"].ToString();
                labelMeterNumber.Text = dtUD.Rows[0]["meterNumber"].ToString();
                labelZone.Text = dtUD.Rows[0]["billType"].ToString();
                labelEmail.Text = dtUD.Rows[0]["email"].ToString();
            }

            string sel = "select * from generateBill where cnum = '" + Session["Cnum"] + "'";
            SqlDataAdapter sda = new SqlDataAdapter(sel, Class1.scn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                labelCnum.Text = dt.Rows[0]["cnum"].ToString();
                labelCnum2.Text = labelCnum.Text;
                labelBillNumber.Text = dt.Rows[0]["billNumber"].ToString();
                labelBillNumber2.Text = labelBillNumber.Text;
                labelSubDivisionOffice.Text = dt.Rows[0]["subDivisionOffice"].ToString();
                issueBillDate = labelBillDate.Text = dt.Rows[0]["billDate"].ToString();
                labelLastDate.Text = dt.Rows[0]["lastDate"].ToString();
                labelUse.Text = dt.Rows[0]["useLight"].ToString();
                labelMeterCode.Text = dt.Rows[0]["meterCode"].ToString();
                labelHPKW.Text = dt.Rows[0]["hpkw"].ToString();
                labelSeasonal.Text = dt.Rows[0]["seasonal"].ToString();
                labelDays.Text = dt.Rows[0]["day"].ToString();
                labelSD.Text = dt.Rows[0]["sd"].ToString();
                labelPhase.Text = dt.Rows[0]["phase"].ToString();
                labelMeterStatus.Text = dt.Rows[0]["meterStatus"].ToString();
                labelMaxDemand.Text = dt.Rows[0]["maxDemand"].ToString();
                labelPresentActive.Text = dt.Rows[0]["presentActive"].ToString();
                labelPresentIMP.Text = dt.Rows[0]["presentIMP"].ToString();
                labelPresentReactive.Text = dt.Rows[0]["presentReactive"].ToString();
                labelPresentEXP.Text = dt.Rows[0]["presentEXP"].ToString();
                labelPastActive.Text = dt.Rows[0]["pastActive"].ToString();
                labelPastIMP.Text = dt.Rows[0]["pastIMP"].ToString();
                labelPastReactive.Text = dt.Rows[0]["pastReactive"].ToString();
                labelPastIMP.Text = dt.Rows[0]["pastIMP"].ToString();
                labelReadingActive.Text = dt.Rows[0]["readingActive"].ToString();
                labelReadingIMP.Text = dt.Rows[0]["readingImp"].ToString();
                labelReadingReactive.Text = dt.Rows[0]["readingReactive"].ToString();
                labelReadingEXP.Text = dt.Rows[0]["readingEXP"].ToString();
                labelMF.Text = dt.Rows[0]["mf"].ToString();
                labelTotalConsumption.Text = dt.Rows[0]["totalConsumption"].ToString();
                labelAverageConsumption.Text = dt.Rows[0]["averageConsumption"].ToString();
                labelMaxBillDemand.Text = dt.Rows[0]["maxBillDemand"].ToString();
                labelAverageMaxBillDemand.Text = dt.Rows[0]["averageMaxBillDemand"].ToString();
                labelCompanyCharges.Text = dt.Rows[0]["totalCompanyCharges"].ToString();
                labelFixed.Text = dt.Rows[0]["fixedCharges"].ToString();
                labelEnergy.Text = dt.Rows[0]["energyCharges"].ToString();
                labelUjala.Text = dt.Rows[0]["ujalaCharges"].ToString();
                labelReactive.Text = dt.Rows[0]["reactiveCharges"].ToString();
                labelFuel.Text = dt.Rows[0]["fuelCharges"].ToString();
                labelElectricityDuty.Text = dt.Rows[0]["electricityDutyCharges"].ToString();
                labelMeter.Text = dt.Rows[0]["meterCharges"].ToString();
                labelDelayedPayment.Text = dt.Rows[0]["delayedPaymentCharges"].ToString();
                labelProRefund.Text = dt.Rows[0]["provisionalBillRefund"].ToString();
                labelNetTotal.Text = dt.Rows[0]["netBill"].ToString();
                labelGovtRelief.Text = dt.Rows[0]["govtRelife"].ToString();
                labelGrandTotal.Text = dt.Rows[0]["grandTotal"].ToString();
                DropDownPaymentType.Text = dt.Rows[0]["paymentType"].ToString();

                showBillPanel.Visible = true;
                
            }
        }
        public void showDataFromOldBill()
        {
            string select = "select * from oldBill where cnum = '" + Session["Cnum"] + "' and billDate = '" + ddlDate.Text + "' ";
            SqlDataAdapter sdaShowDate = new SqlDataAdapter(select, Class1.scn);
            DataTable dtShow = new DataTable();
            sdaShowDate.Fill(dtShow);
            if (dtShow.Rows.Count > 0)
            {
                labelCnum.Text = dtShow.Rows[0]["cnum"].ToString();
                labelCnum2.Text = labelCnum.Text;
                labelBillNumber.Text = dtShow.Rows[0]["billNumber"].ToString();
                labelBillNumber2.Text = labelBillNumber.Text;
                labelSubDivisionOffice.Text = dtShow.Rows[0]["subDivisionOffice"].ToString();
                issueBillDate = labelBillDate.Text = dtShow.Rows[0]["billDate"].ToString();
                labelLastDate.Text = dtShow.Rows[0]["lastDate"].ToString();
                labelEndDate.Text = dtShow.Rows[0]["endDate"].ToString();
                labelUse.Text = dtShow.Rows[0]["useLight"].ToString();
                labelMeterCode.Text = dtShow.Rows[0]["meterCode"].ToString();
                labelHPKW.Text = dtShow.Rows[0]["hpkw"].ToString();
                labelSeasonal.Text = dtShow.Rows[0]["seasonal"].ToString();
                labelDays.Text = dtShow.Rows[0]["day"].ToString();
                labelSD.Text = dtShow.Rows[0]["sd"].ToString();
                labelPhase.Text = dtShow.Rows[0]["phase"].ToString();
                labelMeterStatus.Text = dtShow.Rows[0]["meterStatus"].ToString();
                labelMaxDemand.Text = dtShow.Rows[0]["maxDemand"].ToString();
                labelPresentActive.Text = dtShow.Rows[0]["presentActive"].ToString();
                labelPresentIMP.Text = dtShow.Rows[0]["presentIMP"].ToString();
                labelPresentReactive.Text = dtShow.Rows[0]["presentReactive"].ToString();
                labelPresentEXP.Text = dtShow.Rows[0]["presentEXP"].ToString();
                labelPastActive.Text = dtShow.Rows[0]["pastActive"].ToString();
                labelPastIMP.Text = dtShow.Rows[0]["pastIMP"].ToString();
                labelPastReactive.Text = dtShow.Rows[0]["pastReactive"].ToString();
                labelPastIMP.Text = dtShow.Rows[0]["pastIMP"].ToString();
                labelReadingActive.Text = dtShow.Rows[0]["readingActive"].ToString();
                labelReadingIMP.Text = dtShow.Rows[0]["readingImp"].ToString();
                labelReadingReactive.Text = dtShow.Rows[0]["readingReactive"].ToString();
                labelReadingEXP.Text = dtShow.Rows[0]["readingEXP"].ToString();
                labelMF.Text = dtShow.Rows[0]["mf"].ToString();
                labelTotalConsumption.Text = dtShow.Rows[0]["totalConsumption"].ToString();
                labelAverageConsumption.Text = dtShow.Rows[0]["averageConsumption"].ToString();
                labelMaxBillDemand.Text = dtShow.Rows[0]["maxBillDemand"].ToString();
                labelAverageMaxBillDemand.Text = dtShow.Rows[0]["averageMaxBillDemand"].ToString();
                labelCompanyCharges.Text = dtShow.Rows[0]["totalCompanyCharges"].ToString();
                labelFixed.Text = dtShow.Rows[0]["fixedCharges"].ToString();
                labelEnergy.Text = dtShow.Rows[0]["energyCharges"].ToString();
                labelUjala.Text = dtShow.Rows[0]["ujalaCharges"].ToString();
                labelReactive.Text = dtShow.Rows[0]["reactiveCharges"].ToString();
                labelFuel.Text = dtShow.Rows[0]["fuelCharges"].ToString();
                labelElectricityDuty.Text = dtShow.Rows[0]["electricityDutyCharges"].ToString();
                labelMeter.Text = dtShow.Rows[0]["meterCharges"].ToString();
                labelDelayedPayment.Text = dtShow.Rows[0]["delayedPaymentCharges"].ToString();
                labelProRefund.Text = dtShow.Rows[0]["provisionalBillRefund"].ToString();
                labelNetTotal.Text = dtShow.Rows[0]["netBill"].ToString();
                labelGovtRelief.Text = dtShow.Rows[0]["govtRelife"].ToString();
                labelGrandTotal.Text = dtShow.Rows[0]["grandTotal"].ToString();
                DropDownPaymentType.Text = dtShow.Rows[0]["paymentType"].ToString();
            }
            
        }
        public void selectDataFromOldBill()
        {
            // select data in dropdownl list 
            string select = "select * from oldBill where cnum = '" + Session["Cnum"] + "' ";
            SqlDataAdapter sdaSelectDate = new SqlDataAdapter(select, Class1.scn);
            dtSelect = new DataTable();
            sdaSelectDate.Fill(dtSelect);
            if (dtSelect.Rows.Count > 0)
            {
                foreach (DataRow dr in dtSelect.Rows)
                {
                    ddlDate.DataTextField = dr["billDate"].ToString();
                    ddlDate.Items.Add(dr["billDate"].ToString());
                    ddlDate.DataValueField = dr["id"].ToString();

                    ddlDate.DataBind();
                }
            }
            else
            {
                ddlDate.Visible = false;
                btnShowBill.Visible = false;
            }
        }
        protected void btnShowCurentBill_Click(object sender, EventArgs e)
        {
            fetchData();
            btnShowCurentBill.Visible = false;
            btnHideCurentBill.Visible = true;
            ddlDate.Visible = true;
            btnShowBill.Visible = true;
         
        }
        protected void btnHideCurentBill_Click(object sender, EventArgs e)
        {
            showBillPanel.Visible = false;
            btnHideCurentBill.Visible = false;
            btnShowCurentBill.Visible = true;
            ddlDate.Visible = false;
            btnShowBill.Visible = false;
        }
    }
}
