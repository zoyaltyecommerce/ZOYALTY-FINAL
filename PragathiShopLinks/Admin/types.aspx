<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="types.aspx.cs" Inherits="PragathiShopLinks.Admin.types" EnableEventValidation="false" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hid_operation" runat="server" />
    <asp:HiddenField ID="hid_value" runat="server" />

     <asp:HiddenField ID="Hidd_SUBTYPE_OPRTN" runat="server" />
    <asp:HiddenField ID="Hidd_subtype_value" runat="server" />

    <h3 style="color:blue"> Product Types</h3>

    <div id="div_types" runat="server">

        <table  style="margin-left:400px">
          <tr>
              <td>  <asp:LinkButton ID="lnk_type" runat="server" Text="ADD TYPE" OnClick="lnk_type_Click" CssClass="btn btn-primary"></asp:LinkButton></td>
          </tr>

      </table>


        <telerik:RadGrid  ID="tele_types" runat="server" AllowFilteringByColumn="True" FilterMenu-EnableTextHTMLEncoding="false"
                    AllowPaging="True" AutoGenerateColumns="False" GridLines="None" HeaderStyle-HorizontalAlign="Left"
                    PageSize="10" Skin="Sunset"  OnNeedDataSource="tele_types_NeedDataSource"
                    AllowSorting="true" GroupingSettings-CaseSensitive="false" Width="100%">

             <MasterTableView Width="100%" TableLayout="Auto">
                        <Columns>
                             <telerik:GridBoundColumn DataField="TYPE_ID" HeaderText="TYPE_ID" AutoPostBackOnFilter="true"
                                UniqueName="TYPE_ID">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="TYPE_NAME" HeaderText="TYPE_NAME" AutoPostBackOnFilter="true"
                                UniqueName="TYPE_NAME">
                            </telerik:GridBoundColumn>

                            <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coledit">
                              <ItemTemplate>
                                  <asp:LinkButton ID="lnk_edit"  runat="server"  CommandArgument='<%#Eval("TYPE_ID") %>'
                                        OnCommand="lnk_edit_Command" Text="Edit"></asp:LinkButton>
                              </ItemTemplate>

                          </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coldelete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_delete" runat="server" CommandArgument='<%#Eval("TYPE_ID") %>'
                                         OnCommand="lnk_delete_Command" Text="Delete" OnClientClick="return confirm('Are you sure, you want to delete record?');"></asp:LinkButton>
                                </ItemTemplate>
                                </telerik:GridTemplateColumn>

                                <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="colassign">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_assignsubtype" runat="server" CommandArgument='<%#Eval("TYPE_ID") %>'
                                         OnCommand="lnk_assignsubtype_Command" Text="Assign subtype" ></asp:LinkButton>
                                </ItemTemplate>

                                 </telerik:GridTemplateColumn>
                            </Columns>
                 </MasterTableView> 

        </telerik:RadGrid>
    </div>


     <div id="div_subtypes" runat="server">
          <table  style="margin-left:400px">
          <tr>
              <td>  <asp:LinkButton ID="lnk_suntype" runat="server" Text="ADD SUBTYPE" OnClick="lnk_suntype_Click" CssClass="btn btn-primary"></asp:LinkButton></td>
          </tr>

      </table>

         <telerik:RadGrid  ID="tele_subtypes" runat="server" AllowFilteringByColumn="True" FilterMenu-EnableTextHTMLEncoding="false"
                    AllowPaging="True" AutoGenerateColumns="False" GridLines="None" HeaderStyle-HorizontalAlign="Left"
                    PageSize="10" Skin="Sunset"  OnNeedDataSource="tele_subtypes_NeedDataSource"
                    AllowSorting="true" GroupingSettings-CaseSensitive="false" Width="100%">

              <MasterTableView Width="100%" TableLayout="Auto">
                        <Columns>
                             <telerik:GridBoundColumn DataField="TYPE_ID" HeaderText="TYPE_ID" AutoPostBackOnFilter="true"
                                UniqueName="TYPE_ID">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="TYPE_MAINTYPEID" HeaderText="TYPE_MAINTYPEID" AutoPostBackOnFilter="true"
                                UniqueName="TYPE_MAINTYPEID">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="TYPE_NAME" HeaderText="TYPE_NAME" AutoPostBackOnFilter="true"
                                UniqueName="TYPE_NAME">
                            </telerik:GridBoundColumn>


                             <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coledit">
                              <ItemTemplate>
                                  <asp:LinkButton ID="lnk_editsubtype"  runat="server"  CommandArgument='<%#Eval("TYPE_ID") %>'
                                        OnCommand="lnk_editsubtype_Command" Text="Edit"></asp:LinkButton>
                              </ItemTemplate>

                          </telerik:GridTemplateColumn>
                             <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coledit">
                              <ItemTemplate>
                                  <asp:LinkButton ID="lnk_dete"  runat="server" CommandArgument='<%#Eval("TYPE_ID") %>' 
                                     OnCommand="lnk_dete_Command"
                                       Text="delete"></asp:LinkButton>
                              </ItemTemplate>

                          </telerik:GridTemplateColumn>

                  

                            </Columns>
                  </MasterTableView>
             </telerik:RadGrid>

    </div>



    <div id="div_addtype" runat="server">

    <table>
        <tr>
            <td>ADD TYPE NAME:</td>
        <td>
            <asp:TextBox ID="txt_typename" runat="server" CssClass="form-control"></asp:TextBox>
        </td>
            </tr>
        <tr>
            <td>&nbsp</td>
            <td><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Only characters" ControlToValidate="txt_typename" ValidationExpression="[a-zA-Z]*$"></asp:RegularExpressionValidator> </td>
        </tr>
        <tr>
            <td>&nbsp</td>
            <td><asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txt_typename" errormessage="Please enter Type Name" /></td>
        </tr>
    </table>
    <table style="margin-left:120px">
        <tr>
            <td><asp:Button ID="btn_add" runat="server" Text="ADD" OnClick="btn_add_Click"  CssClass="btn btn-primary"/></td>
            <td>&nbsp</td>
             <td>&nbsp</td>
             <td>&nbsp</td>
            <td><a href="types.aspx" runat="server" class="btn btn-primary" >Cancel</a></td>
        </tr>
    </table>
    </div>

    <div id="div_addsubtype" runat="server">

        <table>

            
        <tr>
            <td>ADD SUB_TYPE NAME:</td>
        <td>
            <asp:TextBox ID="txt_subtype" runat="server" CssClass="form-control"></asp:TextBox>
        </td>
            </tr>
        
        <tr>
            <td>&nbsp</td>
            <td><asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txt_subtype" errormessage="Please enter Type Name" /></td>
        </tr>
    </table>
         <table style="margin-left:80px">
            <tr>
                <td><asp:Button ID="btn_save" runat="server" Text="Save" OnClick="btn_save_Click" CssClass="btn btn-primary"/></td>
                 <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                <td><a href="types.aspx" class="btn btn-primary" runat="server">Cancel</a></td>
            </tr>
        </table>


    </div>


</asp:Content>
