<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="shortcut icon" type="image/x-icon" href="Login/images/Author.png" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- LINEARICONS -->
    <link rel="stylesheet" href="Login/fonts/linearicons/style.css"/>
    <!-- STYLE CSS -->
    <link rel="stylesheet" href="Login/css/style.css" />
    <script type="text/javascript" language="javascript">

        function DisableBackButton() {
            window.history.forward()
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>


</head>
<body>

		<div class="wrapper">
			<div class="inner">
                <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="White" Text=""></asp:Label></center>
                <br />
				<img src="Login/images/image-1.png" alt="" class="image-1">
                
                <form runat="server">
                    <h3>Login</h3>
                    <div class="form-holder">
                        <span class="lnr lnr-envelope"></span>
                        <asp:TextBox ID="txtmail" CssClass="form-control" runat="server" placeholder="Email Id" AutoCompleteType="Email"></asp:TextBox>
                    </div>
                    <div class="form-holder">
                        <span class="lnr lnr-lock"></span>
                        <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-holder">
                        <div>
                            <span class="lnr lnr-user"><a style="color: #6362ad; font-size: 15px" href="SignUp.aspx">New User ?</a></span>
                        </div>
                        <div class="form-holder" style="left: 180px">
                            <span class="lnr lnr-lock"><a style="color: #6362ad; font-size: 15px" href="ForgotPassword.aspx">Forgot Password</a></span>
                        </div>
                    </div>
                    <button onserverclick="btnLogin_Click" runat="server">
                        <span>Login</span>
                    </button>

                </form>
				<img src="Login/images/image-2.png" alt="" class="image-2">
			</div>

		</div>
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/main.js"></script>
</body>
</html>
