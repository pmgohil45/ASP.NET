<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="crudOperation.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" />

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" />

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        From : <asp:DropDownList ID="ddlFrom" runat="server">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem id="li1">Rajkot</asp:ListItem>
                    <asp:ListItem id="li2">Jamnagar</asp:ListItem>
                    <asp:ListItem id="li3">Surat</asp:ListItem>
                    <asp:ListItem id="li4">Jetpur</asp:ListItem>
                </asp:DropDownList> 
        To : <asp:DropDownList ID="ddlTo" runat="server">
                <asp:ListItem>Select</asp:ListItem>
                <asp:ListItem id="l1">Rajkot</asp:ListItem>
                <asp:ListItem id="l2">Jamnagar</asp:ListItem>
                <asp:ListItem id="l3">Surat</asp:ListItem>
                <asp:ListItem id="l4">Jetpur</asp:ListItem>
             </asp:DropDownList><br />

        <asp:TextBox ID="txtRid" placeholder="Enter Id" runat="server"></asp:TextBox><br />

        <asp:Button ID="bb" runat="server" Text="Book Ticket" OnClick="bb_Click" />
        <asp:Button ID="vt" runat="server" Text="View Ticket" OnClick="vt_Click" />
        <asp:Button ID="update" runat="server" Text="Update Ticket" OnClick="update_Click1"/>
        <asp:Button ID="delete" runat="server" Text="Delete Ticket" OnClick="delete_Click"/>

        <asp:GridView ID="gridView" runat="server"></asp:GridView>
    </form>
</body>
</html>