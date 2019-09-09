<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="Work.aspx.cs" Inherits="Work" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script>
            function myFunction(demo) {
                
            alert(demo);
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Portfolio (Right Sidebar) Start -->
    <div class="col-md-9">
        <div class="col-md-12 page-body">
            <div class="row">


                <div class="sub-title">
                    <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                    <h2>My Portfolio</h2>
                    <a href="contact.html"><i class="icon-envelope"></i></a>
                </div>


                <div class="col-md-12 content-page">
                    <div class="col-md-12 blog-post">


                        <!-- Intro Start -->
                        <div class="post-title margin-bottom-30">
                            <h1>Let's take a look on <span class="main-color">My Work</span></h1>
                        </div>
                        <!-- Intro End -->




                        <!-- Portfolio Start -->
                        <div>

                            <asp:Repeater ID="rpWorks" runat="server">
                                <ItemTemplate>
                                    <!-- Portfolio Detail Start images/portfolio/2.jpg -->

                                    <div class="row portfolio">
                                        <div class="col-sm-6 custom-pad-1">
                                            <div class="image-carousel">
                                                <%--<img src='<%# "images/workimg/" + Eval("work_image_name") %>' width="516" height="500" class="img-responsive" alt="">--%>
                                                <asp:Image runat="server" ImageUrl='<%# "images/workimg/" + Eval("work_image_name") %>' CssClass="img-responsive" Width="500" Height="516" />
                                            </div>
                                        </div>


                                        <div class="col-sm-6 custom-pad-2">
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <tbody>

                                                        <tr>
                                                            <td><b>Title</b></td>
                                                            <td><%# Eval("work_title") %></td>
                                                        </tr>

                                                        <tr>
                                                            <td><b>Url</b></td>
                                                            <td><a target="_blank" href='<%# Eval("work_url") %>' title="uipasta">Check Now</a></td>
                                                        </tr>

                                                        <tr>
                                                            <td><b>About Work</b></td>
                                                            <td><%# Eval("work_desc").ToString().Length > 150 ? Eval("work_desc").ToString().Substring(0,150) : Eval("work_desc").ToString() %>
                                                                
                                                                <asp:LinkButton runat="server" CommandArgument='<%# Eval("work_id") %>' CommandName="Read" class="button button-style button-anim fa fa-long-arrow-right"><span>Read More</span></asp:LinkButton>
                                                            <%--<%# (Eval("work_desc").ToString().Length > 150) ? (Eval("work_desc").ToString().Substring(0, 150) + "...<a onclick='"+ String.Format("myFunction(\"{0}\");", Eval("work_desc"))+"' >read More</a>") : Eval("work_desc")%>--%>
                                                            </td>
                                                            
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Portfolio Detail End -->
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                        <!-- Portfolio End -->


                    </div>

                   <%-- <div class="col-md-12 text-center">
                        <a href="javascript:void(0)" id="load-more-portfolio" class="load-more-button">Load</a>
                        <div id="portfolio-end-message"></div>
                    </div>--%>

                </div>

            </div>



            <!-- Subscribe Form Start -->
            <div class="col-md-8 col-md-offset-2">
                <form id="mc-form" method="post" action="http://uipasta.us14.list-manage.com/subscribe/post?u=854825d502cdc101233c08a21&amp;id=86e84d44b7">

                    <div class="subscribe-form margin-top-20">
                        <input id="mc-email" type="email" placeholder="Email Address" class="text-input">
                        <button class="submit-btn" type="submit">Submit</button>
                    </div>
                    <p>Subscribe to my weekly newsletter</p>
                    <label for="mc-email" class="mc-label"></label>
                </form>

            </div>
            <!-- Subscribe Form End -->


        </div>



        <!-- Footer Start -->
        <div class="col-md-12 page-body margin-top-50 footer">
            <footer>
                <ul class="menu-link">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="work.html">Work</a></li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>

                <p>© Copyright 2016 DevBlog. All rights reserved</p>


                <!-- UiPasta Credit Start -->
                <div class="uipasta-credit">Design By <a href="http://www.uipasta.com" target="_blank">UiPasta</a></div>
                <!-- UiPasta Credit End -->


            </footer>
        </div>
        <!-- Footer End -->


    </div>
    <!-- Portfolio (Right Sidebar) End -->
</asp:Content>

