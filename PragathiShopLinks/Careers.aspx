<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="Careers.aspx.cs" Inherits="Zoyal.Careers" %>
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
    <link href="css/theme-responsive.css" rel="stylesheet"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <script>
        $(document).ready(function () {
            document.getElementById("li_career").className = "active";
        });
    </script>

      <!-- Begin Main -->
        <div role="main" class="main">

            <!-- Begin page top -->
            <section class="page-top-lg">
                <div class="container">
                    <div class="page-top-in">
                        <h2><span>Careers</span></h2>
                    </div>
                </div>
            </section>
            <!-- End page top -->
            <div class="container">
                <p>We are transforming content viewing Experience for making india more happier place.
Come ! Be part of change !</p>
                <table>
                      
         <tr><td><label>Full Name:</label></td><td><asp:TextBox ID="txt_name" runat="server" class="form-control"></asp:TextBox></td> <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_name" ErrorMessage="please enter your Name" ></asp:RequiredFieldValidator></td></tr>     
                    <tr><td>&nbsp&nbsp</td></tr>   
                     
                  
               
                        
                 <tr><td> <label>Email</label></td><td><asp:TextBox ID="txt_email" runat="server" CssClass="form-control"></asp:TextBox></td>
                   
                      
                        
                 <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_email" ErrorMessage="please enter your Email"></asp:RequiredFieldValidator>
             </br>
                <asp:RegularExpressionValidator ID="req_email" runat="server" 
       ErrorMessage="Enter a valid email address"
       ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
       ControlToValidate="txt_email" ForeColor="Red" >
 </asp:RegularExpressionValidator></td>
            </tr>  
                    <tr><td>&nbsp&nbsp</td></tr>  
                     
              <tr><td> <label> Contact NO:</label></td><td>  <asp:TextBox ID="txt_contactno" runat="server" CssClass="form-control"></asp:TextBox></td>
                    
                  &nbsp&nbsp
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_contactno" ErrorMessage="please enter your contact no"></asp:RequiredFieldValidator></td>  
                  
                       

                 <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
      ControlToValidate="txt_contactno" ErrorMessage="please Enter valid phone number" 
    ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator></td></tr> 
                    <tr><td>&nbsp&nbsp</td></tr>   
                 
               <tr>

                <td> <label>Position Applied for:</label></td>
                   <td>
                        <asp:DropDownList ID="drp1" runat="server" AutoPostBack="true" CssClass="form-control">
                            <asp:ListItem Text="--SELECT POSITION--" Value="0"></asp:ListItem>
                            <asp:ListItem Text="UI/UX Designer" Value="1"></asp:ListItem>
                             <asp:ListItem Text="  Web Developer" Value="2"></asp:ListItem>
                             <asp:ListItem Text=" Software Developer" Value="3"></asp:ListItem>
                             <asp:ListItem Text=" HR " Value="4"></asp:ListItem>
                             <asp:ListItem Text=" ADMIN" Value="5"></asp:ListItem>
                             <asp:ListItem Text=" Operations  " Value="6"></asp:ListItem>
                             <asp:ListItem Text="Finance " Value="7"></asp:ListItem>
                             <asp:ListItem Text="Data Analyst" Value="8"></asp:ListItem>
                             <asp:ListItem Text=" customer support Manager" Value="9"></asp:ListItem>
                             <asp:ListItem Text=" Android/IOS Developer  " Value="10"></asp:ListItem>
                             <asp:ListItem Text="  Android/IOS " Value="11"></asp:ListItem>
                            <asp:ListItem Text="  Marketing Manager " Value="12"></asp:ListItem>
                            </asp:DropDownList>
                       </td>
                       
            
                    
                   <td><asp:RequiredFieldValidator ID="drpdown" runat="server" ControlToValidate="drp1" InitialValue="0" ErrorMessage="please select position" ></asp:RequiredFieldValidator></td></tr>
                    <tr><td>&nbsp&nbsp</td></tr> 

                    </table>
                <br />
                <br />
               
                  <table style="margin-left:250px">
                        <tr>
                            <td><asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_Click"   CssClass="btn btn-primary" /></td>
                        </tr>
                      </table>
                   <br />
                <br />
                <br />
                <br />

                       
           
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
