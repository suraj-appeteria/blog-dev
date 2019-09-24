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
                <h2>Testimonial</h2>
                <a href="post.aspx"><i class="icon-home"></i></a>
            </div>


            <div class="col-md-12 content-page">
                <div class="col-md-12 blog-post">
                    <!-- Testimonials Start -->
                    <div class="post-title margin-top-50">
                        <h2>I hope you've checked <a href="work.aspx" data-toggle="tooltip" data-placement="top" title="Check out my work.">my work</a>, Let's take a look on what other reders said about my work.</h2>
                    </div>

                    <asp:Repeater ID="rptestimonial" runat="server">
                        <ItemTemplate>
                           

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="testimonial-content">
                                        <p><%# Eval("testimonial") %></p>
                                    </div>

                                    <div class="testimonial-client-info">

                                        <div class="testimonial-client client-thumb">
                                            <img src="images/testimonial/1.png" alt="">
                                        </div>

                                        <div class="client-text">
                                            <div class="client-name"><%# Eval("full_name") %></div>
                                            <span><%# Eval("desingation") %>, <%# Eval("company_name") %></span>
                                        </div>
                                    </div>
                                </div>
                        
                        </ItemTemplate>
                    </asp:Repeater>
                    <!-- Testimonials  End -->

                </div>
            </div>
        </div>


        <br /><br />
        <!-- Subscribe Form Start -->
        <div class="col-md-8 col-md-offset-2" id="dvSubscribe" runat="server">
            <form id="mc-form" method="post" action="http://uipasta.us14.list-manage.com/subscribe/post?u=854825d502cdc101233c08a21&amp;id=86e84d44b7">

                <div class="subscribe-form margin-top-20">
                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Email ID" CssClass="text-input" ValidationGroup="first"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="rev" runat="server" Display="None" ErrorMessage="Please Enter Valid Email Id" ValidationGroup="first" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Email Id" ControlToValidate="txtEmail" ValidationGroup="first" Display="None"></asp:RequiredFieldValidator>
                    <asp:Button class="submit-btn" ID="btnSubscribe" runat="server"  Text="Subscribe Now" ValidationGroup="first" />
                </div>
                <center><p>Subscribe for new post notification</p>
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label></center>
                <br />
            </form>

        </div>
        <!-- Subscribe Form End -->


    </div>
    <!-- Contact (Right Sidebar) End -->

</asp:Content>

