<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="forget.aspx.cs" Inherits="ElectricityBill.forget" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td colspan="2"><h2>Forget Password</h2></td>
                </tr>
                <tr>
                    <td>Bill Number : </td>
                    <td><asp:TextBox ID="txtCnum" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>New Password : </td>
                    <td><asp:TextBox ID="txtNpwd" TextMode="Password" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Re - Password : </td>
                    <td><asp:TextBox ID="txtRpwd" TextMode="Password" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
