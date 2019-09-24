<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AddTestimonial.aspx.cs" Inherits="Testimonial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Contact (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">
            <div class="sub-title">
                <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label></center>
                 <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" />
                <h2>Add New Testimonial</h2>
                <a href="post.aspx"><i class="icon-home"></i></a>
            </div>
            <div class="col-md-12 content-page">
                <div class="col-md-12 blog-post">
                    <!-- Contact Me Start -->
                    <div class="row margin-top-30">
                        <div class="col-md-12">
                            <div class="row">

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Your Name*"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Name" ControlToValidate="txtName" Display="None"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtDesingation" runat="server" CssClass="form-control" placeholder="Desingation (Optional)"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" placeholder="Company Name (Optional)"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <asp:FileUpload CssClass="btntest" ID="fuProfile" runat="server" onchange="this.form.submit()" OnPreRender="fuProfile_PreRender"/>
                                    </div>
                                </div>
                                <div class="col-sm-12">
                                    <div class="form-group">
                                    <asp:DropDownList ID="ddlWork" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Work" InitialValue="0" ControlToValidate="ddlWork" Display="None"></asp:RequiredFieldValidator>
                                        </div>
                                </div>
                                <div class="col-sm-12">
                                    <asp:TextBox ID="txtTestimonial" runat="server" CssClass="form-group form-control" placeholder="Testimonial*" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter Testimonial" ControlToValidate="txtTestimonial" Display="None"></asp:RequiredFieldValidator>
                                </div>

        
                                <div class="text-center">
                                    <button type="submit" id="btnSubmit" class="load-more-button" runat="server" onserverclick="btnSubmit_ServerClick">Add</button>
                                </div>
                                <asp:HiddenField id="hdnTestimonialID" runat="server"/>
                                <asp:HiddenField id="hdnImg" runat="server"/>

                            </div>
                        </div>
                    </div>
                    <!-- Contact Me End -->
                </div>
            </div>
        </div>
    </div>
    <!-- Contact (Right Sidebar) End -->

</asp:Content>

