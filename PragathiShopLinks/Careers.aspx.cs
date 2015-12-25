using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zoyal
{
    public partial class Careers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string delete_cartitemweb(int id)
        {

            DataTable dt_cart = (DataTable)HttpContext.Current.Session["CART"];


            string productid = id.ToString();

            DataRow[] result = dt_cart.Select("PRODUCT_ID = " + id + "");
            foreach (DataRow row in result)
            {
                if (row["PRODUCT_ID"].ToString().Equals("" + productid + ""))
                {
                    dt_cart.Rows.Remove(row);
                }
            }

            HttpContext.Current.Session["CART"] = dt_cart;
            object delamount = dt_cart.Compute("Sum(PRODUCT_SUB_TOTAL)", string.Empty);

            int count = dt_cart.Rows.Count;


            if (dt_cart.Rows.Count > 0)
            {
                HttpContext.Current.Session["CART"] = dt_cart;
            }
            else
            {
                HttpContext.Current.Session["CART"] = null;

            }

            // return count.ToString();
            return delamount.ToString() + "," + count.ToString();



        }
    }
}