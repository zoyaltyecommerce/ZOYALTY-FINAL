using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ZOYALTY.Code;

namespace PragathiShopLinks.Admin
{
    public partial class coupon_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadcoupon();
                tele_coupon.DataBind();
                div_coupon.Visible = true;
                div_addcoupon.Visible = false;
            }
        }

        public void loadcoupon()
        {
            try
            {
                DataTable dt_coupon = new DataTable();
                COUPONS obj = new COUPONS();
                dt_coupon = BLL.SELECTCOUPON(obj);
                tele_coupon.DataSource = dt_coupon;
            }
            catch (Exception ex)
            {
 
            }
        }


        protected void tele_coupon_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            loadcoupon();
        }

        protected void lnk_delete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                COUPONS obj = new COUPONS();
                obj.COUPON_ID = id;
                bool status = BLL.DELETECOUPON(obj);
                if (status == true)
                {
                    loadcoupon();
                    tele_coupon.DataBind();
                    div_addcoupon.Visible = false;
                    div_coupon.Visible = true;
                    BLL.ShowMessage(this, "COUPON DELETED SUCCESSFULLY");

                }
                else
                {
                    BLL.ShowMessage(this, "CONTACT ADMINISTRATOR");
                }

            }
            catch (Exception EX)
            {
 
            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            try 
            {
                COUPONS obj = new COUPONS();
                obj.COUPON_NAME = BLL.ReplaceQuote(txt_name.Text);
                if (drp_discnt.SelectedItem.Text=="DISCOUNT")
                {
                    obj.COUPON_DISCOUNT = Convert.ToInt32(BLL.ReplaceQuote(txt_amount.Text));
                }
                else if (drp_discnt.SelectedItem.Text == "PRICE")
                {
                    obj.COUPON_PRICE = Convert.ToDecimal(BLL.ReplaceQuote(txt_amount.Text));
                }
                else
                { }
                

                    bool status = BLL.INSERTCOUPON(obj);
                    if (status == true)
                    {
                        loadcoupon();
                        tele_coupon.DataBind();
                        div_coupon.Visible = true;
                        div_addcoupon.Visible = false;
                        clearcontrols();
                        BLL.ShowMessage(this, "COUPON ADDED SUCCESSFULLY");
                    }

                    else
                    {
                        BLL.ShowMessage(this, "CONTACT ADMINISTRATOR");
                    }
                
            }
               catch(Exception ex)
                {
                }

            
        }

        protected void lnk_addcoupon_Click(object sender, EventArgs e)
        {
            try
            {
                txt_name.Text = "";
                txt_amount.Text = "";
                div_coupon.Visible = false;
                div_addcoupon.Visible = true;
            }
            catch (Exception ex)
            {
 
            }
           
        }

        public void clearcontrols()
        {
            txt_name.Text = "";
            txt_amount.Text = "";
            drp_discnt.ClearSelection();
          
          
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            clearcontrols();
        }
    }
}