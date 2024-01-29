<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="crudOperation.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        E-mail : 
        <asp:TextBox ID="txtEmail" runat="server" type="email"></asp:TextBox><br />

        Password : 
        <asp:TextBox ID="txtPass" type="password" runat="server"></asp:TextBox><br />

        <asp:Button ID="signIn" runat="server" Text="Sign In" OnClick="signIn_Click1" style="height: 29px" /><br />
        <a href="registration.aspx">Registration Here...</a>
    </form>
</body>
</html>
