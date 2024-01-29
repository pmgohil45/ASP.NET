<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CaptchaDemo.login" UnobtrusiveValidationMode="None"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
            <asp:Label runat="server" Text="User Name : "></asp:Label>
            <asp:TextBox id="txtUnm" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUnm" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </br>
            <asp:Label runat="server" Text="Password : "></asp:Label>
            <asp:TextBox id="txtPwd" runat="server"></asp:TextBox>
             </br>
            <asp:Label runat="server" Text="Re - Password : "></asp:Label>
            <asp:TextBox id="rpwd" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="rpwd" ControlToValidate="txtPwd" ErrorMessage="Does not match a Password or Re-Password ."></asp:CompareValidator>            </br>
            <asp:Label runat="server" Text="Captcha : "></asp:Label>
            <asp:Label id="label1" runat="server" Text=""></asp:Label> </br>
            <asp:Label runat="server" Text="Type Captcha : "></asp:Label>
            <asp:TextBox id="txtCaptcha" runat="server"></asp:TextBox></br>
            <asp:Button id="btnSub" runat="server" Text="Submit" OnClick="btnSub_Click" />
         </div>
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/home.aspx">click me</asp:LinkButton>
    </form>
</body>
</html>