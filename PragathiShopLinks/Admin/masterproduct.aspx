<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="masterproduct.aspx.cs" Inherits="PragathiShopLinks.Admin.masterproduct" EnableEventValidation="false" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hid1" runat="server" />
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:HiddenField ID="HiddenField2" runat="server" />
    <asp:HiddenField ID="HiddenField3" runat="server" />
    <asp:HiddenField ID="HiddenField4" runat="server" />
    <asp:HiddenField ID="HiddenField5" runat="server" />
    <asp:HiddenField ID="HiddenField6" runat="server" />
    <asp:HiddenField ID="HiddenField7" runat="server" />
    <asp:HiddenField ID="HiddenField8" runat="server" />
    <asp:HiddenField ID="HiddenField9" runat="server" />
    <asp:HiddenField ID="HiddenField10" runat="server" />
    <asp:HiddenField ID="product_typid" runat="server" />
    <asp:HiddenField ID="HiddenField11" runat="server" />
    <asp:HiddenField ID="product_subtype" runat="server" />
    <asp:HiddenField ID="cityid" runat="server" />
    <asp:HiddenField ID="IMAGE" runat="server" />
    <asp:HiddenField ID="MASTERID" runat="server" />


  

    <div id="div_masterprdct" runat="server">


         <telerik:RadGrid  ID="tele_masterprdct" runat="server" AllowFilteringByColumn="True" FilterMenu-EnableTextHTMLEncoding="false"
                    AllowPaging="True" AutoGenerateColumns="False" GridLines="None" HeaderStyle-HorizontalAlign="Left"
                    PageSize="10" Skin="Sunset"  OnNeedDataSource="tele_masterprdc_NeedDataSource"
                    AllowSorting="true" GroupingSettings-CaseSensitive="false" Width="100%">

             <MasterTableView Width="100%" TableLayout="Auto">
                        <Columns>
                             <telerik:GridBoundColumn DataField="MPRODUCT_ID" HeaderText="MPRODUCT_ID" AutoPostBackOnFilter="true"
                                UniqueName="MPRODUCT_ID">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="MPRODUCT_NAME" HeaderText="MPRODUCT_NAME" AutoPostBackOnFilter="true"
                                UniqueName="MPRODUCT_NAME">
                            </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="MPRODUCT_DESC" HeaderText="MPRODUCT_DESC" AutoPostBackOnFilter="true"
                                UniqueName="MPRODUCT_DESC">
                            </telerik:GridBoundColumn>

                              <telerik:GridBoundColumn DataField="MPRODUCT_IMAGETITLE" HeaderText="MPRODUCT_IMAGETITLE" AutoPostBackOnFilter="true"
                                UniqueName="MPRODUCT_IMAGETITLE">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="MPRODUCT_CITYID" HeaderText="MPRODUCT_CITYID" AutoPostBackOnFilter="true"
                                UniqueName="MPRODUCT_CITYID">
                            </telerik:GridBoundColumn>


                            <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="colassign">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_addtolive" runat="server"  CommandArgument='<%#Eval("MPRODUCT_ID") %>'
                                         OnCommand="lnk_addtolive_Command" Text="ADD TO LIVE" ></asp:LinkButton>
                                </ItemTemplate>

                                 </telerik:GridTemplateColumn>


                              <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coledit">
                              <ItemTemplate>
                                  <asp:LinkButton ID="lnk_masteredit"  runat="server"  CommandArgument='<%#Eval("MPRODUCT_ID") %>'
                                        OnCommand="lnk_masteredit_Command" Text="Edit"></asp:LinkButton>
                              </ItemTemplate>

                          </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coldelete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_masterdelete" runat="server" CommandArgument='<%#Eval("MPRODUCT_ID") %>'
                                         OnCommand="lnk_masterdelete_Command" Text="Delete" OnClientClick="return confirm('Are you sure, you want to delete record?');"></asp:LinkButton>
                                </ItemTemplate>
                                </telerik:GridTemplateColumn>





                            </Columns>
                 </MasterTableView>
             </telerik:RadGrid>
    </div>


    <div id="div_product" runat="server">

        <table  style="margin-left:400px">
          <tr>
              <td>  <asp:LinkButton ID="lnk_types" runat="server" Text="ADD TYPE" OnClick ="lnk_types_Click"   CssClass ="btn btn-primary"></asp:LinkButton></td>
          </tr>

      </table>



        <telerik:RadGrid  ID="tele_product" runat="server" AllowFilteringByColumn="True" FilterMenu-EnableTextHTMLEncoding="false"
                    AllowPaging="True" AutoGenerateColumns="False" GridLines="None" HeaderStyle-HorizontalAlign="Left"
                    PageSize="10" Skin="Sunset"  OnNeedDataSource="tele_product_NeedDataSource"
                    AllowSorting="true" GroupingSettings-CaseSensitive="false" Width="100%">

            <MasterTableView Width="100%" TableLayout="Auto">

                      
                        
                        <Columns>
                             <telerik:GridBoundColumn DataField="PRODUCT_ID" HeaderText="PRODUCT_ID" AutoPostBackOnFilter="true"
                                UniqueName="PRODUCT_ID">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="PRODUCT_NAME" HeaderText="PRODUCT_NAME" AutoPostBackOnFilter="true"
                                UniqueName="PRODUCT_NAME">
                            </telerik:GridBoundColumn>



                             <telerik:GridBoundColumn DataField="PRODUCT_DESC" HeaderText="BRAND_NAME" AutoPostBackOnFilter="true"
                                UniqueName="PRODUCT_DESC">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="PRODUCT_TYPEID" HeaderText="PRODUCT_TYPEID" AutoPostBackOnFilter="true"
                                UniqueName="PRODUCT_TYPEID">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="PRODUCT_SUBTYPEID" HeaderText="PRODUCT_SUBTYPEID" AutoPostBackOnFilter="true"
                                UniqueName="PRODUCT_SUBTYPEID">
                            </telerik:GridBoundColumn>

                             <telerik:GridBoundColumn DataField="PRODUCT_PRICE" HeaderText="PRODUCT_PRICE" AutoPostBackOnFilter="true"
                                UniqueName="PRODUCT_PRICE">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="PRODUCT_CITYID" HeaderText="PRODUCT_CITYID" AutoPostBackOnFilter="true"
                                UniqueName="PRODUCT_CITYID">
                            </telerik:GridBoundColumn>
                            

                                      <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coledit">
                              <ItemTemplate>
                                  <asp:LinkButton ID="lnk_productedit"  runat="server"  CommandArgument='<%#Eval("PRODUCT_ID") %>'
                                        OnCommand="lnk_productedit_Command" Text="Edit"></asp:LinkButton>
                              </ItemTemplate>

                          </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coldelete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_product_delete" runat="server" CommandArgument='<%#Eval("PRODUCT_ID") %>'
                                         OnCommand="lnk_product_delete_Command"   Text="Delete" OnClientClick="return confirm('Are you sure, you want to delete record?');"></asp:LinkButton>
                                </ItemTemplate>
                                </telerik:GridTemplateColumn>              

                          </Columns>
                </MasterTableView>
            </telerik:RadGrid>
    </div>







    <div id="div_addtypes" runat="server">

         <table>
            <tr>
                <td>ADD TYPE:</td>
                <td><asp:DropDownList ID="drp_types" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drp_types_SelectedIndexChanged" Height="30px" Width="250px"  AppendDataBoundItems="true">
                    <asp:ListItem Text="---SELECT TYPE---" Value="0"></asp:ListItem>
                    </asp:DropDownList></td>
                 
            </tr>
             <tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td></tr>

             <tr>
                <td>ADD SUB TYPE:</td>
                <td><asp:DropDownList ID="drp_subtypes" runat="server" AutoPostBack="true" Height="30px" Width="250px" >
                    <asp:ListItem Text="---SELECT SUB TYPE---" Value="0"></asp:ListItem>
                    </asp:DropDownList></td>
                 
            </tr>
               <tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td></tr>
              <tr>
            <td>ENTER PRICE:</td>
         <td>
            <asp:TextBox ID="txt_price" runat="server" CssClass="form-control"></asp:TextBox>
        </td>

                   <td>
                      <asp:RequiredFieldValidator ID="price" runat="server" ControlToValidate="txt_price" ErrorMessage="please enter price" ForeColor="Red"></asp:RequiredFieldValidator>
                  </td>
            </tr>
               <tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td></tr>

        </table>
        <table style="margin-left:120px">
        <tr>
            <td><asp:Button ID="btn_submit" runat="server" Text="SUBMIT" OnClick="btn_submit_Click"  CssClass="btn btn-primary"/></td>
            <td>&nbsp</td>
             <td>&nbsp</td>
             <td>&nbsp</td>
            <td><a href="masterproduct.aspx" runat="server" class="btn btn-primary" >Cancel</a></td>
        </tr>
    </table>

    </div>


    <div id="div_update" runat="server">

         <table>
            <tr>
                <td>ADD TYPE:</td>
                <td><asp:DropDownList ID="drp_updatetype" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drp_updatetype_SelectedIndexChanged" Height="30px" Width="250px"  AppendDataBoundItems="true">
                    <asp:ListItem Text="---SELECT TYPE---" Value="0"></asp:ListItem>
                    </asp:DropDownList></td>
                 
            </tr>
              <tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td></tr>

             <tr>
                <td>ADD SUB TYPE:</td>
                <td><asp:DropDownList ID="drp_updatesubtype" runat="server" AutoPostBack="true" Height="30px" Width="250px">
                    <asp:ListItem Text="---SELECT SUB TYPE---" Value="0"></asp:ListItem>
                    </asp:DropDownList></td>
                 
            </tr>
              <tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td></tr>
              <tr>
            <td>ENTER PRICE:</td>
         <td>
            <asp:TextBox ID="txt_updateprice" runat="server" CssClass="form-control"></asp:TextBox>
        </td>
                 
            </tr>
              <tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td></tr>

        </table>
        <table style="margin-left:120px">
        <tr>
            <td><asp:Button ID="btn_update" runat="server" Text="UPDATE" OnClick="btn_update_Click"  CssClass="btn btn-primary"/></td>
            <td>&nbsp</td>
             <td>&nbsp</td>
             <td>&nbsp</td>
            <td><a href="masterproduct.aspx" runat="server" class="btn btn-primary" >Cancel</a></td>
        </tr>
    </table>


    </div>

    <div id="div_updatemaster" runat="server">

        
              <table>
                 <tr>
                     <td>PRODUCT_NAME:</td>
                     <td><asp:TextBox ID="txt_name" runat="server" CssClass="form-control"></asp:TextBox></td>
                 </tr>
                  <tr> <td>&nbsp</td></tr>
                  <tr>
                     <td>PRODUCT_DESC</td>
                     <td><asp:TextBox ID="txt_DESC" runat="server" CssClass="form-control"></asp:TextBox></td>
                 </tr>
                   <tr> <td>&nbsp</td></tr>
                  <tr>
                     <td>PRODUCT_IMAGETITLE</td>
                     <td><asp:TextBox ID="txt_IMAGETITL" runat="server"  CssClass="form-control"></asp:TextBox></td>
                 </tr>
                   <tr> <td>&nbsp</td></tr>
                  <tr>
                     <td>UPLOAD IMAGE</td>
                     <td><asp:FileUpload ID="FILE1" runat="server" Width="100px"/> </td>
                 </tr>
                   <tr> <td>&nbsp</td></tr>
                  <tr>
                     <td>PRODUCT_CITY</td>
                     <td><asp:DropDownList ID="drp_city" runat="server" AutoPostBack="true" >
                         <asp:ListItem Text="----SELECT CITY----" Value="0"></asp:ListItem>
                         </asp:DropDownList></td>
                 </tr>
                   <tr> <td>&nbsp</td></tr>
                  <tr>
                     <td>PRODUCT_TITLE:</td>
                     <td><asp:TextBox ID="txt_TITLE" runat="server"  CssClass="form-control"></asp:TextBox></td>
                 </tr>
                   <tr> <td>&nbsp</td></tr>
                
                     <tr> <td>&nbsp</td></tr>
                 
             </table>
            <table style="margin-left:150px">
                <tr>
                    <td>
                        <asp:Button ID="UPDATEMASTER_PRODUCT"   class="btn btn-primary" runat="server" Text="Update" OnClick="UPDATEMASTER_PRODUCT_Click"  />
                    </td>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td> 
                   
                </tr>
            </table>
       



    </div>



</asp:Content>
