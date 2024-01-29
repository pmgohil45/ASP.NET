<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="ElectricityBill.registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Registation Form</title>

    <!-- Icons font CSS-->
    <link href="regiTemp/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="regiTemp/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="regiTemp/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="regiTemp/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="regiTemp/css/main.css" rel="stylesheet" media="all">

</head>
<body class="bg" style="background-color:#ff8788;">

    <!-- 
    <video autoplay muted loop class="myVideo">
        <source src="image/bgVideo.mp4" type="video/mp4">
    </video>
    -->

    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4 cardColor">
                <div class="card-body">
                    <h2 class="title">PGVCL Registration Form</h2>
                    <form id="form1" runat="server">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">User Name</label>
                                    <asp:TextBox class="input--style-4" runat="server" ID="txtUnm"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="txtUnm"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">E-mail</label>
                                    <asp:TextBox runat="server" class="input--style-4" ID="txtEmail" TextMode="Email"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter a valid email id." ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Number</label>
                                    <asp:TextBox class="input--style-4" runat="server" ID="txtNumber" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Gender</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">
                                            <asp:RadioButton ID="radioGenderMale" runat="server" value="Male" GroupName="radioGender" /> Male
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">
                                            <asp:RadioButton ID="radioGenderFemale" runat="server" value="Female" GroupName="radioGender"/> Female
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Password</label>
                                    <asp:TextBox class="input--style-4" runat="server" ID="txtPassword" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" ControlToValidate="txtRepassword"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Re - Password</label>
                            
                                    <asp:TextBox class="input--style-4" runat="server" TextMode="Password" ID="txtRepassword"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Doesn't match password." ControlToCompare="txtPassword" ControlToValidate="txtRepassword"></asp:CompareValidator>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Customer Number</label>
                                    <asp:TextBox class="input--style-4" runat="server" TextMode="number" ID="txtCnum"></asp:TextBox>
                                    
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Meter Number</label>
                                    <asp:TextBox class="input--style-4" runat="server" TextMode="number" ID="txtMeterNumber"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Address</label>
                                    <asp:TextBox class="input--style-4" ID="txtAddress" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Village</label>
                                    <asp:TextBox class="input--style-4" ID="txtVillage" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Taluka</label>
                                    <asp:TextBox class="input--style-4" ID="txtTaluka" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">District</label>
                                    <asp:TextBox class="input--style-4" ID="txtDistrict" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Pin Code</label>
                                    <asp:TextBox class="input--style-4" ID="txtPinCode" TextMode="Number" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <!--
                            <div class="input-group" style="float:left;">
                                <label class="label">Bill Type</label>
                                <div class="ddl">
                                    <asp:DropDownList ID="dropDownBillType" runat="server" > 
                                        <asp:ListItem>Rural</asp:ListItem>
                                        <asp:ListItem>Urban</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            -->

                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Bill Type</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">
                                            <asp:RadioButton ID="RadioButton1" runat="server" value="Rural" GroupName="dropDownBillType" /> Rural
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">
                                            <asp:RadioButton ID="RadioButton2" runat="server" value="Urban" GroupName="dropDownBillType"/> Urban
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Captcha</label>
                                    <strong><asp:Label class="label" runat="server" Text="" ID="labelCaptcha"></asp:Label></strong>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Type Captcha</label>
                                    <asp:TextBox class="input--style-4" runat="server" ID="txtTypeCaptcha"></asp:TextBox>
                                </div>
                            </div>

                        </div>
           
                        <div class="p-t-15">
                            <asp:Button class="btn btn--radius-2 btn--blue" runat="server" ID="btnSub" Text="Submit" OnClick="btnSub_Click" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
