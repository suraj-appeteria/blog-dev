<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link rel="shortcut icon" type="image/x-icon" href="Login/images/Author.png" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- LINEARICONS -->
    <link rel="stylesheet" href="Login/fonts/linearicons/style.css"/>
    <!-- STYLE CSS -->
    <link rel="stylesheet" href="Login/css/style.css" />

    <style type="text/css">
        .auto-style1 {
            left: 1px;
            top: -105%;
        }
    </style>

</head>
<body>
		<div class="wrapper">
            <div class="inner">
                <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="White" Text=""></asp:Label></center>
                
                <br />
                <img src="Login/images/image-1.png" alt="" class="image-1">
                <form runat="server" action="">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>
                    <h3>New Account?</h3>
                    <div class="form-holder">
                        <table>
                            <tr>
                                <td>
                                    <span class="lnr lnr-user"> </span>
                                    <asp:TextBox ID="txtFirstName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Name" ControlToValidate="txtFirstName" Display="None"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <span class="lnr lnr-user"></span>
                                    <asp:TextBox ID="txtLastName" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>                                    
                                </td>
                            </tr>
                        </table>

                    </div>
                    <div class="form-holder">
                        <span class="lnr lnr-phone-handset"></span>
                        <asp:TextBox ID="txtMobile" MaxLength="10" runat="server" class="form-control" placeholder="Phone Number" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Mobile Number" ControlToValidate="txtMobile" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Valid Mobile Number" ControlToValidate="txtMobile" Display="None" ValidationExpression="(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?$"></asp:RegularExpressionValidator>
                    </div>
                    
                    <div class="form-holder">
                        <table>
                            <tr>
                                <td>
                                    <span class="lnr lnr-envelope"></span>
                                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Email Id"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Email Id" ControlToValidate="txtEmail" Display="None"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Email Id" Display="None" ControlToValidate="txtEmail" CssClass="auto-style1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                                <td>
                                    <asp:LinkButton runat="server" ID="btnOtp" Text="Get OTP" OnClick="btnOtp_Click" CausesValidation="false"></asp:LinkButton>

                                </td>
                            </tr>
                        </table>
                        
                    </div>
                    <div class="form-holder">
                        <span class="lnr lnr-keyboard"></span>
                        <asp:TextBox ID="txtOtp" runat="server" class="form-control" placeholder="Enter OTP"></asp:TextBox>
                    </div>
                    <div class="form-holder">
                        <span class="lnr lnr-lock"></span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="txtPass" Display="None"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtPass" TextMode="Password" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
                    </div>
                    <div class="form-holder">
                        <span class="lnr lnr-lock"></span>
                        <asp:TextBox ID="txtConfPass" TextMode="Password" runat="server" class="form-control" placeholder="Confirm Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="txtPass" ControlToValidate="txtConfPass" Display="None"></asp:CompareValidator>
                    </div>
                    <button runat="server" id="btnSignUp" onserverclick="btnSignUp_ServerClick">
                        <span>Sign Up</span>
                    </button>
                </form>
                <img src="Login/images/image-2.png" alt="" class="image-2">
            </div>
			
		</div>
		
		<script src="js/jquery-3.3.1.min.js"></script>
		<script src="js/main.js"></script>
</body>
</html>
