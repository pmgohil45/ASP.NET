<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="session.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Student Name : <asp:TextBox ID="txtSnm" runat="server"></asp:TextBox></br>
        Roll no. : <asp:TextBox ID="txtRlno" runat="server"></asp:TextBox></br>
        <asp:Button ID="btnLog" runat="server" Text="Login" onclick="Button1_Click" />
        <asp:Button ID="Button1" runat="server" Text="Sing Up" 
            onclick="Button1_Click1" />
    </div>
    </form>
</body>
</html>
