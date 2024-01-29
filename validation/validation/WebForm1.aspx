<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="validation.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Name :
        <asp:TextBox runat="server" ID="nm"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="nm" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </br>
        E-mail : 
        <asp:TextBox runat="server" TextMode="Email" ID="email"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="email" ErrorMessage="RegularExpressionValidator" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\@gmail.com+)*"></asp:RegularExpressionValidator>
        </br>
        Password :
        <asp:TextBox runat="server" TextMode="Password" ID="pwd"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="rpwd" ControlToValidate="pwd" ErrorMessage="CompareValidator"></asp:CompareValidator>
        </br>
        Re - Password :
        <asp:TextBox runat="server" TextMode="Password" ID="rpwd"></asp:TextBox></br>
        Contact :
        <asp:TextBox runat="server" TextMode="Number" ID="num" MaxLength="10"></asp:TextBox>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="num" 
            ErrorMessage="RangeValidator" MaximumValue="9999999999" 
            MinimumValue="1111111111"></asp:RangeValidator>
        </br>
        Gender :
        <asp:RadioButton ID="male" runat="server" Text="Male" GroupName="gender" />
        <asp:RadioButton ID="female" runat="server" Text="Female" GroupName="gender" /></br>
        <asp:Button ID="btn" runat="server" Text="Submit" />
        
        
    </div>
    </form>
</body>
</html>
