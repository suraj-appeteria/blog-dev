<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" AutoEventWireup="true" CodeFile="FavPost.aspx.cs" Inherits="FavPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Blog Post (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">
            <div class="sub-title">
                <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />
                <h2>Favorite List</h2>
                <a href="contact.aspx"><i class="icon-envelope"></i></a>
            </div>
        </div>
        <div class="row">
            <asp:Repeater ID="rpFav" runat="server" OnItemCommand="rpPost_ItemCommand">
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
                                <br />
                                <asp:Label runat="server" ID="lblCateggory" Text='<%# Eval("categories") %>'></asp:Label>
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
                <button id="btnLoad" causesvalidation="false" runat="server" onserverclick="btnLoad_ServerClick" class="load-more-button"><span>More</span> </button>
                <br />
            </div>

        </div>

    </div>
    <asp:HiddenField ID="hdnPageNo" Value="0" runat="server" />
    <!-- Blog Post (Right Sidebar) End -->
</asp:Content>

