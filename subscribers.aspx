<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="subscribers.aspx.cs" Inherits="subscribers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Portfolio (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">


            <div class="sub-title">
                <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                <h2>Subscribers</h2>
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
                                                    <asp:Label ID="Label2" runat="server" Text="User Name"></asp:Label>
                                                </th>
                                                <th class="text-center">
                                                    <asp:Label ID="Label3" runat="server" Text="email"></asp:Label>
                                                </th>
                                                <th class="text-center">
                                                    <asp:Label ID="Label4" runat="server" Text="mobile"></asp:Label>
                                                </th>
                                            </tr>
                                            <asp:Repeater ID="rpSubscriber" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td><%# Eval("firstname") + " "+Eval("lastname") %></td>
                                                        <td><%# Eval("email") %></td>
                                                        <td><%# Eval("mobile") %></td>
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

