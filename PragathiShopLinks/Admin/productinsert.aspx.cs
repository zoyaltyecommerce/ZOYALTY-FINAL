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
    public partial class priceinsert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cities da = new cities();
                drp1.DataSource = BLL.GETCITIES(da);

                drp1.DataTextField = "city_name";
                drp1.DataValueField = "city_id";
                drp1.DataBind();

                DataTable dt_types = BLL.GETTYPES();
                RadComboBox1.DataSource = dt_types;
                RadComboBox1.DataTextField = "TYPE_NAME";
                RadComboBox1.DataValueField = "TYPE_ID";
                RadComboBox1.DataBind();


            } 
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {

            string path="";
            try
            {
                if (product_img.HasFile)
                {
                    string str = product_img.FileName;
                    // product_img.PostedFile.SaveAs(Server.MapPath(".") + "\\PRODUCT_IMGES\\" + str);
                    product_img.SaveAs(Server.MapPath(@"\PRODUCT_IMG\" + str));
                    path = "\\PRODUCT_IMG\\" + str.ToString();
                }
                //else 
                //{
                //    lbl.Text = "please upload your image";
                //}


                PRODUCT obj = new PRODUCT();
                obj.PRODUCT_NAME = txt_name.Text;
                obj.PRODUCT_DESC = txt_desc.Text;
                obj.PRODUCT_IMAGEURL = path.ToString();
                obj.PRODUCT_IMAGETITLE = txt_imgtitle.Text;
                obj.PRODUCT_PRICE = Convert.ToDecimal(txt_product_price.Text);
                obj.PRODUCT_TITLE = txt_producttitle.Text;
                obj.PRODUCT_CITYID = Convert.ToInt32(drp1.SelectedItem.Value);


                DataTable dt = BLL.INSERT_PRODUCT(obj);
                {
                    PRODUCT_TYPE OBJ = new PRODUCT_TYPE();

                    OBJ.PROD_ID = Convert.ToInt32(dt.Rows[0]["PRO_ID"].ToString());
                    // OBJ.PROD_ID = Convert.ToInt32(RadComboBox1.SelectedItem.Value)
                    if (RadComboBox1.Items.Count != 0)
                    {

                        for (int i = 0; i < RadComboBox1.Items.Count; i++)
                        {
                            if (RadComboBox1.Items[i].Checked == true)
                            {
                                OBJ.PRODUCT_TYPID = RadComboBox1.Items[i].Value;

                                bool STATUS = BLL.INSERT_PRODUCTTYPES(OBJ);
                            }
                        }
                    }
                    else
                    {

                    }





                    BLL.ShowMessage(this, "Product upload SuccessFully");
                    clear_controls();
                }

            }
            catch (Exception ee)
            {

            }
       
        
        }
        public void clear_controls()
        {
            txt_name.Text = "";
            txt_producttitle.Text = "";
            txt_desc.Text = "";
            txt_imgtitle.Text = "";
            txt_product_price.Text = "";
            RadComboBox1.ClearCheckedItems();

        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("product_details.aspx");
        }
    }
   
}