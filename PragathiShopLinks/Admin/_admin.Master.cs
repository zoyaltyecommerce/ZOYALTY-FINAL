using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZOYALTY.Code;
using System.Data;

namespace Zoyal.Admin
{
    public partial class _admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["VENDORS"] == null && Session["ADMINLOGIN"] ==null)
                {
                    BLL.ShowMessage(this, "Session has been expired");
                    Response.Redirect("vendor_login.aspx");
                }
                hide_menu();
            }
        }
        public void hide_menu()
        {
            try
            {
                if (Session["ADMINLOGIN"] != null)
                {
                    DataTable dt_admin = (DataTable)Session["ADMINLOGIN"];
                    string adminname = dt_admin.Rows[0]["USER_NAME"].ToString();
                    li_vendor.Visible = true;
                    li_users.Visible = true;
                    li_sales_admin.Visible = true;
                    li_pro_details.Visible = true;
                    li_shopping.Visible = false;
                    li_my_acc_pro.Visible = false;
                    li_sal_vendor.Visible = false;
                    li_my_pro.Visible = false;
                    li_pro_details.Visible = true;
                    li_CITY.Visible = true;
                    li_coupon.Visible = true;
                    li_types.Visible = true;
                 
                    login_name.InnerHtml = adminname;

                }
                else if (Session["vendors"] != null)
                {
                    DataTable dt_vendors = (DataTable)Session["vendors"];
                    string vendorname = dt_vendors.Rows[0]["VENDOR_NAME"].ToString();
                    li_my_acc_pro.Visible = true;
                    li_my_pro.Visible = true;
                    li_sal_vendor.Visible = true;
                    li_vendor.Visible = false;
                    li_users.Visible = false;
                    li_sales_admin.Visible = false;
                    li_shopping.Visible = true;
                    li_shop_peding.Visible = false;
                    li_pro_details.Visible = false;
                    li_CITY.Visible = false;
                    li_coupon.Visible =false;
                    li_types.Visible = false;
                    

                    login_name.InnerHtml = vendorname;
                }
            }
            catch(Exception ex)
            {

            }
           

         
        }

       

        protected void link_logout_Click1(object sender, EventArgs e)
        {
            if (Session["ADMINLOGIN"] != null)
            {
                Session["ADMINLOGIN"] = null;
                Response.Redirect("login.aspx");

            }
            else if (Session["vendors"] != null)
            {
                Session["vendors"] = null;
                Response.Redirect("vendor_login.aspx");
            }

        }
    }
}