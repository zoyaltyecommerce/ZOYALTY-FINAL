using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZOYALTY.Code;

namespace PragathiShopLinks.Admin
{
    public partial class salesreportbyvendor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                load_cart_view();
                tele_sales.DataBind();
            }
           
        }

        internal void load_cart_view()
        {
            DataTable dt_cart_view = new DataTable();
            try
            {
                DataTable dt = (DataTable)Session["VENDORS"];

                dt_cart_view = BLL.GETCART_ACCEPET_SHOW(Int32.Parse(dt.Rows[0]["vendor_id"].ToString())); 

object total_price = dt_cart_view.Compute("Sum(maincart_totalprice)", string.Empty).ToString();
                tele_sales.DataSource = dt_cart_view;



            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_clear_Click(object sender, EventArgs e)
        {
            try
            {
                load_cart_view();
                tele_sales.DataBind();
            }
            catch(Exception ex)
            {

            }
           
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            try
            {
                string startdate;
                string enddate;
                DataTable dt = (DataTable)Session["VENDORS"];
                startdate = BLL.ReplaceQuote(txt_startdate.Text);
                enddate = BLL.ReplaceQuote(txt_enddate.Text);

                int vendorid = Convert.ToInt32(dt.Rows[0]["vendor_id"].ToString());
                DataTable dt_date = BLL.GETVENDORSSALES(startdate, enddate, vendorid);
                object total_price = dt_date.Compute("Sum(maincart_totalprice)", string.Empty).ToString();
                tele_sales.DataSource = dt_date;
                tele_sales.DataBind();
            }
            catch(Exception ex)
            {

            }

           
        }

        protected void tele_slaes_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            load_cart_view();
        }
    }
}