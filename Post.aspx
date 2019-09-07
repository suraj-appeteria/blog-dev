<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="Post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Blog Post (Right Sidebar) Start -->
    <div class="col-md-9">
        <div class="col-md-12 page-body">
            <div class="row">
                <div class="sub-title">
                    <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                    <h2>Blogs</h2>
                    <a href="contact.html"><i class="icon-envelope"></i></a>
                </div>
            </div>
            <div class="row">
                <asp:Repeater ID="rpPost" runat="server" OnItemCommand="rpPost_ItemCommand">
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-md-12 content-page">
                                <!-- Blog Post Start -->
                                <div class="col-md-12 blog-post">
                                    <div class="post-title">
                                        <asp:LinkButton runat="server" CommandArgument='<%# Eval("postid") %>' CommandName="Read">
                                        <h1><%# Eval("PostTitle")%></h1>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="post-info">
                                        <span><%# Eval("CreatedOn","{0:MMMM dd,yyyy}")%> / by <a href="#" target="_blank"><%# Eval("createdbyemail")%></a></span>
                                    </div>
                                    <p><%# (Eval("postdescription").ToString().Length > 500) ? (Eval("postdescription").ToString().Substring(0, 500)) : Eval("postdescription")%></p>

                                    <asp:LinkButton runat="server" CommandArgument='<%# Eval("postid") %>' CommandName="Read" class="button button-style button-anim fa fa-long-arrow-right"><span>Read More</span></asp:LinkButton>
                                </div>
                                <!-- Blog Post End -->
<%--                                <div class="col-md-12 page-body margin-top-50 footer">
                                    <ul class="knowledge">
                                        <li class="bg-color-2"><i class="fa fa-eye" style="font-size: 18px"></i><%# " " +  Eval("viewscount") + "  Views" %> </li>
                                        <li class="bg-color-4"><i class="fa fa-thumbs-o-up" style="font-size: 18px"></i><%# " " +  Eval("likescount") %> </li>
                                        <a href="SinglePost.aspx">
                                            <li class="bg-color-5"><i class="fa fa-comment-o" style="font-size: 18px"></i><%# " " +  Eval("commentscount") %> </li>
                                        </a>
                                        <li class="bg-color-6"><i class="fa fa-share" style="font-size: 18px"></i><%# " " +  Eval("sharecount") %> </li>
                                    </ul>
                                </div>--%>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12 text-center">
                    <%--<a href="javascript:void(0)" id="load-more-post" class="load-more-button">Load</a>
                    <div id="post-end-message"></div>--%>
                    <button id="btnLoad" runat="server" onserverclick="btnLoad_ServerClick" class="load-more-button"><span>Load</span> </button>
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
    <asp:HiddenField ID="hdnPageNo" Value="0" runat="server" />
    <!-- Blog Post (Right Sidebar) End -->
</asp:Content>

