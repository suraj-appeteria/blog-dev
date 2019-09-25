<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddWork.aspx.cs" Inherits="AddWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function Test(msg) {
            debugger;
            alert(msg);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- Portfolio (Right Sidebar) Start -->       
        <div class="col-md-12 page-body">
            <div class="row">
                <div class="sub-title">
                   <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red" Text=""></asp:Label></center>
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />
                    <h2>Add New Work</h2>
                    <a href="addpost.aspx"><i class="icon-home"></i></a>
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
                                                        <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txtTitle" ErrorMessage="Enter Title" Display="None"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td><b>Url</b></td>
                                                    <td>
                                                        <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control"></asp:TextBox></td>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUrl" ErrorMessage="Enter Url" Display="None"></asp:RequiredFieldValidator>
                                                     </tr>

                                                <tr>
                                                    <td><b>About Work</b></td>
                                                    <td>
                                                        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox></td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesc" ErrorMessage="Enter About Work" Display="None"></asp:RequiredFieldValidator>
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
                                        <div class="col-sm-5 custom-pad-1">
                                                <asp:Image runat="server" ImageUrl='<%# Eval("work_image_name").ToString() == "" ? ConfigurationManager.AppSettings["workurl"] + "writing.jpg" : ConfigurationManager.AppSettings["workurl"] + Eval("work_image_name") %>' CssClass="img-responsive" Height="330px" Width="347px"/>                                        
                                        </div>


                                        <div class="col-sm-7 custom-pad-2">
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <tbody>

                                                        <tr>
                                                            <td><b>Title</b></td>
                                                            <td><%# Eval("work_title") %></td>
                                                        </tr>

                                                        <tr>
                                                            <td><b>Url</b></td>
                                                            <td><a target="_blank" href='<%# Eval("work_url") %>' >Check Now</a></td>
                                                        </tr>

                                                        <tr>
                                                            <td><b>About Work</b></td>
                                                            <td><%# Eval("work_desc").ToString().Length > 150 ? Eval("work_desc").ToString().Substring(0,150) : Eval("work_desc").ToString() %>                                                                
                                                                <asp:LinkButton ID="lnkRead" CausesValidation="false" runat="server" OnClientClick='<%# string.Format("Test(\"{0}\");",Eval("work_desc")) %>' class="button button-style button-anim fa fa-long-arrow-right"><span>Read More</span></asp:LinkButton>                                                            
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

