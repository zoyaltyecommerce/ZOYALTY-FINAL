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
    public partial class myaccepeted_products : System.Web.UI.Page
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
                DataTable dt = (DataTable)Session["VENDORS"];

                dt_cart_view = BLL.GETCART_ACCEPET_SHOW(Int32.Parse(dt.Rows[0]["vendor_id"].ToString()));
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