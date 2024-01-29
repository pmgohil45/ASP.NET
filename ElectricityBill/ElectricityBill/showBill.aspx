<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="showBill.aspx.cs" Inherits="ElectricityBill.showBill" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

     <!-- Bootstrap CSS library -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"crossorigin="anonymous" />

    <!-- JS library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"crossorigin="anonymous"></script>
    
    <!-- Latest compiled JavaScript library -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"crossorigin="anonymous"></script>

    <script src="https://printjs-4de6.kxcdn.com/print.min.js"></script>
    <script src="https://printjs-4de6.kxcdn.com/print.min.css"></script>
    

    <title>Create Bill</title>

    <style>
        body{
            font-family: 'Times New Roman';
        }
        .ddlDate{
            text-align:center;
            width:100%;
            font-size: 4vh;
        }
        .btnShow{
            width:100%;
            background-color:#ff8788;
            color:#272727;
            text-align:center;
            border-color:transparent;
            font-size:3vh;
            margin-bottom:2vh;
        }
        .btnShow:hover{
            background-color:#272727;
            color:#ff8788;
            text-align:center;
            border-color:transparent;
            font-size:3vh;
        }
        .btnShow:focus{
            background-color:#272727;
            color:#ff8788;
            text-align:center;
            border-color:transparent;
            font-size:3vh;
        }
    </style>
</head>
<body>
  
      
    <form id="form1" runat="server" >
        <div>
        <asp:DropDownList ID="ddlDate" class="ddlDate"  runat="server">
        </asp:DropDownList>
        <asp:Button ID="btnShowBill" Class="btnShow" runat="server" Text="Show Privious Bill" OnClick="btnShowBill_Click" />
        <asp:Button ID="btnShowCurentBill" runat="server" Class="btnShow" OnClick="btnShowCurentBill_Click" Text="Show Current Bill" />
        <asp:Button ID="btnHideCurentBill" runat="server" Class="btnShow" Text="Hide Bill" OnClick="btnHideCurentBill_Click" />
        <asp:Label ID="labelEndDate" runat="server" Text=""></asp:Label>

        <asp:Panel ID="showBillPanel" runat="server">
        <asp:Panel ID="printBillPanel" runat="server">
            <div id="printDivAsPdf">
                <div>
                    <h1 align="center">Prakash Gohil Vij Company Limited</h1>
                </div>
                <table align="center" border="1" id="printTable">
                    <tr style="border-color:transparent;">
                        <td>
                            <asp:Image ID="pgvclLogo" runat="server" Height="150px" ImageUrl="\image\logo1.jpg" Width="150px" />
                        </td>
                        <td align="center" colspan="2" style="padding:20px;">
                            <asp:Label ID="Label3" runat="server" Text="Helpline Number :"></asp:Label>
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="(+91)9512240793"></asp:Label>
                        </td>
                        <td align="center" colspan="4" style="font-size:60px">P.G.V.C.L.</td>
                        <td align="center" colspan="2" style="padding:30px;">
                            <asp:Label ID="Label5" runat="server" Text="E - mail :"></asp:Label>
                            <br />
                            <asp:Label ID="Label6" runat="server" Text="pmgohil45@gmail.com"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Image ID="payImage" runat="server" class="d-flex justify-content-end" Height="150px" ImageUrl="\image\logo1.jpg" Width="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" rowspan="7">User Name :
                            <asp:Label ID="labelUserName" runat="server" Text=""></asp:Label>
                            <br />Number :
                            <asp:Label ID="labelNumber" runat="server" Text=""></asp:Label>
                            <br />Address :
                            <asp:Label ID="labelAddress" runat="server" Text=""></asp:Label>
                            <br />Village :
                            <asp:Label ID="labelVillage" runat="server" Text=""></asp:Label>
                            <br />Pin Code :
                            <asp:Label ID="labelPinCode" runat="server" Text=""></asp:Label>
                            <br />Bill Type :
                            <asp:Label ID="labelBillType" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">Zone</td>
                        <td colspan="3">
                            <asp:Label ID="labelZone" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">Sub-division Office</td>
                        <td colspan="3">
                            <asp:Label ID="labelSubDivisionOffice" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">Customer Number</td>
                        <td colspan="3">
                            <asp:Label ID="labelCnum" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">Bill Date</td>
                        <td colspan="3">
                            <asp:Label ID="labelBillDate" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="label7" runat="server" ForeColor="red" Text="Last Date of Payment"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="labelLastDate" runat="server" ForeColor="Red" Text=""></asp:Label>
                        </td>
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
                        <td colspan="2">Bill Number :
                            <asp:Label ID="labelBillNumber" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="2">
                            <asp:Label ID="label9" runat="server" Text=" Meter Number :"></asp:Label>
                            <asp:Label ID="labelMeterNumber" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="labelUse" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="Center">
                            <asp:Label ID="labelMeterCode" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="labelHPKW" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="Center">
                            <asp:Label ID="labelSeasonal" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="labelDays" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="labelSD" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Phase</td>
                        <td colspan="3">Meter Status</td>
                        <td>Max. Demand</td>
                        <td align="center">Sr. No.</td>
                        <td align="center" colspan="3">Charges Details</td>
                        <td align="center">Rupee</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="labelPhase" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="labelMeterStatus" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="labelMaxDemand" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="center">1</td>
                        <td colspan="3">Fixed Charges</td>
                        <td align="center">
                            <asp:Label ID="labelFixed" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td align="center">Active</td>
                        <td align="center">IMP</td>
                        <td align="center">Reactive/Night</td>
                        <td align="center">EXP</td>
                        <td align="center">2</td>
                        <td colspan="3">Energy Charges</td>
                        <td align="center">
                            <asp:Label ID="labelEnergy" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Present Reading</td>
                        <td align="center">
                            <asp:Label ID="labelPresentActive" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="center">
                            <asp:Label ID="labelPresentIMP" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="center">
                            <asp:Label ID="labelPresentReactive" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="center">
                            <asp:Label ID="labelPresentEXP" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="center">3</td>
                        <td colspan="3">Ujala Charges</td>
                        <td align="center">
                            <asp:Label ID="labelUjala" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Past Reading</td>
                        <td align="center">
                            <asp:Label ID="labelPastActive" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="center">
                            <asp:Label ID="labelPastIMP" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="center">
                            <asp:Label ID="labelPastReactive" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="center">
                            <asp:Label ID="labelPastEXP" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="center">4</td>
                        <td colspan="3">Reactive Charges</td>
                        <td align="center">
                            <asp:Label ID="labelReactive" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Reading Difference</td>
                        <td align="center">
                            <asp:Label ID="labelReadingActive" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="center">
                            <asp:Label ID="labelReadingIMP" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="center">
                            <asp:Label ID="labelReadingReactive" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="center">
                            <asp:Label ID="labelReadingEXP" runat="server" Text=""></asp:Label>
                        </td>
                        <td align="center">5</td>
                        <td colspan="3">Fuel Charges @ 2.5 Rs/Unit</td>
                        <td align="center">
                            <asp:Label ID="labelFuel" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>MF</td>
                        <td align="center" colspan="2">
                            <asp:Label ID="labelMF" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="2"></td>
                        <td align="center">6</td>
                        <td colspan="3">Electricity Duty Charges @ 15%</td>
                        <td align="center">
                            <asp:Label ID="labelElectricityDuty" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Total Consumption</td>
                        <td align="center" colspan="2">
                            <asp:Label ID="labelTotalConsumption" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="2"></td>
                        <td align="center">7</td>
                        <td colspan="3">Meter Charges</td>
                        <td align="center">
                            <asp:Label ID="labelMeter" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Average Consumption</td>
                        <td align="center" colspan="2">
                            <asp:Label ID="labelAverageConsumption" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="2"></td>
                        <td align="center">8</td>
                        <td colspan="3">Delayed Payment Charges</td>
                        <td align="center">
                            <asp:Label ID="labelDelayedPayment" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Max Bill Demand</td>
                        <td align="center" colspan="2">
                            <asp:Label ID="labelMaxBillDemand" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="2"></td>
                        <td align="center">9</td>
                        <td colspan="3">Provisional Bill Refund Amount</td>
                        <td align="center">
                            <asp:Label ID="labelProRefund" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Average Max Bill Demand</td>
                        <td align="center" colspan="2">
                            <asp:Label ID="labelAverageMaxBillDemand" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="2"></td>
                        <td align="center">10</td>
                        <td colspan="3">Net Total</td>
                        <td align="center">
                            <asp:Label ID="labelNetTotal" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Total Company Charges</td>
                        <td align="center" colspan="2">
                            <asp:Label ID="labelCompanyCharges" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="2"></td>
                        <td align="center">11</td>
                        <td colspan="3">Government Relief Fund</td>
                        <td align="center">
                            <asp:Label ID="labelGovtRelief" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5"></td>
                        <td align="center">12</td>
                        <td colspan="3" style="color:red;">Grand Total</td>
                        <td align="center" style="text-align:center; color:red;">
                            <asp:Label ID="labelGrandTotal" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                
                    <tr>
                        <td colspan="10" style="text-align:center; font-size:26px;">(Only For Office Use) </td>
                    </tr>
                    <tr style="border-left-color: transparent;">
                        <td align="center" rowspan="4">
                            <asp:Image ID="Image1" runat="server" class="d-flex justify-content-end" Height="150px" ImageUrl="\image\logo1.jpg" Width="150px" />
                        </td>
                        <td colspan="3">Payment Date</td>
                        <td colspan="3">Signature</td>
                        <td colspan="3">Payment Type</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="labelPaymentDate" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:Label ID="labelSignature" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="DropDownPaymentType" runat="server">
                                <asp:ListItem ID="DDUPI">UPI</asp:ListItem>
                                <asp:ListItem ID="DDCash">Cash</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="labelPay" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">Bill Number :</td>
                        <td colspan="2">
                            <asp:Label ID="labelBillNumber2" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="2">Customer Number :</td>
                        <td colspan="3">
                            <asp:Label ID="labelCnum2" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">Mobile Number :</td>
                        <td colspan="2">
                            <asp:Label ID="labelNumber2" runat="server" Text=""></asp:Label>
                        </td>
                        <td colspan="2">E-mail :</td>
                        <td colspan="3">
                            <asp:Label ID="labelEmail" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="10" style="padding:10px;">
                            <asp:Label ID="Label1" runat="server" Text="Address : Nana Mava Road, Rajkot-360004"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="10">
                            <asp:Button ID="btnPay" runat="server" OnClick="btnPay_Click1" Text="Pay Bill" />
                            <input type = "button" value = "Print" onclick = "printPdf()" />
                        </td>
                    </tr>
                  </table>
                
            </div>
        </asp:Panel>
        </asp:Panel>
        </div>
    </form>

    <script type="text/javascript">
        function printPdf() {
            window.print();
        }

        /*  printJS({ printable: './test-large.pdf', type: 'pdf', showModal: true })*/
    </script>
</body>
</html>
