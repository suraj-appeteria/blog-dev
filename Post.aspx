<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" MaintainScrollPositionOnPostback="true" ValidateRequest="false" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="Post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Blog Post (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">
            <div class="sub-title">
                <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                <h2>Blogs</h2>
                <a href="contact.aspx"><i class="icon-envelope"></i></a>
            </div>
        </div>
        <div class="row">
            <asp:Repeater ID="rpPost" runat="server" OnItemCommand="rpPost_ItemCommand">
                <ItemTemplate>
                    <div class="row">
                        <div class="col-md-12 content-page">
                            <!-- Blog Post Start blog-post -->
                            <div class="col-md-12 ">
                                <div class="post-title">
                                    <asp:LinkButton runat="server" CommandArgument='<%# Eval("postid") %>' CommandName="Read">
                                        <h1><%# Eval("PostTitle")%></h1>
                                    </asp:LinkButton>
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
                            <div class="col-md-12 page-body margin-top-50 footer">
                                <ul class="knowledge">
                                    <li class="bg-color-6"><i class="fa fa-eye" style="font-size: 18px"></i><%# Eval("viewscount").ToString() == "0" ? "" : " " + Eval("viewscount") + "  Views" %> </li>
                                    <li class="bg-color-4"><i class="fa fa-thumbs-o-up" style="font-size: 18px"></i><%# Eval("likescount").ToString() == "0" ? "" : " " + Eval("likescount") %> </li>
                                    <li class="bg-color-5"><i class="fa fa-comment-o" style="font-size: 18px"></i><%# Eval("commentscount").ToString() == "0" ? "" : " " + Eval("commentscount") %> </li>
                                    <%--<li class="bg-color-6"><i class="fa fa-share" style="font-size: 18px"></i><%# Eval("viewscount").ToString() == "0" ? "" : Eval("viewscount") %> </li>--%>
                                </ul>
                            </div>
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
                <button id="btnLoad" runat="server" onserverclick="btnLoad_ServerClick" class="load-more-button"><span>More</span> </button>
                <br />
            </div>

        </div>




        <!-- Subscribe Form Start -->
        <div class="col-md-8 col-md-offset-2" id="dvSubscribe" runat="server">
            <form id="mc-form" method="post" action="http://uipasta.us14.list-manage.com/subscribe/post?u=854825d502cdc101233c08a21&amp;id=86e84d44b7">

                <div class="subscribe-form margin-top-20">
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Email ID" CssClass="text-input"></asp:TextBox>
                    <button class="submit-btn" id="btnSubscribe" runat="server" onserverclick="btnSubscribe_ServerClick" type="submit">Subscribe Now</button>
                </div>
                <p>Subscribe for new post notification</p>
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                <br />
            </form>

        </div>
        <!-- Subscribe Form End -->
    </div>
    <asp:HiddenField ID="hdnPageNo" Value="0" runat="server" />
    <!-- Blog Post (Right Sidebar) End -->
</asp:Content>

