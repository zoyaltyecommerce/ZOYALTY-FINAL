<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="location.aspx.cs" Inherits="PragathiShopLinks.Admin.location" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="color:blue">SELECT LOCATION</h3>
    <table>

   <tr>
       <td>select city</td>
        <td>&nbsp</td>
       <td> <asp:DropDownList ID="drpdown1" runat="server" AutoPostBack="true"  Width="200px" Height="35px" ></asp:DropDownList ></td>
   </tr>
        <tr>
            <td>&nbsp</td>
        </tr>
    <tr>
        <td>
            select Location
        </td>
         <td>&nbsp</td>
        <td><asp:TextBox ID="txtlocation" runat="server" CssClass="form-control"></asp:TextBox></td>
        <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Only characters" ControlToValidate="txtlocation" ValidationExpression="[a-zA-Z]*$"></asp:RegularExpressionValidator> </td>
    </tr>
        <tr>
            <td>&nbsp</td>
        </tr>
        </table>
    <table style="margin-left:100px">
      <tr>
           <td>&nbsp</td>
          <td> <asp:Button ID="btnlocation" runat="server" value="save" Text="save.."  OnClick="btnlocation_Click"  CssClass="btn btn-primary" /></td>
      </tr>
           
    </table>
     
</asp:Content>
