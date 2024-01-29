<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="ElectricityBill.adminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PGVCL Admin Login</title>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="image/logo2.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="adminLogin/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="adminLogin/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="adminLogin/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="adminLogin/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="adminLogin/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="adminLogin/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="adminLogin/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="adminLogin/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="adminLogin/css/util.css">
	<link rel="stylesheet" type="text/css" href="adminLogin/css/main.css">
<!--===============================================================================================-->
</head>
<body>
    <div class="limiter">
		<div class="container-login100" style="background-image: url('adminLogin/images/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
					Admin Login Form
				</span>
				<form id="form1" runat="server" autocomplete="off">
					<div class="wrap-input100 validate-input" data-validate = "Enter username">
						<asp:TextBox ID="txtUserName" class="input100" placeholder="User name" runat="server"></asp:TextBox>
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<asp:TextBox ID="txtPasswrod" class="input100" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>
					<div class="container-login100-form-btn m-t-32">
						<asp:Button id="btnLogin" runat="server" class="login100-form-btn button" Text="Log in" OnClick="btnLogin_Click" />
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>


<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>
