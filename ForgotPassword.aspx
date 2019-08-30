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
</head>
<body>
    <div class="wrapper">
        <div class="inner">
            <img src="Login/images/image-1.png" alt="" class="image-1">
            <form runat="server" action="">
                <center>
                <asp:Image runat="server" height="80" width="100" ImageUrl="~/Login/images/forgot.jpg" />
                </center>
                <br />
                <h3>Forgot Password?</h3>
          
                
                <div class="form-holder">
                    <span class="lnr lnr-envelope"></span>
                    <input type="text" class="form-control" placeholder="Mail">
                </div>
                <button>
                    <span>Reset Now</span>
                </button>
            </form>
            <img src="Login/images/image-2.png" alt="" class="image-2">
        </div>

    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
