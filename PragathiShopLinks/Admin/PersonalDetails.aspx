<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="PersonalDetails.aspx.cs" Inherits="PragathiShopLinks.Admin.PersonalDetails" EnableEventValidation="false" ValidateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
    <div class="col-md-12">
        <asp:HiddenField ID="hid_operation" runat="server" />
        <asp:HiddenField ID="hid_vendorid" runat="server" />
          <h2  style="color:blue">MY DETAILS</h2>
        <div id="div1" runat="server">
     <telerik:RadGrid ID="VENDOR" runat="server" AllowFilteringByColumn="True" FilterMenu-EnableTextHTMLEncoding="false"
                    AllowPaging="True" AutoGenerateColumns="False" GridLines="None" HeaderStyle-HorizontalAlign="Left"
                    PageSize="10" Skin="Sunset" OnNeedDataSource="VENDOR_NeedDataSource"
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
                                  <asp:LinkButton ID="lnk_edit"  runat="server" CommandArgument='<%#Eval("VENDOR_ID") %>' OnCommand="lnk_edit_Command"
                                         Text="Edit"></asp:LinkButton>
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
                     <td><asp:TextBox ID="txt_name" runat="server" CssClass="form-control"></asp:TextBox></td>
                 </tr>
                   <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>EMAIL</td>
                     <td><asp:TextBox ID="txt_email" runat="server" CssClass="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Password</td>
                     <td><asp:TextBox ID="txt_password" runat="server" CssClass="form-control" ></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Phone</td>
                     <td><asp:TextBox ID="txt_phone" runat="server" CssClass="form-control" ></asp:TextBox></td>
                 </tr>
                   <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>City:</td>
                     <td><asp:TextBox ID="txt_city" runat="server" CssClass="form-control"></asp:TextBox></td>
                 </tr>
                  <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Location:</td>
                     <td><asp:TextBox ID="txt_location" runat="server" CssClass="form-control"></asp:TextBox></td>
                 </tr>
                   <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Account HolderName:</td>
                     <td><asp:TextBox ID="txt_acnthldename" runat="server" CssClass="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr> 
                  <tr>
                     <td>AccountNumber:</td>
                     <td><asp:TextBox ID="txt_acctnumbr" runat="server" CssClass="form-control" ></asp:TextBox></td>
                 </tr>
                  <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Bank:</td>
                     <td><asp:TextBox ID="txt_bank" runat="server"  CssClass="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                  <tr>
                     <td>Branch:</td>
                     <td><asp:TextBox ID="txt_branch" runat="server" CssClass="form-control"></asp:TextBox></td>
                 </tr>
                  <tr><td>&nbsp</td></tr> 
                  <tr>
                     <td>IFSC CODE:</td>
                     <td><asp:TextBox ID="txt_ifsc" runat="server" CssClass="form-control"></asp:TextBox></td>
                 </tr>
                   <tr><td>&nbsp</td></tr> 
                  <tr>
                     <td>Status:</td>
                     <td><asp:TextBox ID="txt_status" runat="server" CssClass="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr> 
                  <tr>
                     <td>Bank_city:</td>
                     <td><asp:TextBox ID="Txt_bankcity" runat="server" CssClass="form-control"></asp:TextBox></td>
                 </tr>
                 <tr><td>&nbsp</td></tr>
                 
             </table>
            <table style="margin-left:50px">
                <tr>
                    <td>
                        <asp:Button ID="btn_update" class="btn btn-primary" runat="server" Text="Update" OnClick="btn_update_Click" />
                    </td>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                      <td>
                        <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Cancel" OnClick="Button1_Click" />
                    </td>
                   
                </tr>
            </table>
        </div>
        </div>
        </div>

</asp:Content>
