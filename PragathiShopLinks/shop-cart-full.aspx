﻿<%@ Page Title="" Language="C#" MasterPageFile="~/_Layout.Master" AutoEventWireup="true" CodeBehind="shop-cart-full.aspx.cs" Inherits="Zoyal.shop_cart_full" %>

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
    <link href="css/jquery.timepicker.css" rel="stylesheet" /> 
    <script src="Scripts/jquery-1.9.1.min.js"></script> 
    <script src="Scripts/all.min.js"></script>

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
                                              
                             
    <asp:TextBox ID="txt_startdate" style="line-height:25px;float:right;" runat="server" Width="260px" Height="35px" Text='<%# Bind("DateofBirth", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                                     <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ValidationGroup="procedtocheckout"
                                                        ControlToValidate="txt_startdate"  ErrorMessage="Please Select start date" Display="Dynamic" SetFocusOnError="true" ForeColor="red">
                                            </asp:RequiredFieldValidator>
                                </div>
                                 <div style="padding:10px 0px">
                                            
                                        <label>Start Time</label>   
                                        <input type="text" id="start1" name="start_time"   style="line-height:35px;float:right;width:260px;" onkeypress="return fun_AllowOnlyAmountAndDot(this.id);"/>
                                       
                                </div>
                               
                                
                            <div style="padding:10px 0px">
                                    <label>End date</label>


    <asp:TextBox ID="txt_enddate" style="line-height:25px;float:right;" runat="server" Width="260px" Height="35px" Text='<%# Bind("DateofBirth", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
                                <br />
                                                    
  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ValidationGroup="procedtocheckout"
                                                        ControlToValidate="txt_enddate" ErrorMessage="Please Select End date" Display="Dynamic"  SetFocusOnError="true" ForeColor="red">
                                            </asp:RequiredFieldValidator>
                                   
                                </div> 
                                  <div style="padding:10px 0px">
                                            
                                        <label>End Time</label>   

                                       <input type="text" id="endtime"   name="end_time" style="line-height:35px;float:right;width:260px;" onkeypress="return fun_AllowOnlyAmountAndDot(this.id);"/>
                                       
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

    <!-- Theme Initializer -->
    <script src="js/theme.plugins.js"></script>
    <script src="js/theme.js"></script>
    <script src="js/jquery.timepicker.js"></script>
    <!-- Style Switcher -->
    <script type="text/javascript" src="style-switcher/js/switcher.js"></script>
       <script> 
        $("#timepicker").kendoTimePicker({
          animation: false
        });
    </script>
        <script type="text/javascript">        
            $(function(){
                $('#starttime').timepicker();
                $('#endtime').timepicker();
                 });
         </script>  
    <%--</div> --%> 
</asp:Content>


 