<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="crudOperation.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Name : 
        <asp:TextBox ID="txtNm" runat="server" type="text"></asp:TextBox><br />

        E-mail : 
        <asp:TextBox ID="txtEmail" runat="server" type="email"></asp:TextBox><br />

        Password : 
        <asp:TextBox ID="txtPass" type="password" runat="server"></asp:TextBox><br />

        <asp:Button ID="signUp" runat="server" Text="Sign Up" OnClick="signUp_Click1" style="height: 29px" />
    </form>
</body>
</html>
