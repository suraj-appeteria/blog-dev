<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="CategoryMaster.aspx.cs" Inherits="CategoryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-9">
        <div class="col-md-12 page-body">
            <div class="row">
                <div class="sub-title">
                    <center> <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Text="sfgdjsgfds"></asp:Label></center>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />
                    <center><h2 style="color:#1abc9c">Category</h2></center>
                </div>
            </div>
            <div class="row">
                <div class="post-info">
                    <div class="col-md-12 content-page">
                        <!-- Blog Post Start -->
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
                            <asp:GridView ID="gvCategory" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="categoryid" HeaderText="Id" />
                                    <asp:BoundField DataField="category" HeaderText="Category" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

