<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script src='https://www.google.com/recaptcha/api.js'></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Contact (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">


            <div class="sub-title">
                <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label></center>
                 <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ValidationGroup="Contact" ShowModelStateErrors="False" ShowSummary="False" />
                <h2>Contact Me</h2>
                <a href="default.aspx"><i class="icon-home"></i></a>
            </div>


            <div class="col-md-12 content-page">
                <div class="col-md-12 blog-post">



                    <!-- Intro Start -->
                    <div class="post-title margin-bottom-10">
                        <h1>Hello,</h1>
                    </div>

                    <p>Friends, if you want to give some feedback or have any query or just want to say hi, don’t hesitate to contact me via Email. My Email ID is given below. Or fill the form and hit 'Send' button.</p>
                    <!-- Intro End -->

                    <!-- Contact Me Start -->
                    <%--<div class="post-title margin-top-70">
                        <h1>Contact <span class="main-color">Me</span></h1>
                        <span>Feel free to contact us for any help</span>
                    </div>--%>


                    <div class="row">

                        <div class="col-md-4 col-sm-4">
                            <%--<div class="contact-us-detail">
                                <i class="icon-screen-smartphone color-6"></i>
                                <p><a href="tel:+918080786228">+ 91 80 807 86 228</a></p>
                            </div>--%>
                        </div>

                        <div class="col-md-4 col-sm-4">
                            <div class="contact-us-detail">
                                <i class="icon-envelope-open color-5"></i>
                                <p><a href="mailto:kimaya.kolhe@appeteria.com">kimaya.kolhe@appeteria.com</a></p>
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-4">
                            <%--<div class="contact-us-detail">
                                <i class="icon-clock color-3"></i>
                                <p>Mon - Fri 09:00 – 18:00</p>
                            </div>--%>
                        </div>

                    </div>


                    <div class="row margin-top-30">
                        <div class="col-md-12">

                            <div class="row">
                                <form>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name*"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="Contact" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtName" Display="None"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtContactEmail" runat="server" CssClass="form-control" placeholder="Your Email*"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="None" ErrorMessage="Please Enter Valid Email Id" ControlToValidate="txtContactEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ValidationGroup="Contact" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Email Id" ControlToValidate="txtContactEmail" Display="None"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtPhn" runat="server" TextMode="Phone" MaxLength="10" CssClass="form-control" placeholder="Contact (Optional)"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" placeholder="Where are You From ? (Optional)"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-group form-control" placeholder="Subject*"></asp:TextBox>
                                        <asp:RequiredFieldValidator ValidationGroup="Contact" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Subject" ControlToValidate="txtSubject" Display="None"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="textarea-message form-group">
                                            <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" CssClass="textarea-message form-control" placeholder="Your Message*" Rows="5"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="Contact" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Message" ControlToValidate="txtMsg" Display="None"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="g-recaptcha" data-sitekey="6LfurrMUAAAAAFDMf8DxDKZdy_gJQJisgnQZ-zhV"></div>
                                        <asp:Label ID="litMessage" runat="server" ForeColor="Red"></asp:Label>
                                        <asp:Label ID="litDebug" runat="server" ForeColor="Red"></asp:Label>
                                    </div>


                                    <div class="text-center">
                                        <button type="submit" ValidationGroup="Contact" id="btnSubmit" class="load-more-button" runat="server" onserverclick="btnSubmit_ServerClick">Send</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Contact Me End -->


                </div>
            </div>
        </div>
    </div>
    <!-- Contact (Right Sidebar) End -->
</asp:Content>

