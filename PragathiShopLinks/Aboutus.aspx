<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="Aboutus.aspx.cs" Inherits="Zoyal.Aboutus1" %>
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
    <script type="text/javascript">

        //document.getElementById('resb').style.display = 'none';
        function delete_cartitem(id) {
            debugger;
            //var REMOVE_cart = document.getElementById('DELETE_CART' + id);
            //REMOVE_cart.remove(REMOVE_cart.id);
            //var REMOVE = document.getElementById('delete_product' + id);
            //REMOVE.remove(REMOVE.id);
            // PageMethods.delete_cartitem(document.getElementById('REMOVE_cart').value, OnSuccess, onfailure);
            PageMethods.delete_cartitemweb(id, OnSuccessDelete, onfailureDelete)

        }
        function OnSuccessDelete(result) {
            location.href = "contactUs.aspx";
        }
        function onfailureDelete(response) {

            alert(response);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <script>
        $(document).ready(function () {
            document.getElementById("li_aboutus").className = "active";
        });
    </script>
    <div role="main" class="main">

            <!-- Begin page top -->
            <section class="page-top-lg">
                <div class="container">
                    <div class="page-top-in">
                        <h2><span>About Us</span></h2>
                    </div>
                </div>
            </section>
            <!-- End page top -->
            <div class="container">
                <h2>About Us</h2>
                <div class="row">
                    <div class="col-md-12 animation">
                        <p>
1.Our team consists of experienced professionals from Film Industry, technology  and financial services . Work experience of around 20 years of all founding team put together. We are here to disrupt the industry that needs constant innovation and customer winnning experience
</p>

                        
                        </div>
                 
                </div>
                <h2>Our Motto</h2>
                <div class="row">
                    <div class="col-md-12 animation">
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Mission</a> </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                       <p>2.We are here to make yourselves happier than ever before</p>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">What we do</a> </h4>
                                    <p>3.We are India’s Latest best content viewing experience providers.Come be part of us making india’s latest & fastest growing happy time providers. We provide best content viewing experience Whether you want to watch movie /live sports /events/your occasions and projector rentals pan india.</p>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse">
                                    <div class="panel-body">  </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                               <%-- <div class="panel-heading">
                                    <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">What we do</a> </h4>
                                    <p>3.We are India’s Latest best content viewing experience providers.Come be part of us making india’s latest & fastest growing happy time providers. We provide best content viewing experience Whether you want to watch movie /live sports /events/your occasions and projector rentals pan india.</p>

                                </div--%>>
                                <div id="collapseThree" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
     <!-- End Search -->
    <!-- Begin Style Switcher -->
    
    <!-- Begin Style Switcher -->
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
