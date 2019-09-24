<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="CategoryMaster.aspx.cs" Inherits="CategoryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Portfolio (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">
            <div class="sub-title">
                <center> <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Text=""></asp:Label></center>
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />
                <h2>Category</h2>
                <a href="addpost.aspx"><i class="icon-home"></i></a>
            </div>


            <div class="col-md-12 content-page">
                <div class="col-md-12 blog-post">
                    <div class="row">
                        <div class="col-lg-5 post-title">
                            <asp:Label ID="label1" runat="server" Text="Category"> </asp:Label>
                            <asp:TextBox ID="txtCategory" runat="server" CssClass="form-control" placeholder="Categoty Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Category Name" ControlToValidate="txtCategory" Display="None"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-4 text-center">
                            <asp:Button ID="loadmorepost" OnClick="loadmorepost_Click" runat="server" CssClass="load-more-button" Text="Add" />
                        </div>
                    </div>
                    <br />
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
                                                    <asp:Label ID="Label3" runat="server" Text="Category Id"></asp:Label>
                                                </th>
                                                <th class="text-center">
                                                    <asp:Label ID="Label4" runat="server" Text="Category"></asp:Label>
                                                </th>

                                            </tr>
                                            <asp:Repeater ID="rpCategory" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# Eval("categoryid") %></td>
                                                        <td><%# Eval("category") %></td>
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

