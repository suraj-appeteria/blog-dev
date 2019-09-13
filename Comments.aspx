﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Comments.aspx.cs" Inherits="Comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Portfolio (Right Sidebar) Start -->
    <div class="col-md-9">
        <div class="col-md-12 page-body">
            <div class="row">


                <div class="sub-title">
                    <asp:label id="lblErrorMsg" runat="server" forecolor="Red"></asp:label>
                    <h2>Comments Requests</h2>
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
                                                <asp:Repeater ID="rpComments" runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%# Eval("posttitle") %></td>
                                                            <td><%# Eval("comments") %></td>
                                                            <td><%# Eval("username") %></td>                                                            
                                                            <td><%# Eval("email") %></td>
                                                            <td><%# Eval("commentedon","{0:dd/MM/yyyy}") %></td>
                                                            <td><asp:LinkButton runat="server" CommandName="Accept" CommandArgument='<%# Eval("commentsid") %>' Font-Size="18px" ToolTip="Publish Comment"> <i class="fa fa-check"></i></asp:LinkButton></td>
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



        <!-- Footer Start -->
        <div class="col-md-12 page-body margin-top-50 footer">
            <footer>
                <ul class="menu-link">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="work.html">Work</a></li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>

                <p>© Copyright 2016 DevBlog. All rights reserved</p>


                <!-- UiPasta Credit Start -->
                <div class="uipasta-credit">Design By <a href="http://www.uipasta.com" target="_blank">UiPasta</a></div>
                <!-- UiPasta Credit End -->


            </footer>
        </div>
        <!-- Footer End -->


    </div>
    <!-- Portfolio (Right Sidebar) End -->
</asp:Content>

