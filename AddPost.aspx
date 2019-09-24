<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" MaintainScrollPositionOnPostback="true" ValidateRequest="false" AutoEventWireup="true" CodeFile="AddPost.aspx.cs" Inherits="AddPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/ForPost.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Blog Post (Right Sidebar) Start -->
        <div class="col-md-12 page-body">
            <div class="row">
                <div class="sub-title">
                    <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Text=""></asp:Label></center>
                    <center><h2><asp:LinkButton ID="btnAdd" runat="server" Text="Write New Post" PostBackUrl="~/NewPost.aspx"></asp:LinkButton></h2></center>
                   <h4 class="text-right"><asp:LinkButton ID="lnkDraft" runat="server" CausesValidation="False" OnClick="lnkDraft_Click" Visible="False">Draft</asp:LinkButton></h4>
                </div>
            </div>
            <asp:Panel ID="pnlPost" runat="server">
                <div class="row">
                    <div class="post-info">
                        <asp:Repeater ID="rpPost" runat="server" OnItemCommand="rpPost_ItemCommand">
                            <ItemTemplate>

                                <div class="col-lg-4">
                                    <div class="col-md-12 content-page">
                                    <br />
                                    <div class="promo-area2">
                                        <%--<div class="promo-item2" style="background-image:url( http://hannahgale.co.uk/wp-content/uploads/2019/06/10744126784_IMG_3068.jpg)">--%>
                                        <div class="posts_ids1">
                                            <div class="promo-item2" style="background-image: url('<%# ConfigurationManager.AppSettings["postImg"] + Eval("imageurl") %>')">
                                                <ul class="knowledge text-center">
                                                    <li class="bg-color-6">
                                                        <asp:LinkButton ID="lnkEdit" ToolTip="Edit Post" runat="server" CommandArgument='<%# Eval("postid") %>' Font-Size="20" Style="margin-right:0.5em" CommandName="EDT"><i class="fa fa-edit"></i></asp:LinkButton>
                                                        <asp:LinkButton ID="lnkDel" ToolTip="Delete Post" runat="server" CommandArgument='<%# Eval("postid") %>' Font-Size="20" Style="margin-right:0.5em" CommandName="DEL"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                        <asp:LinkButton ID="lnkUnpublish" ToolTip="Unpublish Post" runat="server" CommandArgument='<%# Eval("postid") %>' Font-Size="20" CommandName="UNPublish"><i class="fa fa-eye-slash"></i></asp:LinkButton>
                                                    </li>
                                                </ul>
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
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12 text-center">
                        <%--<a href="javascript:void(0)" id="load-more-post" class="load-more-button">Load</a>
                    <div id="post-end-message"></div>--%>
                        <button id="btnLoad" runat="server" onserverclick="btnLoad_ServerClick" class="load-more-button"><span>More</span> </button>
                    </div>
                </div>
                <br />
            </asp:Panel>

            <asp:Panel ID="pnlDraft" runat="server" >
                <div class="row">
                    <div class="post-info">
                        <asp:Repeater ID="rpDraft" runat="server" OnItemCommand="rpPost_ItemCommand">
                            <ItemTemplate>
                                <div class="col-lg-4">
                                    <div class="col-md-12 content-page">
                                        <br />
                                        <div class="promo-area2">
                                            <%--<div class="promo-item2" style="background-image:url( http://hannahgale.co.uk/wp-content/uploads/2019/06/10744126784_IMG_3068.jpg)">--%>
                                            <div class="posts_ids1">
                                                <div class="promo-item2" style="background-image: url('<%# ConfigurationManager.AppSettings["postImg"] + Eval("imageurl") %>')">
                                                    <ul class="knowledge text-center">
                                                        <li class="bg-color-6">
                                                        <asp:LinkButton ID="LinkButton1" ToolTip="Edit Post" runat="server" CommandArgument='<%# Eval("postid") %>' Font-Size="12" CommandName="Active">Active Post</asp:LinkButton>    
                                                        </li>
                                                    </ul>
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
                </div>
                <br />
                
            </asp:Panel>


        </div>
    <asp:HiddenField ID="hdnPageNo" Value="0" runat="server" />
    <!-- Blog Post (Right Sidebar) End -->

</asp:Content>

