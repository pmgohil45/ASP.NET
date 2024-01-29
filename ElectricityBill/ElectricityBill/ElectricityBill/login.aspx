<%@ Page Language="C#" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ElectricityBill.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
   
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="fonts/icomoon/styleLogin.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="css/styleLogin.css">

    <title> Login Form</title>
</head>
<body style="background-color: #ff8788;">
<div class="half" style="background-color:#ff8788; color:#ffffff;">
      <div class="container">
          <div class="row align-items-center justify-content-center">
              <asp:Image runat="server" class="bg" ID="image1" ImageUrl="~/image/logo2.png" />
           <div class="col-md-5">
            <div class="form-block mx-auto" style="background-color:#272727;">
              <div class="text-center mb-5">
                <h3 class="text-uppercase">Login to <strong>PGVCL</strong></h3>
              </div>
              <form id="form1" runat="server" autocomplete="off">
                <div class="form-group first">
                  <label for="username">Customer Number</label>
                  <asp:TextBox class="form-control tb" ID="txtCnum" placeholder="Enter a customer number..." runat="server"></asp:TextBox><br/>
                </div>
                <div class="form-group">
                  <label for="password">Password</label>
                  <asp:TextBox ID="txtPasswrod" class="form-control tb" placeholder="Enter a password..." TextMode="Password" runat="server"></asp:TextBox><br/>
                </div>
                
                <asp:Button id="btnLogin" Class="btn btn-block py-2 btn-primary" style="background-color:#ff8788; color:#272727;" runat="server" Text="Log in" OnClick="btnLogin_Click"/></br>
                  </br>
                <div class="mb-5 align-items-center" >
                  <span class="ml-auto">
                    If you change password <asp:LinkButton style="color:#ff8788;" ID="forgetLink" runat="server" OnClick="forgetLink_Click">Forget Password.</asp:LinkButton></br>
                    If you have account <asp:LinkButton style="color:#ff8788;" ID="ragistrationLink" runat="server" OnClick="ragistrationLink_Click">Registration Here.</asp:LinkButton></br>
                    Only for <asp:LinkButton ID="adminLink" style="color:#ff8788;" runat="server" OnClick="adminLink_Click" >Admin.</asp:LinkButton></br>
                  </span>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>

