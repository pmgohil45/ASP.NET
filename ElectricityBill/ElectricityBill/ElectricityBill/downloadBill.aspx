<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="downloadBill.aspx.cs" Inherits="ElectricityBill.createBill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Required me    ta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

     <!-- Bootstrap CSS library -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"crossorigin="anonymous">

    <!-- JS library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"crossorigin="anonymous"></script>
    
    <!-- Latest compiled JavaScript library -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"crossorigin="anonymous"></script>

    <title>Create Bill</title>

    <style>
        body {
            font-family: 'Times New Roman';
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="statusPanel" runat="server">
            <h1><asp:Label ID="labelStatus" class="labelStatus"  runat="server" Text=""></asp:Label></h1>
            <h2><asp:Label ID="labelNote1"  class="labelNote" runat="server" Text=""></asp:Label></h2>
            <h2><asp:Label ID="labelNote2" class="labelNote" runat="server" Text=""></asp:Label></h2>
        </asp:Panel>
        <asp:Panel ID="billPanel" runat="server">
        <asp:Label ID="labelEndDate" runat="server" Text=""></asp:Label>
            <div>
            <h2 align="center">Prakash Gohil Vij Company Limited</h2>
        </div>
            <div>
           <table align="center" border="1px">
                <tr style="border:none;">
                    <td><asp:Image ID="pgvclLogo" runat="server" ImageUrl="~/image/logo1.jpg" Height="150px" Width="150px" /></td>

                    <td colspan="2" style="padding:30px;" align="center"><asp:Label ID="Label3" runat="server" Text="Helpline Number :"></asp:Label><br />
                    <asp:Label ID="Label4" runat="server" Text="(+91)9512240793"></asp:Label></td>

                    <td colspan="4" style="font-size:60px" align="center">P.G.V.C.L.</td>

                    <td colspan="2" style="padding:30px;" align="center"><asp:Label ID="Label5" runat="server" Text="E - mail :"></asp:Label><br />
                    <asp:Label ID="Label6" runat="server" Text="pmgohil45@gmail.com"></asp:Label></td>

                    <td align="right"><asp:Image ID="payImage" class="d-flex justify-content-end" runat="server" ImageUrl="~/image/logo1.jpg" Height="150px" Width="150px"/></td>
                </tr>
                <tr>
                    <td rowspan="7" colspan="4">
                        User Name : <asp:Label runat="server" ID="labelUserName" Text=""></asp:Label><br />
                        Number : <asp:Label runat="server" ID="labelNumber" Text=""></asp:Label><br />
                        Address : <asp:Label runat="server" ID="labelAddress" Text=""></asp:Label><br />
                        Village : <asp:Label runat="server" ID="labelVillage" Text=""></asp:Label><br />
                        Pin Code : <asp:Label runat="server" ID="labelPinCode" Text=""></asp:Label><br />
                        Bill Type : <asp:Label runat="server" ID="labelBillType" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">Zone</td>
                    <td colspan="3"><asp:Label runat="server" ID="labelZone" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3">Sub-division Office</td>
                    <td colspan="3"><asp:Label runat="server" ID="labelSubDivisionOffice" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3">Customer Number</td>
                    <td colspan="3"><asp:Label runat="server" ID="labelCnum" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3">Bill Date</td>
                    <td colspan="3"><asp:Label runat="server" ID="labelBillDate" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="3"><asp:Label runat="server" ForeColor="red" ID="label7" Text="Last Date of Payment"></asp:Label></td>
                    <td colspan="3"><asp:Label  runat="server" ForeColor="Red" ID="labelLastDate" Text=""></asp:Label></td>
                </tr>
                <tr> 
                    <td>Use</td>
                    <td>Meter Code</td>
                    <td>H.P./K.W</td>
                    <td>Seasonal</td>
                    <td>Days</td>
                    <td>S.D</td>
                </tr>
                <tr>
                    <td  colspan="2">
                        Bill Number : <asp:Label runat="server" ID="labelBillNumber" Text=""></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:Label runat="server" ID="label9" Text=" Meter Number :"></asp:Label> 
                            <asp:Label runat="server" ID="labelMeterNumber" Text=""></asp:Label>
                    </td>
                    <td><asp:Label runat="server" ID="labelUse" Text=""></asp:Label></td>
                    <td align="Center"><asp:Label runat="server" ID="labelMeterCode" Text=""></asp:Label></td>
                    <td><asp:Label runat="server" ID="labelHPKW" Text=""></asp:Label></td>
                    <td align="Center"><asp:Label runat="server" ID="labelSeasonal" Text=""></asp:Label></td>
                    <td><asp:Label runat="server" ID="labelDays" Text=""></asp:Label></td>
                    <td><asp:Label runat="server" ID="labelSD" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Phase</td>
                    <td colspan="3">Meter Status</td>
                    <td>Max. Demand</td>
                    <td align="center">Sr. No.</td>
                    <td colspan="3" align="center">Charges Details</td>
                    <td align="center">Rupee</td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" ID="labelPhase" Text=""></asp:Label></td>
                    <td colspan="3"><asp:Label runat="server" ID="labelMeterStatus" Text=""></asp:Label></td>
                    <td><asp:Label runat="server" ID="labelMaxDemand" Text=""></asp:Label></td>
                    <td align="center">1</td>
                    <td colspan="3">Fixed Charges</td>
                    <td align="center"><asp:Label runat="server" ID="labelFixed" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td></td>
                    <td align="center">Active</td>
                    <td align="center">IMP</td>
                    <td align="center">Reactive/Night</td>
                    <td align="center">EXP</td>
                    <td align="center">2</td>
                    <td colspan="3">Energy Charges</td>
                    <td align="center"><asp:Label runat="server" ID="labelEnergy" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Present Reading</td>
                    <td align="center"><asp:Label runat="server" ID="labelPresentActive" Text=""></asp:Label></td>
                    <td align="center"><asp:Label runat="server" ID="labelPresentIMP" Text=""></asp:Label></td>
                    <td align="center"><asp:Label runat="server" ID="labelPresentReactive" Text=""></asp:Label></td>
                    <td align="center"><asp:Label runat="server" ID="labelPresentEXP" Text=""></asp:Label></td>
                    <td align="center">3</td>
                    <td colspan="3">Ujala Charges</td>
                    <td align="center"><asp:Label runat="server" ID="labelUjala" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Past Reading</td>
                    <td align="center"><asp:Label runat="server" ID="labelPastActive" Text=""></asp:Label></td>
                    <td align="center"><asp:Label runat="server" ID="labelPastIMP" Text=""></asp:Label></td>
                    <td align="center"><asp:Label runat="server" ID="labelPastReactive" Text=""></asp:Label></td>
                    <td align="center"><asp:Label runat="server" ID="labelPastEXP" Text=""></asp:Label></td>
                    <td align="center">4</td>
                    <td colspan="3">Reactive Charges</td>
                    <td align="center"><asp:Label runat="server" ID="labelReactive" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Reading Difference</td>
                    <td align="center"><asp:Label runat="server" ID="labelReadingActive" Text=""></asp:Label></td>
                    <td align="center"><asp:Label runat="server" ID="labelReadingIMP" Text=""></asp:Label></td>
                    <td align="center"><asp:Label runat="server" ID="labelReadingReactive" Text=""></asp:Label></td>
                    <td align="center"><asp:Label runat="server" ID="labelReadingEXP" Text=""></asp:Label></td>
                    <td align="center">5</td>
                    <td colspan="3">Fuel Charges @ 2.5 Rs/Unit</td>
                    <td align="center"><asp:Label runat="server" ID="labelFuel" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>MF</td>
                    <td colspan="2" align="center"><asp:Label runat="server" ID="labelMF" Text=""></asp:Label></td>
                    <td colspan="2"></td>
                    <td align="center">6</td>
                    <td colspan="3">Electricity Duty Charges @ 15%</td>
                    <td align="center"><asp:Label runat="server" ID="labelElectricityDuty" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Total Consumption</td>
                    <td colspan="2" align="center"><asp:Label runat="server" ID="labelTotalConsumption" Text=""></asp:Label></td>
                    <td colspan="2"></td>
                    <td align="center">7</td>
                    <td colspan="3">Meter Charges</td>
                    <td align="center"><asp:Label runat="server" ID="labelMeter" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Average Consumption</td>
                    <td colspan="2" align="center"><asp:Label runat="server" ID="labelAverageConsumption" Text=""></asp:Label></td>
                    <td colspan="2"></td>
                    <td align="center">8</td>
                    <td colspan="3">Delayed Payment Charges</td>
                    <td align="center"><asp:Label runat="server" ID="labelDelayedPayment" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Max Bill Demand</td>
                    <td colspan="2" align="center"><asp:Label runat="server" ID="labelMaxBillDemand" Text=""></asp:Label></td>
                    <td colspan="2"></td>
                    <td align="center">9</td>
                    <td colspan="3">Provisional Bill Refund Amount</td>
                    <td align="center"><asp:Label runat="server" ID="labelProRefund" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Average Max Bill Demand</td>
                    <td colspan="2" align="center"><asp:Label runat="server" ID="labelAverageMaxBillDemand" Text=""></asp:Label></td>
                    <td colspan="2"></td>
                    <td align="center">10</td>
                    <td colspan="3">Net Total</td>
                    <td align="center"><asp:Label runat="server" ID="labelNetTotal" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Total Company Charges</td>
                    <td colspan="2" align="center"><asp:Label runat="server" ID="labelCompanyCharges" Text=""></asp:Label></td>
                    <td colspan="2"></td>
                    <td align="center">11</td>
                    <td colspan="3">Government Relief Fund</td>
                    <td align="center"><asp:Label runat="server" ID="labelGovtRelief" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="5"></td>
                    <td align="center">12</td>
                    <td colspan="3" style="color:red;">Grand Total</td>
                    <td align="center" style="text-align:center; color:red;"><asp:Label runat="server" ID="labelGrandTotal" Text=""></asp:Label></td>
                </tr>
                <!--
                <tr>
                    <td colspan="10" style="text-align:center; font-size:32px; color:red;">Last Three Month Units Details</td>
                </tr>
                <tr>
                    <td>Month</td>
                    <td colspan="3" align="center"><asp:Label runat="server" ID="labelMonth1" Text=""></asp:Label></td>
                    <td colspan="3" align="center"><asp:Label runat="server" ID="labelMonth2" Text=""></asp:Label></td>
                    <td colspan="3" align="center"><asp:Label runat="server" ID="labelMonth3" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Unit</td>
                    <td colspan="3" align="center"><asp:Label runat="server" ID="labelUnitM1" Text=""></asp:Label></td>
                    <td colspan="3" align="center"><asp:Label runat="server" ID="labelUnitM2" Text=""></asp:Label></td>
                    <td colspan="3" align="center"><asp:Label runat="server" ID="labelUnitM3" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Amount</td>
                    <td colspan="3" align="center"><asp:Label runat="server" ID="labelAmountM1" Text=""></asp:Label></td>
                    <td colspan="3" align="center"><asp:Label runat="server" ID="labelAmountM2" Text=""></asp:Label></td>
                    <td colspan="3" align="center"><asp:Label runat="server" ID="labelAmountM3" Text=""></asp:Label></td>
                </tr>

                <tr>
                    <td colspan="10" style="text-align:center; font-size:34px; color:red;">
                        Total Amount Due : <asp:Label runat="server" ID="labelTotalAmountDue" Text=""></asp:Label>
                    </td>
                </tr>
                -->
                <tr>
                    <td colspan="10" style="text-align:center; font-size:26px;">
                        (Only For Office Use)
                    </td>
                </tr>
                <tr>
                    <td align="center" rowspan="4"><asp:Image ID="Image1" class="d-flex justify-content-end" runat="server" ImageUrl="~/image/logo1.jpg" Height="150px" Width="150px"/></td>
                    <td colspan="3">Payment Date</td>
                    <td colspan="3">Signature</td>
                    <td colspan="3">Payment Type</td>
                </tr>
                <tr>
                    <td colspan="3"><asp:Label runat="server" ID="labelPaymentDate" Text=""></asp:Label></td>
                    <td colspan="3"><asp:Label runat="server" ID="labelSignature" Text=""></asp:Label></td>
                    <td colspan="3">
                        <asp:DropDownList ID="DropDownPaymentType" runat="server">
                            <asp:ListItem ID="DDUPI">UPI</asp:ListItem>
                            <asp:ListItem ID="DDCash">Cash</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td  colspan="2">Customer Number :</td>
                    <td colspan="2"><asp:Label runat="server" ID="labelBillNumber2" Text=""></asp:Label></td>
                    <td  colspan="2">Bill Number :</td>
                    <td colspan="3"><asp:Label runat="server" ID="labelCnum2" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td  colspan="2">Mobile Number :</td>
                    <td colspan="2"><asp:Label runat="server" ID="labelNumber2" Text=""></asp:Label></td>
                    <td  colspan="2">E-mail :</td>
                    <td colspan="3"><asp:Label runat="server" ID="labelEmail" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="10" style="padding:10px;" align="center">
                        <asp:Label ID="Label1" runat="server" Text="Address : Nana Mava Road, Rajkot-360004"></asp:Label><br /></td>
                </tr>
                <tr>
                    <td colspan="10" align="right">
                        <asp:Button ID="btnPay" runat="server" Text="Pay Bill" />
                        <asp:Button ID="btnDownload" runat="server" Text="Download Bill" OnClick="btnDownload_Click" />
                    </td>
                </tr>
            </table>
        </div>
        </asp:Panel>
    </form>
</body>
</html>
