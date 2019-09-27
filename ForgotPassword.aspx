<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
    <link rel="shortcut icon" type="image/x-icon" href="Login/images/Author.png" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- LINEARICONS -->
    <link rel="stylesheet" href="Login/fonts/linearicons/style.css"/>
    <!-- STYLE CSS -->
    <link rel="stylesheet" href="Login/css/style.css" />
    <!-- OTP -->
    <link href="Login/css/OTP.css" rel="stylesheet" />
    <script src="Login/js/Otp.js"></script>
</head>
<body>
    <div class="wrapper">
        <div class="inner">
           <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Text=""></asp:Label></center>
              
            <br />
          <%--  <img src="Login/images/image-1.png" alt="" class="image-1">--%>
            <form runat="server" action="">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False"></asp:ValidationSummary>  
                <center>
                <asp:Image runat="server" height="80" width="100" ImageUrl="~/Login/images/forgot.jpg" />
                </center>
                <br />
                <asp:Panel ID="pnlForgrt" runat="server" Visible="true">
                <h3>Forgot Password?</h3>
          
                
                <div class="form-holder">
                    <table>
                        <tr>
                            <td>
                                <span class="lnr lnr-envelope"></span>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="E-Mail Id"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Email Id" ControlToValidate="txtEmail" Display="None"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Email Id" Display="None" ControlToValidate="txtEmail" CssClass="auto-style1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                            </td>
                            <td>
                                <asp:LinkButton Font-Bold="true" ForeColor="#134575" runat="server" ID="btnOtp" Text="Get OTP" OnClick="btnOtp_Click"></asp:LinkButton>
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
                <asp:LinkButton ID="lnkResend" Font-Bold="true" ForeColor="#134575" runat="server" Text="Resend OTP" OnClick="btnOtp_Click"> </asp:LinkButton>
                
                </center>
                
                <button id="btnReset" runat="server" onserverclick="btnReset_ServerClick">
                    <span>Reset Now</span>
                </button>
                    <br />
                    <asp:LinkButton ID="LinkButton1" Font-Bold="true" ForeColor="#134575" runat="server" Text="Sign in instead" PostBackUrl="~/Login.aspx" CausesValidation="false"> </asp:LinkButton>
                
                    </asp:Panel>
                <asp:Panel ID="pnlChangPass" runat="server" Visible="false">
                    <h3>Forgot Password?</h3>
                    <div class="form-holder">
                        <span class="lnr lnr-lock"></span>
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="txtPass" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-holder">
                        <span class="lnr lnr-lock"></span>
                        <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" CssClass="form-control" placeholder="Confirm Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Confirm Password" ControlToValidate="txtConfirm" Display="None"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Your password and confirmation password do not match" Display="None" ControlToCompare="txtPass" ControlToValidate="txtConfirm"></asp:CompareValidator>
                    </div>
                    <button id="btnChange" runat="server" onserverclick="btnChange_ServerClick">
                    <span>Change Password</span>
                </button>
                </asp:Panel>
            </form>
           <%-- <img src="Login/images/image-2.png" alt="" class="image-2">--%>
        </div>

    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
