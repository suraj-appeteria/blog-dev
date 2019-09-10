<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Comments.aspx.cs" Inherits="Comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Portfolio (Right Sidebar) Start -->
    <div class="col-md-9">
        <div class="col-md-12 page-body">
            <div class="row">


                <div class="sub-title">
                    <asp:label id="lblErrorMsg" runat="server" forecolor="Red"></asp:label>
                    <h2>Comments Requests</h2>
                </div>


                <div class="col-md-12 content-page">
                    <div class="col-md-12 blog-post">
                        <!-- Portfolio Start -->
                        <div>

                            <asp:repeater id="rpComments" runat="server">
                                <ItemTemplate>
                                    <!-- Portfolio Detail Start images/portfolio/2.jpg portfolio-->

                                    <div class="row">
                                        <div class="col-sm-12 custom-pad-2">
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <tbody>
                                                        <tr>
                                                            <th></th>
                                                        </tr>
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
                                    <br /><br />
                                    <!-- Portfolio Detail End -->
                                </ItemTemplate>
                            </asp:repeater>

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

