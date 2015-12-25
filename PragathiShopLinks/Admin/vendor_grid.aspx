<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="vendor_grid.aspx.cs" Inherits="PragathiShopLinks.Admin.vendor_grid" EnableEventValidation="false" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
    <div class="col-md-12">
        <asp:HiddenField ID="hid_operation" runat="server" />
        <asp:HiddenField ID="hid_vendorid" runat="server" />
     <style>
        .rgDataDiv
{
height:auto !important;
}</style>

   
        <h2  style="color:blue">VENDOR DETAILS</h2>
        <div id="div1" runat="server">
                         <table align="center">
                <tr>
                    <td>
                        
                        <asp:LinkButton class="btn btn-primary" runat="server" ID="lnk_add" Text="Add New Vendor" OnClick="lnk_add_Click" ></asp:LinkButton></td>
                    
                </tr>
            </table>
     <telerik:RadGrid ID="rgvendors" runat="server" AllowFilteringByColumn="True" FilterMenu-EnableTextHTMLEncoding="false"
                    AllowPaging="True" PageSize="10" AutoGenerateColumns="False" GridLines="None" HeaderStyle-HorizontalAlign="Left"
                     Skin="Sunset"  OnNeedDataSource="rgvendors_NeedDataSource"
                    AllowSorting="true" GroupingSettings-CaseSensitive="false" Width="100%">

              <ClientSettings> 
          <Scrolling AllowScroll="True" ScrollHeight="550" SaveScrollPosition="True"></Scrolling> 
           </ClientSettings>
         



                    <MasterTableView Width="100%" TableLayout="Auto">
                        <Columns>
                             <telerik:GridBoundColumn DataField="VENDOR_NAME" HeaderText="Name" AutoPostBackOnFilter="true"
                                UniqueName="VENDOR_NAME">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="VENDOR_EMAIL" HeaderText="Email" AutoPostBackOnFilter="true"
                                UniqueName="VENDOR_EMAIL">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="VENDOR_PASSWORD" HeaderText="password" AutoPostBackOnFilter="true"
                                UniqueName="VENDOR_PASSWORD">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="VENDOR_CITY" HeaderText="city" AutoPostBackOnFilter="true"
                                UniqueName="VENDOR_CITY">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="VENDOR_LOCATION" HeaderText="Location" AutoPostBackOnFilter="true"
                                UniqueName="VENDOR_LOCATION">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="VENDOR_PHONE" HeaderText="Phoneno" AutoPostBackOnFilter="true"
                                UniqueName="VENDOR_PHONE">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="VENDOR_ACCOUNTHOLDERNAME" HeaderText="Account Holder name" AutoPostBackOnFilter="true"
                                UniqueName="VENDOR_ACCOUNTHOLDERNAME">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="VENDOR_ACCOUNTNUMBER" HeaderText="ACCOUNTNUMBER" AutoPostBackOnFilter="true"
                                UniqueName="VENDOR_ACCOUNTNUMBER">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="VENDOR_BANKNAME" HeaderText="Bankname" AutoPostBackOnFilter="true"
                                UniqueName="VENDOR_BANKNAME">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="VENDOR_BRANCH" HeaderText="Branch" AutoPostBackOnFilter="true"
                                UniqueName="VENDOR_BRANCH">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="BANK_CITY" HeaderText="Bank_city" AutoPostBackOnFilter="true"
                                UniqueName="BANK_CITY">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="VENDOR_ACCOUNTTYPE" HeaderText="ACCOUNTTYPE" AutoPostBackOnFilter="true"
                                UniqueName="VENDOR_ACCOUNTTYPE">
                            </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="VENDOR_IFSCODE" HeaderText="IFSC CODE" AutoPostBackOnFilter="true"
                                UniqueName="VENDOR_IFSCODE">
                            </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="STATUS_NAME" HeaderText="STATUS" AutoPostBackOnFilter="true"
                                UniqueName="STATUS_NAME">
                            </telerik:GridBoundColumn>

                          <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coledit">
                              <ItemTemplate>
                                  <asp:LinkButton ID="lnk_edit"  runat="server"  CommandArgument='<%#Eval("VENDOR_ID") %>'
                                        OnCommand="lnk_edit_Command" Text="Edit"></asp:LinkButton>
                              </ItemTemplate>

                          </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coldelete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_delete" runat="server" CommandArgument='<%#Eval("VENDOR_ID") %>'
                                         OnCommand="lnk_delete_Command"  Text="Delete" OnClientClick="return confirm('Are you sure, you want to delete record?');"></asp:LinkButton>
                                </ItemTemplate>

                            </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
         </telerik:RadGrid>

        </div>
        <div id="div_update" runat="server">
             <table>
                 <tr>
                     <td>Name:</td>
                     <td><asp:TextBox ID="txt_name" runat="server" class="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>EMAIL</td>
                     <td><asp:TextBox ID="txt_email" runat="server" class="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Password</td>
                     <td><asp:TextBox ID="txt_password" runat="server" class="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Phone No</td>
                     <td><asp:TextBox ID="txt_phone" runat="server" class="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>City:</td>
                     <td><asp:TextBox ID="txt_city" runat="server" class="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Location:</td>
                     <td><asp:TextBox ID="txt_location" runat="server" class="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Accountholdername:</td>
                     <td><asp:TextBox ID="txt_acnthldename" runat="server" class="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Accountnumber:</td>
                     <td><asp:TextBox ID="txt_acctnumbr" runat="server" class="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Bank:</td>
                     <td><asp:TextBox ID="txt_bank" runat="server" class="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Branch:</td>
                     <td><asp:TextBox ID="txt_branch" runat="server" class="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>IFS Code:</td>
                     <td><asp:TextBox ID="txt_ifsc" runat="server" class="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Status:</td>
                     <td><asp:TextBox ID="txt_status" runat="server" class="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Bank_city:</td>
                     <td><asp:TextBox ID="Txt_bankcity" runat="server" class="form-control"></asp:TextBox></td>
                 </tr>
                 
             </table>
            <br />
            <br />
            <table style="margin-left:150px">
                <tr>
                    <td>
                        <asp:Button ID="btn_update" runat="server" class="btn btn-primary" Text="Update" OnClick="btn_Click" />
                    </td>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                    <td>
                        <asp:Button ID="btn_cancel" runat="server"  class="btn btn-primary" Text="cancel" OnClick="btn_cancel_Click" />
                    </td>
                </tr>
            </table>
        </div>
        </div>
        </div>


</asp:Content>
