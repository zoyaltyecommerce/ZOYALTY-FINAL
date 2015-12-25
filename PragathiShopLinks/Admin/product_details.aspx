<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="product_details.aspx.cs" Inherits="PragathiShopLinks.Admin.product_details" EnableEventValidation="false" ValidateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
    <div class="col-md-12">
        <asp:HiddenField ID="hid_operation" runat="server" />
        <asp:HiddenField ID="hid_vendorid" runat="server" />
         <asp:HiddenField ID="product_id" runat="server" />
       
        
         <div id="div1" runat="server">
              <h2  style="color:blue">PRODUCT DETAILS</h2>
              <table align="center">
                <tr>
                    <td>
                        
                        <asp:LinkButton class="btn btn-primary" runat="server" ID="LinkButton1" Text="Add Product" OnClick="LinkButton1_Click"></asp:LinkButton></td>
                    
                </tr>
            </table>
     <telerik:RadGrid ID="product_grid" runat="server" AllowFilteringByColumn="True" FilterMenu-EnableTextHTMLEncoding="false"
                    AllowPaging="True" AutoGenerateColumns="False" GridLines="None" HeaderStyle-HorizontalAlign="Left"
                    PageSize="10" Skin="Sunset"   OnNeedDataSource="product_grid_NeedDataSource"
                    AllowSorting="true" GroupingSettings-CaseSensitive="false" Width="100%">

              <ClientSettings> 
          <Scrolling AllowScroll="True" ScrollHeight="550" SaveScrollPosition="True"></Scrolling> 
           </ClientSettings>



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

                             <telerik:GridBoundColumn DataField="PRODUCT_TITLE" HeaderText="PRODUCT_TYPE" AutoPostBackOnFilter="true"
                                UniqueName="PRODUCT_TITLE">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="PRODUCT_PRICE" HeaderText="PRODUCT_PRICE" AutoPostBackOnFilter="true"
                                UniqueName="PRODUCT_PRICE">
                            </telerik:GridBoundColumn>
                             <telerik:GridBoundColumn DataField="PRODUCT_CITYID" HeaderText="PRODUCT_CITYID" AutoPostBackOnFilter="true"
                                UniqueName="PRODUCT_CITYID">
                            </telerik:GridBoundColumn>
                            


                          <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="colTYPE">
                              <ItemTemplate>
                                  <asp:LinkButton ID="TYPES"  runat="server"  CommandArgument='<%#Eval("PRODUCT_ID") %>'
                                        OnCommand="TYPES_Command"  Text="TYPES"></asp:LinkButton>
                              </ItemTemplate>

                          </telerik:GridTemplateColumn>
                            
                          <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="colTPE">
                              <ItemTemplate>
                                  <asp:LinkButton ID="update"  runat="server"  CommandArgument='<%#Eval("PRODUCT_ID") %>'
                                      OnCommand="update_Command"     Text="Edit"></asp:LinkButton>
                              </ItemTemplate>

                          </telerik:GridTemplateColumn>


                           

                            <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="coldelete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_delete" runat="server" CommandArgument='<%#Eval("PRODUCT_ID") %>'
                                         OnCommand="lnk_delete_Command"  Text="Delete" OnClientClick="return confirm('Are you sure, you want to delete record?');"></asp:LinkButton>
                                </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
         </telerik:RadGrid>

        </div>
       <div id="div_grid" runat="server" style="margin-top:10px">

          
              <table align="center">
                <tr>
                    <td>
                        
                        <asp:LinkButton class="btn btn-primary" runat="server" ID="lnk_add" Text="Add ProductTypes" OnClick="lnk_add_Click"></asp:LinkButton></td>
                    
                </tr>
            </table>

                <telerik:RadGrid ID="rgvendors" runat="server" AllowFilteringByColumn="True" FilterMenu-EnableTextHTMLEncoding="false"
                    AllowPaging="True" AutoGenerateColumns="False" GridLines="None" HeaderStyle-HorizontalAlign="Left"
                     OnNeedDataSource="rgvendors_NeedDataSource" PageSize="10" Skin="Sunset"
                    AllowSorting="true" GroupingSettings-CaseSensitive="false" Width="100%">
                    <MasterTableView Width="100%">
                        <Columns>


                            <telerik:GridBoundColumn DataField="PRODUCTTYPE_ID" HeaderText="ID" AutoPostBackOnFilter="true"
                                UniqueName="PRODUCTTYPE_ID">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PRODUCTNAME" HeaderText="PRODUCT NAME" AutoPostBackOnFilter="true"
                                UniqueName="PRODUCTNAME">
                            </telerik:GridBoundColumn>

                            <telerik:GridBoundColumn DataField="PRODUCT_TYPE" HeaderText="PRODUCT_TYPID" AutoPostBackOnFilter="true"
                                UniqueName="PRODUCT_TYPE">
                            </telerik:GridBoundColumn>

                            
                        <%--  <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="colTYPE">
                              <ItemTemplate>
                                  <asp:LinkButton ID="Add"  runat="server" CommandArgument='<%#Eval("PRODUCT_ID") %>'
                                      OnCommand="Add_Command"
                                         Text="Add"></asp:LinkButton>
                              </ItemTemplate>--%>

                        <%--  </telerik:GridTemplateColumn>--%>
                            
                          <telerik:GridTemplateColumn AllowFiltering="false" UniqueName="colTPE">
                              <ItemTemplate>
                                  <asp:LinkButton ID="delete"  runat="server" CommandArgument='<%#Eval("PRODUCTTYPE_ID") %>'
                                       OnCommand="delete_Command"  Text="delete"></asp:LinkButton>
                              </ItemTemplate>

                          </telerik:GridTemplateColumn>
                            

                        </Columns>
                    </MasterTableView>
                    <PagerStyle AlwaysVisible="True" />
                </telerik:RadGrid>
           <br />
           <a href="product_details.aspx" id="back" runat="server">Back ProductDetails</a>
            </div>

        <div id="update" runat="server">
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
                     <td>PRODUCT_PRICE</td>
                     <td><asp:TextBox ID="txt_PRICE" runat="server"  CssClass="form-control"></asp:TextBox></td>
                 </tr>
                   <tr> <td>&nbsp</td></tr>
                  <tr>
                     <td>PRODUCT_TITLE:</td>
                     <td><asp:TextBox ID="txt_TITLE" runat="server"  CssClass="form-control"></asp:TextBox></td>
                 </tr>
                   <tr> <td>&nbsp</td></tr>
                   <tr>
                     <td> CITY:</td>
                      <td><asp:TextBox ID="TXT_CITY" runat="server"  CssClass="form-control"></asp:TextBox></td>
                    
                 </tr>
                     <tr> <td>&nbsp</td></tr>
                 
             </table>
            <table style="margin-left:150px">
                <tr>
                    <td>
                        <asp:Button ID="btn_update"   class="btn btn-primary" runat="server" Text="Update" OnClick="btn_update_Click" />
                    </td>
                     <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td> 
                    <td>
                        <asp:Button ID="btn_cancel"  class="btn btn-primary" runat="server" Text="cancel"  OnClick="btn_cancel_Click" />
                    </td>
                </tr>
            </table>
        </div>
     <div id="add_types" runat="server">
         <h3 style="color:blue">Product Add Types</h3>
         <table>

             <tr>
                 <td>product_id</td>
                 <td><asp:TextBox ID="pro_id" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox></td>
             </tr>
             <tr><td>&nbsp</td></tr>
             <tr>
                 <td></td>
             </tr>
             
             <tr>
                 <td>
                     Select ProductType
                 </td>
                 <td><asp:DropDownList ID="drp_types" runat="server" AutoPostBack="true" Width="250px" Height="30px"></asp:DropDownList></td>
             </tr>
              <tr><td>&nbsp</td></tr>
                 <table style="margin-left:100px">
                  <tr>
                 <td><asp:Button ID="btn_insert" class="btn btn-primary"  runat="server" Text="Save" OnClick="btn_insert_Click" /></td>
                      <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                      <td><a href="product_details.aspx" id="cancel" runat="server" class="btn btn-primary">Cancel</a></td>
                      
                      
                      
             </tr>
               </table>
            
         </table>


         <br />
         <br />
         

           <%--  <h3 style="color:blue">Add Types</h3>
             <table>
                 <tr>
                     <td> Types</td>
                     <td>&nbsp</td>
                     <td><asp:TextBox ID="txt_type" runat="server" CssClass="form-control"></asp:TextBox> </td>
                 </tr>
             </table>
             <table style="margin-left:100px">
                  <tr>
                 <td><asp:Button ID="Button1" class="btn btn-primary"  runat="server" Text="Save" OnClick="Button1_Click1"/></td>
                      <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                      <td><a href="product_details.aspx" id="A1" runat="server" class="btn btn-primary">Cancel</a></td>
                      
                      
                      
             </tr>
               </table>
             
            --%>

        



     </div>

   </div>
        </div>


       


     





</asp:Content>
