using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;

namespace ElectricityBill
{
    public partial class createBill : System.Web.UI.Page
    {
        string zone, meterStatus, labelMS, startBillDate, endDate, currentDt;
        float unit;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Cnum"] != null && Session["password"] != null || Session["adminNm"] != null && Session["adminPwd"] != null)
            {
                labelEndDate.Visible = false;
                btnPay.Visible = false;
                statusPanel.Visible = false;
                billPanel.Visible = false;

                // Functions
                dateFunction();
                checkBillValidity();
                deleteDataFromGetUnit();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
        protected void btnDownload_Click(object sender, EventArgs e)
        {
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
            IronPdf.AspxToPdf.RenderThisPageAsPdf(IronPdf.AspxToPdf.FileBehavior.Attachment, "ElectricitBill" + Session["Cnum"] + ".pdf", AspxToPdfOptions);
            */
        }
        public void fetchFromUdGu()
        {
            //select data from the userDetail table
            string selUserDetail = "select * from userDetail where cnum = '" + Request.QueryString["Cnum"] + "'";
            SqlDataAdapter sdaUserDetail = new SqlDataAdapter(selUserDetail, Class1.scn);
            DataTable dtUserDetail = new DataTable();
            sdaUserDetail.Fill(dtUserDetail);
            labelUserName.Text = dtUserDetail.Rows[0]["userName"].ToString();
            labelCnum.Text = dtUserDetail.Rows[0]["cnum"].ToString();
            labelCnum2.Text = labelCnum.Text;
            labelNumber.Text = dtUserDetail.Rows[0]["number"].ToString();
            labelNumber2.Text = labelNumber.Text;
            labelEmail.Text = dtUserDetail.Rows[0]["email"].ToString();
            labelAddress.Text = dtUserDetail.Rows[0]["address"].ToString();
            labelVillage.Text = dtUserDetail.Rows[0]["village"].ToString();
            labelPinCode.Text = dtUserDetail.Rows[0]["pinCode"].ToString();
            labelBillType.Text = dtUserDetail.Rows[0]["billType"].ToString();
            labelMeterNumber.Text = dtUserDetail.Rows[0]["meterNumber"].ToString();

            //select data from the getUnit table
            string selGetUnit = "select * from getUnit where cnum = '" + Request.QueryString["Cnum"] + "'";
            SqlDataAdapter sdaGetUnit = new SqlDataAdapter(selGetUnit, Class1.scn);
            DataTable dtGetUnit = new DataTable();
            sdaGetUnit.Fill(dtGetUnit);
            zone = labelZone.Text = dtGetUnit.Rows[0]["zone"].ToString();
            labelPhase.Text = dtGetUnit.Rows[0]["phase"].ToString();
            labelMS = labelMeterStatus.Text = dtGetUnit.Rows[0]["meterStatus"].ToString();
            labelBillNumber.Text = dtGetUnit.Rows[0]["billNumber"].ToString();
            labelBillNumber2.Text = labelBillNumber.Text;
            meterStatus = dtGetUnit.Rows[0]["meterStatus"].ToString();

            unit = Convert.ToSingle(meterStatus);
        }
        public void zoneFunction()
        {
            if (zone == "North")
            {
                labelSubDivisionOffice.Text = "Rajnagar";
            }
            else if (zone == "South")
            {
                labelSubDivisionOffice.Text = "Movdi Gaam";
            }
            else if (zone == "West")
            {
                labelSubDivisionOffice.Text = "West Zone Office";
            }
            else if (zone == "East")
            {
                labelSubDivisionOffice.Text = "Punitnagar";
            }
        }
        public void unitFunction()
        {
            labelDays.Text = "30";
            labelSD.Text = "2000.00";
            labelMaxDemand.Text = "0.00";
            labelMaxBillDemand.Text = "0.00";
            labelAverageMaxBillDemand.Text = "0.00";

            labelPresentIMP.Text = "0.00";
            labelPresentReactive.Text = "0.00";
            labelPresentEXP.Text = "0.00";

            labelPastIMP.Text = "0.00";
            labelPastReactive.Text = "0.00";
            labelPastEXP.Text = "0.00";

            labelReadingEXP.Text = "0.00";
            labelReadingReactive.Text = "0.00";
            labelReadingIMP.Text = "0.00";

            if (unit >= 1 && unit < 1000)
            {
                labelUse.Text = "Low";
                labelSeasonal.Text = "-";
                labelMeterCode.Text = "-";
                float u = unit * 8;

                float kw1 = unit / 100;
                float hp1 = kw1 * 2; // 2hours
                float hp2 = hp1 * 30; // 30days
                labelHPKW.Text = hp2.ToString() + " / " + kw1.ToString();

                float mf = u * 1 / 100;
                labelMF.Text = mf.ToString();

                float tc = u * 3 / 100;
                labelTotalConsumption.Text = tc.ToString();

                float ac = u * 2 / 100;
                labelAverageConsumption.Text = ac.ToString();

                float tcc = u * 15 / 100;
                labelCompanyCharges.Text = tcc.ToString();


                float fixedC = u * 2 / 100;
                labelFixed.Text = Convert.ToString(fixedC);

                float energyC = u * 9 / 100;
                labelEnergy.Text = Convert.ToString(energyC);

                float ujalaC = 0;
                labelUjala.Text = Convert.ToString(ujalaC);

                float reactiveC = 0;
                labelReactive.Text = Convert.ToString(reactiveC);

                float fuelC = u * 7 / 100;
                labelFuel.Text = Convert.ToString(fuelC);

                float electricityDutyC = u * 5 / 100;
                labelElectricityDuty.Text = Convert.ToString(electricityDutyC);

                float meterC = 0;
                labelMeter.Text = Convert.ToString(meterC);

                float paymentC = 0;
                labelDelayedPayment.Text = Convert.ToString(paymentC);

                float proBillRefundC = 0;
                labelProRefund.Text = Convert.ToString(proBillRefundC);

                float netBill = fixedC + energyC + ujalaC + reactiveC + fuelC + electricityDutyC + meterC + paymentC - proBillRefundC;
                labelNetTotal.Text = Convert.ToString(netBill);

                float govtR = 0;
                labelGovtRelief.Text = Convert.ToString(govtR);

                float grandT = netBill - govtR;
                labelGrandTotal.Text = Convert.ToString(grandT);

                float lms = Convert.ToSingle(labelMS);
                if (lms >= 1 && lms < 100)
                {
                    string a1 = labelPresentActive.Text = "130.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);

                }
                else if (lms >= 100 && lms < 200)
                {
                    string a1 = labelPresentActive.Text = "240.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 200 && lms < 300)
                {
                    string a1 = labelPresentActive.Text = "340.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 300 && lms < 400)
                {
                    string a1 = labelPresentActive.Text = "435.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 400 && lms < 500)
                {
                    string a1 = labelPresentActive.Text = "535.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 500 && lms < 600)
                {
                    string a1 = labelPresentActive.Text = "630.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 600 && lms < 700)
                {
                    string a1 = labelPresentActive.Text = "740.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 700 && lms < 800)
                {
                    string a1 = labelPresentActive.Text = "828.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 800 && lms < 900)
                {
                    string a1 = labelPresentActive.Text = "928.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 900 && lms < 1000)
                {
                    string a1 = labelPresentActive.Text = "1035.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
            }
            else if (unit >= 1000 && unit < 10000)
            {
                labelUse.Text = "Average";
                labelSeasonal.Text = "-";
                labelMeterCode.Text = "-";
                float u = unit * 10;

                float kw1 = unit / 100;
                float hp1 = kw1 * 2; // 2hours
                float hp2 = hp1 * 30; // 30days
                labelHPKW.Text = hp2.ToString() + " / " + kw1.ToString();

                float mf = u * 2 / 100;
                labelMF.Text = mf.ToString();

                float tc = u * 4 / 100;
                labelTotalConsumption.Text = tc.ToString();

                float ac = u * 3 / 100;
                labelAverageConsumption.Text = ac.ToString();

                float tcc = u * 16 / 100;
                labelCompanyCharges.Text = tcc.ToString();


                float fixedC = u * 3 / 100;
                labelFixed.Text = Convert.ToString(fixedC);

                float energyC = u * 10 / 100;
                labelEnergy.Text = Convert.ToString(energyC);

                float ujalaC = u * 1 / 100;
                labelUjala.Text = Convert.ToString(ujalaC);

                float reactiveC = 0;
                labelReactive.Text = Convert.ToString(reactiveC);

                float fuelC = u * 8 / 100;
                labelFuel.Text = Convert.ToString(fuelC);

                float electricityDutyC = u * 7 / 100;
                labelElectricityDuty.Text = Convert.ToString(electricityDutyC);

                float meterC = 0;
                labelMeter.Text = Convert.ToString(meterC);

                float paymentC = 0;
                labelDelayedPayment.Text = Convert.ToString(paymentC);

                float proBillRefundC = 0;
                labelProRefund.Text = Convert.ToString(proBillRefundC);

                float netBill = fixedC + energyC + ujalaC + reactiveC + fuelC + electricityDutyC + meterC + paymentC - proBillRefundC;
                labelNetTotal.Text = Convert.ToString(netBill);

                float govtR = 0;
                labelGovtRelief.Text = Convert.ToString(govtR);

                float grandT = netBill - govtR;
                labelGrandTotal.Text = Convert.ToString(grandT);

                float lms = Convert.ToSingle(labelMS);
                if (lms >= 1000 && lms < 2000)
                {
                    string a1 = labelPresentActive.Text = "2406.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);

                }
                else if (lms >= 2000 && lms < 3000)
                {
                    string a1 = labelPresentActive.Text = "3568.20";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 3000 && lms < 4000)
                {
                    string a1 = labelPresentActive.Text = "4345.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 4000 && lms < 5000)
                {
                    string a1 = labelPresentActive.Text = "5335.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 5000 && lms < 6000)
                {
                    string a1 = labelPresentActive.Text = "6630.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 6000 && lms < 7000)
                {
                    string a1 = labelPresentActive.Text = "7640.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 7000 && lms < 8000)
                {
                    string a1 = labelPresentActive.Text = "8828.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 8000 && lms < 9000)
                {
                    string a1 = labelPresentActive.Text = "9828.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 9000 && lms < 10000)
                {
                    string a1 = labelPresentActive.Text = "10565.37";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
            }
            else if (unit >= 10000 && unit < 20000)
            {
                labelUse.Text = "Medium";
                labelSeasonal.Text = "-";
                labelMeterCode.Text = "-";
                float u = unit * 13;

                float kw1 = unit / 100;
                float hp1 = kw1 * 2; // 2hours
                float hp2 = hp1 * 30; // 30days
                labelHPKW.Text = hp2.ToString() + " / " + kw1.ToString();

                float mf = u * 3 / 100;
                labelMF.Text = mf.ToString();

                float tc = u * 5 / 100;
                labelTotalConsumption.Text = tc.ToString();

                float ac = u * 4 / 100;
                labelAverageConsumption.Text = ac.ToString();

                float tcc = u * 17 / 100;
                labelCompanyCharges.Text = tcc.ToString();

                float fixedC = u * 4 / 100;
                labelFixed.Text = Convert.ToString(fixedC);

                float energyC = u * 11 / 100;
                labelEnergy.Text = Convert.ToString(energyC);

                float ujalaC = u * 2 / 100;
                labelUjala.Text = Convert.ToString(ujalaC);

                float reactiveC = 0;
                labelReactive.Text = Convert.ToString(reactiveC);

                float fuelC = u * 9 / 100;
                labelFuel.Text = Convert.ToString(fuelC);

                float electricityDutyC = u * 8 / 100;
                labelElectricityDuty.Text = Convert.ToString(electricityDutyC);

                float meterC = 0;
                labelMeter.Text = Convert.ToString(meterC);

                float paymentC = 0;
                labelDelayedPayment.Text = Convert.ToString(paymentC);

                float proBillRefundC = 0;
                labelProRefund.Text = Convert.ToString(proBillRefundC);

                float netBill = fixedC + energyC + ujalaC + reactiveC + fuelC + electricityDutyC + meterC + paymentC - proBillRefundC;
                labelNetTotal.Text = Convert.ToString(netBill);

                float govtR = 0;
                labelGovtRelief.Text = Convert.ToString(govtR);

                float grandT = netBill - govtR;
                labelGrandTotal.Text = Convert.ToString(grandT);

                float lms = Convert.ToSingle(labelMS);
                if (lms >= 10000 && lms < 11000)
                {
                    string a1 = labelPresentActive.Text = "11206.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);

                }
                else if (lms >= 11000 && lms < 12000)
                {
                    string a1 = labelPresentActive.Text = "12168.20";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 12000 && lms < 13000)
                {
                    string a1 = labelPresentActive.Text = "13345.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 13000 && lms < 14000)
                {
                    string a1 = labelPresentActive.Text = "14345.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 14000 && lms < 15000)
                {
                    string a1 = labelPresentActive.Text = "15335.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 15000 && lms < 16000)
                {
                    string a1 = labelPresentActive.Text = "16630.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 16000 && lms < 17000)
                {
                    string a1 = labelPresentActive.Text = "17340.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 17000 && lms < 18000)
                {
                    string a1 = labelPresentActive.Text = "18428.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 18000 && lms < 19000)
                {
                    string a1 = labelPresentActive.Text = "19565.37";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 19000 && lms < 20000)
                {
                    string a1 = labelPresentActive.Text = "20565.37";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
            }
            else if (unit >= 20000 && unit < 30000)
            {
                labelUse.Text = "High";
                labelSeasonal.Text = "-";
                labelMeterCode.Text = "-";
                float u = unit * 14;

                float kw1 = unit / 100;
                float hp1 = kw1 * 2; // 2hours
                float hp2 = hp1 * 30; // 30days
                labelHPKW.Text = hp2.ToString() + " / " + kw1.ToString();

                float mf = u * 4 / 100;
                labelMF.Text = mf.ToString();

                float tc = u * 6 / 100;
                labelTotalConsumption.Text = tc.ToString();

                float ac = u * 5 / 100;
                labelAverageConsumption.Text = ac.ToString();

                float tcc = u * 18 / 100;
                labelCompanyCharges.Text = tcc.ToString();


                float fixedC = u * 5 / 100;
                labelFixed.Text = Convert.ToString(fixedC);

                float energyC = u * 12 / 100;
                labelEnergy.Text = Convert.ToString(energyC);

                float ujalaC = u * 3 / 100;
                labelUjala.Text = Convert.ToString(ujalaC);

                float reactiveC = 0;
                labelReactive.Text = Convert.ToString(reactiveC);

                float fuelC = u * 10 / 100;
                labelFuel.Text = Convert.ToString(fuelC);

                float electricityDutyC = u * 9 / 100;
                labelElectricityDuty.Text = Convert.ToString(electricityDutyC);

                float meterC = 0;
                labelMeter.Text = Convert.ToString(meterC);

                float paymentC = 0;
                labelDelayedPayment.Text = Convert.ToString(paymentC);

                float proBillRefundC = 0;
                labelProRefund.Text = Convert.ToString(proBillRefundC);

                float netBill = fixedC + energyC + ujalaC + reactiveC + fuelC + electricityDutyC + meterC + paymentC - proBillRefundC;
                labelNetTotal.Text = Convert.ToString(netBill);

                float govtR = 0;
                labelGovtRelief.Text = Convert.ToString(govtR);

                float grandT = netBill - govtR;
                labelGrandTotal.Text = Convert.ToString(grandT);

                float lms = Convert.ToSingle(labelMS);
                if (lms >= 20000 && lms < 21000)
                {
                    string a1 = labelPresentActive.Text = "21506.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);

                }
                else if (lms >= 21000 && lms < 22000)
                {
                    string a1 = labelPresentActive.Text = "22368.20";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 22000 && lms < 23000)
                {
                    string a1 = labelPresentActive.Text = "23345.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 23000 && lms < 24000)
                {
                    string a1 = labelPresentActive.Text = "24335.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 24000 && lms < 25000)
                {
                    string a1 = labelPresentActive.Text = "25430.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 25000 && lms < 26000)
                {
                    string a1 = labelPresentActive.Text = "26640.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 26000 && lms < 27000)
                {
                    string a1 = labelPresentActive.Text = "27328.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 27000 && lms < 28000)
                {
                    string a1 = labelPresentActive.Text = "28565.37";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 28000 && lms < 29000)
                {
                    string a1 = labelPresentActive.Text = "29565.37";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 29000 && lms < 30000)
                {
                    string a1 = labelPresentActive.Text = "30565.37";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
            }
            else if (unit >= 30000 && unit < 40000)
            {
                labelUse.Text = "Highest";
                labelSeasonal.Text = "-";
                labelMeterCode.Text = "-";
                float u = unit * 16;

                float kw1 = unit / 100;
                float hp1 = kw1 * 2; // 2hours
                float hp2 = hp1 * 30; // 30days
                labelHPKW.Text = hp2.ToString() + " / " + kw1.ToString();

                float mf = u * 5 / 100;
                labelMF.Text = mf.ToString();

                float tc = u * 7 / 100;
                labelTotalConsumption.Text = tc.ToString();

                float ac = u * 6 / 100;
                labelAverageConsumption.Text = ac.ToString();

                float tcc = u * 19 / 100;
                labelCompanyCharges.Text = tcc.ToString();


                float fixedC = u * 5 / 100;
                labelFixed.Text = Convert.ToString(fixedC);

                float energyC = u * 13 / 100;
                labelEnergy.Text = Convert.ToString(energyC);

                float ujalaC = u * 4 / 100;
                labelUjala.Text = Convert.ToString(ujalaC);

                float reactiveC = 0;
                labelReactive.Text = Convert.ToString(reactiveC);

                float fuelC = u * 11 / 100;
                labelFuel.Text = Convert.ToString(fuelC);

                float electricityDutyC = u * 10 / 100;
                labelElectricityDuty.Text = Convert.ToString(electricityDutyC);

                float meterC = 0;
                labelMeter.Text = Convert.ToString(meterC);

                float paymentC = 0;
                labelDelayedPayment.Text = Convert.ToString(paymentC);

                float proBillRefundC = 0;
                labelProRefund.Text = Convert.ToString(proBillRefundC);

                float netBill = fixedC + energyC + ujalaC + reactiveC + fuelC + electricityDutyC + meterC + paymentC - proBillRefundC;
                labelNetTotal.Text = Convert.ToString(netBill);

                float govtR = 0;
                labelGovtRelief.Text = Convert.ToString(govtR);

                float grandT = netBill - govtR;
                labelGrandTotal.Text = Convert.ToString(grandT);

                float lms = Convert.ToSingle(labelMS);
                if (lms >= 30000 && lms < 31000)
                {
                    string a1 = labelPresentActive.Text = "31506.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);

                }
                else if (lms >= 31000 && lms < 32000)
                {
                    string a1 = labelPresentActive.Text = "32368.20";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 32000 && lms < 33000)
                {
                    string a1 = labelPresentActive.Text = "33345.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 33000 && lms < 34000)
                {
                    string a1 = labelPresentActive.Text = "34335.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 34000 && lms < 35000)
                {
                    string a1 = labelPresentActive.Text = "35430.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 35000 && lms < 36000)
                {
                    string a1 = labelPresentActive.Text = "36640.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 36000 && lms < 37000)
                {
                    string a1 = labelPresentActive.Text = "32328.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 37000 && lms < 38000)
                {
                    string a1 = labelPresentActive.Text = "38565.37";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 38000 && lms < 39000)
                {
                    string a1 = labelPresentActive.Text = "39565.37";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 39000 && lms < 40000)
                {
                    string a1 = labelPresentActive.Text = "40565.37";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
            }
            else if (unit >= 40000 && unit < 50000)
            {
                labelUse.Text = "Extreme";
                labelSeasonal.Text = "-";
                labelMeterCode.Text = "-";
                float u = unit * 17;

                float kw1 = unit / 100;
                float hp1 = kw1 * 2; // 2hours
                float hp2 = hp1 * 30; // 30days
                labelHPKW.Text = hp2.ToString() + " / " + kw1.ToString();

                float mf = u * 6 / 100;
                labelMF.Text = mf.ToString();

                float tc = u * 8 / 100;
                labelTotalConsumption.Text = tc.ToString();

                float ac = u * 7 / 100;
                labelAverageConsumption.Text = ac.ToString();

                float tcc = u * 20 / 100;
                labelCompanyCharges.Text = tcc.ToString();


                float fixedC = u * 6 / 100;
                labelFixed.Text = Convert.ToString(fixedC);

                float energyC = u * 14 / 100;
                labelEnergy.Text = Convert.ToString(energyC);

                float ujalaC = u * 5 / 100;
                labelUjala.Text = Convert.ToString(ujalaC);

                float reactiveC = 0;
                labelReactive.Text = Convert.ToString(reactiveC);

                float fuelC = u * 12 / 100;
                labelFuel.Text = Convert.ToString(fuelC);

                float electricityDutyC = u * 11 / 100;
                labelElectricityDuty.Text = Convert.ToString(electricityDutyC);

                float meterC = 0;
                labelMeter.Text = Convert.ToString(meterC);

                float paymentC = 0;
                labelDelayedPayment.Text = Convert.ToString(paymentC);

                float proBillRefundC = 0;
                labelProRefund.Text = Convert.ToString(proBillRefundC);

                float netBill = fixedC + energyC + ujalaC + reactiveC + fuelC + electricityDutyC + meterC + paymentC - proBillRefundC;
                labelNetTotal.Text = Convert.ToString(netBill);

                float govtR = 0;
                labelGovtRelief.Text = Convert.ToString(govtR);

                float grandT = netBill - govtR;
                labelGrandTotal.Text = Convert.ToString(grandT);

                float lms = Convert.ToSingle(labelMS);
                if (lms >= 40000 && lms < 41000)
                {
                    string a1 = labelPresentActive.Text = "41506.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);

                }
                else if (lms >= 41000 && lms < 42000)
                {
                    string a1 = labelPresentActive.Text = "42368.20";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 42000 && lms < 43000)
                {
                    string a1 = labelPresentActive.Text = "43345.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 43000 && lms < 44000)
                {
                    string a1 = labelPresentActive.Text = "44335.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 44000 && lms < 45000)
                {
                    string a1 = labelPresentActive.Text = "45430.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 45000 && lms < 46000)
                {
                    string a1 = labelPresentActive.Text = "46640.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 46000 && lms < 47000)
                {
                    string a1 = labelPresentActive.Text = "47328.00";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 47000 && lms < 48000)
                {
                    string a1 = labelPresentActive.Text = "48565.37";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 48000 && lms < 49000)
                {
                    string a1 = labelPresentActive.Text = "49565.37";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
                else if (lms >= 49000 && lms < 50000)
                {
                    string a1 = labelPresentActive.Text = "50565.37";
                    float a2 = Convert.ToSingle(a1);
                    string b1 = labelPastActive.Text = labelMeterStatus.Text;
                    float b2 = Convert.ToSingle(b1);
                    float ab = a2 - b2;
                    labelReadingActive.Text = Convert.ToString(ab);
                }
            }

        }
        public void dateFunction()
        {

            labelBillDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
            startBillDate = labelBillDate.Text;
            labelLastDate.Text = DateTime.Now.AddDays(10).ToString("dd-MM-yyyy");
            //labelPaymentDate.Text = labelBillDate.Text;
            labelPaymentDate.Text = "-";
            labelEndDate.Text = DateTime.Now.AddMonths(1).ToString("dd-MM-yyyy");
            endDate = labelEndDate.Text;
            //Response.Write(endDate);

            /*  
                // last date logic
                labelMonth1.Text = DateTime.Now.AddMonths(-3).ToString("dd-MM-yyyy");
                labelMonth2.Text = DateTime.Now.AddMonths(-2).ToString("dd-MM-yyyy");
                labelMonth3.Text = DateTime.Now.AddMonths(-1).ToString("dd-MM-yyyy");
            */
        }
        public void checkBillValidity()
        {
            currentDt = DateTime.Now.ToString("dd-MM-yyyy");
            string select = "select * from generateBill where cnum = '" + Request.QueryString["Cnum"] + "' "; //and billDate = '" + endDate + "'
            SqlDataAdapter sdaSelect = new SqlDataAdapter(select, Class1.scn);
            DataTable dtSelect = new DataTable();
            sdaSelect.Fill(dtSelect);

            fetchFromUdGu();
            zoneFunction();
            unitFunction();

            if (dtSelect.Rows.Count == 0)
            {
                // insert data in generateBill Tabel
                string insDownloadBill = "insert into generateBill(cnum,billNumber,subDivisionOffice,billDate,lastDate,endDate,useLight,meterCode,hpKw,seasonal,day,sd,phase,meterStatus,maxDemand,presentActive,presentIMP,presentReactive,presentEXP,pastActive,pastIMP,pastReactive,pastEXP,readingActive,readingImp,readingReactive,readingEXP,mf,totalConsumption,averageConsumption,maxBillDemand,averageMaxBillDemand,totalCompanyCharges,fixedCharges,energyCharges,ujalaCharges,reactiveCharges,fuelCharges,electricityDutyCharges,meterCharges,delayedPaymentCharges,provisionalBillRefund,netBill,govtRelife,grandTotal,paymentType) values('" + labelCnum.Text + "','" + labelBillNumber.Text + "','" + labelSubDivisionOffice.Text + "','" + labelBillDate.Text + "','" + labelLastDate.Text + "','" + labelEndDate.Text + "','" + labelUse.Text + "','" + labelMeterCode.Text + "','" + labelHPKW.Text + "','" + labelSeasonal.Text + "','" + labelDays.Text + "','" + labelSD.Text + "','" + labelPhase.Text + "','" + labelMS + "','" + labelMaxDemand.Text + "','" + labelPresentActive.Text + "','" + labelPresentIMP.Text + "','" + labelPresentReactive.Text + "','" + labelPresentEXP.Text + "','" + labelPastActive.Text + "','" + labelPastIMP.Text + "','" + labelPastReactive.Text + "','" + labelPastEXP.Text + "','" + labelReadingActive.Text + "','" + labelReadingIMP.Text + "','" + labelReadingReactive.Text + "','" + labelReadingEXP.Text + "','" + labelMF.Text + "','" + labelTotalConsumption.Text + "','" + labelAverageConsumption.Text + "','" + labelMaxBillDemand.Text + "','" + labelAverageMaxBillDemand.Text + "','" + labelCompanyCharges.Text + "','" + labelFixed.Text + "','" + labelEnergy.Text + "','" + labelUjala.Text + "','" + labelReactive.Text + "','" + labelFuel.Text + "','" + labelElectricityDuty.Text + "','" + labelMeter.Text + "','" + labelDelayedPayment.Text + "','" + labelProRefund.Text + "','" + labelNetTotal.Text + "','" + labelGovtRelief.Text + "','" + labelGrandTotal.Text + "','" + DropDownPaymentType.Text + "')";
                SqlDataAdapter sda = new SqlDataAdapter(insDownloadBill, Class1.scn);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                billPanel.Visible = true;
            }
            else
            {
                //currentDt = DateTime.Now.AddMonths(1).ToString("dd-MM-yyyy");
                
                if (endDate == currentDt)
                {
                    // insert data in oldBill table
                    string insOldBill = "insert into oldBill(cnum,billNumber,subDivisionOffice,billDate,lastDate,endDate,useLight,meterCode,hpKw,seasonal,day,sd,phase,meterStatus,maxDemand,presentActive,presentIMP,presentReactive,presentEXP,pastActive,pastIMP,pastReactive,pastEXP,readingActive,readingImp,readingReactive,readingEXP,mf,totalConsumption,averageConsumption,maxBillDemand,averageMaxBillDemand,totalCompanyCharges,fixedCharges,energyCharges,ujalaCharges,reactiveCharges,fuelCharges,electricityDutyCharges,meterCharges,delayedPaymentCharges,provisionalBillRefund,netBill,govtRelife,grandTotal,paymentType) values('" + labelCnum.Text + "','" + labelBillNumber.Text + "','" + labelSubDivisionOffice.Text + "','" + labelBillDate.Text + "','" + labelLastDate.Text + "','" + labelEndDate.Text + "','" + labelUse.Text + "','" + labelMeterCode.Text + "','" + labelHPKW.Text + "','" + labelSeasonal.Text + "','" + labelDays.Text + "','" + labelSD.Text + "','" + labelPhase.Text + "','" + labelMS + "','" + labelMaxDemand.Text + "','" + labelPresentActive.Text + "','" + labelPresentIMP.Text + "','" + labelPresentReactive.Text + "','" + labelPresentEXP.Text + "','" + labelPastActive.Text + "','" + labelPastIMP.Text + "','" + labelPastReactive.Text + "','" + labelPastEXP.Text + "','" + labelReadingActive.Text + "','" + labelReadingIMP.Text + "','" + labelReadingReactive.Text + "','" + labelReadingEXP.Text + "','" + labelMF.Text + "','" + labelTotalConsumption.Text + "','" + labelAverageConsumption.Text + "','" + labelMaxBillDemand.Text + "','" + labelAverageMaxBillDemand.Text + "','" + labelCompanyCharges.Text + "','" + labelFixed.Text + "','" + labelEnergy.Text + "','" + labelUjala.Text + "','" + labelReactive.Text + "','" + labelFuel.Text + "','" + labelElectricityDuty.Text + "','" + labelMeter.Text + "','" + labelDelayedPayment.Text + "','" + labelProRefund.Text + "','" + labelNetTotal.Text + "','" + labelGovtRelief.Text + "','" + labelGrandTotal.Text + "','" + DropDownPaymentType.Text + "')";
                    SqlDataAdapter sdaOldBill = new SqlDataAdapter(insOldBill, Class1.scn);
                    DataTable dtOldBill = new DataTable();
                    sdaOldBill.Fill(dtOldBill);
                    billPanel.Visible = true;

                    // delete data from generateBill
                    string deleteData = "delete from generateBill where cnum = '" + Request.QueryString["Cnum"] + "'";
                    SqlDataAdapter deleteSda = new SqlDataAdapter(deleteData, Class1.scn);
                    DataTable deleteDt = new DataTable();
                    deleteSda.Fill(deleteDt);
                }
                else
                {
                    billPanel.Visible = false;
                    statusPanel.Visible = true;
                    labelStatus.Text = "Already Exist";
                    labelNote1.Text = "Note : See your bill after a one month...";
                    labelNote2.Text = "Thank You..!";
                }
            }
        }
        public void deleteDataFromGetUnit()
        {
            string delGetUnit = "delete from getUnit where cnum = '" + Request.QueryString["Cnum"] + "'";
            SqlDataAdapter delGetSda = new SqlDataAdapter(delGetUnit, Class1.scn);
            DataTable delGetDt = new DataTable();
            delGetSda.Fill(delGetDt);
        }
    }
}