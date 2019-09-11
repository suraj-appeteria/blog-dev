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
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>  
                    <h3>Login</h3>
                    <div class="form-holder">
                        <span class="lnr lnr-envelope"></span>
                        <asp:TextBox ID="txtmail" CssClass="form-control" runat="server" placeholder="Email Id" AutoCompleteType="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Email Id" ControlToValidate="txtmail" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Email Id" Display="None" ControlToValidate="txtmail" CssClass="auto-style1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                    </div>
                    <div class="form-holder">
                        <span class="lnr lnr-lock"></span>
                        <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="txtPassword" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <br />
                    <div class="form-holder">
                        <div>
                            <span class="lnr lnr-user"><a style="color: #134575; font-size: 15px;" href="SignUp.aspx" ><b> New User ?</b></a></span>
                        </div>
                        <div class="form-holder" style="left: 180px">
                            <span class="lnr lnr-lock"><a style="color: #134575; font-size: 15px;" href="ForgotPassword.aspx"><b> Forgot Password ?</b></a></span>
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
