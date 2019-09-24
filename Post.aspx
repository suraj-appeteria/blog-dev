﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" MaintainScrollPositionOnPostback="true" ValidateRequest="false" AutoEventWireup="true" CodeFile="Post.aspx.cs" Inherits="Post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/ForPost.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Blog Post (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">
            <div class="sub-title">
                <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Text=""></asp:Label></center>
                 <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />
                <h2>Blogs</h2>
                <a href="contact.aspx"><i class="icon-envelope"></i></a>
            </div>
        </div>
        <div class="row">
            <asp:Repeater ID="rpPost" runat="server" OnItemCommand="rpPost_ItemCommand">
                <ItemTemplate>

                  <%--  <div class="row" runat="server" visible="false">
                        <div class="col-md-12 content-page">
                          
                            <div class="col-md-12 ">
                                <div class="post-title">
                                    <asp:LinkButton CausesValidation="false" runat="server" CommandArgument='<%# Eval("postid") %>' CommandName="Read">
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
                                <asp:LinkButton CausesValidation="false" runat="server" CommandArgument='<%# Eval("postid") %>' CommandName="Read" class="button button-style button-anim fa fa-long-arrow-right"><span>Read More</span></asp:LinkButton>
                            </div>
                           
                            <div class="col-md-12 page-body margin-top-50 footer">
                                <ul class="knowledge">
                                    <li class="bg-color-6"><i class="fa fa-eye" style="font-size: 18px"></i><%# Eval("viewscount").ToString() == "0" ? "" : " " + Eval("viewscount") + "  Views" %> </li>
                                    <li class="bg-color-4"><i class="fa fa-thumbs-o-up" style="font-size: 18px"></i><%# Eval("likescount").ToString() == "0" ? "" : " " + Eval("likescount") %> </li>
                                    <li class="bg-color-5"><i class="fa fa-comment-o" style="font-size: 18px"></i><%# Eval("commentscount").ToString() == "0" ? "" : " " + Eval("commentscount") %> </li>
                                 
                                </ul>
                                <br />
                                <asp:Label runat="server" ID="lblCateggory" Text='<%# Eval("categories") %>'></asp:Label>
                            </div>
                        </div>
                    </div>--%>

                    <div class="col-lg-4">
                        <div class="col-md-12 content-page">
                            <br />
                            <div class="promo-area2">
                                <%--<div class="promo-item2" style="background-image:url( http://hannahgale.co.uk/wp-content/uploads/2019/06/10744126784_IMG_3068.jpg)">--%>
                                <div class="posts_ids1">
                                    <div class="promo-item2" style="background-image: url('<%# ConfigurationManager.AppSettings["postImg"] + Eval("imageurl") %>')">
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
                                                <li class="bg-color-6"><i class="fa fa-eye" style="font-size: 18px"></i><%# Eval("viewscount").ToString() == "0" ? "" : " " + Eval("viewscount") + "  Views" %> </li>
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
                <button id="btnLoad" causesvalidation="false" runat="server" onserverclick="btnLoad_ServerClick" class="load-more-button" ><span>More</span> </button>
                <br />
            </div>

        </div>




        <!-- Subscribe Form Start -->
        <div class="col-md-8 col-md-offset-2" id="dvSubscribe" runat="server">
            <form id="mc-form" method="post" action="http://uipasta.us14.list-manage.com/subscribe/post?u=854825d502cdc101233c08a21&amp;id=86e84d44b7">

                <div class="subscribe-form margin-top-20">
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Email ID" CssClass="text-input"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="rev" runat="server" Display="None" ErrorMessage="Please Enter Valid Email Id" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <asp:Button class="submit-btn" id="btnSubscribe" runat="server" OnClick="btnSubscribe_ServerClick" Text="Subscribe Now" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Email Id" ControlToValidate="txtEmail" Display="None"></asp:RequiredFieldValidator>
                </div>
                <center><p>Subscribe for new post notification</p>
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label></center>
                <br />
            </form>

        </div>
        <!-- Subscribe Form End -->
    </div>
    <asp:HiddenField ID="hdnPageNo" Value="0" runat="server" />
    <!-- Blog Post (Right Sidebar) End -->
</asp:Content>

