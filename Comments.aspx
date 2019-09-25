<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Comments.aspx.cs" Inherits="Comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Portfolio (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">


            <div class="sub-title">
                <center><asp:label id="lblErrorMsg" runat="server" forecolor="Red"></asp:label></center>

                <h2>Posts Comments</h2>
                <a href="addpost.aspx"><i class="icon-home"></i></a>
            </div>


            <div class="col-md-12 content-page">
                <div class="col-md-12 blog-post">
                    <!-- Portfolio Start -->
                    <div>
                        <!-- Portfolio Detail Start images/portfolio/2.jpg portfolio-->
                        <div class="row">
                            <div class="col-sm-12 custom-pad-2">
                                <div class="table-responsive">
                                    <table class="table table-bordered ">
                                        <tbody>
                                            <tr>
                                                <th class="text-center">
                                                    <asp:Label ID="Label2" runat="server" Text="Post"></asp:Label>
                                                </th>
                                                <th class="text-center">
                                                    <asp:Label ID="Label3" runat="server" Text="Comments"></asp:Label>
                                                </th>
                                                <th class="text-center">
                                                    <asp:Label ID="Label4" runat="server" Text="User"></asp:Label>
                                                </th>
                                                <th class="text-center">
                                                    <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
                                                </th>
                                                <th class="text-center">
                                                    <asp:Label ID="Label6" runat="server" Text="Commented On"></asp:Label>
                                                </th>
                                                <th class="text-center">
                                                    <asp:Label ID="Label1" runat="server" Text="Action"></asp:Label>
                                                </th>
                                            </tr>
                                            <asp:Repeater ID="rpComments" runat="server" OnItemCommand="rpComments_ItemCommand">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# Eval("posttitle") %></td>
                                                        <td><%# Eval("comments") %></td>
                                                        <td><%# Eval("username") %></td>
                                                        <td><%# Eval("email") %></td>
                                                        <td><%# Eval("commentedon","{0:dd/MM/yyyy}") %></td>
                                                        <td>
                                                            <div class="col-lg-1">
                                                                <asp:LinkButton runat="server" OnClientClick="return confirm('Do you reall want to delete this comment ?')" CommandName="DEL" CommandArgument='<%# Eval("commentsid") %>' Font-Size="18px" ToolTip="Delete Comment"> <i class="fa fa-trash" ></i></asp:LinkButton>
                                                            </div>
                                                            <div class="col-lg-1">
                                                                <asp:LinkButton runat="server" Visible="false" CommandName="Reject" CommandArgument='<%# Eval("commentsid") %>' Font-Size="18px" ToolTip="Reject Comment"> <i class="fa fa-close"></i></asp:LinkButton></div>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                        <br />
                        <br />

                        <!-- Portfolio Detail End -->


                    </div>
                    <!-- Portfolio End -->


                </div>

                <%-- <div class="col-md-12 text-center">
                        <a href="javascript:void(0)" id="load-more-portfolio" class="load-more-button">Load</a>
                        <div id="portfolio-end-message"></div>
                    </div>--%>
            </div>

        </div>
    </div>
    <!-- Portfolio (Right Sidebar) End -->
</asp:Content>

