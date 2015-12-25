using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZOYALTY.Code;
using Telerik.Web.UI;

namespace PragathiShopLinks.Admin
{
    public partial class salesreport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                load_cart_view();
                tele_slaes.DataBind();
                cart_details.Visible = true;
            }
        }

        internal void load_cart_view()
        {
            DataTable dt_cart_view = new DataTable();
            try
            {
                DataTable dt = (DataTable)Session["ADMINLOGIN"];
               
                dt_cart_view = BLL.GETSALES_REPORT(Int32.Parse(dt.Rows[0]["user_id"].ToString()));
                object total_price = dt_cart_view.Compute("Sum(maincart_totalprice)", string.Empty).ToString();
                lbl_total.Text = total_price.ToString();
                tele_slaes.DataSource = dt_cart_view;

            }
            catch (Exception ex)
            {

            }
        }
        protected void tele_slaes_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            load_cart_view();

        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            string startdate;
            string enddate;
           startdate= BLL.ReplaceQuote( txt_startdate.Text);
            enddate = BLL.ReplaceQuote(txt_enddate.Text);
            DataTable dt_date = BLL.GETDATEDIFF(startdate, enddate);
           object total_price= dt_date.Compute("Sum(maincart_totalprice)", string.Empty).ToString();
            lbl_total.Text = total_price.ToString();
            tele_slaes.DataSource = dt_date;
            tele_slaes.DataBind();
        }

        protected void btn_clear_Click(object sender, EventArgs e)
        {
            load_cart_view();
            tele_slaes.DataBind();
        }
    }
}