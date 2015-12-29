<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="shop-cart-full.aspx.cs" Inherits="Zoyal.shop_cart_full" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta charset="utf-8"/>
    <meta name="keywords" content="Zoyalty" />
    <meta name="description" content="Zoyalty"/>
    <meta name="author" content="konnectsu.com"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Zoyalty</title>

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,700' rel='stylesheet' type='text/css'/>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,700,300' rel='stylesheet' type='text/css'/>

    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Icon Fonts -->
    <link href="css/fonts/font-awesome/css/font-awesome.css" rel="stylesheet"/>

    <!-- Owl Carousel Assets -->
    <link href="vendor/owl-carousel/owl.carousel.css" rel="stylesheet"/>
    <link href="vendor/owl-carousel/owl.theme.css" rel="stylesheet"/>
    <link href="vendor/owl-carousel/owl.transitions.css" rel="stylesheet"/>

    <!-- bxslider -->
    <link href="vendor/bxslider/jquery.bxslider.css" rel="stylesheet"/>
    <!-- flexslider -->
    <link rel="stylesheet" href="vendor/flexslider/flexslider.css" media="screen"/>

    <!-- Theme --> 
    <link href="css/theme-animate.css" rel="stylesheet"/>
    <link href="css/theme-elements.css" rel="stylesheet"/>
    <link href="css/theme-blog.css" rel="stylesheet"/>
    <link href="css/theme-shop.css" rel="stylesheet"/>
    <link href="css/theme.css" rel="stylesheet"/>

    <!-- Style Switcher-->
    <link rel="stylesheet" href="style-switcher/css/style-switcher.css"/>
    <link href="css/colors/cyan/style.html" rel="stylesheet" id="layoutstyle"/>

    <!-- Theme Responsive-->
    <link href="css/theme-responsive.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/common.min.css"/>
    <link rel="stylesheet" href="css/rtl.min.css"/> 
    <link rel="stylesheet" href="css/silver.min.css"/>  
    <link rel="stylesheet" href="css/mobile.all.min.css"/>  
   
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/theme.plugins.js"></script>
    <script src="js/theme.js"></script>
    <script src="Scripts/jquery-1.9.1.min.js"></script> 


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

    <script type="text/javascript">
         
        function OnSuccessprice(GRAND_TOTAL) {
            document.getElementById("cart_total_footer").innerHTML = GRAND_TOTAL;
            document.getElementById("total_footer").innerHTML = GRAND_TOTAL;
            //document.getElementById("cart_total_footer").innerHTML = result;
            //document.getElementById("total_footer").innerHTML = result; 
        }
    </script> 
       <script src="js/theme.plugins.js"></script>
    <script src="js/theme.js"></script>
    <script src="js/jquery.timepicker.js"></script>
    <script src="js/kendo.all.min.js"></script>
    <script src="js/jquery-1.9.1.min.js"></script>
      
    <style type="text/css">
     
     #ctl00_ContentPlaceHolder1_btn_radio_0
{
  float:left;  
  
  width:56px; 
 
}

#ctl00_ContentPlaceHolder1_btn_radio_1,#ctl00_ContentPlaceHolder1_btn_radio_1
{           
     float:right;  
     text-align:right;
     margin-left:5px;
     
}
.timepicker{background:#fafafa !important;} 
.ui-timepicker-container {
    position: absolute;
    overflow: hidden;
}

.ui-timepicker {
    display: block;
    height: 200px;
    text-align: center;
    list-style: none outside none;
    overflow: auto;
    overflow-x: hidden; /* IE */
    margin: 0;
    padding: 0 0 0 1px;
}
.ui-timepicker-standard {
    /* .ui-widget */
    font-family: Verdana,Arial,sans-serif;
    font-size: 1.1em;
    /* .ui-widget-content */
    background-color: #FFF;
    border: 1px solid #AAA;
    color: #222;
    /* .ui-menu */
    margin: 0;
    padding: 2px;
}
.ui-timepicker-standard a {
    /* .ui-widget-content a */
    color: #222;
}
.ui-timepicker-standard .ui-state-hover {
    /* .ui-state-hover */
    background-color: #DADADA;
    border: 1px solid #999;
    font-weight: normal;
    color: #212121;
}
.ui-timepicker-standard .ui-menu-item {
    /* .ui-menu .ui-menu-item */
    /*clear: left;
    float: left;*/
    margin: 0;
    padding: 0;
    /*width: 100%;*/
}
.ui-timepicker-standard .ui-menu-item a {
    /* .ui-menu .ui-menu-item a */
    display: block;
    padding: 0.2em 0.4em;
    line-height: 1.5;
    text-decoration: none;
}
.ui-timepicker-standard .ui-menu-item a.ui-state-hover {
    /* .ui-menu .ui-menu-item a.ui-state-hover */
    font-weight: normal;
    margin: -1px -1px -1px -1px;
}
 .ui-timepicker-corners, .ui-timepicker-corners .ui-corner-all {
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
}
.ui-timepicker-hidden {
    /* .ui-helper-hidden */
    display: none;
}

 
      
    </style>
    <style>
      

.ui-timepicker-container{position:absolute;overflow:hidden;box-sizing:border-box}.ui-timepicker{box-sizing:content-box;display:block;height:205px;list-style:none outside none;margin:0;padding:0 1px;text-align:center}.ui-timepicker-viewport{box-sizing:content-box;display:block;height:205px;margin:0;padding:0;overflow:auto;overflow-x:hidden}.ui-timepicker-standard{font-family:Verdana,Arial,sans-serif;font-size:1.1em;background-color:#FFF;border:1px solid #AAA;color:#222;margin:0;padding:2px}.ui-timepicker-standard a{border:1px solid transparent;color:#222;display:block;padding:.2em .4em;text-decoration:none}.ui-timepicker-standard .ui-state-hover{background-color:#DADADA;border:1px solid #999;font-weight:400;color:#212121}.ui-timepicker-standard .ui-menu-item{margin:0;padding:0}.ui-timepicker-corners,.ui-timepicker-corners .ui-corner-all{-moz-border-radius:4px;-webkit-border-radius:4px;border-radius:4px}.ui-timepicker-hidden{display:none}.ui-timepicker-no-scrollbar .ui-timepicker{border:0}
    </style>
     <script type="text/javascript">
        function fun_AllowOnlyAmountAndDot(txt) {
            if (event.keyCode > 47 && event.keyCode < 58 || event.keyCode == 46) {
                var txtbx = document.getElementById(txt);
                var amount = document.getElementById(txt).value;
                var present = 0;
                var count = 0;

                if (amount.indexOf(".", present) || amount.indexOf(".", present + 1));
                {
                    // alert('0');
                }
                do {
                    present = amount.indexOf(".", present);
                    if (present != -1) {
                        count++;
                        present++;
                    }
                }
                while (present != -1);
                if (present == -1 && amount.length == 0 && event.keyCode == 46) {
                    event.keyCode = 0;
                    //alert("Wrong position of decimal point not  allowed !!");
                    return false;
                }

                if (count >= 1 && event.keyCode == 46) {

                    event.keyCode = 0;
                    //alert("Only one decimal point is allowed !!");
                    return false;
                }
                if (count == 1) {
                    var lastdigits = amount.substring(amount.indexOf(".") + 1, amount.length);
                    if (lastdigits.length >= 2) {
                        //alert("Two decimal places only allowed");
                        event.keyCode = 0;
                        return false;
                    }
                }
                return true;
            }
            else {
                event.keyCode = 0;
                //alert("Only Numbers with dot allowed !!");
                return false;
            }

        }

    </script>

    <script type="text/javascript">

        function dropcity() {
            debugger;
            var drop = document.getElementById("select_loc");
            var dropvalue = drop.options[drop.selectedIndex].value;
            var selectedText = drop.options[drop.selectedIndex].text;
            document.getElementById('ctl00_ContentPlaceHolder1_hid_location').value = dropvalue;
            document.getElementById('ctl00_ContentPlaceHolder1_hid_location_name').value = selectedText;

            //         var loc = document.getElementById("ContentPlaceHolder1_select_location").innerHTML;
            //PageMethods.dropcityselect(loc, OnSuccess, onerror)

            //function OnSuccess(result) {

            //}
            //function onerror() {
            //    // alert("somthing error")
            //}
        }
    </script>

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
            //var res = result.split(',');
            //document.getElementById('ctl00_ContentPlaceHolder1_lbl_count_item').innerHTML = "Your selection(" + res[1] + "   items)";
            //document.getElementById('ctl00_ContentPlaceHolder1_lbl_count_item').value = res[1];
            //document.getElementById("ctl00_ContentPlaceHolder1_cart_total_footer").innerHTML = res[0];
            //document.getElementById("ctl00_ContentPlaceHolder1_total_footer").innerHTML = res[0];
            //document.getElementById("ctl00_sub_amount_cart").innerHTML = res[0];

            ////document.getElementById('cart_head').innerHTML = "Your selection items(" + res[1] + ")";
            //debugger;
            //if (res[1] == 0) {
            //    location.href = "../index.aspx";
            //    var res = document.getElementById('result');
            //    document.getElementById("Myres").style.borderColor = "#ddd";
            //    // document.getElementsByClassName("resdata").style.border = "1px solid #ddd";
            //    var n = "Noitem selected";
            //    res.innerHTML = n;
            //    var zero = "00.00";
            //    document.getElementById("ctl00_ContentPlaceHolder1_cart_total_footer").innerHTML = zero;
            //    document.getElementById("ctl00_ContentPlaceHolder1_total_footer").innerHTML = zero;
            //    document.getElementById("ctl00_sub_amount_cart").innerHTML = zero;


            //}
            location.href = "shop-cart-full.aspx";


        }
        function onfailureDelete(response) {

            alert(response);
        }
    </script>
    <link href="Scripts/date%20(1).css" rel="stylesheet" />
    <script src="Scripts/date%20(2).js"></script>
    <script src="Scripts/date.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Begin Main -->
    <asp:HiddenField runat="server" ID="hid_city" />
    <asp:HiddenField runat="server" ID="hid_city_id" />
    <asp:HiddenField runat="server" ID="hid_location" />
    <asp:HiddenField runat="server" ID="hid_location_name" />
    <asp:HiddenField runat="server" ID="hid_coupon" />
    <asp:HiddenField runat="server" ID="hid_total_amount" />
    <asp:HiddenField runat="server" ID="hid_couponid" />
    <asp:HiddenField runat="server" ID="hid_coupon_disc" />
    <asp:HiddenField runat="server" ID="hid_paymenttype" />
     <asp:HiddenField runat="server" ID="hid_endtime" />
    <asp:HiddenField runat="server" ID="hid_starttime" />



    <div role="main" class="main">

        <!-- Begin page top -->
        <section class="page-top">
            <div class="container">
                <div class="page-top-in">
                    <h2><span>Shopping Bag</span></h2>
                </div>
            </div>
        </section>
        <!-- End page top -->

        <div class="container">

            <div class="row featured-boxes">
                <div class="col-md-12">
                    <h3 id="lbl_count_item" runat="server">Your selection (3 items)</h3>
                    <div class="featured-box featured-box-cart" id="Myres">
                        <div class="box-content">
                            <div>
                                <table cellspacing="0" class="shop_table" width="100%">
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">Item
                                            </th>
                                            <th class="product-name">Product name
                                            </th>
                                           <%-- <th class="product-name">Types
                                            </th>--%>
                                            <th class="product-price">Price(Rupees)
                                            </th>
                                            <th class="product-quantity">Quantity
                                            </th>
                                            <th class="product-subtotal">SubTotal(Rupees)
                                            </th>
                                            <th class="product-remove">&nbsp;
                                            </th>
                                        </tr>
                                    </thead>


                                    <tbody runat="server" id="tb_cart">

                                        <tr class='cart_table_item'>
                                            <td class='product-thumbnail'>
                                                <a href='shop-product-sidebar.html'>
                                                    <img alt='' width='80' src='images/content/products/product-thumb.jpg'></a>
                                            </td>
                                            <td class='product-name'>
                                                <a href='shop-product-sidebar.html'>Linen shirt with ribbon at the front</a>
                                            </td>
                                            <td class='product-price'>
                                                <span class='amount'>RS299</span>
                                            </td>
                                            <td class='product-quantity'>
                                                <div class='quantity'>
                                                    <input type='button' class='minus' value='-'><input type='text' class='input-text qty text' title='Qty' value='1' name='quantity' min='1' step='1'>
                                                    <input type='button' class='plus' value='+'>
                                                </div>
                                            </td>
                                            <td class='product-subtotal'>

                                                <span class='amount'>RS299</span>
                                            </td>
                                            <td class='product-remove'><a title='Remove this item' class='remove' href='#'>
                                                <i class='fa fa-times-circle'></i>
                                            </a>
                                            </td>
                                        </tr>
                                        <tr class='cart_table_item'>
                                            <td class='product-thumbnail'>
                                                <a href='shop-product-sidebar.html'>
                                                    <img alt='' width='80' src='images/content/products/product-thumb.jpg'></a>
                                            </td>
                                            <td class='product-name'>
                                                <a href='shop-product-sidebar.html'>Linen shirt with ribbon at the front</a>
                                            </td>
                                            <td class='product-price'>
                                                <span class='amount'>RS299</span>
                                            </td>
                                            <td class='product-quantity'>
                                                <div class='quantity'>
                                                    <input type='button' class='minus' value='-'><input type='text' class='input-text qty text' title='Qty' value='1' name='quantity' min='1' step='1'>
                                                    <input type='button' class='plus' value='+'>
                                                </div>
                                            </td>
                                            <td class='product-subtotal'>
                                                <span class='amount'>RS299</span>
                                            </td>
                                            <td class='product-remove'><a title='Remove this item' class='remove' href='#'>
                                                <i class='fa fa-times-circle'></i>
                                            </a>
                                            </td>
                                        </tr>
                                        <tr class='cart_table_item'>
                                            <td class='product-thumbnail'>
                                                <a href='shop-product-sidebar.html'>
                                                    <img alt='' width='80' src='images/content/products/product-thumb.jpg'></a>
                                            </td>
                                            <td class='product-name'>
                                                <a href='shop-product-sidebar.html'>Linen shirt with ribbon at the front</a>
                                            </td>
                                            <td class='product-price'>
                                                <span class='amount'>RS299</span>
                                            </td>
                                            <td class='product-quantity'>
                                                <div class='quantity'>
                                                    <input type='button' class='minus' value='-'><input type='text' class='input-text qty text' title='Qty' value='1' name='quantity' min='1' step='1'>
                                                    <input type='button' class='plus' value='+'>
                                                </div>
                                            </td>
                                            <td class='product-subtotal'>
                                                <span class='amount'>RS299</span>
                                            </td>
                                            <td class='product-remove'><a title='Remove this item' class='remove' href='#'>
                                                <i class='fa fa-times-circle'></i>
                                            </a>
                                            </td>
                                        </tr>
                                        <%--<tr class="cart_table_item">
												
												<td class="product-thumbnail">
													<a href="shop-product-sidebar.html">
														<img alt="" width="80" src="images/content/products/product-thumb.jpg">
													</a>
												</td>
												<td class="product-name">
													<a href="shop-product-sidebar.html">Linen shirt with ribbon at the front</a>
												</td>
												<td class="product-price">
													<span class="amount">RS299</span>
												</td>
												<td class="product-quantity">
													
														<div class="quantity">
															<input type="button" class="minus" value="-">
															<input type="text" class="input-text qty text" title="Qty" value="1" name="quantity" min="1" step="1">
															<input type="button" class="plus" value="+">
														</div>
													
												</td>
												<td class="product-subtotal">
													<span class="amount">RS299</span>
												</td>
												<td class="product-remove">
													<a title="Remove this item" class="remove" href="#">
														<i class="fa fa-times-circle"></i>
													</a>
												</td>
											</tr>
											<tr class="cart_table_item">
												
												<td class="product-thumbnail">
													<a href="shop-product-sidebar.html">
														<img alt="" width="80" src="images/content/products/product-thumb-1.jpg">
													</a>
												</td>
												<td class="product-name">
													<a href="shop-product-sidebar.html">Poplin shirt with fine pleated bands</a>
												</td>
												<td class="product-price">
													<span class="amount">RS72</span>
												</td>
												<td class="product-quantity">
													<div >
														<div class="quantity">
															<input type="button" class="minus" value="-">
															<input type="text" class="input-text qty text" title="Qty" value="1" name="quantity" min="1" step="1">
															<input type="button" class="plus" value="+">
														</div>
													</div>
												</td>
												<td class="product-subtotal">
													<span class="amount">RS72</span>
												</td>
												<td class="product-remove">
													<a title="Remove this item" class="remove" href="#">
														<i class="fa fa-times-circle"></i>
													</a>
												</td>
											</tr>
											<tr class="cart_table_item">
												
												<td class="product-thumbnail">
													<a href="shop-product-sidebar.html">
														<img alt="" width="80" src="images/content/products/product-thumb-4.jpg">
													</a>
												</td>
												<td class="product-name">
													<a href="shop-product-sidebar.html">Contrasting shirt</a>
												</td>
												<td class="product-price">
													<span class="amount">RS60</span>
												</td>
												<td class="product-quantity">
													<div >
														<div class="quantity">
															<input type="button" class="minus" value="-">
															<input type="text" class="input-text qty text" title="Qty" value="1" name="quantity" min="1" step="1">
															<input type="button" class="plus" value="+">
														</div>
													</div>
												</td>
												<td class="product-subtotal">
													<span class="amount">RS60</span>
												</td>
												<td class="product-remove">
													<a title="Remove this item" class="remove" href="#">
														<i class="fa fa-times-circle"></i>
													</a>
												</td>
											</tr>--%>
                                    </tbody>

                               <%-- <tbody>
                                        <tr id="resb">
                                            <td class="tdata"></td>
                                            <td class="tdata"></td>
                                            <td class="tdata" id="result"></td>
                                            <td class="tdata"></td>
                                            <td class="tdata"></td>
                                            <td class="tdata"></td>
                                        </tr>
                                    </tbody>--%>
                                </table>




                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row featured-boxes">
                <div class="col-xs-4">
                    <div class="featured-box featured-box-secondary">
                        <div class="box-content">
                            <h4>Address</h4>

                            <div>
                                <div class="form-group">
                                    <label class="sr-only">Name</label>

                                    <asp:TextBox ID="txt_name" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="procedtocheckout"
                                        ControlToValidate="txt_name" ErrorMessage="Please enter your name" Display="Dynamic" SetFocusOnError="true" ForeColor="red">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only">Email ID</label>
                                    <asp:TextBox ID="txt_email" runat="server" class="form-control" placeholder="Email ID"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="procedtocheckout"
                                        ControlToValidate="txt_email" ErrorMessage="Enter valid Email" Display="Dynamic" SetFocusOnError="true" ForeColor="red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator Display="Dynamic" ForeColor="red" ID="RegularExpressionValidator2" runat="server" ValidationGroup="procedtocheckout"
                                        ErrorMessage="Enter a valid email address"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ControlToValidate="txt_email">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only">Phone Number</label>
                                    <asp:TextBox ID="txt_phonenumber" runat="server" class="form-control" placeholder="Phone number" MaxLength="12"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="procedtocheckout"
                                        ControlToValidate="txt_phonenumber" ErrorMessage="Please enter phone-number" Display="Dynamic" ForeColor="red" SetFocusOnError="true">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ForeColor="red"
                                        ControlToValidate="txt_phonenumber" ErrorMessage="Enter the valid phone number"
                                        ValidationExpression="[0-9]{10}" ValidationGroup="procedtocheckout">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only">Alternate Phone Number</label>
                                    <asp:TextBox ID="txt_altphonenumber" runat="server" class="form-control" placeholder="Alternate Phone Number" MaxLength="12"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="procedtocheckout"
                                        ControlToValidate="txt_altphonenumber" ErrorMessage="Please enter phone-number" Display="Dynamic" ForeColor="red" SetFocusOnError="true">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" ForeColor="red"
                                        ControlToValidate="txt_altphonenumber" ErrorMessage="Enter the valid phone number" ValidationGroup="procedtocheckout"
                                        ValidationExpression="[0-9]{10}">
                                    </asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only">Country</label>
                                    <%-- <div class="list-sort">
                                            <asp:DropDownList ID="ddlcontry" runat="server" class="formDropdown">
                                                <asp:ListItem>Select a country</asp:ListItem>
                                                  <asp:ListItem>INDIA</asp:ListItem>
                                                  <asp:ListItem>USA</asp:ListItem>
                                                 <asp:ListItem>UK</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>--%>
                                </div>
                                <div class="form-group" id="select_city" runat="server">
                                    <%-- <label class="sr-only">State/Province</label>--%>
                                    <%-- <asp:DropDownList ID="txt_state" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="txt_state_SelectedIndexChanged"  >
                                            <asp:ListItem>State/Province</asp:ListItem>
                                        </asp:DropDownList>--%>
                                    <%-- <select class="form-control" id="city_select" runat="server">
                                        <option value="volvo">--Select-City--</option>

                                    </select>--%>
                                    <%--  <asp:TextBox ID="txt_state" runat="server" class="form-control" placeholder="State/Province"></asp:TextBox>--%>
                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                        ControlToValidate="txt_state" ErrorMessage="Please enter your state" Display="Dynamic" SetFocusOnError="true" ForeColor="red">
                                            </asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="form-group" id="select_location" runat="server">
                                    <%--<label class="sr-only">City</label>
                                    <select class="form-control" id="loc_select" runat="server">
                                        <option value="volvo">--Select-Location--</option>--%>

                                    <%-- </select>--%>
                                    <%-- <asp:TextBox ID="txt_city" runat="server" class="form-control" placeholder="City"></asp:TextBox>--%>
                                    <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="procedtocheckout"
                                                        ControlToValidate="txt_city" ErrorMessage="Please enter your city name" Display="Dynamic" SetFocusOnError="true" ForeColor="red">
                                            </asp:RequiredFieldValidator>--%>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-4">
                    <div class="featured-box featured-box-secondary">
                        <div class="box-content">
                            <h4>Address</h4>
                          

                            <div>

                                <div class="form-group">
                                    <label class="sr-only">Address Line1</label>
                                    <asp:TextBox ID="txt_addline1" runat="server" TextMode="MultiLine" class="form-control" placeholder="Address Line1"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="procedtocheckout"
                                        ControlToValidate="txt_addline1" ErrorMessage="Please enter your address1" Display="Dynamic" SetFocusOnError="true" ForeColor="red">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label class="sr-only">Address Line2</label>
                                    <asp:TextBox ID="txt_addline2" runat="server" TextMode="MultiLine" class="form-control" placeholder="Address Line2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="procedtocheckout"
                                        ControlToValidate="txt_addline2" ErrorMessage="Please enter your address2" Display="Dynamic" SetFocusOnError="true" ForeColor="red">
                                    </asp:RequiredFieldValidator>

                                </div>
                           <div class="form-group">
                                      
                                    <label>
                                        No of Audience
                                    </label> 
                                    
                                        <asp:TextBox ID="txt_audience" style="float:right" runat="server" Width="260px" Height="35px" onkeypress="return fun_AllowOnlyAmountAndDot(this.id);"></asp:TextBox>
                               <br />
                                <asp:RequiredFieldValidator ID="noof" runat="server" ValidationGroup="procedtocheckout"
                                        ControlToValidate="txt_audience" ErrorMessage="Please enter No of Audience" Display="Dynamic" SetFocusOnError="true" ForeColor="red">
                                    </asp:RequiredFieldValidator>
                             
                                       
                                </div>
                                 <div style="padding:10px 0px">
                                    
                                        <label>start date</label>   
                                              
                             
    <asp:TextBox ID="txt_startdate" style="line-height:25px;float:right;" runat="server" Width="260px" Height="35px"></asp:TextBox>
                                     <br />
                                  
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="procedtocheckout"
                                                        ControlToValidate="txt_startdate"  ErrorMessage="Please Select start date" Display="Dynamic" SetFocusOnError="true" ForeColor="red">
                                            </asp:RequiredFieldValidator>
                                </div>
                                 <div style="padding:10px 0px">
                                            
                                        <label>Start Time</label>   
                                       <%--<input type="text" id="starttime" name="start_time"   style="line-height:35px;float:right;width:260px;" onkeypress="return fun_AllowOnlyAmountAndDot(this.id);"/>--%>
                                        <input type="text" id="starttime" class="timepicker"  name="end_time" style="line-height:35px;float:right;width:260px;" onkeypress="return fun_AllowOnlyAmountAndDot(this.id);"/>
                                </div> 
                               
                            <div style="padding:10px 0px">
                                    <label>End date</label>

    <asp:TextBox ID="txt_enddate" style="line-height:25px;float:right;" runat="server" Width="260px" Height="35px" ></asp:TextBox>
                                <br />
                                                    
  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="procedtocheckout"
                                                        ControlToValidate="txt_enddate" ErrorMessage="Please Select End date" Display="Dynamic"  SetFocusOnError="true" ForeColor="red">
                                            </asp:RequiredFieldValidator>
                                   
                                </div> 
                                  <div style="padding:10px 0px">
                                            
                                        <label>End Time</label>   

                                       <input type="text" id="endtime" class="timepicker"  name="end_time" style="line-height:35px;float:right;width:260px;" onkeypress="return fun_AllowOnlyAmountAndDot(this.id);"/>
                                       
                                </div>
                                
                            </div>
                               
                        </div>
                    </div>
                </div>

             
                <div class="col-xs-4">


                    <div class="featured-box featured-box-secondary">
                        <div class="box-content">
                            <h4>Shopping bag summary</h4>

                            <div id="producttbl" runat="server">
                                <table cellspacing="0" class="cart-totals" width="100%">
                                    <tbody>
                                        <div class="form-group">
                                    <label class="sr-only">Promotional code</label>
                                    <asp:TextBox ID="txt_promocode" runat="server" class="form-control" placeholder="Enter promotional code here"></asp:TextBox>
                                    <asp:Label ID="lbl" runat="server" Visible="true" ForeColor="Red"></asp:Label>
                                </div>
                                <div class="form-group">

                                    <%--<asp:Button ID="btn_submit" runat="server" class="btn btn-grey btn-sm"  data-loading-text="Loading..." Text="Apply Promotion"/>--%>
                                    <input type="button" id="apply1" runat="server" onclick="coupon_price()" value="Apply Promotion" class="btn btn-primary btn-block btn-sm" />
                                    <input type="button" id="Button1" runat="server" onclick="removie_Coupon()" value="remove Promotion" style="display: none" class="btn btn-primary btn-block btn-sm" />

                                </div>


                                        <tr class="cart-subtotal">
                                        </tr>
                                        <tr class="cart-subtotal" style="border-top: 0px;">

                                            <th>Cart Subtotal
                                            </th>
                                            <td>
                                                <span class="amount" id="cart_total_footer" runat="server">RS431</span>
                                            </td>
                                        </tr>
                                      <tr class="shipping">
                                            <th>Discount Price
                                            </th>
                                            <td><span id="spn_discount" runat="server" >0.00</span><input type="hidden" value="free_shipping" id="shipping_method" name="shipping_method">
                                            </td>
                                        </tr>
                                        <tr class="total">
                                            <th>Total
                                            </th>
                                            <td>
                                                <span class="amount" id="total_footer" runat="server">RS431</span>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                                <tr>
                                    <td>
                                        <asp:RadioButtonList ID="btn_radio" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="radio">
                                            <asp:ListItem Value="1" Selected="True" >Online payment</asp:ListItem>
                                            <asp:ListItem Value="2" >Cash on delivary</asp:ListItem>
                                        </asp:RadioButtonList>
                                        
                                    </td>

                                </tr>
                            </div>
                            <asp:Label ID="lbl_proced_msg" runat="server" ForeColor="Red"></asp:Label>
                            <p>
                                <asp:Button ID="btn_procedchekout" runat="server" Text="Proceed To checkout" class="btn btn-primary btn-block btn-sm" data-loading-text="Loading..." OnClick="btn_procedchekout_Click" ValidationGroup="procedtocheckout" />
                            </p>
                            <p>
                                <asp:Button ID="btn_conshaping" runat="server" Text="Continue Shopping" class="btn btn-grey btn-block btn-sm" data-loading-text="Loading..." OnClick="btn_conshaping_Click" />
                            </p>

                        </div>
                    </div>
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
  <script >
                                         
        $(document).ready(function () {
            $("#ctl00_ContentPlaceHolder1_txt_startdate").datepicker({
                minDate: 0
            });
            $("#ctl00_ContentPlaceHolder1_txt_enddate").datepicker({
                minDate: 0
            });
        });
    </script>

    <!-- Theme Initializer -->

     
    
      
    <!-- Style Switcher -->
    <script type="text/javascript" src="style-switcher/js/switcher.js"></script>
       
   <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet"
        type="text/css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
     <script>
         $(document).ready(function () {
             // initialize both timepickers at once
             $('input.timepicker').timepicker({
                 timeFormat: 'hh:mm p',
                 // year, month, day and seconds are not important
                 minTime: new Date(0, 0, 0, 8, 0, 0),
                 maxTime: new Date(0, 0, 0, 15, 0, 0),
                 // time entries start being generated at 6AM but the plugin 
                 // shows only those within the [minTime, maxTime] interval
                 startHour: 6,
                 // the value of the first item in the dropdown, when the input
                 // field is empty. This overrides the startHour and startMinute 
                 // options
                 startTime: new Date(0, 0, 0, 8, 20, 0),
                 // items in the dropdown are separated by at interval minutes
                 interval: 10,
                 change: function (time) {
                     var element = $(this), text, color; 
                     var timepicker = element.timepicker();

                     color = '#' + (~~(Math.random() * 16777215)).toString(16);
                     element.css({ 'background': color });
                 }
             });
         });



              
            </script>
    <script>
       
        "undefined" != typeof jQuery && function (e) { function t(e, t, i) { return Array(i + 1 - e.length).join(t) + e } function i() { if (1 === arguments.length) { var t = arguments[0]; return "string" == typeof t && (t = e.fn.timepicker.parseTime(t)), new Date(0, 0, 0, t.getHours(), t.getMinutes(), t.getSeconds()) } return 3 === arguments.length ? new Date(0, 0, 0, arguments[0], arguments[1], arguments[2]) : 2 === arguments.length ? new Date(0, 0, 0, arguments[0], arguments[1], 0) : new Date(0, 0, 0) } e.TimePicker = function () { var t = this; t.container = e(".ui-timepicker-container"), t.ui = t.container.find(".ui-timepicker"), 0 === t.container.length && (t.container = e("<div></div>").addClass("ui-timepicker-container").addClass("ui-timepicker-hidden ui-helper-hidden").appendTo("body").hide(), t.ui = e("<div></div>").addClass("ui-timepicker").addClass("ui-widget ui-widget-content ui-menu").addClass("ui-corner-all").appendTo(t.container), t.viewport = e("<ul></ul>").addClass("ui-timepicker-viewport").appendTo(t.ui), e.fn.jquery >= "1.4.2" && t.ui.delegate("a", "mouseenter.timepicker", function () { t.activate(!1, e(this).parent()) }).delegate("a", "mouseleave.timepicker", function () { t.deactivate(!1) }).delegate("a", "click.timepicker", function (i) { i.preventDefault(), t.select(!1, e(this).parent()) }), t.ui.bind("click.timepicker, scroll.timepicker", function () { clearTimeout(t.closing) })) }, e.TimePicker.count = 0, e.TimePicker.instance = function () { return e.TimePicker._instance || (e.TimePicker._instance = new e.TimePicker), e.TimePicker._instance }, e.TimePicker.prototype = { keyCode: { ALT: 18, BLOQ_MAYUS: 20, CTRL: 17, DOWN: 40, END: 35, ENTER: 13, HOME: 36, LEFT: 37, NUMPAD_ENTER: 108, PAGE_DOWN: 34, PAGE_UP: 33, RIGHT: 39, SHIFT: 16, TAB: 9, UP: 38 }, _items: function (t, n) { var r, a, s = this, o = e("<ul></ul>"), u = null; for (-1 === t.options.timeFormat.indexOf("m") && 0 !== t.options.interval % 60 && (t.options.interval = 60 * Math.max(Math.round(t.options.interval / 60), 1)), r = n ? i(n) : t.options.startTime ? i(t.options.startTime) : i(t.options.startHour, t.options.startMinutes), a = new Date(r.getTime() + 864e5) ; a > r;) s._isValidTime(t, r) && (u = e("<li>").addClass("ui-menu-item").appendTo(o), e("<a>").addClass("ui-corner-all").text(e.fn.timepicker.formatTime(t.options.timeFormat, r)).appendTo(u), u.data("time-value", r)), r = new Date(r.getTime() + 1e3 * 60 * t.options.interval); return o.children() }, _isValidTime: function (e, t) { var n = null, r = null; return t = i(t), null !== e.options.minTime ? n = i(e.options.minTime) : (null !== e.options.minHour || null !== e.options.minMinutes) && (n = i(e.options.minHour, e.options.minMinutes)), null !== e.options.maxTime ? r = i(e.options.maxTime) : (null !== e.options.maxHour || null !== e.options.maxMinutes) && (r = i(e.options.maxHour, e.options.maxMinutes)), null !== n && null !== r ? t >= n && r >= t : null !== n ? t >= n : null !== r ? r >= t : !0 }, _hasScroll: function () { var e = this.ui.prop !== undefined ? "prop" : "attr"; return this.ui.height() < this.ui[e]("scrollHeight") }, _move: function (e, t, i) { var n = this; if (n.closed() && n.open(e), !n.active) return n.activate(e, n.viewport.children(i)), undefined; var r = n.active[t + "All"](".ui-menu-item").eq(0); r.length ? n.activate(e, r) : n.activate(e, n.viewport.children(i)) }, register: function (t, i) { var n = this, r = {}; r.element = e(t), r.element.data("TimePicker") || (r.options = e.metadata ? e.extend({}, i, r.element.metadata()) : e.extend({}, i), r.widget = n, e.extend(r, { next: function () { return n.next(r) }, previous: function () { return n.previous(r) }, first: function () { return n.first(r) }, last: function () { return n.last(r) }, selected: function () { return n.selected(r) }, open: function () { return n.open(r) }, close: function (e) { return n.close(r, e) }, closed: function () { return n.closed(r) }, destroy: function () { return n.destroy(r) }, parse: function (e) { return n.parse(r, e) }, format: function (e, t) { return n.format(r, e, t) }, getTime: function () { return n.getTime(r) }, setTime: function (e, t) { return n.setTime(r, e, t) }, option: function (e, t) { return n.option(r, e, t) } }), n._setDefaultTime(r), n._addInputEventsHandlers(r), r.element.data("TimePicker", r)) }, _setDefaultTime: function (t) { "now" === t.options.defaultTime ? t.setTime(i(new Date)) : t.options.defaultTime && t.options.defaultTime.getFullYear ? t.setTime(i(t.options.defaultTime)) : t.options.defaultTime && t.setTime(e.fn.timepicker.parseTime(t.options.defaultTime)) }, _addInputEventsHandlers: function (t) { var i = this; t.element.bind("keydown.timepicker", function (e) { switch (e.which || e.keyCode) { case i.keyCode.ENTER: case i.keyCode.NUMPAD_ENTER: e.preventDefault(), i.closed() ? t.element.trigger("change.timepicker") : i.select(t, i.active); break; case i.keyCode.UP: t.previous(); break; case i.keyCode.DOWN: t.next(); break; default: i.closed() || t.close(!0) } }).bind("focus.timepicker", function () { t.open() }).bind("blur.timepicker", function () { t.close() }).bind("change.timepicker", function () { t.closed() && t.setTime(e.fn.timepicker.parseTime(t.element.val())) }) }, select: function (t, i) { var n = this, r = t === !1 ? n.instance : t; clearTimeout(n.closing), n.setTime(r, e.fn.timepicker.parseTime(i.children("a").text())), n.close(r, !0) }, activate: function (e, t) { var i = this, n = e === !1 ? i.instance : e; if (n === i.instance) { if (i.deactivate(), i._hasScroll()) { var r = t.offset().top - i.ui.offset().top, a = i.ui.scrollTop(), s = i.ui.height(); 0 > r ? i.ui.scrollTop(a + r) : r >= s && i.ui.scrollTop(a + r - s + t.height()) } i.active = t.eq(0).children("a").addClass("ui-state-hover").attr("id", "ui-active-item").end() } }, deactivate: function () { var e = this; e.active && (e.active.children("a").removeClass("ui-state-hover").removeAttr("id"), e.active = null) }, next: function (e) { return (this.closed() || this.instance === e) && this._move(e, "next", ".ui-menu-item:first"), e.element }, previous: function (e) { return (this.closed() || this.instance === e) && this._move(e, "prev", ".ui-menu-item:last"), e.element }, first: function (e) { return this.instance === e ? this.active && 0 === this.active.prevAll(".ui-menu-item").length : !1 }, last: function (e) { return this.instance === e ? this.active && 0 === this.active.nextAll(".ui-menu-item").length : !1 }, selected: function (e) { return this.instance === e ? this.active ? this.active : null : null }, open: function (t) { var i = this, n = t.getTime(), r = t.options.dynamic && n; if (!t.options.dropdown) return t.element; switch ((t.rebuild || !t.items || r) && (t.items = i._items(t, r ? n : null)), (t.rebuild || i.instance !== t || r) && ("1.4.2" > e.fn.jquery ? (i.viewport.children().remove(), i.viewport.append(t.items), i.viewport.find("a").bind("mouseover.timepicker", function () { i.activate(t, e(this).parent()) }).bind("mouseout.timepicker", function () { i.deactivate(t) }).bind("click.timepicker", function (n) { n.preventDefault(), i.select(t, e(this).parent()) })) : (i.viewport.children().detach(), i.viewport.append(t.items))), t.rebuild = !1, i.container.removeClass("ui-helper-hidden ui-timepicker-hidden ui-timepicker-standard ui-timepicker-corners").show(), t.options.theme) { case "standard": i.container.addClass("ui-timepicker-standard"); break; case "standard-rounded-corners": i.container.addClass("ui-timepicker-standard ui-timepicker-corners"); break; default: } i.container.hasClass("ui-timepicker-no-scrollbar") || t.options.scrollbar || (i.container.addClass("ui-timepicker-no-scrollbar"), i.viewport.css({ paddingRight: 40 })); var a = i.container.outerHeight() - i.container.height(), s = t.options.zindex ? t.options.zindex : t.element.offsetParent().css("z-index"), o = t.element.offset(); i.container.css({ top: o.top + t.element.outerHeight(), left: o.left }), i.container.show(), i.container.css({ left: t.element.offset().left, height: i.ui.outerHeight() + a, width: t.element.outerWidth(), zIndex: s, cursor: "default" }); var u = i.container.width() - (i.ui.outerWidth() - i.ui.width()); return i.ui.css({ width: u }), i.viewport.css({ width: u }), t.items.css({ width: u }), i.instance = t, n ? t.items.each(function () { var r, a = e(this); return r = "1.4.2" > e.fn.jquery ? e.fn.timepicker.parseTime(a.find("a").text()) : a.data("time-value"), r.getTime() === n.getTime() ? (i.activate(t, a), !1) : !0 }) : i.deactivate(t), t.element }, close: function (e, t) { var i = this; return i.closed() || t ? (clearTimeout(i.closing), i.instance === e && (i.container.addClass("ui-helper-hidden ui-timepicker-hidden").hide(), i.ui.scrollTop(0), i.ui.children().removeClass("ui-state-hover"))) : i.closing = setTimeout(function () { i.close(e, !0) }, 150), e.element }, closed: function () { return this.ui.is(":hidden") }, destroy: function (e) { var t = this; return t.close(e, !0), e.element.unbind(".timepicker").data("TimePicker", null) }, parse: function (t, i) { return e.fn.timepicker.parseTime(i) }, format: function (t, i, n) { return n = n || t.options.timeFormat, e.fn.timepicker.formatTime(n, i) }, getTime: function (t) { var i = this, n = e.fn.timepicker.parseTime(t.element.val()); return n instanceof Date && !i._isValidTime(t, n) ? null : n instanceof Date && t.selectedTime ? t.format(n) === t.format(t.selectedTime) ? t.selectedTime : n : n instanceof Date ? n : null }, setTime: function (t, n, r) { var a = this, s = t.selectedTime; if ("string" == typeof n && (n = t.parse(n)), n && n.getMinutes && a._isValidTime(t, n)) { if (n = i(n), t.selectedTime = n, t.element.val(t.format(n, t.options.timeFormat)), r) return t } else t.selectedTime = null; return (null !== s || null !== t.selectedTime) && (t.element.trigger("time-change", [n]), e.isFunction(t.options.change) && t.options.change.apply(t.element, [n])), t.element }, option: function (t, i, n) { if (n === undefined) return t.options[i]; var r, a, s = t.getTime(); "string" == typeof i ? (r = {}, r[i] = n) : r = i, a = ["minHour", "minMinutes", "minTime", "maxHour", "maxMinutes", "maxTime", "startHour", "startMinutes", "startTime", "timeFormat", "interval", "dropdown"], e.each(r, function (i) { t.options[i] = r[i], t.rebuild = t.rebuild || e.inArray(i, a) > -1 }), t.rebuild && t.setTime(s) } }, e.TimePicker.defaults = { timeFormat: "hh:mm p", minHour: null, minMinutes: null, minTime: null, maxHour: null, maxMinutes: null, maxTime: null, startHour: null, startMinutes: null, startTime: null, interval: 30, dynamic: !0, theme: "standard", zindex: null, dropdown: !0, scrollbar: !1, change: function () { } }, e.TimePicker.methods = { chainable: ["next", "previous", "open", "close", "destroy", "setTime"] }, e.fn.timepicker = function (t) { if ("string" == typeof t) { var i, n, r = Array.prototype.slice.call(arguments, 1); return i = "option" === t && arguments.length > 2 ? "each" : -1 !== e.inArray(t, e.TimePicker.methods.chainable) ? "each" : "map", n = this[i](function () { var i = e(this), n = i.data("TimePicker"); return "object" == typeof n ? n[t].apply(n, r) : undefined }), "map" === i && 1 === this.length ? e.makeArray(n).shift() : "map" === i ? e.makeArray(n) : n } if (1 === this.length && this.data("TimePicker")) return this.data("TimePicker"); var a = e.extend({}, e.TimePicker.defaults, t); return this.each(function () { e.TimePicker.instance().register(this, a) }) }, e.fn.timepicker.formatTime = function (e, i) { var n = i.getHours(), r = n % 12, a = i.getMinutes(), s = i.getSeconds(), o = { hh: t("" + (0 === r ? 12 : r), "0", 2), HH: t("" + n, "0", 2), mm: t("" + a, "0", 2), ss: t("" + s, "0", 2), h: 0 === r ? 12 : r, H: n, m: a, s: s, p: n > 11 ? "PM" : "AM" }, u = e, c = ""; for (c in o) o.hasOwnProperty(c) && (u = u.replace(RegExp(c, "g"), o[c])); return u = u.replace(RegExp("a", "g"), n > 11 ? "pm" : "am") }, e.fn.timepicker.parseTime = function () { var t = [[/^(\d+)$/, "$1"], [/^:(\d)$/, "$10"], [/^:(\d+)/, "$1"], [/^(\d):([7-9])$/, "0$10$2"], [/^(\d):(\d\d)$/, "$1$2"], [/^(\d):(\d{1,})$/, "0$1$20"], [/^(\d\d):([7-9])$/, "$10$2"], [/^(\d\d):(\d)$/, "$1$20"], [/^(\d\d):(\d*)$/, "$1$2"], [/^(\d{3,}):(\d)$/, "$10$2"], [/^(\d{3,}):(\d{2,})/, "$1$2"], [/^(\d):(\d):(\d)$/, "0$10$20$3"], [/^(\d{1,2}):(\d):(\d\d)/, "$10$2$3"]], n = t.length; return function (r) { var a = i(new Date), s = !1, o = !1, u = !1, c = !1, l = !1; if (r === undefined || !r.toLowerCase) return null; r = r.toLowerCase(), s = /a/.test(r), o = s ? !1 : /p/.test(r), r = r.replace(/[^0-9:]/g, "").replace(/:+/g, ":"); for (var m = 0; n > m; m += 1) if (t[m][0].test(r)) { r = r.replace(t[m][0], t[m][1]); break } return r = r.replace(/:/g, ""), 1 === r.length ? u = r : 2 === r.length ? u = r : 3 === r.length || 5 === r.length ? (u = r.substr(0, 1), c = r.substr(1, 2), l = r.substr(3, 2)) : (4 === r.length || r.length > 5) && (u = r.substr(0, 2), c = r.substr(2, 2), l = r.substr(4, 2)), r.length > 0 && 5 > r.length && (3 > r.length && (c = 0), l = 0), u === !1 || c === !1 || l === !1 ? !1 : (u = parseInt(u, 10), c = parseInt(c, 10), l = parseInt(l, 10), s && 12 === u ? u = 0 : o && 12 > u && (u += 12), u > 24 ? r.length >= 6 ? e.fn.timepicker.parseTime(r.substr(0, 5)) : e.fn.timepicker.parseTime(r + "0" + (s ? "a" : "") + (o ? "p" : "")) : (a.setHours(u, c, l), a)) } }() }(jQuery);
    </script> 


    <%--</div> --%> 
</asp:Content>
 

  