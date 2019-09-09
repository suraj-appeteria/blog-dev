<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddWork.aspx.cs" Inherits="AddWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- Portfolio (Right Sidebar) Start -->
    <div class="col-md-9">
       
        <div class="col-md-12 page-body">
            <div class="row">


                <div class="sub-title">
                    <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label></center>
                    <h2>Add New Work</h2>
                    <a href="contact.html"><i class="icon-envelope"></i></a>
                </div>


                <div class="col-md-12 content-page">
                    <div class="col-md-12 blog-post">


                        <!-- Intro Start -->
                        <%--<div class="post-title margin-bottom-30">
                            <h1>Let's take a look on <span class="main-color">My Work</span></h1>
                        </div>--%>
                        <!-- Intro End -->

                        <!-- Portfolio Start -->
                        <div>
                            
                            <!-- Portfolio Detail Start -->
                            <div class="row portfolio">
                                <div class="col-sm-12 custom-pad-2">
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <tbody>

                                                <tr>
                                                    <td><b>Title</b></td>
                                                    <td>
                                                     <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td><b>Url</b></td>
                                                    <td><asp:TextBox ID="txtUrl" runat="server" CssClass="form-control"></asp:TextBox></td>
                                                </tr>

                                                <tr>
                                                    <td><b>About Work</b></td>
                                                    <td><asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td><b>Photo</b></td>
                                                    <td>
                                                        <asp:FileUpload ID="fuImage" runat="server" ClientIDMode="Static" onchange="this.form.submit()" OnPreRender="fuImage_PreRender" />
                                                    </td>
                                                </tr>
                                                <asp:HiddenField runat="server" ID="hdnFileUpload" />
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                            <!-- Portfolio Detail End -->

                        </div>
                        <!-- Portfolio End -->
                    </div>

                    <div class="col-md-12 text-center">
                        <%--<a href="javascript:void(0)" id="load-more-portfolio" class="load-more-button">Load</a>
                        <div id="portfolio-end-message"></div>--%>
                        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" CssClass="load-more-button" Text="Add" />
                    </div>

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

