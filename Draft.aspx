<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Draft.aspx.cs" Inherits="Draft" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Blog Post (Right Sidebar) Start -->
    <div class="col-md-9">
        <div class="col-md-12 page-body">
            <div class="row">
                <div class="sub-title">
                    <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label></center>
                    <center><h2>Post In Draft</h2></center>
                </div>
            </div>
            <asp:Panel ID="pnlDraft" runat="server">
                <div class="row">
                    <div class="post-info">
                        <asp:Repeater ID="rpDraft" runat="server" OnItemCommand="rpDraft_ItemCommand">
                            <ItemTemplate>
                                <div class="col-md-12 content-page">
                                    <!-- Blog Post Start -->
                                    <div class="col-md-12 ">
                                        <div class="post-title">
                                            <div class="row">
                                                <div class="col-lg-10">
                                                    <asp:LinkButton runat="server" CommandArgument='<%# Eval("postid") %>' CommandName="Read">
                                                <h1><%# Eval("PostTitle")%></h1>
                                                    </asp:LinkButton>
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:LinkButton ID="lnkEdit" ToolTip="Edit Post" runat="server" CommandArgument='<%# Eval("postid") %>' Font-Size="12" CommandName="Publish">Publish Now</asp:LinkButton>
                                                 </div>
                                            </div>
                                        </div>

                                        <div class="post-info">
                                            <h5><%# Eval("tags") %></h5>
                                            <span><%# Eval("CreatedOn","{0:MMMM dd,yyyy}")%> / by <a href="#" target="_blank"><%# Eval("createdbyemail")%></a></span>
                                        </div>
                                        <p><%# (Eval("postdescription").ToString().Length > 500) ? (Eval("postdescription").ToString().Substring(0, 500)) : Eval("postdescription")%></p>

                                    </div>
                                    <div class="col-md-12">
                                        <asp:LinkButton runat="server" CommandArgument='<%# Eval("postid") %>' CommandName="Read" class="button button-style button-anim fa fa-long-arrow-right"><span>Read More</span></asp:LinkButton>
                                    </div>
                                    <!-- Blog Post End -->
                                    <div class="col-md-12 page-body margin-top-10 footer">
                                        <ul class="knowledge">
                                            <li class="bg-color-6"><i class="fa fa-eye" style="font-size: 18px"></i><%# " " +  Eval("viewscount") + "  Views" %> </li>
                                            <li class="bg-color-4"><i class="fa fa-thumbs-o-up" style="font-size: 18px"></i><%# " " +  Eval("likescount") %> </li>
                                            <li class="bg-color-5"><i class="fa fa-comment-o" style="font-size: 18px"></i><%# " " +  Eval("commentscount") %> </li>

                                            <%--<li class="bg-color-6"><i class="fa fa-share" style="font-size: 18px"></i><%# " " +  Eval("sharecount") %> </li>--%>
                                        </ul>

                                        <asp:Label runat="server" ID="lblCateggory" Text="Historical"></asp:Label>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <br />
            </asp:Panel>
           
                <div class="row">
                    <div class="col-md-12 text-center">
                        <%--<a href="javascript:void(0)" id="load-more-post" class="load-more-button">Load</a>
                    <div id="post-end-message"></div>--%>
                        <button id="btnLoad" runat="server" onserverclick="btnLoad_ServerClick" class="load-more-button"><span>Load</span> </button>
                    </div>
                </div>
                <br />

        </div>

        <!-- Footer Start -->
        <div class="col-md-12 page-body margin-top-50 footer">
            <footer>
                <%--<ul class="menu-link">
                    <li><a href="addpost.aspx">Home</a></li>
                    <li><a href="about.aspx">About</a></li>
                    <li><a href="work.aspx">Work</a></li>
                    <li><a href="contact.aspx">Contact</a></li>
                </ul>--%>

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

