<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" MaintainScrollPositionOnPostback="true" ValidateRequest="false" AutoEventWireup="true" CodeFile="AddPost.aspx.cs" Inherits="AddPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

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
                                                    <asp:LinkButton ID="lnkEdit" ToolTip="Edit Post" runat="server" CommandArgument='<%# Eval("postid") %>' Font-Size="20" CommandName="EDT"><i class="fa fa-edit"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkDel" ToolTip="Delete Post" runat="server" CommandArgument='<%# Eval("postid") %>' Font-Size="20" CommandName="DEL"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkUnpublish" ToolTip="Unpublish Post" runat="server" CommandArgument='<%# Eval("postid") %>' Font-Size="20" CommandName="UNPublish"><i class="fa fa-eye-slash"></i></asp:LinkButton>
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
                                        <li class="bg-color-6"><i class="fa fa-eye" style="font-size: 18px"></i><%# Eval("viewscount").ToString() == "0" ? "" : " " + Eval("viewscount") + "  Views" %> </li>
                                        <li class="bg-color-4"><i class="fa fa-thumbs-o-up" style="font-size: 18px"></i><%# Eval("likescount").ToString() == "0" ? "" : " " + Eval("likescount") %> </li>
                                        <li class="bg-color-5"><i class="fa fa-comment-o" style="font-size: 18px"></i><%# Eval("commentscount").ToString() == "0" ? "" : " " + Eval("commentscount") %> </li>
                                        <%--<li class="bg-color-6"><i class="fa fa-share" style="font-size: 18px"></i><%# Eval("viewscount").ToString() == "0" ? "" : Eval("viewscount") %> </li>--%>
                                    </ul>

                                        <asp:Label runat="server" ID="lblCateggory" Text="Historical"></asp:Label>
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
                                                    <asp:LinkButton ID="lnkEdit" ToolTip="Edit Post" runat="server" CommandArgument='<%# Eval("postid") %>' Font-Size="12" CommandName="Active">Active Post</asp:LinkButton>
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
                                        <li class="bg-color-6"><i class="fa fa-eye" style="font-size: 18px"></i><%# Eval("viewscount").ToString() == "0" ? "" : " " + Eval("viewscount") + "  Views" %> </li>
                                        <li class="bg-color-4"><i class="fa fa-thumbs-o-up" style="font-size: 18px"></i><%# Eval("likescount").ToString() == "0" ? "" : " " + Eval("likescount") %> </li>
                                        <li class="bg-color-5"><i class="fa fa-comment-o" style="font-size: 18px"></i><%# Eval("commentscount").ToString() == "0" ? "" : " " + Eval("commentscount") %> </li>
                                        <%--<li class="bg-color-6"><i class="fa fa-share" style="font-size: 18px"></i><%# Eval("viewscount").ToString() == "0" ? "" : Eval("viewscount") %> </li>--%>
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


        </div>
    <asp:HiddenField ID="hdnPageNo" Value="0" runat="server" />
    <!-- Blog Post (Right Sidebar) End -->

</asp:Content>

