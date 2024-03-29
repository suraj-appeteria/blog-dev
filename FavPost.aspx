﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" AutoEventWireup="true" CodeFile="FavPost.aspx.cs" Inherits="FavPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/ForPost.css" rel="stylesheet" />
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
                    <div class="col-lg-4">
                        <div class="col-md-12 content-page">
                            <br />
                            <div class="promo-area2">
                                <%--<div class="promo-item2" style="background-image:url( http://hannahgale.co.uk/wp-content/uploads/2019/06/10744126784_IMG_3068.jpg)">--%>
                                <div class="posts_ids1">
                                    <div class="promo-item2" style="background-image: url('<%# Eval("imageurl").ToString() == "" ? ConfigurationManager.AppSettings["postImg"] + "background.jpg" : ConfigurationManager.AppSettings["postImg"] + Eval("imageurl") %>')">
                                        <div class="promo-overlay2">
                                            <h1 class="cat_post_title">
                                                <div class="cat"></div>
                                                <%# Eval("posttitle") %>   </h1>
                                            <div class="promomore">
                                                <br />

                                                <asp:LinkButton CausesValidation="false" runat="server" CommandArgument='<%# Eval("postid") %>' CommandName="Read" CssClass="promomore a"><span>VIEW POST</span></asp:LinkButton>
                                                <%--<a href="http://hannahgale.co.uk/2019/06/26/menstrual-cycle-journaling-how-i-do-it-and-what-ive-learned/">VIEW POST</a>--%>
                                            </div>
                                            <br />
                                            <ul class="knowledge">
                                                <li class="bg-color-6"><i class="fa fa-eye" style="font-size: 18px"></i><%# Eval("viewscount").ToString() == "0" ? "" : " " + Eval("viewscount") %> </li>
                                                <li class="bg-color-4"><a href="SinglePost.aspx?postid=<%# Eval("postid") %>&req=like"><i class="fa fa-thumbs-o-up" style="font-size: 18px"></i><%# Eval("likescount").ToString() == "0" ? "" : " " + Eval("likescount") %> </a></li>
                                                <li class="bg-color-5"><a href="SinglePost.aspx?postid=<%# Eval("postid") %>&req=comment"><i class="fa fa-comment-o" style="font-size: 18px"></i><%# Eval("commentscount").ToString() == "0" ? "" : " " + Eval("commentscount") %> </a></li>
                                                <%--<li class="bg-color-6"><i class="fa fa-share" style="font-size: 18px"></i><%# Eval("viewscount").ToString() == "0" ? "" : Eval("viewscount") %> </li>--%>
                                            </ul>

                                        </div>

                                    </div>
                                </div>
                            </div>
                            <br />
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

