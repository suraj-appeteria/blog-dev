﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="About.aspx.cs" Inherits="About" %>

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
                <div class="col-md-12 blog-post" style="padding:30px;" >
                    <center><asp:Image id="imgProfile" runat="server" Width="60%" Height="60%" CssClass="img-circle" alt="" ImageUrl="~/images/Profile/profile.jpg"/></center>
                    <br />
                    <!-- My Intro Start -->
                    <%--<div class="post-title margin-bottom-30 text-center">
                        <h2>Hi, I am <span class="main-color">Mrs. Kimaya Kolhe</span></h2>


                    </div>--%>
                    <!-- My Intro End -->
                    <%--<p >I am in the website field since 2004 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at quam at orci commodo hendrerit vitae nec eros. Vestibulum neque est, imperdiet nec tortor nec, tempor semper metus. <b>I am a developer</b>, et accumsan nisi. Duis laoreet pretium ultricies. Curabitur rhoncus auctor nunc congue sodales. Sed posuere nisi ipsum, eget dignissim nunc dapibus eget. Aenean elementum sollicitudin sapien ut sapien fermentum aliquet mollis. Curabitur ac quam orci sodales quam ut tempor. suspendisse, gravida in augue in, interdum <b><a href="work.aspx" data-toggle="tooltip" data-placement="top" title="Check out my work.">Work</a></b> bibendum dui. Suspendisse sit amet justo sit amet diam fringilla commodo. Praesent ac magna at metus malesuada tincidunt non ac arcu. Nunc gravida eu felis vel elementum. Vestibulum sodales quam ut tempor tempor Donec sollicitudin imperdiet nec tortor nec, tempor semper metus..</p>--%>
                    <p style="text-align:justify;">Hey friends, I am Mrs. Kimaya Kolhe. A co-founder of a software firm, a writer with passion and a creative mind, a mother of two smart kids, a daughter of hardcore teachers and a smart wife of the equally smart and supporting husband, and I promise I am loving all the roles I am playing in my life. And life is an awesome stage for a performance.</p>

                    <p style="text-align:justify;">I am very sensitive sometimes and sometimes a typical fun-loving lady with many aspirations and dreams to achieve. The picture of my blog perfectly describes me. The small span of life and many things to do.</p>

                    <p style="text-align:justify;">In my career to date, once I was a lecturer. It was the most beautiful phase of my life or career, ever since then my heart started resonating at the frequency matching with that of the youngsters’ heart, so I always feel energetic and young even though I have crossed 36 already.</p>

                    <p style="text-align:justify;">I believe in positivity and cannot afford to be negative. Really !! Even if I am stressed or depressed, I try to be well dressed.</p>

                    <p style="text-align:justify;">I am writing for the last few years and I am in love with writing and expressing whatever I feel. In my blog, I will include anything and everything which my mind speaks, whether it’s the experience I would share or it may be any imagination or illusion I would create. I don’t know at this moment, how the blog will take shape with its age.</p>

                    <p style="text-align:justify;">I hope that this blog will sometimes comfort, sometimes inspiring, sometimes entertain and empower my readers everywhere — no matter where they may be on their journey.</p>

                    <br />
                    <br />

                    <!-- Video Start -->
                    <%--<div class="video-box margin-top-40 margin-bottom-80">
                        <div class="video-tutorial">
                            <a class="video-popup" href="https://www.youtube.com/watch?v=O2Bsw3lrhvs" title="My Thought">
                                <img src="images/pic/my-pic.png" alt="">
                            </a>
                        </div>
                        <p>Take a look about my thought on website design.</p>
                    </div>--%>
                    <!-- Video End -->




                    <!-- My Service Start -->
                    <div class="post-title">
                        <h1>My <span class="main-color"><a href="Work.aspx">Works</a></span></h1>
                    </div>

                </div>
 

            </div>

        </div>


    </div>

    <!-- About Me (Right Sidebar) End -->
</asp:Content>

