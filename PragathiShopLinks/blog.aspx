﻿<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="blog.aspx.cs" Inherits="Zoyal.blog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta charset="utf-8">
    <meta name="keywords" content="Zoyalty" />
    <meta name="description" content="Zoyalty">
    <meta name="author" content="konnectsu.com">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Zoyalty</title>
    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300' rel='stylesheet' type='text/css'>
    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Icon Fonts -->
    <link href="css/fonts/font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- Owl Carousel Assets -->
    <link href="vendor/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="vendor/owl-carousel/owl.theme.css" rel="stylesheet">
    <link href="vendor/owl-carousel/owl.transitions.css" rel="stylesheet">

    <!-- bxslider -->
    <link href="vendor/bxslider/jquery.bxslider.css" rel="stylesheet">
    <!-- flexslider -->
    <link rel="stylesheet" href="vendor/flexslider/flexslider.css" media="screen">
    <!-- Theme -->
    <link href="css/theme-animate.css" rel="stylesheet">
    <link href="css/theme-elements.css" rel="stylesheet">
    <link href="css/theme-blog.css" rel="stylesheet">
    <link href="css/theme-shop.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <!-- Style Switcher-->
    <link rel="stylesheet" href="style-switcher/css/style-switcher.css">
    <link href="css/colors/cyan/style.html" rel="stylesheet" id="layoutstyle">
    <!-- Theme Responsive-->
    <link href="css/theme-responsive.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <!-- Begin Main -->
        <div role="main" class="main">

            <!-- Begin page top -->
            <section class="page-top-md">
                <div class="container">
                    <div class="page-top-in">
                        <h2><span>Blog</span></h2>
                    </div>
                </div>
            </section>
            <!-- End page top -->

            <div class="container">
                <div class="row">
                    <div class="col-md-9">
                        <div class="blog-posts">
                            <article class="post post-large">
                                <h3><a href="blog-single.html">Standard Post</a></h3>
                                <div class="post-meta">
                                    <span>By <a href="#">John Doe</a> in <a href="#">Blog</a></span>
                                    <span><i class="fa fa-clock-o"></i> July 9, 2014</span>
                                    <span><i class="fa fa-comment-o"></i> <a href="#">212 Comments</a></span>
                                </div>
                                <div class="post-image single">
                                    <span class="post-info-act">
                                        <a href="#"><i class="fa fa-caret-right"></i></a>
                                    </span>
                                    <a href="blog-single.html"><img class="img-responsive" src="images/content/blog/demo-6.jpg" alt="Blog"></a>
                                </div>
                                <div class="post-content">
                                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                                    <a class="btn btn-sm" href="blog-single.html">Continue reading</a>
                                </div>

                            </article>
                          
                            <article class="post post-large">
                                <h3><a href="blog-single.html">Girl With Roses</a></h3>
                                <div class="post-meta">
                                    <span>By <a href="#">John Doe</a> in <a href="#">Blog</a></span>
                                    <span><i class="fa fa-clock-o"></i> July 9, 2014</span>
                                    <span><i class="fa fa-comment-o"></i> <a href="#">212 Comments</a></span>
                                </div>
                                <div class="post-image single">
                                    <span class="post-info-act">
                                        <a href="#"><i class="fa fa-video-camera"></i></a>
                                    </span>
                                    <a href="blog-single.html"><img class="img-responsive" src="images/content/blog/demo-7.jpg" alt="Blog"></a>
                                </div>
                                <div class="post-content">
                                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                                    <a class="btn btn-sm" href="blog-single.html">Continue reading</a>
                                </div>

                            </article>
                            <ul class="pagination">
                                <li class="disabled"><a href="#">&laquo;</a></li>
                                <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">&raquo;</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <aside class="sidebar">
                            <aside class="block">
                                <form class="form-inline form-search form-search2" class="form-inline" role="form">
                                    <div class="form-group">
                                        <label class="sr-only" for="textsearch2">Enter text search</label>
                                        <input type="text" class="form-control input-lg" id="textsearch2" placeholder="Enter text search">
                                    </div>
                                    <button type="submit" class="btn"><i class="fa fa-search"></i></button>
                                </form>
                            </aside>
                            <aside class="block blk-ads">
                                <h4>Ads</h4>
                                <img class="img-responsive" src="images/content/blog/side-ad.png" alt="Blog">
                            </aside>
                            
                            <aside class="block blk-ads">
                                <h4>Featured Video</h4>
                                <div class="video">
                                    <iframe src="http://player.vimeo.com/video/28614006?color=0088CC" width="100%" height="169" frameborder="0" webkitallowfullscreen="" mozallowfullscreen="" allowfullscreen=""></iframe>
                                </div>
                            </aside>
                            <aside class="block blk-ads">
                                <h4>Tags</h4>
                                <ul class="list-inline tagclouds">
                                    <li><a href="#">Image</a></li>
                                    <li><a href="#">Features</a></li>
                                    <li><a href="#">Gallery</a></li>
                                    <li><a href="#">Post Formats</a></li>
                                    <li><a href="#">Typography</a></li>
                                    <li><a href="#">WooCommerce</a></li>
                                    <li><a href="#">Shortcodes</a></li>
                                    <li><a href="#">Best Sellers</a></li>
                                    <li><a href="#">Slideshow</a></li>
                                </ul>
                            </aside>
                            <aside class="block blk-ads">
                                <h4>Flickr Photos</h4>
                                <ul class="list-thumb-gallery">
                                    <li><a href="#"><img class="img-responsive" src="images/content/blog/demo-thumb-1.jpg" alt="Photo"></a></li>
                                    <li><a href="#"><img class="img-responsive" src="images/content/blog/demo-thumb-2.jpg" alt="Photo"></a></li>
                                    <li><a href="#"><img class="img-responsive" src="images/content/blog/demo-thumb-3.jpg" alt="Photo"></a></li>
                                    <li><a href="#"><img class="img-responsive" src="images/content/blog/demo-thumb-4.jpg" alt="Photo"></a></li>
                                    <li><a href="#"><img class="img-responsive" src="images/content/blog/demo-thumb-5.jpg" alt="Photo"></a></li>
                                    <li><a href="#"><img class="img-responsive" src="images/content/blog/demo-thumb-6.jpg" alt="Photo"></a></li>
                                </ul>
                            </aside>
                        </aside>
                    </div>
                </div>
            </div>

        </div>
        <!-- End Main -->

     <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="vendor/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/bootstrap-hover-dropdown.min.js"></script>
    <script src="vendor/owl-carousel/owl.carousel.js"></script>
    <script src="vendor/modernizr.custom.js"></script>
    <script src="vendor/jquery.stellar.js"></script>
    <script src="vendor/imagesloaded.pkgd.min.js"></script>
    <script src="vendor/masonry.pkgd.min.js"></script>
    <script src="vendor/jquery.pricefilter.js"></script>
    <script src="vendor/bxslider/jquery.bxslider.min.js"></script>
    <script src="vendor/mediaelement-and-player.js"></script>
    <script src="vendor/waypoints.min.js"></script>
    <script src="vendor/flexslider/jquery.flexslider-min.js"></script>

    <!-- Theme Initializer -->
    <script src="js/theme.plugins.js"></script>
    <script src="js/theme.js"></script>

    <!-- Style Switcher -->
    <script type="text/javascript" src="style-switcher/js/switcher.js"></script>
</asp:Content>
