<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="productinsert.aspx.cs" Inherits="PragathiShopLinks.Admin.priceinsert" EnableEventValidation="false" ValidateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2  style="color:blue">ADD PRODUCTS</h2>
    <table>
        <tr>
            <td>Select City</td>
            <td><asp:DropDownList ID="drp1" runat="server" AutoPostBack="true"   Width="250px" Height="30px"  AppendDataBoundItems="true">
                <asp:ListItem Text="-Select city-" />
                </asp:DropDownList></td>
             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="drp1" InitialValue="-Select city-" ErrorMessage="please select city"></asp:RequiredFieldValidator></td>

             
        </tr>
        <tr><td>&nbsp</td></tr>
        <tr>
        <td>Product Name:</td>
            <td><asp:TextBox ID="txt_name" runat="server" CssClass="form-control"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="req1" runat="server" ControlToValidate="txt_name" ErrorMessage="please enter name"></asp:RequiredFieldValidator></td>
        </tr>
        <tr><td>&nbsp</td></tr>
        <tr>
            <td>Product Description</td>
            <td> <asp:TextBox ID="txt_desc" runat="server"  CssClass="form-control"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_desc" ErrorMessage="please enter product description"></asp:RequiredFieldValidator></td>
        </tr>
        <tr><td>&nbsp</td></tr>
    <tr>
        <td>Upload image</td>
        <td>  <asp:FileUpload ID="product_img" runat="server" /></td>
        <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="product_img" ErrorMessage="please select image"></asp:RequiredFieldValidator></td>

    </tr>
        <tr><td>&nbsp</td></tr>
   <tr>
       <td>Product Image title</td>
       <td> <asp:TextBox ID="txt_imgtitle" runat="server" CssClass="form-control"></asp:TextBox></td>
       <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_imgtitle" ErrorMessage="please enter image Title"></asp:RequiredFieldValidator></td>
   </tr>
        <tr><td>&nbsp</td></tr>
      <tr>
          <td>Product price</td>
          <td> <asp:TextBox ID="txt_product_price" runat="server" CssClass="form-control"></asp:TextBox></td>
        <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txt_product_price" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"  Display="Dynamic" ></asp:RegularExpressionValidator>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_product_price" ErrorMessage="Please Enter Price"></asp:RequiredFieldValidator></td>
      </tr>
        <tr><td>&nbsp</td></tr>
       <tr>
           <td>product title</td>
           <td> <asp:TextBox ID="txt_producttitle" runat="server" CssClass="form-control"></asp:TextBox></td>
           <td> <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_product_price" ErrorMessage="Please Enter Product Title"></asp:RequiredFieldValidator></td>
          
        </tr>
        <tr><td>&nbsp</td></tr>

        </table> 

   <div style="margin-left:20px">
     Select type
    
             
            <telerik:RadComboBox ID="RadComboBox1" runat="server" CheckBoxes="true" EnableCheckAllItemsCheckBox="true"
                    Width="180px" Label=""   EmptyMessage="--Select producttype--" Value="-1" >
                    <Items>
                       
                     
                    </Items>
                </telerik:RadComboBox>
        <asp:RequiredFieldValidator ID="drodo" runat="server" ControlToValidate="RadComboBox1" InitialValue="-1" ErrorMessage="please select product type"></asp:RequiredFieldValidator>
       </div>
        <br /> 
    <br />
  

     <table style="margin-left:20px">
         <tr>
             <td>
            <asp:Button ID="btn_submit" class="btn btn-primary" runat="server" Text="Save"  OnClick="btn_submit_Click"/>
           </td>
           <td> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>  
               <td>
        
          
           <a href="product_details.aspx" runat="server" class="btn btn-primary" >Cancel</a>
              </td>
             </tr>
         </table>
                
          
</asp:Content>
