<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="SinglePost.aspx.cs" Inherits="SinglePost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Blog Post (Right Sidebar) Start -->
    <div class="col-md-12 page-body">
        <div class="row">
            <div class="sub-title">
                <center><asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label></center>

                <%--<a href="post.aspx" title="Go to Home Page">
                        <h2>Back Home</h2>
                    </a>--%>
                <h2>
                    <asp:LinkButton ID="btnBack" OnClick="btnBack_Click" Text="Back Home" runat="server" /></h2>
                <a href="#comment" class="smoth-scroll"><i class="icon-bubbles"></i></a>
            </div>
            <div class="col-md-12 content-page">
                <div class="col-md-12 blog-post">
                    <!-- Post Headline Start -->
                    <div class="text-right">
                        <!-- AddToAny BEGIN -->
                        <div class="a2a_kit a2a_kit_size_32 a2a_default_style">
                            <a class="a2a_dd" href="https://www.addtoany.com/share"></a>
                            <a class="a2a_button_facebook"></a>
                            <a class="a2a_button_twitter"></a>
                            <a class="a2a_button_linkedin"></a>
                            <a class="a2a_button_whatsapp"></a>
                            <a class="a2a_button_google_gmail"></a>
                            <a class="a2a_button_yahoo_mail"></a>
                        </div>
                        <%--<script async src="https://static.addtoany.com/menu/page.js"></script>--%>
                        <script src="js/Share.js"></script>
                        <!-- AddToAny END -->
                        <asp:LinkButton ID="lnkLike" runat="server" Font-Size="25" OnClick="lnkLike_Click" TabIndex="0" ForeColor="#450c3a"><i class="fa fa-heart-o"></i></asp:LinkButton>
                        <asp:LinkButton ID="lnkFav" runat="server" Font-Size="25" OnClick="lnkFav_Click" TabIndex="0" ForeColor="#450c3a"><i style="padding-left:0.3em" class="fa fa-star-o"></i></asp:LinkButton>
                    </div>


                    <div class="post-title">
                        <h1>
                            <asp:Label ID="lblposttitle" runat="server"></asp:Label></h1>
                    </div>
                    <!-- Post Headline End -->


                    <!-- Post Detail Start -->
                    <div class="post-info">
                        <span>
                            <asp:Label ID="lblCreatedOn" runat="server"></asp:Label>
                            / by <a href="#" target="_blank">
                                <asp:Label ID="lblcreatedbyemail" runat="server"></asp:Label></a></span>
                    </div>
                    <!-- Post Detail End -->
                    <div>
                        <p>
                            <asp:Label ID="lblPostDescription" runat="server"></asp:Label>
                        </p>
                        <div class="you-may-also-like">
                            <h3>Do you like this post ?  
                                
                            </h3>
                        </div>
                    </div>
                    <!-- Post Author Bio Box Start -->
                    <div class="about-author margin-top-70 margin-bottom-50">

                        <div class="picture">
                            <img src="images/blog/author.png" class="img-responsive" alt="">
                        </div>

                        <div class="c-padding">
                            <h3>Article By <a href="#" target="_blank" data-toggle="tooltip" data-placement="top" title="Visit Alex Website">Alex Parker</a></h3>
                            <p>You can use about author box when someone guest post on your blog, Lorem ipsum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ad minim veniam.</p>
                        </div>
                    </div>
                    <!-- Post Author Bio Box End -->




                    <!-- You May Also Like Start -->
                    <div class="you-may-also-like margin-top-50 margin-bottom-50">
                        <h3>You may also like</h3>
                        <div class="row">
                            <asp:Repeater runat="server" ID="rpInner">
                                <ItemTemplate>

                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                        <a href="singlepost.aspx?postid=<%# Eval("postid") %>">
                                            <p>
                                                <%# Eval("posttitle") %>
                                            </p>
                                        </a>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <!-- You May Also Like End -->



                    <!-- Post Comment (Disqus) Start -->
                    <div id="comment" class="comment">
                        <h3>Discuss about post</h3>
                        <br />
                        <div class="row">
                            <asp:Repeater runat="server" ID="rpComment" OnItemCommand="rpComment_ItemCommand">
                                <ItemTemplate>

                                    <div class="about-author">
                                        <div class="picture">
                                            <asp:Image ID="imgComment" runat="server" ImageUrl='<%# Eval("picture_url") %>' alt="" />
                                            <%-- <img src="images/baby.jpg" class="img-responsive" alt="">--%>
                                        </div>
                                        <div class="c-padding">
                                            <h3><%# Eval("username") %> <a style="color: #655c5c; font-size: 12px"><%# Eval("commentedon","{0:MMMM dd,yyyy}") %></a></h3>
                                            <div class="row">
                                                <div class="col-lg-11">
                                                    <h5><%# Eval("comments") %></h5>
                                                </div>
                                                <div class="col-lg-1">
                                                    <asp:LinkButton runat="server" ID="lnkDel" Visible='<%# Convert.ToString(Eval("userid"))==Session["userid"].ToString() %>' CommandArgument='<%# Eval("commentsid") %>' Font-Size="18" CommandName="DEL" OnClientClick="return confirm('Are you sure want to delete comment ?')"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <div id="disqus_thread" class="row">
                            <div class="col-lg-2">
                                <center>
                                            <asp:Image ID="imgComment" CssClass="load-more-button" runat="server" ImageUrl="~/images/Profile/default.png" alt="" /></center>
                            </div>
                            <div class="col-lg-10 ">
                                <div class="subscribe-form margin-top-10">
                                    <asp:TextBox runat="server" ID="txtComment" TextMode="MultiLine" placeholder="Write a comment" CssClass="text-input"></asp:TextBox>
                                    <button id="btnComment" onserverclick="btnComment_ServerClick" runat="server" class="submit-btn1" type="submit">Submit</button>
                                </div>
                            </div>
                        </div>
                        <asp:Panel runat="server" Visible="false">
                            <!-- Disqus Code Start  (Please Note: Disqus will not be load on local, You have to upload it on server.)-->

                            <script>
                                (function () { // DON'T EDIT BELOW THIS LINE
                                    var d = document, s = d.createElement('script');
                                    s.src = '//uipasta.disqus.com/embed.js';   // Please change the url from your own disqus id
                                    s.setAttribute('data-timestamp', +new Date());
                                    (d.head || d.body).appendChild(s);
                                })();
                            </script>
                            <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
                            <!-- Disqus Code End -->
                        </asp:Panel>
                    </div>
                    <!-- Post Comment (Disqus) End -->


                </div>
            </div>
        </div>
    </div>
    <!-- Blog Post (Right Sidebar) End -->
</asp:Content>

