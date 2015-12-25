<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="select_type.aspx.cs" Inherits="PragathiShopLinks.Admin.select_type" EnableEventValidation="false" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>SELECT TYPE</h3>
    <table>
        <tr>
        <td>Select Product Name</td>
        <td><asp:DropDownList ID="drp_product" runat="server" AutoPostBack="true" Width="250px" Height="30px"></asp:DropDownList></td>
            </tr>
        <tr><td>&nbsp</td></tr>
         <tr><td>&nbsp</td></tr>
        <tr>
            <td>Select type</td>
            <td><asp:DropDownList ID="drp_type" runat="server" AutoPostBack="true" Width="250px" Height="30px"></asp:DropDownList></td>
        </tr>
         <tr><td>&nbsp</td></tr>
        <table style="margin-left:200px">
        <tr>
            <td><asp:Button ID="btn_save"  class="btn btn-primary" runat="server" Text="Save" OnClick="btn_save_Click" /></td>

        </tr>
            </table>
    </table>
</asp:Content>
