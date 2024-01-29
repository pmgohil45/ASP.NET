<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forget.aspx.cs" Inherits="ElectricityBill.forget" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    <title>Forget Password</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="createBillTemp/fonts/material-icon/css/material-design-iconic-font.min.css"></link>

    <!-- Main css -->
    <link rel="stylesheet" href="createBillTemp/css/style.css"></link>
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
                        <h2 class="form-title">Forget Password</h2>
                        <form id="form2" class="register-form" runat="server">
                            <div class="form-group">
                                <asp:TextBox ID="txtCnum" runat="server" type="number" placeholder="Customer Number"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtNpwd" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="txtRpwd" TextMode="Password" placeholder="Re - Password" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group form-button">
                                <asp:Button ID="btnSave" Text="Change Password" class="form-submit" runat="server" OnClick="btnSave_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
    
</body>
</html>
