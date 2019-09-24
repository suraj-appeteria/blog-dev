﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

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
                <h2>Contact Me</h2>
                <a href="post.aspx"><i class="icon-home"></i></a>
            </div>


            <div class="col-md-12 content-page">
                <div class="col-md-12 blog-post">



                    <!-- Intro Start -->
                    <div class="post-title margin-bottom-10">
                        <h1>Looking for a <span class="main-color">online presence</span>?</h1>
                    </div>

                    <p>I am in the website field since 2004 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at quam at orci commodo hendrerit vitae nec eros. Vestibulum neque est, imperdiet nec tortor nec, tempor semper metus. <b>I am a developer</b>, et accumsan nisi. Duis laoreet pretium ultricies. Curabitur rhoncus auctor nunc congue sodales. Sed posuere nisi ipsum, eget dignissim nunc dapibus eget. Aenean elementum sollicitudin sapien ut sapien fermentum aliquet mollis. Curabitur ac quam orci sodales quam ut tempor.</p>
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtName" Display="None"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtContactEmail" runat="server" CssClass="form-control" placeholder="Your Email*"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="None" ErrorMessage="Please Enter Valid Email Id" ControlToValidate="txtContactEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Email Id" ControlToValidate="txtContactEmail" Display="None"></asp:RequiredFieldValidator>
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
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Subject" ControlToValidate="txtSubject" Display="None"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="textarea-message form-group">
                                            <asp:TextBox ID="txtMsg" runat="server" TextMode="MultiLine" CssClass="textarea-message form-control" placeholder="Your Message*" Rows="5"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Message" ControlToValidate="txtMsg" Display="None"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="g-recaptcha" data-sitekey="6LfurrMUAAAAAFDMf8DxDKZdy_gJQJisgnQZ-zhV"></div>
                                        <asp:Label ID="litMessage" runat="server" ForeColor="Red"></asp:Label>
                                        <asp:Label ID="litDebug" runat="server" ForeColor="Red"></asp:Label>
                                    </div>


                                    <div class="text-center">
                                        <button type="submit" id="btnSubmit" class="load-more-button" runat="server" onserverclick="btnSubmit_ServerClick">Send</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Contact Me End -->


                </div>
            </div>
        </div>



        <!-- Subscribe Form Start -->
        <div class="col-md-8 col-md-offset-2" id="dvSubscribe" runat="server">
            <form id="mc-form" method="post" action="http://uipasta.us14.list-manage.com/subscribe/post?u=854825d502cdc101233c08a21&amp;id=86e84d44b7">

                <div class="subscribe-form margin-top-20">
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Email ID" CssClass="text-input" ValidationGroup="first"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="rev" runat="server" Display="None" ErrorMessage="Please Enter Valid Email Id" ValidationGroup="first" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Email Id" ControlToValidate="txtEmail" ValidationGroup="first" Display="None"></asp:RequiredFieldValidator>
                    <asp:Button class="submit-btn" ID="btnSubscribe" runat="server" OnClick="btnSubscribe_ServerClick" Text="Subscribe Now" ValidationGroup="first" />
                </div>
                <center><p>Subscribe for new post notification</p>
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label></center>
                <br />
            </form>

        </div>
        <!-- Subscribe Form End -->


    </div>
    <!-- Contact (Right Sidebar) End -->
</asp:Content>

