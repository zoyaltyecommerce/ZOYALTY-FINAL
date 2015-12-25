using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZOYALTY.Code;
using Telerik.Web.UI;
using System.Data;

namespace PragathiShopLinks.Admin
{
    public partial class admin_shopingcart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
               // DataTable dt = (DataTable)Session["ADMINLOGIN"];

                //  dt_cart_view = BLL.GETCART_DETAILS(Int32.Parse(dt.Rows[0]["user_id"].ToString()));
                // tele_cat.DataSource = dt_cart_view;
                dt_cart_view = BLL.GET_CART_RESULT_SHOW_ADMIN();
                tele_cat.DataSource = dt_cart_view;


            }
            catch (Exception ex)
            {

            }
        }

        protected void tele_cat_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            load_cart_view();
        }
    }
}