<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewPost.aspx.cs" ValidateRequest="false" Inherits="NewPost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Meta Tag -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- SEO -->
    <meta name="description" content="150 words" />
    <meta name="author" content="uipasta" />
    <meta name="url" content="http://www.yourdomainname.com" />
    <meta name="copyright" content="company name" />
    <meta name="robots" content="index,follow" />
    <title>Blog Admin</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="Login/images/Author.png" />
    <link rel="apple-touch-icon" sizes="144x144" type="image/x-icon" href="images/favicon/apple-touch-icon.png" />

    <!-- All CSS Plugins -->
    <link rel="stylesheet" type="text/css" href="css/plugin.css" />

    <!-- Main CSS Stylesheet -->
    <link rel="stylesheet" type="text/css" href="css/style.css" />

    <!-- Google Web Fonts  -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:400,300,500,600,700" />


    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet" />
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js -->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet" />
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
    <script>
        $(document).ready(function () {
            $('#txtDescription').summernote({
                height: 350,
                placeholder: 'Write a Post...'

            });

        });
    </script>

    <!--MultiSelect Text Box -->
        <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2019.2.619/styles/kendo.common-material.min.css" />
    <%--<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2019.2.619/styles/kendo.material.min.css" />--%>
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2019.2.619/styles/kendo.material.mobile.min.css" />
    <link href="css/kendo.material.min.css" rel="stylesheet" />
    <%--<script src="https://kendo.cdn.telerik.com/2019.2.619/js/jquery.min.js"></script>--%>
    <script src="https://kendo.cdn.telerik.com/2019.2.619/js/kendo.all.min.js"></script>
</head>
<body>
    <div id="main">
        <div class="container">
            <div class="row">
                <form id="form1" runat="server">
                    <div class="col-md-1"></div>
                    <!-- Blog Post (Right Sidebar) Start -->
                    <div class="col-md-10">
                        <div class="col-md-12 page-body">
                            <div class="row">
                                <div class="sub-title" style="padding-top: 0px">
                                    <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                                <div class="post-title text-center">
                                    <h2>Add New Post</h2>
                                </div>
                                <div class="col-md-12 content-page">
                                    <!-- Blog Post Start -->
                                    <div class="post-title">
                                        <asp:Label runat="server" Text="Post Title"></asp:Label>
                                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Write Post Title..."></asp:TextBox>
                                    </div><br />
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="post-title">
                                                <asp:Label runat="server" Text="Tags"></asp:Label>
                                                <asp:TextBox ID="txtTags" runat="server" CssClass="form-control" placeholder="Tag"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="post-title">
                                                <asp:Label runat="server" Text="Image Url"></asp:Label>
                                                <asp:FileUpload runat="server" ID="fuImage" OnPreRender="fuImage_PreRender" />
                                            </div>
                                        </div>
                                    </div><br />
                                    <div class="post-info">
                                        <asp:Label runat="server" Text="Description"></asp:Label>
                                        <span>
                                            <asp:TextBox ID="txtDescription" Height="600px" name="editordata" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Write a post here..."></asp:TextBox>
                                        </span>
                                        <br />
                                        <asp:Label runat="server" Text="Add To Category"></asp:Label>

                                        <div id="example" role="application">
                                            <div class="demo-section k-content">
                                                <select id="required" runat="server" data-placeholder="Select Category...">
                                                </select>
                                            </div>
                                            <style>
                                                .demo-section label {
                                                    display: block;
                                                    margin: 15px 0 5px 0;
                                                }

                                                #get {
                                                    float: right;
                                                    margin: 25px auto 0;
                                                }
                                            </style>
                                            <script>
                                                $(document).ready(function () {
                                                    // create MultiSelect from select HTML element
                                                    var required = $("#required").kendoMultiSelect().data("kendoMultiSelect");
                                                    var optional = $("#optional").kendoMultiSelect({
                                                        autoClose: false
                                                    }).data("kendoMultiSelect");

                                                    $("#get").click(function () {
                                                        alert("Attendees:\n\nRequired: " + required.value() + "\nOptional: " + optional.value());
                                                    });
                                                });
                                            </script>

                                            <br />
                                            <div class="col-md-12 text-center">
                                                    <div class="col-lg-3"></div>
                                                <div class="col-lg-2">
                                                    <asp:Button ID="btnSave" OnClick="btnSave_Click" runat="server" CssClass="load-more-button" Text="Save" />
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:Button ID="btnPublish" OnClick="loadmorepost_Click" runat="server" CssClass="load-more-button" Text="Publish" />
                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="load-more-button" Text="Cancel" PostBackUrl="~/AddPost.aspx"></asp:LinkButton>
                                                </div>
                                                <div class="col-lg-3"></div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <asp:HiddenField runat="server" ID="hdnPostId" />

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
                            <!-- Blog Post (Right Sidebar) End -->
                        </div>
                        <div class="col-md-1">
                        </div>
                        <asp:HiddenField runat="server" ID="hdnFileUpload" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>
