using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZOYALTY.Code;

namespace PragathiShopLinks.Admin
{
    public partial class vendor_registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cities da = new cities();
           drop_city.DataSource = BLL.GETCITIES(da);

            drop_city.DataTextField = "city_name";
            drop_city.DataValueField = "city_id";
            drop_city.DataBind();

        }

        protected void txtv_save_Click(object sender, EventArgs e)
        {
            try
            {

           
            vendors obj = new vendors();
            obj.VENDOR_NAME = txtv_name.Value;
            obj.VENDOR_EMAIL = txtv_email.Value;
            obj.VENDOR_PHONE = txtv_phone.Value;
            obj.VENDOR_ALTERPHONE = txtv_altrphno.Value;
            obj.VENDOR_PASSWORD = txtv_password.Value;
            obj.VENDOR_CONFORMPASSWORD = txtv_retypass.Value;
            obj.VENDOR_ACCOUNTHOLDERNAME = txtv_accntholdername.Value;
            obj.VENDOR_ACCOUNTNUMBER = txtv_acntno.Value;
            obj.VENDOR_BANKNAME = txtv_bank.Value;
            obj.VENDOR_BRANCH = txtv_branch.Value;
            obj.VENDOR_ACCOUNTTYPE = select.Value;
            obj.VENDOR_IFSCODE = txtv_ifsc.Value;
            obj.VENDOR_PANCARDNUMBER = txtv_pan.Value;
            obj.VENDOR_IDENTIFICATIONNUMBER = txtv_idproof.Value;
                obj.VENDOR_CITY = drop_city.SelectedItem.Text;
            obj.VENDOR_STATE = txtv_state.Value;
            obj.VENDOR_PINCODE = txtv_pin.Value;
            obj.VENDOR_BUSINESSNAME = txtv_bisname.Value;
            obj.VENDOR_ADDRESS = txtv_addrs.Text;
            obj.VENDOR_LANDNUMBER = txtv_landno.Value;
            obj.VENDOR_LOCATION = txtv_vendorloc.Value;
            obj.BANK_CITY = txtv_city.Value;


            bool status = BLL.INSERT_VENDORS(obj);
            if (status == true)
            {
                    BLL.ShowMessage(this, "Vendor add Successfully");


                    Response.Redirect("vendor_grid.aspx");

                }
                
            else
            {
 
            }
             }
            catch(Exception ex)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("vendor.grid.aspx");
        }
    }
}