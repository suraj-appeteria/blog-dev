<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddWork.aspx.cs" Inherits="AddWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- Portfolio (Right Sidebar) Start -->       
        <div class="col-md-12 page-body">
            <div class="row">


                <div class="sub-title">
                   <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Text=""></asp:Label></center>
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
                                                    <td>
                                                        <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control"></asp:TextBox></td>
                                                </tr>

                                                <tr>
                                                    <td><b>About Work</b></td>
                                                    <td>
                                                        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
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
                    <br /><br />
                    </div>
                     <!-- Intro Start -->
                        <div class="post-title margin-bottom-30">
                            <h1> <span class="main-color">My Work</span></h1>
                        </div>
                        <!-- Intro End -->
                    <div>
                            <asp:Repeater ID="rpWorks" runat="server">
                                <ItemTemplate>
                                    <!-- Portfolio Detail Start images/portfolio/2.jpg portfolio-->

                                    <div class="row">
                                        <div class="col-sm-6 custom-pad-1">
                                           <%-- <div class="image-carousel">--%>
                                                <%--<img src="images/portfolio/2.jpg" class="img-responsive" alt="">--%>
                                                <asp:Image runat="server" ImageUrl='<%# Eval("work_image_name").ToString() == "" ? ConfigurationManager.AppSettings["workurl"] + "writing.jpg" : ConfigurationManager.AppSettings["workurl"] + Eval("work_image_name") %>' CssClass="img-responsive" alt="" />                                                
                                           <%-- </div>--%>
                                        </div>


                                        <div class="col-sm-6 custom-pad-2">
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <tbody>

                                                        <tr>
                                                            <td><b>Title</b></td>
                                                            <td><%# Eval("work_title") %></td>
                                                        </tr>

                                                        <tr>
                                                            <td><b>Url</b></td>
                                                            <td><a target="_blank" href='<%# Eval("work_url") %>' title="uipasta">Check Now</a></td>
                                                        </tr>

                                                        <tr>
                                                            <td><b>About Work</b></td>
                                                            <td><%# Eval("work_desc").ToString().Length > 150 ? Eval("work_desc").ToString().Substring(0,150) : Eval("work_desc").ToString() %>
                                                                
                                                                <asp:LinkButton runat="server" CommandArgument='<%# Eval("work_id") %>' CommandName="Read" class="button button-style button-anim fa fa-long-arrow-right"><span>Read More</span></asp:LinkButton>
                                                            <%--<%# (Eval("work_desc").ToString().Length > 150) ? (Eval("work_desc").ToString().Substring(0, 150) + "...<a onclick='"+ String.Format("myFunction(\"{0}\");", Eval("work_desc"))+"' >read More</a>") : Eval("work_desc")%>--%>
                                                            </td>
                                                            
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <br /><br />
                                    <!-- Portfolio Detail End -->
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>

                </div>

            </div>

        </div>
    <!-- Portfolio (Right Sidebar) End -->

</asp:Content>

