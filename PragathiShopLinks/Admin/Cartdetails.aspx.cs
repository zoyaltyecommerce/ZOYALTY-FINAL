using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZOYALTY.Code;
using System.Data;
using Telerik.Web.UI;


namespace PragathiShopLinks.Admin
{
    public partial class Cartdetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
                load_cart_view();
               tele_cat.DataBind();
                cart_details.Visible = true;
               
               
            }

        }

        internal void load_cart_view()
        {
            DataTable dt_cart_view = new DataTable();
            try
            {
                DataTable dt = (DataTable)Session["VENDORS"];
             
                    dt_cart_view = BLL.GETCART_DETAILS(Int32.Parse(dt.Rows[0]["vendor_id"].ToString()));
                    tele_cat.DataSource = dt_cart_view;
              
              

                
            }
            catch(Exception ex)
            {

            }
            
        }
        protected void tele_cat_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            load_cart_view();
        }
        
        protected void lnkAccept_Command(object sender, CommandEventArgs e)
        {
            try
            {

                DataTable DT = (DataTable)Session["VENDORS"];
            
                MAINCART obj = new MAINCART();
                obj.MAINCART_ACCEPETEDBY = Convert.ToInt32(DT.Rows[0]["VENDOR_ID"]);
            
               int id = Convert.ToInt32(e.CommandArgument.ToString());
                
                
            DataTable dt = BLL.VENDOR_ACCEPET(id,obj);
            load_cart_view();
            tele_cat.DataBind();
           
            
            }
            catch (Exception ex)
            {

            }
        }

        protected void lnkDecline_Command(object sender, CommandEventArgs e)
        {
            try
            {
                DataTable DT = (DataTable)Session["VENDORS"];
               // MAINCART obj = new MAINCART();
                DECLINEDPRODUCTSBYUSER obj = new DECLINEDPRODUCTSBYUSER();
                
                obj.D_VENDORID = Convert.ToInt32(DT.Rows[0]["VENDOR_ID"]);
                int id = Convert.ToInt32(e.CommandArgument.ToString());


                DataTable dt = BLL.VENDOR_DECLINE(id, obj);
                load_cart_view();
                tele_cat.DataBind();
            }
            catch (Exception ex)
            {

            }

        }

      
    }
}