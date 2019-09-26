<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Draft.aspx.cs" Inherits="Draft" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/ForPost.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Blog Post (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">
            <div class="sub-title">
                <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label></center>
                <center><h2>Post In Draft</h2></center>
                <a href="addpost.aspx"><i class="icon-home"></i></a>
            </div>
        </div>
        <asp:Panel ID="pnlDraft" runat="server">
            <div class="row">
                <div class="post-info">
                    <asp:Repeater ID="rpDraft" runat="server" OnItemCommand="rpDraft_ItemCommand">
                        <ItemTemplate>
                            <div class="col-lg-4">
                                <div class="col-md-12 content-page">
                                    <br />
                                    <div class="promo-area2">
                                        <%--<div class="promo-item2" style="background-image:url( http://hannahgale.co.uk/wp-content/uploads/2019/06/10744126784_IMG_3068.jpg)">--%>
                                        <div class="posts_ids1">
                                            <div class="promo-item2" style="background-image: url('<%# Eval("imageurl").ToString() == "" ? ConfigurationManager.AppSettings["postImg"] + "background.jpg" : ConfigurationManager.AppSettings["postImg"] + Eval("imageurl") %>')">
                                                <ul class="knowledge text-center">
                                                    <li class="bg-color-6">
                                                       <asp:LinkButton ID="LinkButton1" ToolTip="Edit Post" runat="server" Font-Bold="true" CommandArgument='<%# Eval("postid") %>' Font-Size="12" CommandName="Publish">Publish Now</asp:LinkButton></li>
                                                    <li class="bg-color-6"><asp:LinkButton ID="lnkEdit" ToolTip="Edit Post" runat="server" CommandArgument='<%# Eval("postid") %>' Font-Size="14"  CommandName="EDT"><i class="fa fa-edit"></i></asp:LinkButton></li>
                                                        <li class="bg-color-6"><asp:LinkButton ID="lnkDel" ToolTip="Delete Post" runat="server" CommandArgument='<%# Eval("postid") %>' Font-Size="14" CommandName="DEL"><i class="fa fa-trash-o"></i></asp:LinkButton>                                                       
                                                    
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
            </div>
            <br />
        </asp:Panel>

        <div class="row">
            <div class="col-md-12 text-center">
                <%--<a href="javascript:void(0)" id="load-more-post" class="load-more-button">Load</a>
                    <div id="post-end-message"></div>--%>
                <button id="btnLoad" runat="server" onserverclick="btnLoad_ServerClick" class="load-more-button"><span>More</span> </button>
            </div>
        </div>
        <br />

    </div>
    <asp:HiddenField ID="hdnPageNo" Value="0" runat="server" />
    <!-- Blog Post (Right Sidebar) End -->
</asp:Content>

