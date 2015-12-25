<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="coupon_details.aspx.cs" Inherits="PragathiShopLinks.Admin.coupon_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hid_value" runat="server" />
    <h2  style="color:blue">COUPON DETAILS</h2>

    <div id="div_coupon" runat="server">

         <table  style="margin-left:400px">
            <tr>
                <td> <asp:LinkButton  ID="lnk_addcoupon" runat="server" Text="ADD COUPON"  OnClick="lnk_addcoupon_Click" CssClass="btn btn-primary"></asp:LinkButton></td>
            </tr>
        </table>


         <telerik:RadGrid  ID="tele_coupon" runat="server" AllowFilteringByColumn="True" FilterMenu-EnableTextHTMLEncoding="false"
                    AllowPaging="True" AutoGenerateColumns="False" GridLines="None" HeaderStyle-HorizontalAlign="Left"
                    PageSize="10" Skin="Sunset"  OnNeedDataSource="tele_coupon_NeedDataSource"
                    AllowSorting="true" GroupingSettings-CaseSensitive="false" Width="100%">

             <MasterTableView Width="100%" TableLayout="Auto">
                        <Columns>
                             <telerik:GridBoundColumn DataField="COUPON_ID" HeaderText="COUPON_ID" AutoPostBackOnFilter="true"
                                UniqueName="COUPON_ID">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="COUPON_NAME" HeaderText="COUPON_NAME" AutoPostBackOnFilter="true"
                                UniqueName="COUPON_NAME">
                            </telerik:GridBoundColumn>


                             <telerik:GridBoundColumn DataField="COUPON_DISCOUNT" HeaderText="COUPON_DISCOUNT" AutoPostBackOnFilter="true"
                                UniqueName="COUPON_DISCOUNT">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="COUPON_PRICE" HeaderText="COUPON_PRICE" AutoPostBackOnFilter="true"
                                UniqueName="COUPON_PRICE">
                            </telerik:GridBoundColumn>


                             <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coldelete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_delete" runat="server" CommandArgument='<%#Eval("COUPON_ID") %>'
                                         OnCommand="lnk_delete_Command"  Text="Delete" OnClientClick="return confirm('Are you sure, you want to delete record?');"></asp:LinkButton>
                                </ItemTemplate>
                                   </telerik:GridTemplateColumn>

                            </Columns>
                 </MasterTableView>
             </telerik:RadGrid>
    </div>

    <div id="div_addcoupon" runat="server">

        <table>
            <tr>
                <td>COUPON NAME:</td>
                <td><asp:TextBox ID="txt_name" runat="server"  CssClass="form-control"></asp:TextBox></td>
                 <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Only characters" ControlToValidate="txt_name" ValidationExpression="[a-zA-Z]*$"></asp:RegularExpressionValidator> </td>
            </tr>
            <tr>
                <td>&nbsp</td>
                <td> <asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="txt_name" errormessage="Please enter coupon name!" /></td>
            </tr>
            <tr><td>&nbsp</td></tr>
            <tr>
                <td>DISCOUNT TYPE:</td>
                <td><asp:DropDownList ID="drp_discnt" runat="server" AutoPostBack="true" Height="30PX" Width="200PX">
                    <asp:ListItem Text="SELECT COUPON TYPE" Value="0"></asp:ListItem>
                    <asp:ListItem Text="DISCOUNT" Value="1"></asp:ListItem>
                    <asp:ListItem  Text="PRICE" Value="2"></asp:ListItem>
                    </asp:DropDownList></td>
           </tr>
            <tr><td>&nbsp</td></tr>
            <tr>
                <td>ENTER VALUE:</td>
                <td><asp:TextBox ID="txt_amount" runat="server" CssClass="form-control"></asp:TextBox></td>
               
            </tr>
            <tr><td>&nbsp</td><td> <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txt_amount" runat="server" ErrorMessage="Only Numbers allowed" ValidationExpression="\d+"></asp:RegularExpressionValidator></td></tr>
            <tr><td>&nbsp</td><td><asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txt_amount" errormessage="Please enter amount" /></td></tr>
        </table>
         
        <table style="margin-left:150px">
            <tr>
                <td><asp:Button ID="btn_add" runat="server" Text="ADD" OnClick="btn_add_Click"  CssClass="btn btn-primary" /></td>
            <td>&nbsp</td>
             <td>&nbsp</td>
            <td><asp:Button  ID="btn_cancel" runat="server" Text="Cancel" OnClick="btn_cancel_Click"  CssClass="btn btn-primary"/></td>
           </tr>
        </table>

       

    </div>


</asp:Content>
