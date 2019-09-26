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

    <!-- OTP -->
    <link href="Login/css/OTP.css" rel="stylesheet" />
    <script src="Login/js/Otp.js"></script>
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
            <%--<img src="Login/images/image-1.png" alt="" class="image-1">--%>
            <form runat="server" action="">
                <asp:HiddenField id="hdnUserID" runat="server"/>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>
                <asp:Panel runat="server" ID="pnlemail" Visible="true">
                    <h3 style="font-size:16px">Verify e-mail to continue</h3>
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
                                    <asp:LinkButton runat="server" ID="btnOtp" TabIndex="0" Font-Bold="true" ForeColor="#450c3a" Text="Get OTP" OnClick="btnOtp_Click" CausesValidation="false" Font-Size="16px"></asp:LinkButton>

                                </td>
                            </tr>
                        </table>

                    </div>
                    <center>
                <div id="divOuter">
                    <div id="divInner">                       
                        <asp:TextBox id="partitioned" runat="server" MaxLength="4"></asp:TextBox>
                    </div>
                </div>
                   <br />
                <asp:LinkButton ID="lnkResend" Font-Bold="true" ForeColor="#450c3a" runat="server" Text="Resend OTP" OnClick="btnOtp_Click" Font-Size="16px"> </asp:LinkButton>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter OTP" ControlToValidate="partitioned" Display="None"></asp:RequiredFieldValidator>
                </center>
                    <button runat="server" id="btnNext" onserverclick="btnNext_ServerClick">
                        <span>Verify Otp</span>
                    </button>
                    <br />
                    <center><asp:LinkButton ID="LinkButton1" Font-Bold="true" ForeColor="#450c3a" runat="server" Text="Sign in instead" PostBackUrl="~/Login.aspx" CausesValidation="false" Font-Size="18px"> </asp:LinkButton></center>
                </asp:Panel>
                <asp:Panel ID="pnlInfo" runat="server" Visible="false">
                    <h3>Create New Account ?</h3>
                    <div class="form-holder">
                        <table>
                            <tr>
                                <td>
                                    <span class="lnr lnr-user"></span>
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
                        <asp:TextBox ID="txtMobile" MaxLength="10" runat="server" class="form-control" placeholder="Phone Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Mobile Number" ControlToValidate="txtMobile" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Valid Mobile Number" ControlToValidate="txtMobile" Display="None" ValidationExpression="(\+?\d{1,4}[\s-])?(?!0+\s+,?$)\d{10}\s*,?$"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-holder">
                        <span class="lnr lnr-lock"></span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="txtPass" Display="None"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtPass" TextMode="Password" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
                    </div>
                    <div class="form-holder">
                        <span class="lnr lnr-lock"></span>
                        <asp:TextBox ID="txtConfPass" TextMode="Password" runat="server" class="form-control" placeholder="Confirm Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Your password and confirmation password do not match" ControlToCompare="txtPass" ControlToValidate="txtConfPass" Display="None"></asp:CompareValidator>
                    </div>
                    <button runat="server" id="btnSignUp" onserverclick="btnSignUp_ServerClick">
                        <span>Sign Up</span>
                    </button>
                </asp:Panel>
                <asp:Panel ID="pnlProfile" runat="server" Visible="false">
                    <h3>Update Your Profile</h3>
                    <style>
                        .avatar {
                            vertical-align: middle;
                            width: 150px;
                            height: 150px;
                            border-radius: 50%;
                        }
                    </style>

                    <center>
                    <div class="my-pic">
                        
                        <asp:Image ID="imgProfile" runat="server" CssClass="avatar" ImageUrl="~/images/Profile/default.png" alt="" />
                        <br /><br />
                        <asp:FileUpload runat="server" ID="fuImg" OnPreRender="fuImg_PreRender" ClientIDMode="Static" onchange="this.form.submit()"/>

                        <button id="btnProfile" runat="server" onserverclick="btnProfile_ServerClick">
                            <span>Save Profile</span>
                        </button>
                    </div>
                        </center>
                    <asp:HiddenField id="hdnFileName" runat="server"/>
                </asp:Panel>
            </form>
           <%-- <img src="Login/images/image-2.png" alt="" class="image-2">--%>
        </div>

    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
