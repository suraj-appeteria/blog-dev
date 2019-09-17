<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Portfolio (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">
            <div class="sub-title">
                <center> <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label></center>
                <h2>My Profile</h2>
            </div>
            <div class="col-md-12 content-page">
                <div class="col-md-12 blog-post">
                    <!-- Portfolio Start -->
                    <div>
                        <div class="row">
                            <div class="col-sm-4 ">
                                <%--<div class="image-carousel">
                                        <img src="images/portfolio/2.jpg" class="img-responsive" alt="">--%>
                                <asp:Image ID="imgProfile" runat="server" ImageUrl="~/images/Profile/default.png" CssClass="img-responsive" alt="" />
                                <%-- </div>--%>

                                <style>
                                    label.myLabel input[type="file"] {
                                        position: absolute;
                                        top: -1000px;
                                    }

                                    /***** Example custom styling *****/
                                    .myLabel {
                                        border: 2px solid #AAA;
                                        border-radius: 4px;
                                        padding: 2px 5px;
                                        margin: 2px;
                                        background: #DDD;
                                        display: inline-block;
                                    }

                                        .myLabel:hover {
                                            background: #CCC;
                                        }

                                        .myLabel:active {
                                            background: #CCF;
                                        }

                                        .myLabel :invalid + span {
                                            color: #A44;
                                        }

                                        .myLabel :valid + span {
                                            color: #4A4;
                                        }
                                </style>
                                <label class="myLabel">                                    
                                    <asp:FileUpload CssClass="btntest" ID="fuProfile" runat="server" onchange="this.form.submit()" OnPreRender="fuProfile_PreRender"/>
                                    <span>Change Profile</span>
                                </label>


                            </div>


                            <div class="col-sm-8 ">
                                <%--<div class="table-responsive">--%>
                                <%--<div class="table table-bordered"> --%>
                                <br />
                                <div class="row">
                                    <div class="col-lg-4"><b>Name</b></div>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtName" runat="server" Text="" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-4"><b>Last Name</b></div>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtLastName" runat="server" Text="" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-4"><b>E-Mail</b></div>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtEmail" runat="server" Text="" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-lg-4"><b>Contact</b></div>
                                    <div class="col-lg-8">
                                        <asp:TextBox ID="txtMobile" runat="server" Text="" ReadOnly="true" MaxLength="10" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="row text-center">
                                    <div class="col-lg-12">
                                        <asp:Button ID="btnUpdate" TabIndex="0" runat="server" Text="Edit" CssClass="btn btn-default" OnClick="btnUpdate_Click" />
                                    </div>
                                </div>
                                <br />
                                <%--</div>--%>
                                <%--</div>--%>
                            </div>
                        </div>
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

