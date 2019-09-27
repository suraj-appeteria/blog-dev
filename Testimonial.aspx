<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" AutoEventWireup="true" CodeFile="Testimonial.aspx.cs" Inherits="Testimonial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- Contact (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">


            <div class="sub-title">
                <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label></center>
                 <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />
                <h2>Reviews</h2>
                <a href="default.aspx"><i class="icon-home"></i></a>
            </div>


            <div class="col-md-12 content-page">
                <div class="col-md-12 blog-post">
                    <!-- Testimonials Start -->
                    <div class="post-title margin-top-50">
                        <h4>Let's take a look on what reders said about "<asp:Label ID="lblWork" runat="server"></asp:Label>" .</h4>
                    </div>

                    <asp:Repeater ID="rptestimonial" runat="server">
                        <ItemTemplate>
                           

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="testimonial-content">
                                        <p><%# Eval("testimonial") %></p>
                                    </div>

                                    <div class="testimonial-client-info">

                                        <div class="testimonial-client client-thumb">
                                            <asp:Image ID="imgComment" CssClass="load-more-button" runat="server" ImageUrl='<%# Eval("photo_name").ToString()== "" ? ConfigurationManager.AppSettings["profileUrl"] + "default.png" : ConfigurationManager.AppSettings["profileUrl"] + Eval("photo_name") %>' alt="" />
                                        </div>

                                        <div class="client-text">
                                            <div class="client-name"><%# Eval("full_name") %></div>
                                            <span><%# Eval("desingation") %>, <%# Eval("company_name") %></span>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                        
                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- Testimonials  End -->

                </div>
            </div>
        </div>


    </div>
    <!-- Contact (Right Sidebar) End -->

</asp:Content>

