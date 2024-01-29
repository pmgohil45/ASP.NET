<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="studDB.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Student Name : <asp:TextBox ID="txtSnm" runat="server"></asp:TextBox></br>
        Course : <asp:DropDownList ID="ddlC" runat="server">
            <asp:ListItem>BCA</asp:ListItem>
            <asp:ListItem>BBA</asp:ListItem>
            <asp:ListItem>B.Sc.IT</asp:ListItem>
        </asp:DropDownList></br>
        Div : <asp:DropDownList ID="ddlD" runat="server">
            <asp:ListItem>A</asp:ListItem>
            <asp:ListItem>B</asp:ListItem>
            <asp:ListItem>C</asp:ListItem>
            <asp:ListItem>D</asp:ListItem>
        </asp:DropDownList></br>
        Roll no. : <asp:TextBox ID="txtRlno" runat="server"></asp:TextBox></br>
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="snm" HeaderText="Student Name" />
                <asp:BoundField DataField="course" HeaderText="Course" />
                <asp:BoundField DataField="div" HeaderText="Div" />
                <asp:BoundField DataField="rlno" HeaderText="Roll No." />
            </Columns>
    </asp:GridView>
    </form>
</body>
</html>
