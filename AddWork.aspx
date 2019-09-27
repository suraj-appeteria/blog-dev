<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddWork.aspx.cs" Inherits="AddWork" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        function Test(msg) {
            debugger;
            alert(msg);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                                                <td><b>Description</b></td>
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
                    <br />
                    <br />
                </div>
                <!-- Intro Start -->
                <div class="post-title margin-bottom-30">
                    <h1><span class="main-color">My Work</span></h1>
                </div>
                <!-- Intro End -->
                <div>
                    <asp:HiddenField ID="hdnWorkId" runat="server" />
                    <asp:Repeater ID="rpWorks" runat="server" OnItemCommand="rpWorks_ItemCommand">
                        <ItemTemplate>
                            <!-- Portfolio Detail Start images/portfolio/2.jpg portfolio-->

                            <div class="row">
                                <div class="col-sm-4 custom-pad-1">
                                    <asp:Image runat="server" ImageUrl='<%# Eval("work_image_name").ToString() == "" ? ConfigurationManager.AppSettings["workurl"] + "background.jpg" : ConfigurationManager.AppSettings["workurl"] + Eval("work_image_name") %>' CssClass="img-responsive" Height="400px" Width="347px" />
                                </div>
                                <div class="col-sm-8 custom-pad-2">
                                    <div class="table-responsive" style="padding-left: 1.5em">
                                        <div class="text-right">
                                            <asp:LinkButton CausesValidation="false" ID="lnkEdit" ToolTip="Edit Post" runat="server" CommandArgument='<%# Eval("work_id") %>' Font-Size="20" Style="margin-right:0.5em" CommandName="EDT"><i class="fa fa-edit"></i></asp:LinkButton>
                                            <asp:LinkButton CausesValidation="false" ID="lnkDel" ToolTip="Delete Post" runat="server" CommandArgument='<%# Eval("work_id") %>' Font-Size="20" Style="margin-right:0.5em" CommandName="DEL"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                        </div>
                                        <h3><%# Eval("work_title") %></h3>

                                        <h4><%# Eval("work_desc").ToString().Length > 500 ? Eval("work_desc").ToString().Substring(0,500) : Eval("work_desc").ToString() %></h4>

                                        <p>
                                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("work_id") %>' CommandName="Read" CausesValidation="false" class="button button-style button-anim fa fa-long-arrow-right"><span>Read More</span></asp:LinkButton>
                                        </p>
                                        <p>
                                            <h4><a href='<%# "Testimonial.aspx?workId=" + Eval("work_id") %>'>What Our Readers Says ?</a></h4>
                                        </p>
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

            </div>

        </div>

    </div>
    <!-- Portfolio (Right Sidebar) End -->

</asp:Content>

