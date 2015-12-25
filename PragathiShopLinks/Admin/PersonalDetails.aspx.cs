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
    public partial class PersonalDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load();
            div1.Visible = true;
            div_update.Visible = false;
          
        }
     
        public void load()
        {
            try
            {
                DataTable dt = (DataTable)Session["VENDORS"];

                hid_vendorid.Value = dt.Rows[0]["vendor_id"].ToString();
                DataTable DT_VENDORS = BLL.vendorsbyid(Convert.ToInt32(hid_vendorid.Value));
                VENDOR.DataSource = DT_VENDORS;
                VENDOR.DataBind();
            }
            catch(Exception ex)
            {

            }
           

            
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            bool status = false;
            try
            {
                vendors obj = new vendors();
                obj.VENDOR_NAME = BLL.ReplaceQuote(txt_name.Text);
                obj.VENDOR_EMAIL = BLL.ReplaceQuote(txt_email.Text);
                obj.VENDOR_PASSWORD = BLL.ReplaceQuote(txt_password.Text);
                obj.VENDOR_PHONE = BLL.ReplaceQuote(txt_phone.Text);
                obj.VENDOR_CITY = BLL.ReplaceQuote(txt_city.Text);
                obj.VENDOR_LOCATION = BLL.ReplaceQuote(txt_location.Text);
                obj.VENDOR_ACCOUNTNUMBER = BLL.ReplaceQuote(txt_acctnumbr.Text);
                obj.VENDOR_ACCOUNTHOLDERNAME = BLL.ReplaceQuote(txt_acnthldename.Text);
                obj.VENDOR_BANKNAME = BLL.ReplaceQuote(txt_bank.Text);
                obj.VENDOR_BRANCH = BLL.ReplaceQuote(txt_branch.Text);
                obj.VENDOR_IFSCODE = BLL.ReplaceQuote(txt_ifsc.Text);
                obj.BANK_CITY = BLL.ReplaceQuote(Txt_bankcity.Text);
                obj.VENDOR_STATUS = Convert.ToInt32(BLL.ReplaceQuote(txt_status.Text));
                if (hid_operation.Value == "update")
                {

                    obj.VENDOR_ID = Convert.ToInt32( hid_vendorid.Value);
                    status = BLL.updatevendor_details(obj);
                }
                if (status == true)
                {
                    BLL.ShowMessage(this, "vendor updated successfully");
                    load();
                    
                    
                }
                else
                {
                    BLL.ShowMessage(this, "contact administrator");
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void VENDOR_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void lnk_edit_Command(object sender, CommandEventArgs e)
        {
            try
            {
                hid_operation.Value = "update";
                hid_vendorid.Value = e.CommandArgument.ToString();
                btn_update.Text = "update";
                int id = Convert.ToInt32(e.CommandArgument);
                DataTable dt_vendors = BLL.GETVENDOR_DETAILSBYID(id);
                txt_name.Text = dt_vendors.Rows[0]["VENDOR_NAME"].ToString();
                txt_email.Text = dt_vendors.Rows[0]["VENDOR_EMAIL"].ToString();
                txt_password.Text = dt_vendors.Rows[0]["VENDOR_PASSWORD"].ToString();
                txt_phone.Text = dt_vendors.Rows[0]["VENDOR_PHONE"].ToString();
                txt_acnthldename.Text = dt_vendors.Rows[0]["VENDOR_ACCOUNTHOLDERNAME"].ToString();
                txt_acctnumbr.Text = dt_vendors.Rows[0]["VENDOR_ACCOUNTNUMBER"].ToString();
                txt_bank.Text = dt_vendors.Rows[0]["VENDOR_BANKNAME"].ToString();
                txt_branch.Text = dt_vendors.Rows[0]["VENDOR_BRANCH"].ToString();
                txt_city.Text = dt_vendors.Rows[0]["VENDOR_CITY"].ToString();
                txt_location.Text = dt_vendors.Rows[0]["VENDOR_LOCATION"].ToString();
                txt_ifsc.Text = dt_vendors.Rows[0]["VENDOR_IFSCODE"].ToString();
                Txt_bankcity.Text = dt_vendors.Rows[0]["BANK_CITY"].ToString();
                txt_status.Text = dt_vendors.Rows[0]["VENDOR_STATUS"].ToString();
                div_update.Visible = true;
                div1.Visible = false;
            }
            catch (Exception ex)
            {

            }
        }
    }
}