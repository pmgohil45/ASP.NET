<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createBill.aspx.cs" Inherits="ElectricityBill.createBill1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    <title>Generate Bill</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="createBillTemp/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="createBillTemp/css/style.css">
</head>
<body style="background: #ff8788;">
    <div class="main" style="background: #ff8788;">
        <section class="signup" >
            <div class="container">
                <div class="signup-content" >
                    <div class="signup-image">
                        <figure><img src="image/logo2.png" alt="sing up image"></figure>
                    </div>
                    <div class="signup-form">
                        <h2 class="form-title">Generate Bill</h2>
                        <form id="form1" class="register-form" runat="server">
                            <div class="form-group">
                                <asp:TextBox ID="txtCnum" runat="server" type="number" placeholder="Customer Number"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtMeterStatus" runat="server" placeholder="Meter Status(Unit)"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="DropDownZone" runat="server" class="dropDownList form-control">
                                    <asp:ListItem>Zone</asp:ListItem>
                                    <asp:ListItem>North</asp:ListItem>
                                    <asp:ListItem>South</asp:ListItem>
                                    <asp:ListItem>East</asp:ListItem>
                                    <asp:ListItem>West</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:DropDownList ID="DropDownPhase" runat="server" class="form-control">
                                    <asp:ListItem>Phase</asp:ListItem>
                                    <asp:ListItem>One Phase</asp:ListItem>
                                    <asp:ListItem>Two Phase</asp:ListItem>
                                    <asp:ListItem>Three Phase</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group form-button">
                                <asp:Button ID="btnGenerateBill" runat="server" class="form-submit" Text="Generate Bill" OnClick="btnGenerateBill_Click1" />
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </section>
    </div>
    
</body>
</html>
