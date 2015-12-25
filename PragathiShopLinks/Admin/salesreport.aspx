<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_admin.Master" AutoEventWireup="true" CodeBehind="salesreport.aspx.cs" Inherits="PragathiShopLinks.Admin.salesreport"  EnableEventValidation="false" ValidateRequest="false" %>
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
            margin:7px 0px;
        }
        .fromd{float:none !important;} 
        sbut{
                background: gr;
    background: #1ab394;
    colro: #fff;
    color: #fff;
    border: none;
    padding: 6px 24px;
    font-weight: bold;
    margin: 0px 14px;
}
        }
    </style>
     <h2  style="color:blue">SALES REPORTS</h2>
     <div id="date" >
        
            <label>From date</label>
           <asp:TextBox ID="txt_startdate" class="fromd" style="line-height:25px;float:right;" runat="server" Text='<%# Bind("DateofBirth", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
            <label>To date</label>  
         <asp:TextBox ID="txt_enddate" class="fromd" style="line-height:25px;float:right;" runat="server" Text='<%# Bind("DateofBirth", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
            <asp:Button ID="btn_search" class="btn btn-primary" runat="server" Text="search" OnClick="btn_search_Click" />&nbsp&nbsp&nbsp&nbsp

         <asp:Button ID="btn_clear" class="btn btn-primary" runat="server" Text="Clear" OnClick="btn_clear_Click" />
               </div>   
    <div id="cart_details" runat="server" >
                                         
        <telerik:RadGrid ID="tele_slaes" runat="server" AutoGenerateColumns="false" AllowFilteringByColumn="true" AllowSorting="true" AllowPaging="true" PageSize="10" 
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

        <span>Total Ammount:</span>
        <asp:Label ID="lbl_total" runat="server"></asp:Label>
    </div>

</asp:Content>
