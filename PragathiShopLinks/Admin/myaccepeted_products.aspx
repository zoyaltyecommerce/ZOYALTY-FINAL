<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="myaccepeted_products.aspx.cs" Inherits="PragathiShopLinks.Admin.myaccepeted_products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <style>
        .rgDataDiv
{
height:auto !important;
}</style>
     <h2  style="color:blue">ACCEPTED PRODUCT DETAILS</h2>
    <div id="cart_details" runat="server" >
       
        <telerik:RadGrid ID="tele_cat" runat="server" AutoGenerateColumns="false" AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true" PageSize="10" 
            OnNeedDataSource="tele_cat_NeedDataSource" Height="800px" Skin="Sunset" HeaderStyle-HorizontalAlign="Left" GroupingSettings-CaseSensitive="false"  FilterMenu-EnableTextHTMLEncoding="false" Width="100%">
           <ClientSettings>
               <Scrolling  AllowScroll="true" SaveScrollPosition="true" />
           </ClientSettings>
             <MasterTableView Width="100%">
                
                <Columns >
                        <telerik:GridBoundColumn DataField="MAINCART_ID" HeaderText="ORDER_ID" UniqueName="MAINCART_ID"></telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="ADD_FIRSTNAME" HeaderText="Customer_Name" UniqueName="ADD_FIRSTNAME"></telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="PRODUCT_NAME" HeaderText="Products" UniqueName="PRODUCT_NAME"></telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="MAINCART_TOTALPRICE" HeaderText="Total_Amount" UniqueName="MAINCART_TOTALPRICE"></telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="ADD_ADDRESS"  HeaderText="Address" UniqueName="ADD_ADDRESS"></telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="MAINCART_STARTDATE"  HeaderText="Start date" UniqueName="MAINCART_STARTDATE"></telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="MAINCART_ENDDATE"  HeaderText="End date" UniqueName="MAINCART_ENDDATE"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="MAINCART_STARTTIME"  HeaderText="Start time" UniqueName="MAINCART_STARTTIME"></telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="MAINCART_ENDTIME"  HeaderText="Endtime" UniqueName="MAINCART_ENDTIME"></telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="ADD_PRIMARYPHONE"  HeaderText="Phone" UniqueName="ADD_PRIMARYPHONE"></telerik:GridBoundColumn>
                      <telerik:GridBoundColumn DataField="STATUS"  HeaderText="STATUS" UniqueName="STATUS"></telerik:GridBoundColumn>

              
                </Columns>

            </MasterTableView>

        </telerik:RadGrid>


    </div>
</asp:Content>
