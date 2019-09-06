<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddPost.aspx.cs" Inherits="AddPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Blog Post (Right Sidebar) Start -->
    <div class="col-md-9">
        <div class="col-md-12 page-body">
            <div class="row">
                <div class="sub-title">
                    <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                    <center><h2><asp:LinkButton ID="btnAdd" runat="server" Text="Write New Post" PostBackUrl="~/NewPost.aspx"></asp:LinkButton></h2></center>
                </div>
            </div>

            <div class="row">
                <div class="post-info">
                    <asp:Repeater ID="rpPost" runat="server" OnItemCommand="rpPost_ItemCommand">
                        <ItemTemplate>
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
                                    <p><%# (Eval("postdescription").ToString().Length > 300) ? (Eval("postdescription").ToString().Substring(0, 300)) : Eval("postdescription")%></p>
                                    <asp:LinkButton runat="server" CommandArgument='<%# Eval("postid") %>' CommandName="Read" class="button button-style button-anim fa fa-long-arrow-right"><span>Read More</span></asp:LinkButton>
                                </div>
                                <!-- Blog Post End -->
                                <div class="col-md-12 page-body margin-top-10 footer">
                                    <ul class="knowledge">
                                        <li class="bg-color-2"><i class="fa fa-eye" style="font-size: 18px"></i><%# " " +  Eval("viewscount") + "  Views" %> </li>
                                        <li class="bg-color-4"><i class="fa fa-thumbs-o-up" style="font-size: 18px"></i><%# " " +  Eval("likescount") %> </li>
                                        <a href="SinglePost.aspx">
                                            <li class="bg-color-5"><i class="fa fa-comment-o" style="font-size: 18px"></i><%# " " +  Eval("commentscount") %> </li>
                                        </a>
                                        <li class="bg-color-6"><i class="fa fa-share" style="font-size: 18px"></i><%# " " +  Eval("sharecount") %> </li>
                                    </ul>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>

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
    <!-- Blog Post (Right Sidebar) End -->
</asp:Content>

