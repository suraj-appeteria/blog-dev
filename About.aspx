<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- About Me (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">


            <div class="sub-title">
                <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Text=""></asp:Label></center>
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />

                <h2>About Me</h2>
                
                <a href="contact.aspx"><i class="icon-envelope"></i></a>

            </div>


            <div class="col-md-12 content-page">
                <div class="col-md-12 blog-post">


                    <!-- My Intro Start -->
                    <div class="post-title margin-bottom-30">
                        <h1>Hi, I am <span class="main-color">Alex Parker</span></h1>

                        <ul class="knowledge">
                            <li class="bg-color-1">Web Designer</li>
                            <li class="bg-color-4">Web Developer</li>
                            <li class="bg-color-6">Freelancer</li>
                            <li class="bg-color-5">Consultant</li>
                        </ul>

                    </div>
                    <!-- My Intro End -->


                    <p>I am in the website field since 2004 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at quam at orci commodo hendrerit vitae nec eros. Vestibulum neque est, imperdiet nec tortor nec, tempor semper metus. <b>I am a developer</b>, et accumsan nisi. Duis laoreet pretium ultricies. Curabitur rhoncus auctor nunc congue sodales. Sed posuere nisi ipsum, eget dignissim nunc dapibus eget. Aenean elementum sollicitudin sapien ut sapien fermentum aliquet mollis. Curabitur ac quam orci sodales quam ut tempor. suspendisse, gravida in augue in, interdum <b><a href="work.aspx" data-toggle="tooltip" data-placement="top" title="Check out my work.">Work</a></b> bibendum dui. Suspendisse sit amet justo sit amet diam fringilla commodo. Praesent ac magna at metus malesuada tincidunt non ac arcu. Nunc gravida eu felis vel elementum. Vestibulum sodales quam ut tempor tempor Donec sollicitudin imperdiet nec tortor nec, tempor semper metus..</p>



                    <!-- Video Start -->
                    <div class="video-box margin-top-40 margin-bottom-80">
                        <div class="video-tutorial">
                            <a class="video-popup" href="https://www.youtube.com/watch?v=O2Bsw3lrhvs" title="My Thought">
                                <img src="images/pic/my-pic.png" alt="">
                            </a>
                        </div>
                        <p>Take a look about my thought on website design.</p>
                    </div>
                    <!-- Video End -->




                    <!-- My Service Start -->
                    <div class="post-title">
                        <h1>My <span class="main-color">Services</span></h1>
                    </div>

                    <div class="list list-style-2 margin-top-30">
                        <ul>
                            <li>Website Design</li>
                            <li>Website Development</li>
                            <li>Wordpress Theme Development</li>
                            <li>Mobile Apps UI/UX Design</li>
                            <li>Online Software Development</li>
                            <li>E-commerce Development</li>
                            <li>UI/UX Consulting</li>
                        </ul>
                    </div>
                    <!-- My Service End -->

                </div>

                <div class="col-md-12 text-center">
                    <a href="contact.aspx" data-toggle="tooltip" data-placement="top" title="Visit on my contact page for hire me." class="load-more-button">Hire</a>
                </div>

            </div>

        </div>

        <!-- Subscribe Form Start -->
        <div class="col-md-8 col-md-offset-2" id="dvSubscribe" runat="server">
            <form id="mc-form" method="post" action="http://uipasta.us14.list-manage.com/subscribe/post?u=854825d502cdc101233c08a21&amp;id=86e84d44b7">

                <div class="subscribe-form margin-top-20">
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Email ID" CssClass="text-input"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="rev" runat="server" Display="None" ErrorMessage="Please Enter Valid Email Id" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:Button class="submit-btn" ID="btnSubscribe" runat="server" OnClick="btnSubscribe_ServerClick" Text="Subscribe Now" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Email Id" ControlToValidate="txtEmail" Display="None"></asp:RequiredFieldValidator>
                </div>
                <center><p>Subscribe for new post notification</p>
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label></center>
                <br />
            </form>

        </div>
        <!-- Subscribe Form End -->


    </div>

    <!-- About Me (Right Sidebar) End -->
</asp:Content>

