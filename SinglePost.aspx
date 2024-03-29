﻿<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="SinglePost.aspx.cs" Inherits="SinglePost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<script type="text/javascript">
        window.location.href = "#comment";
</script>--%>
        <link href="css/ForPost.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Blog Post (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">
            <div class="sub-title">
                <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label></center>
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />
                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Comment" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />

                <h2>
                    <asp:LinkButton CausesValidation="false" ID="btnBack" OnClick="btnBack_Click" Text="<i class='fa fa-arrow-circle-left'></i>" runat="server" /></h2>

                <a href="#comment" class="smoth-scroll"><i class="icon-bubbles"></i></a>
            </div>
            <div class="col-md-12 content-page">
                <div class="col-md-12 blog-post">
                    <!-- Post Headline Start -->
                    <div class="row">
                        <div class="col-lg-11">
                            <div class="post-title">
                                <h1>
                                    <asp:Label ID="lblposttitle" runat="server"></asp:Label></h1>
                            </div>
                        </div>
                        <div class="col-lg-1">
                            <asp:LinkButton ID="lnkFav" CausesValidation="false" runat="server" Font-Size="25" OnClick="lnkFav_Click" TabIndex="0" ForeColor="#450c3a"><i style="padding-left:0.3em" class="fa fa-heart-o"></i></asp:LinkButton>
                        </div>
                    </div>

                    <!-- Post Headline End -->


                    <!-- Post Detail Start -->
                    <div class="post-info" style="margin-left: 1em; margin-right: 1em">
                        <asp:Label ID="lblTags" ForeColor="#450c3a" runat="server" Font-Size="18px"></asp:Label>
                        <br />
                        <span>
                            <asp:Label ID="lblCreatedOn" runat="server"></asp:Label>
                            <%--/ by <a href="#" target="_blank">
                                <asp:Label ID="lblcreatedbyemail" runat="server"></asp:Label></a>--%></span>
                    </div>
                    <!-- Post Detail End -->
                    <br />
                    <div>
                        <div class="row" style="margin-left: 1em; margin-right: 1em">
                            <p>
                                <asp:Label ID="lblPostDescription" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div id="dvlike" class="row" style="margin-left: 1em; margin-right: 1em">
                            <div class="you-may-also-like">
                                <h3>Do you like this post ?  
                                <asp:LinkButton ID="lnkLike" CausesValidation="false" runat="server" Font-Size="25" OnClick="lnkLike_Click" TabIndex="0" ForeColor="#450c3a"><i class="fa fa-thumbs-o-up"></i></asp:LinkButton>
                                </h3>
                            </div>
                        </div>
                        <div class="row" style="margin-left: 1em; margin-right: 1em">
                            <!-- AddToAny BEGIN -->
                            <div class="a2a_kit a2a_kit_size_32 a2a_default_style">
                                <a class="a2a_dd" href="https://www.addtoany.com/share"></a>
                                <a class="a2a_button_facebook"></a>
                                <a class="a2a_button_twitter"></a>
                                <a class="a2a_button_linkedin"></a>
                                <a class="a2a_button_whatsapp"></a>
                                <a class="a2a_button_google_gmail"></a>
                                <a class="a2a_button_yahoo_mail"></a>
                            </div>
                            <%--<script async src="https://static.addtoany.com/menu/page.js"></script>--%>
                            <script src="js/Share.js"></script>
                            <!-- AddToAny END -->
                        </div>
                    </div>

                    <!-- You May Also Like Start -->
                    <div class="you-may-also-like margin-top-50 margin-bottom-50">
                        <h3>You may also like</h3>
                        <div class="row">
                            <asp:Repeater runat="server" ID="rpInner" OnItemCommand="rpInner_ItemCommand">
                                <ItemTemplate>

                                    <div class="col-md-4 col-sm-6 col-xs-12" runat="server" visible="false">
                                        <a href="singlepost.aspx?postid=<%# Eval("postid") %>">
                                            <p>
                                                <%# Eval("posttitle") %>
                                            </p>
                                        </a>
                                    </div>
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
                    </div>
                    <!-- You May Also Like End -->

                    <!-- Post Comment (Disqus) Start -->
                    <div id="comment" class="comment">
                        <h3>Discuss about post</h3>
                        <br />
                        <div class="row">
                            <asp:Repeater runat="server" ID="rpComment" OnItemCommand="rpComment_ItemCommand">
                                <ItemTemplate>

                                    <div class="about-author">
                                        <div class="picture">
                                            <asp:Image ID="imgComment" CssClass="load-more-button" runat="server" ImageUrl='<%# Eval("picture_url").ToString()== "" ? ConfigurationManager.AppSettings["profileUrl"] + "default.png" : ConfigurationManager.AppSettings["profileUrl"] + Eval("picture_url") %>' alt="" />
                                            <%-- <img src="images/baby.jpg" class="img-responsive" alt="">--%>
                                        </div>
                                        <div class="c-padding">
                                            <h3><%# Eval("username") %> <a style="color: #655c5c; font-size: 12px"><%# Eval("commentedon","{0:MMMM dd,yyyy}") %></a></h3>
                                            <div class="row">
                                                <div class="col-lg-11">
                                                    <h5><%# Eval("comments") %></h5>
                                                </div>
                                                <div class="col-lg-1">
                                                    <asp:LinkButton runat="server" ID="lnkDel" Visible='<%#  Session["userid"] != null && Convert.ToString(Eval("userid")) == Session["userid"].ToString() || Session["type"].ToString() == "writer"  %>' CommandArgument='<%# Eval("commentsid") %>' Font-Size="18" CommandName="DEL" OnClientClick="return confirm('Are you sure want to delete comment ?')"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <div id="disqus_thread" class="row">
                            <div class="col-lg-2">
                                <center>
                                <asp:Image ID="imgComment" CssClass="load-more-button" runat="server" ImageUrl="~/images/Profile/default.png" alt="" /></center>
                            </div>
                            <div class="col-lg-10 ">
                                <div class="subscribe-form margin-top-10">
                                    <asp:TextBox runat="server" ID="txtComment" ValidationGroup="Comment" TextMode="MultiLine" placeholder="Write a comment" CssClass="text-input"></asp:TextBox>
                                    <asp:Button ID="btnComment" OnClick="btnComment_ServerClick" ValidationGroup="Comment" runat="server" class="submit-btn1" Text="Submit" />
                                    <asp:RequiredFieldValidator ValidationGroup="Comment" ID="rfv1" runat="server" ErrorMessage="Enter Comment" Display="None" ControlToValidate="txtComment"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Post Comment (Disqus) End -->


                </div>
            </div>
        </div>
    </div>
    <!-- Blog Post (Right Sidebar) End -->
</asp:Content>

