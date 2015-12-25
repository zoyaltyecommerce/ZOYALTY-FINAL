<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="vendor_registration.aspx.cs" Inherits="PragathiShopLinks.Admin.vendor_registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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

        function validateForm() {
            var x = document.form["tst"]["num"].value;
            var y = parseInt(x, 10)
            var i = 15;
            if (y > i) {
                alert("Range is Between 0-10");
                return false;
            }
        }

    </script>
    <h3 style="color:blue">Account creation</h3>
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" id="txtv_name" runat="server" class="form-control" /></td>
            <td> <asp:RequiredFieldValidator ID="req_name" runat="server" ControlToValidate="txtv_name" ErrorMessage="Please Enter Your Name"></asp:RequiredFieldValidator></td>
        </tr>
        <tr><td><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Only characters" ControlToValidate="txtv_name" ValidationExpression="[a-zA-Z]*$"></asp:RegularExpressionValidator> </td></tr>
        <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" id="txtv_email" class="form-control" runat="server" /></td>
            <td><asp:RequiredFieldValidator ID="Req_email" runat="server" ControlToValidate="txtv_email" ErrorMessage="Please Enter your Email"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>  <asp:RegularExpressionValidator Display="Dynamic" ForeColor="red" ID="RegularExpressionValidator3" runat="server" 
       ErrorMessage="Enter a valid email address"
       ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
       ControlToValidate="txtv_email" > </asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>&nbsp</td>
        </tr>
         <tr>
            <td>Phone No:</td>
            
            <td><input type="text" id="txtv_phone" runat="server" class="form-control" onkeypress="return fun_AllowOnlyAmountAndDot(this.id);" /></td>
           <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtv_phone" ErrorMessage="Please Enter Your Phone No"></asp:RequiredFieldValidator></td>
             </tr>
        <tr><td>&nbsp</td><td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
      ControlToValidate="txtv_phone" ErrorMessage="please Enter valid phone number" 
    ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator></td></tr>





        <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>Alternate Contact No:</td>
            <td><input type="text" id="txtv_altrphno" runat="server" class="form-control"   onkeypress="return validateForm()"/></td>
        </tr>
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>Create password:</td>
            
            <td><input type="password" id="txtv_password" runat="server" class="form-control"/></td>
            <td> <asp:RequiredFieldValidator ID="Req_password" runat="server" ControlToValidate="txtv_password" ErrorMessage="Please enter your password"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>Conform password:</td>
            
            <td><input type="password" id="txtv_retypass" runat="server" class="form-control" /></td>
            <td> <asp:CompareValidator runat="server" id="cmpNumbers" controltovalidate="txtv_password" controltocompare="txtv_retypass" errormessage="Password should be match above" /></td>
        </tr>
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>Select city:</td>
            <td><asp:DropDownList ID="drop_city" runat="server" Width="250px" Height="30px"  AppendDataBoundItems="true">
             <asp:ListItem Text="-Select city-" /></asp:DropDownList></td>
            <td> <asp:RequiredFieldValidator ID="Req_vendorcity" runat="server" ControlToValidate="drop_city" InitialValue="-Select city-" ErrorMessage="Please Select your city"></asp:RequiredFieldValidator></td>
            
             
        </tr>
         
        <tr><td> </td></tr>
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
      <td>Location:</td>
            <td><input type="text" id="txtv_vendorloc" runat="server" class="form-control" /></td>
            <td> <asp:RequiredFieldValidator ID="Req_vendorloc" runat="server" ControlToValidate="txtv_vendorloc" ErrorMessage="Please Enter your location"></asp:RequiredFieldValidator></td>
            
        </tr>
         <tr>
            <td>&nbsp</td>
        </tr>

    </table>
     <tr>
            <td>&nbsp</td>
        </tr>
    <h3 style="color:blue">Bank Details</h3>
    <table>
        <tr>
            <td>Account Holder Name:</td>
            
            <td><input type="text" id="txtv_accntholdername" runat="server" class="form-control" /></td>
            <td> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtv_accntholdername" ErrorMessage="Please enter Account Holder Name"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>Account no:</td>
            
            <td><input type="text" id="txtv_acntno" runat="server" class="form-control" /></td>
            <td> <asp:RequiredFieldValidator ID="Req_accntno" runat="server" ControlToValidate="txtv_acntno" ErrorMessage="Please Enter Your Account Number"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>Bank:</td>
            
            <td><input type="text" id="txtv_bank" runat="server" class="form-control" /></td>
            <td> <asp:RequiredFieldValidator ID="Req_bank" runat="server" ControlToValidate="txtv_bank" ErrorMessage="Please Enter Bank name"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>Branch:</td>
             
            <td><input type="text" id="txtv_branch" runat="server" class="form-control" /></td>
            <td><asp:RequiredFieldValidator ID="Req_branch" runat="server" ControlToValidate="txtv_branch" ErrorMessage="Please Enter Branch name"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>Account type:</td>
            
            <%--<td><asp:DropDownList ID="drp1" runat="server" AutoPostBack="true">
                <asp:ListItem Text="Select Type" Value="0"></asp:ListItem>
                <asp:ListItem Text="Current" Value="1" ></asp:ListItem>
                <asp:ListItem Text="Savings" Value="2"></asp:ListItem>
                </asp:DropDownList></td>--%>
            <td><select id="select" runat="server"   style="width:200px;height:30px  " >
                <option value="select type"></option>
                <option value="Current"></option>
                <option value="Savings"></option>

                </select></td>
            <td>
           
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="select" InitialValue="select type" ErrorMessage="Please Select Account Type"></asp:RequiredFieldValidator>
            </td>

            <td> <asp:RequiredFieldValidator ID="Req_type" runat="server" ControlToValidate="select" ErrorMessage="Please enter Branch name"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>IFSC CODE:</td>
            
            <td><input type="text" id="txtv_ifsc" runat="server" class="form-control" /></td>

            <td> <asp:RequiredFieldValidator ID="Req_ifsc" runat="server" ControlToValidate="txtv_ifsc" ErrorMessage="Please Enter IFSC CODE of Your Bank"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>PAN:</td>
            <td><input type="text" id="txtv_pan" runat="server" class="form-control" /></td>
        </tr>
        
        <tr>
            <td>(OR)</td>
        </tr>
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>ID PROOF:</td>
            
            <td><input type="text" id="txtv_idproof" runat="server" class="form-control" /></td>
            <td> <asp:RequiredFieldValidator ID="Req_idproof" runat="server" ControlToValidate="txtv_idproof" ErrorMessage="Please Enter Any ID Proof No"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td>&nbsp</td>
        </tr>
       
        <tr>
            <td> Bank City:</td>
           
            <td><input type="text" id="txtv_city" runat="server" class="form-control" /></td>
            <td>  <asp:RequiredFieldValidator ID="Req_city" runat="server" ControlToValidate="txtv_city" ErrorMessage="Please Enter your city"></asp:RequiredFieldValidator></td>
        </tr>
       
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>Bank State:</td>
            
            <td><input type="text" id="txtv_state" runat="server" class="form-control" /></td>
            <td> <asp:RequiredFieldValidator ID="Req_state" runat="server" ControlToValidate="txtv_state" ErrorMessage="Please Enter Your State"></asp:RequiredFieldValidator></td>
        </tr>
       
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>Pincode:</td>
             
            <td><input type="text" id="txtv_pin" runat="server" class="form-control"  onkeypress="return fun_AllowOnlyAmountAndDot(this.id);" /></td>
          <td><asp:RequiredFieldValidator ID="Req_pincode" runat="server" ControlToValidate="txtv_pin" ErrorMessage="Please enter your pincode"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td>&nbsp</td>
        </tr>

    </table>
    <h3 style="color:blue">Business Details</h3>
    <table>
       <tr>
           <td>Company Name:</td>
            <td>&nbsp</td>
             <td style="margin-left:800px"><input type="text" id="txtv_bisname" runat="server" class="form-control"/></td>
            <td> <asp:RequiredFieldValidator ID="Req_businessame" runat="server" ControlToValidate="txtv_bisname" ErrorMessage="Please Enter your Business Name"></asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td>Company Address:</td>
            <td>&nbsp</td>
                <td><asp:TextBox ID="txtv_addrs" runat="server" TextMode="MultiLine" class="form-control" ></asp:TextBox></td>
            <td>  <asp:RequiredFieldValidator ID="Req_address" runat="server" ControlToValidate="txtv_addrs" ErrorMessage="Please Enter your Company Address"></asp:RequiredFieldValidator></td>
            </tr>
         <tr>
            <td>&nbsp</td>
        </tr>
        <tr>
          <td >Company Landline No:</td>
            <td>&nbsp</td>
            <td style="margin-left:200px" ><input type="text" id="txtv_landno" runat="server" class="form-control"/></td>
                  </tr>
        <tr><td>&nbsp</td></tr>
    </table>

    <table style="margin-left:200PX">
        <tr>
            <td><asp:Button ID="txtv_save" Text="Save" class="btn btn-primary" runat="server" OnClick="txtv_save_Click" /></td>
           <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
             <td><a href="vendor_grid.aspx" id="btn" runat="server" class="btn btn-primary" >Cancel</a></td>
           

        </tr>



</asp:Content>
