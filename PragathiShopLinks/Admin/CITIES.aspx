<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="CITIES.aspx.cs" Inherits="PragathiShopLinks.Admin.city" EnableEventValidation="false" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:HiddenField ID="hidden_operation" runat="server" />
    <asp:HiddenField ID="hidden_value" runat="server" />

     <asp:HiddenField ID="Hidden_loc_operatin" runat="server" />
    <asp:HiddenField ID="Hidd_loc_value" runat="server" />
    <h2  style="color:blue">CITIES AND LOCATION</h2>

    <div id="div_city" runat="server">
      <table  style="margin-left:400px">
          <tr>
              <td>  <asp:LinkButton ID="lnk_city" runat="server" Text="ADD CITY" OnClick="lnk_city_Click" CssClass="btn btn-primary"></asp:LinkButton></td>
          </tr>

      </table>
      
         <telerik:RadGrid ID="tele_city" runat="server" AllowFilteringByColumn="True" FilterMenu-EnableTextHTMLEncoding="false"
                    AllowPaging="True" AutoGenerateColumns="False" GridLines="None" HeaderStyle-HorizontalAlign="Left"
                    PageSize="10" Skin="Sunset"  OnNeedDataSource="tele_city_NeedDataSource"
                    AllowSorting="true" GroupingSettings-CaseSensitive="false" Width="100%">

             <MasterTableView Width="100%" TableLayout="Auto">
                        <Columns>
                             <telerik:GridBoundColumn DataField="city_id" HeaderText="city_id" AutoPostBackOnFilter="true"
                                UniqueName="city_id">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="city_name" HeaderText="city_name" AutoPostBackOnFilter="true"
                                UniqueName="city_name">
                            </telerik:GridBoundColumn>


                               <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coledit">
                              <ItemTemplate>
                                  <asp:LinkButton ID="lnk_edit"  runat="server"  CommandArgument='<%#Eval("city_id") %>'
                                        OnCommand="lnk_edit_Command" Text="Edit"></asp:LinkButton>
                              </ItemTemplate>

                          </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coldelete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_delete" runat="server" CommandArgument='<%#Eval("city_id") %>'
                                         OnCommand="lnk_delete_Command"  Text="Delete" OnClientClick="return confirm('Are you sure, you want to delete record?');"></asp:LinkButton>
                                </ItemTemplate>

                            </telerik:GridTemplateColumn>


                             <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coldelete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_asign" runat="server" CommandArgument='<%#Eval("city_id") %>'
                                         OnCommand="lnk_asign_Command"  Text="Assign Location"></asp:LinkButton>
                                </ItemTemplate>

                            </telerik:GridTemplateColumn>
                            </Columns>
                 </MasterTableView>
             </telerik:RadGrid>
    </div>

    <div id="div_location" runat="server">
        <table  style="margin-left:400px">
            <tr>
                <td> <asp:LinkButton ID="lnk_addloctin" runat="server" Text="ADD LOCATION" OnClick="lnk_addloctin_Click" CssClass="btn btn-primary"></asp:LinkButton></td>
            </tr>
        </table>

         <telerik:RadGrid ID="tele_location" runat="server" AllowFilteringByColumn="True" FilterMenu-EnableTextHTMLEncoding="false"
                    AllowPaging="True" AutoGenerateColumns="False" GridLines="None" HeaderStyle-HorizontalAlign="Left"
                    PageSize="10" Skin="Sunset"  OnNeedDataSource="tele_location_NeedDataSource"
                    AllowSorting="true" GroupingSettings-CaseSensitive="false" Width="100%">

              <MasterTableView Width="100%" TableLayout="Auto">
                        <Columns>
                             <telerik:GridBoundColumn DataField="LOCATION_ID" HeaderText="LOCATION_ID" AutoPostBackOnFilter="true"
                                UniqueName="LOCATION_ID">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="LOCATION_NAME" HeaderText="LOCATION_NAME" AutoPostBackOnFilter="true"
                                UniqueName="LOCATION_NAME">
                            </telerik:GridBoundColumn>


                               <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coledit">
                              <ItemTemplate>
                                  <asp:LinkButton ID="lnk_locatnedit"  runat="server"  CommandArgument='<%#Eval("location_id") %>'
                                        OnCommand="lnk_locatnedit_Command1" Text="Edit"></asp:LinkButton>
                              </ItemTemplate>

                          </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coldelete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_locatndelete" runat="server" CommandArgument='<%#Eval("location_id") %>'
                                         OnCommand="lnk_locatndelete_Command" Text="Delete" OnClientClick="return confirm('Are you sure, you want to delete record?');"></asp:LinkButton>
                                </ItemTemplate>

                            </telerik:GridTemplateColumn>
                            </Columns>
                  </MasterTableView>
             </telerik:RadGrid>
        
        
    </div>

    <div id="div_addcity" runat="server">

        <table>
            <tr>
                <td>ADD CITY</td>
                <td><asp:TextBox ID="txt_city" runat="server"  CssClass="form-control"></asp:TextBox></td>
                 <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Only characters" ControlToValidate="txt_city" ValidationExpression="[a-zA-Z]*$"></asp:RegularExpressionValidator> </td>
            </tr>
        </table>
        <table><tr><td>&nbsp</td></tr></table>
        <table style="margin-left:80px">
            <tr>
                <td><asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click"  CssClass="btn btn-primary"/></td>
            </tr>
        </table>
        
    </div>
    <div id="div_addlocaton" runat="server">
        <table>
            <tr>
                <td>ADD Location:</td>
                <td><asp:TextBox ID="txt_location" runat="server"  CssClass="form-control"></asp:TextBox></td>
                 <td><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter Only characters" ControlToValidate="txt_location" ValidationExpression="[a-zA-Z]*$"></asp:RegularExpressionValidator> </td>
            </tr>

        </table>
        <table><tr><td>&nbsp</td></tr></table>
        <table style="margin-left:100px">
            <tr>
                <td><asp:Button ID="btn_savelocation" runat="server" Text="Save" OnClick="btn_savelocation_Click1"  CssClass="btn btn-primary"/></td>
            </tr>
        </table>

      

    </div>

</asp:Content>
