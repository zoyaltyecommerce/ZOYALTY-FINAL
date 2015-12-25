<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="salesreportbyvendor.aspx.cs" Inherits="PragathiShopLinks.Admin.salesreportbyvendor" EnableEventValidation="false" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <style>
        .rgDataDiv
{
height:auto !important;
}</style>
    <style>
        #date{
            float:none;
        }
    </style>
    <h2  style="color:blue">SALES REPORT DETAILS</h2>
     <div id="date" >
        
         <asp:TextBox ID="txt_enddate" style="line-height:25px;float:right;" runat="server" Text='<%# Bind("DateofBirth", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
           <asp:TextBox ID="txt_startdate" style="line-height:25px;float:right;" runat="server" Text='<%# Bind("DateofBirth", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
            <asp:Button ID="btn_search" runat="server" Text="search" OnClick="btn_search_Click" />

         <asp:Button ID="btn_clear" runat="server" Text="Clear" OnClick="btn_clear_Click" />
               </div>   
    <div id="cart_details" runat="server" >
                                         
        <telerik:RadGrid ID="tele_sales" runat="server" AutoGenerateColumns="false" AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true" PageSize="10" 
            OnNeedDataSource="tele_slaes_NeedDataSource" Height="800px" Skin="Sunset" HeaderStyle-HorizontalAlign="Left" GroupingSettings-CaseSensitive="false"  FilterMenu-EnableTextHTMLEncoding="false" Width="100%">
           <ClientSettings>
               <Scrolling  AllowScroll="true" SaveScrollPosition="true" />
           </ClientSettings>
             <MasterTableView Width="100%">
             
                <Columns>
                        <telerik:GridBoundColumn DataField="MAINCART_ID" HeaderText="Order_id" UniqueName="MAINCART_ID"></telerik:GridBoundColumn>
                  
                      <telerik:GridBoundColumn DataField="PRODUCT_NAME" HeaderText="Products" UniqueName="PRODUCT_NAME"></telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="MAINCART_TOTALPRICE" HeaderText="Total_Amount" UniqueName="MAINCART_TOTALPRICE"></telerik:GridBoundColumn>

                </Columns>
            
                   
            </MasterTableView>
            
        </telerik:RadGrid>


    </div>


</asp:Content>
