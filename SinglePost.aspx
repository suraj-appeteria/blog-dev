<%@ Page Title="" Language="C#" MasterPageFile="~/BlogAdmin.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="SinglePost.aspx.cs" Inherits="SinglePost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Blog Post (Right Sidebar) Start -->
    <div class="col-md-9">
        <div class="col-md-12 page-body">
            <div class="row">
                <div class="sub-title">
                    <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>

                    <%--<a href="post.aspx" title="Go to Home Page">
                        <h2>Back Home</h2>
                    </a>--%>
                    <h2><asp:LinkButton ID="btnBack" OnClick="btnBack_Click" Text="Back Home" runat="server" /></h2>
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
                                <a class="a2a_button_sms"></a>
                                <a class="a2a_button_yahoo_mail"></a>
                            </div>
                            <script async src="https://static.addtoany.com/menu/page.js"></script>
                            <!-- AddToAny END -->
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
                        </div>
                        <asp:Panel ID="pnlHtml" runat="server" Visible="false">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at quam at orci commodo hendrerit vitae nec eros. Vestibulum neque est, imperdiet nec tortor nec, tempor semper metus. <b>Cras vel tempus velit</b>, et accumsan nisi. Duis laoreet pretium ultricies. Curabitur rhoncus auctor nunc congue sodales. Sed posuere nisi ipsum, eget dignissim nunc dapibus eget. Aenean elementum <b><a href="javascript:void(0)" data-toggle="popover" data-placement="top" data-content="You can write any text here">Click me</a></b> sollicitudin sapien ut sapien fermentum aliquet mollis. Curabitur ac quam orci sodales quam ut tempor. <b data-toggle="tooltip" data-placement="top" title="You can write any text here.">Hover me</b> suspendisse, gravida in augue in, interdum bibendum dui. Suspendisse sit amet justo sit amet diam fringilla commodo. Praesent ac magna at metus malesuada tincidunt non ac arcu. Nunc gravida eu felis vel elementum. Vestibulum sodales quam ut tempor tempor. Donec sollicitudin sapien ut sapien fermentum, non ultricies nulla gravida.</p>


                            <!-- Post Image Start -->
                            <div class="post-image margin-top-40 margin-bottom-40">
                                <img src="images/blog/1.jpg" alt="">
                                <p>Image source from <a href="#" target="_blank">Link</a></p>
                            </div>
                            <!-- Post Image End -->


                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at quam at orci commodo hendrerit vitae nec eros. Vestibulum neque est, imperdiet nec tortor nec, tempor semper metus. Cras vel tempus velit, et accumsan nisi. Duis laoreet pretium ultricies. Curabitur rhoncus auctor nunc congue sodale Sed posuere nisi ipsum.</p>



                            <!-- Post Video Tutorial Start -->
                            <div class="video-box margin-top-40 margin-bottom-40">
                                <div class="video-tutorial">
                                    <a class="video-popup" href="https://www.youtube.com/watch?v=O2Bsw3lrhvs" title="Video Tutorial">
                                        <img src="images/blog/4.jpg" alt="">
                                    </a>
                                </div>
                                <p>Integrate video on magnific popup for fast page load.</p>
                            </div>
                            <!-- Post Video Tutorial End -->



                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at quam at orci commodo hendrerit vitae nec eros. Vestibulum neque est, imperdiet nec tortor nec, tempor semper metus. Cras vel tempus velit, et accumsan nisi. Duis laoreet pretium ultricies. Curabitur rhoncus auctor nunc congue sodale Sed posuere nisi ipsum.</p>



                            <!-- Post Blockquote Start -->
                            <div class="post-quote margin-top-40 margin-bottom-40">
                                <blockquote>Design is not just what is look like, Design is how it's work.</blockquote>
                            </div>
                            <!-- Post Blockquote End -->



                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at quam at orci commodo hendrerit vitae nec eros. Vestibulum neque est, imperdiet nec tortor nec, tempor semper metus. Cras vel tempus velit, et accumsan nisi. Duis laoreet pretium ultricies. Curabitur rhoncus auctor nunc congue sodale Sed posuere nisi ipsum.</p>



                            <!-- Post Coding (SyntaxHighlighter) Start -->
                            <div class="margin-top-40 margin-bottom-40">
                                <pre class="brush: js">
                                   /* Smooth Scroll */

                                    $('a.smoth-scroll').on("click", function (e) {
                                      var anchor = $(this);
                                      $('html, body').stop().animate({
                                      scrollTop: $(anchor.attr('href')).offset().top - 50
                                      }, 1000);
                                      e.preventDefault();
                                     });
				 
                                   /* Scroll To Top */
		
                                   $(window).scroll(function(){
                                     if ($(this).scrollTop() >= 500) {
                                     $('.scroll-to-top').fadeIn();
                                     } else {
                                     $('.scroll-to-top').fadeOut();
                                     }
                                     });
	
	                               $('.scroll-to-top').click(function(){
                                   $('html, body').animate({scrollTop : 0},800);
                                   return false;
                                    });
                                  </pre>
                            </div>
                            <!-- Post Coding (SyntaxHighlighter) End -->



                            <div class="post-title">
                                <h2>How to implement?</h2>
                            </div>


                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at quam at orci commodo hendrerit vitae nec eros. Vestibulum neque est, imperdiet nec tortor nec, tempor semper metus. Cras vel tempus velit, et accumsan nisi. Duis laoreet pretium ultricies. Curabitur rhoncus auctor nunc congue sodale Sed posuere nisi ipsum.</p>




                            <!-- Post Image Gallery Start -->
                            <div class="row margin-top-40 margin-bottom-40">

                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <a href="images/blog/7.jpg" class="image-popup" title="image Title">
                                        <img src="images/blog/7.jpg" class="img-responsive" alt="">
                                    </a>
                                </div>

                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <a href="images/blog/5.jpg" class="image-popup" title="image Title">
                                        <img src="images/blog/5.jpg" class="img-responsive" alt="">
                                    </a>
                                </div>

                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <a href="images/blog/6.jpg" class="image-popup" title="image Title">
                                        <img src="images/blog/6.jpg" class="img-responsive" alt="">
                                    </a>
                                </div>

                            </div>
                            <!-- Post Image Gallery End -->



                            <div class="post-title">
                                <h2>Make it more awesome</h2>
                            </div>


                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at quam at orci commodo hendrerit vitae nec eros. Vestibulum neque est.</p>



                            <!-- Post Blockquote (Italic Style) Start -->
                            <blockquote class="margin-top-40 margin-bottom-40">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at quam at orci commodo hendrerit vitae nec eros. Vestibulum neque est, imperdiet nec tortor nec, tempor semper metus. Cras vel tempus velit, <b>et accumsan nisi</b>. Duis laoreet pretium ultricies. Curabitur rhoncus auctor nunc congue sodale Sed posuere nisi ipsum.</p>
                            </blockquote>
                            <!-- Post Blockquote (Italic Style) End -->




                            <div class="post-title">
                                <h2>Learn to check all the features</h2>
                            </div>


                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at quam at orci commodo hendrerit vitae nec eros. Vestibulum neque est.</p>



                            <!-- Post List Style Start -->
                            <div class="list">
                                <ul>
                                    <li>Ready to use Blog Template</li>
                                    <li>It have all the necessary features which you need to run blog</li>
                                    <li>Neat and Clean Typography</li>
                                    <li>Speed Optimization</li>
                                </ul>
                            </div>



                            <div class="list list-style margin-top-40">
                                <ul>
                                    <li>Ready to use Blog Template</li>
                                    <li>It have all the necessary features which you need to run blog</li>
                                    <li>Neat and Clean Typography</li>
                                    <li>Speed Optimization</li>
                                </ul>
                            </div>


                            <div class="list list-style-2 margin-top-40">
                                <ul>
                                    <li>Ready to use Blog Template</li>
                                    <li>It have all the necessary features which you need to run blog</li>
                                    <li>Neat and Clean Typography</li>
                                    <li>Speed Optimization</li>
                                </ul>
                            </div>
                            <!-- Post List Style End -->
                        </asp:Panel>



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
                                <asp:Repeater runat="server" ID="rpComment">
                                    <ItemTemplate>
                                        <div class="about-author">
                                            <div class="picture">
                                                <img src="images/baby.jpg" class="img-responsive" alt="">
                                            </div>
                                            <div class="c-padding">
                                                <h3><%# Eval("username") %> <a style="color: #655c5c; font-size: 12px"><%# Eval("commentedon","{0:MMMM dd,yyyy}") %></a></h3>
                                                <asp:LinkButton runat="server" ID="lnkDel" CommandArgument='<%# Eval("commentsid") %>' CommandName="DEL" Text="Remove" ></asp:LinkButton>
                                                <h6><%# Eval("email") %></h6>
                                                <h5><%# Eval("comments") %></h5>
                                            </div>
                                        </div>
                                        <br />
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div id="disqus_thread" class="row">
                                <div class="col-lg-2">
                                    <center>
                                            <asp:Image CssClass="load-more-button" runat="server" ImageUrl="~/images/baby.jpg" /></center>
                                </div>
                                <div class="col-lg-10 ">
                                    <div class="subscribe-form margin-top-10">
                                        <asp:TextBox runat="server" ID="txtComment" TextMode="MultiLine" placeholder="Write a comment" CssClass="text-input"></asp:TextBox>
                                        <button id="btnComment" onserverclick="btnComment_ServerClick" runat="server" class="submit-btn" type="submit">Submit</button>
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



            <!-- Subscribe Form Start -->
            <div class="col-md-8 col-md-offset-2">
                <form id="mc-form" method="post" action="http://uipasta.us14.list-manage.com/subscribe/post?u=854825d502cdc101233c08a21&amp;id=86e84d44b7">

                    <div class="subscribe-form margin-top-20">
                        <input id="mc-email" type="email" placeholder="Email Address" class="text-input">
                        <button class="submit-btn" type="submit">Submit</button>
                    </div>
                    <p>Subscribe to my weekly newsletter</p>
                    <label for="mc-email" class="mc-label"></label>
                </form>

            </div>
            <!-- Subscribe Form End -->


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
</asp:Content>

