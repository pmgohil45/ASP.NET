<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtname" runat="server"></asp:TextBox><br />
        <asp:TextBox TextMode="Password" ID="txtpwd" runat="server"></asp:TextBox><br />
        <asp:Button ID="btnlog" Text="log in" runat="server" onclick="btnlog_Click" />
    </div>
    </form>
</body>
</html>
