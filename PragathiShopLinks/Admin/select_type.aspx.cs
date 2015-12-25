using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZOYALTY.Code;
using System.Data;

namespace PragathiShopLinks.Admin
{
    public partial class select_type : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt_products = BLL.GET_ALLPRODUCTS();
                drp_product.DataSource = dt_products;
                drp_product.DataTextField = "PRODUCT_NAME";
                drp_product.DataValueField = "PRODUCT_ID";
                drp_product.DataBind();

                DataTable dt_types = BLL.GETTYPES();
                drp_type.DataSource = dt_types;
                drp_type.DataTextField = "TYPE_NAME";
                drp_type.DataValueField = "TYPE_ID";
                drp_type.DataBind();
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {
                PRODUCT_TYPE obj = new PRODUCT_TYPE();
                obj.PROD_ID = Convert.ToInt32( drp_product.SelectedItem.Value);
                obj.PRODUCT_TYPID = drp_type.SelectedItem.Value;
                bool STATUS = BLL.INSERT_PRODUCTTYPES(obj);

                if (STATUS == true)
                {
                    BLL.ShowMessage(this, "Add Product Type SuccessFully");
                }
                else
                {
 
                }
            }
            catch(Exception ex)
            {

            }
        }
    }
}