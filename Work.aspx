<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="Work.aspx.cs" Inherits="Work" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script>
            function myFunction(demo) {
            alert(demo);
        }
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Portfolio (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">


            <div class="sub-title">
                <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label></center>
                 <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />
               
                <a href="contact.aspx"><i class="icon-envelope"></i></a>
            </div>


            <div class="col-md-12 content-page">
                <div class="col-md-12 blog-post">


                    <!-- Intro Start -->
                    <div class="post-title margin-bottom-30">
                        <h1>Let's take a look on <span class="main-color">My Work</span></h1>
                    </div>
                    <!-- Intro End -->

                    <!-- Portfolio Start -->
                    <div>

                        <asp:Repeater ID="rpWorks" runat="server">
                            <ItemTemplate>
                                <!-- Portfolio Detail Start images/portfolio/2.jpg portfolio-->

                                <div class="row">
                                    <div class="col-sm-4 custom-pad-1">
                                        <%-- <div class="image-carousel">--%>
                                        <%-- <img src="images/portfolio/2.jpg" class="img-responsive" alt="">--%>
                                        <asp:Image runat="server" ImageUrl='<%# Eval("work_image_name").ToString() == "" ? ConfigurationManager.AppSettings["workurl"] + "background.jpg" : ConfigurationManager.AppSettings["workurl"] + Eval("work_image_name") %>' CssClass="img-responsive" Height="400px" Width="347px"/>
                                        <%--  </div>--%>
                                    </div>


                                    <div class="col-sm-8 custom-pad-2">
                                        <div class="table-responsive" style="padding-left: 1.5em">
                                            <h3><%# Eval("work_title") %></h3>
                                            
                                            <h4><%# Eval("work_desc").ToString().Length > 500 ? Eval("work_desc").ToString().Substring(0,500) : Eval("work_desc").ToString() %></h4>

                                            <p>
                                                <asp:LinkButton runat="server" CommandArgument='<%# Eval("work_id") %>' CommandName="Read" CausesValidation="false" class="button button-style button-anim fa fa-long-arrow-right"><span>Read More</span></asp:LinkButton></p>                                            
                                            <p><h4><a href='<%# "Testimonial.aspx?workId=" + Eval("work_id") %>'>What Our Readers Says ?</a></h4></p>
                                           <center> <p><a class="btn-link" target="_blank" href='<%# Eval("work_url") %>'>Buy Now</a></p></center>

                                        </div>
                                    </div>
                                </div>
                                <br />
                                <br />
                                <!-- Portfolio Detail End -->
                            </ItemTemplate>
                        </asp:Repeater>

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

