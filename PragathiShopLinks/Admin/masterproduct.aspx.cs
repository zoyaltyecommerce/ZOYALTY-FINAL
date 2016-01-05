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
    public partial class masterproduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadproduct();
                tele_masterprdct.DataBind();
                div_masterprdct.Visible = true;
                div_addtypes.Visible = false;
                div_update.Visible = false;
                div_product.Visible = false;
                div_updatemaster.Visible = false;
                
                DataTable dt_types = BLL.SELECTTYPES();
                drp_types.DataSource = dt_types;

                drp_types.DataTextField = "TYPE_NAME";
                drp_types.DataValueField = "TYPE_ID";
                drp_types.DataBind();


                drp_updatetype.DataSource = dt_types;
                drp_updatetype.DataTextField = "TYPE_NAME";
                drp_updatetype.DataValueField = "TYPE_ID";
                drp_updatetype.DataBind();

                cities obj=new cities();
                 drp_city.DataSource=BLL.GETCITIES(obj);
                 drp_city.DataTextField = "city_name";
                 drp_city.DataValueField = "city_id";
                 drp_city.DataBind();

            }
        }
        public void loadproduct()
        {
            try
            {
                DataTable dt_master = BLL.SELECT_MASTERPRODUCT();
                tele_masterprdct.DataSource = dt_master;


            }
            catch (Exception ex)
            {

            }
        }

        protected void tele_masterprdc_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            loadproduct();
        }

        protected void lnk_addtolive_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                HiddenField10.Value = id.ToString();






                div_product.Visible = true;
                div_masterprdct.Visible = false;
                div_addtypes.Visible = false;
                div_update.Visible = false;

                DataTable dt_product = BLL.GETPRODUCTBYMASTERID(id);
                tele_product.DataSource = dt_product;
                tele_product.DataBind();

            }
            catch (Exception ex)
            {

            }

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                PRODUCT obj = new PRODUCT();
                obj.PRODUCT_NAME = hid1.Value;
                obj.PRODUCT_DESC = HiddenField1.Value;
                obj.PRODUCT_IMAGEURL = HiddenField2.Value;
                obj.PRODUCT_IMAGETITLE = HiddenField3.Value;
                obj.PRODUCT_CITYID = Convert.ToInt32(HiddenField6.Value);


                obj.PRODUCT_MASTERTYPEID = Convert.ToInt32(HiddenField7.Value);

                obj.PRODUCT_TITLE = HiddenField5.Value;
                if (drp_subtypes.SelectedIndex.ToString() =="-1")
                {
                    obj.PRODUCT_SUBTYPEID = 0;
                   
                }
                else
                {
                    obj.PRODUCT_SUBTYPEID = Convert.ToInt32(drp_subtypes.SelectedItem.Value);
                }
                

               
                obj.PRODUCT_TYPEID = Convert.ToInt32(drp_types.SelectedItem.Value);
               
                obj.PRODUCT_PRICE = Convert.ToDecimal(txt_price.Text);


                bool status =false;
                int md = Convert.ToInt32(HiddenField10.Value);
                DataTable dt_product = BLL.GETPRODUCTBYMASTERID(md);
                for(int i=0;i<dt_product.Rows.Count;i++)
                {

                    if (dt_product.Rows[i]["PRODUCT_TYPEID"].ToString()== drp_types.SelectedItem.Value && dt_product.Rows[i]["PRODUCT_SUBTYPEID"].ToString()== drp_subtypes.SelectedItem.Value && dt_product.Rows[i]["PRODUCT_PRICE"].ToString()==obj.PRODUCT_PRICE.ToString())
                {
                    status = true;
                        break;
                }
                else
                {
                    status = false;
                   
                }
                
                
                
                }

                if(status==false)
                {
                    bool status1 = BLL.insertproduct(obj);
                    int id = Convert.ToInt32(HiddenField10.Value);

                    DataTable dt_product1 = BLL.GETPRODUCTBYMASTERID(id);
                    tele_product.DataSource = dt_product1;
                    tele_product.DataBind();
                    BLL.ShowMessage(this, "save product type and price successfully");
                    
                }
                else if(status==true)
                {
                    BLL.ShowMessage(this, "already exiting in the record");
                }



                div_addtypes.Visible = false;
                div_product.Visible = true;








            }
            catch (Exception ex)
            {

            }
        }

        protected void drp_types_SelectedIndexChanged(object sender, EventArgs e)
        {
            int type_id = Convert.ToInt32(drp_types.SelectedItem.Value);
            productsubtype obj = new productsubtype();
            obj.TYPE_MAINTYPEID = type_id;
            DataTable dt_subtype = BLL.GETSUBTYPESBYTYPEID(obj);
            drp_subtypes.DataSource = dt_subtype;
            drp_subtypes.DataTextField = "type_name";
            drp_subtypes.DataValueField = "type_id";
            drp_subtypes.DataBind();
        }

        protected void lnk_masteredit_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                MASTERID.Value = id.ToString();
                DataTable dt_master = BLL.select_mastreproductbyid(id);

                txt_name.Text = dt_master.Rows[0]["MPRODUCT_NAME"].ToString();
                txt_DESC.Text = dt_master.Rows[0]["MPRODUCT_DESC"].ToString();
                txt_IMAGETITL.Text = dt_master.Rows[0]["MPRODUCT_IMAGETITLE"].ToString();
                txt_TITLE.Text = dt_master.Rows[0]["MPRODUCT_TITLE"].ToString();
                cityid.Value = dt_master.Rows[0]["MPRODUCT_CITYID"].ToString();
                IMAGE.Value = dt_master.Rows[0]["MPRODUCT_IMAGEURL"].ToString();

                div_updatemaster.Visible = true;
                div_masterprdct.Visible = false;

            }
            catch (Exception EX)
            {

            }




        }

        protected void lnk_masterdelete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                bool status = BLL.DELETEMASTERPRODUCT(id);
                loadproduct();
                tele_masterprdct.DataBind();
                BLL.ShowMessage(this, "product deleted successfully");

            }
            catch (Exception ex)
            {

            }
        }

        protected void lnk_productedit_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            HiddenField11.Value = id.ToString();

            DataTable dt_product = BLL.SELECTPRODUCTBYID(id);

            txt_updateprice.Text = dt_product.Rows[0]["product_price"].ToString();
            product_typid.Value = dt_product.Rows[0]["product_typeid"].ToString();
            product_subtype.Value = dt_product.Rows[0]["product_subtypeid"].ToString();

            div_update.Visible = true;

            div_addtypes.Visible = false;
            div_product.Visible = false;

        }

        protected void lnk_product_delete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);

                bool status = BLL.DELETEPRODUCT(id);

                int mid = Convert.ToInt32(HiddenField10.Value);
                DataTable dt_product = BLL.GETPRODUCTBYMASTERID(mid);
                tele_product.DataSource = dt_product;
                tele_product.DataBind();
                BLL.ShowMessage(this, "PRODUCT DELETED SUCCESSFULLY");

            }
            catch (Exception EX)
            {
            }
        }

        protected void lnk_types_Click(object sender, EventArgs e)
        {

            div_addtypes.Visible = true;
            div_product.Visible = false;
            int id = Convert.ToInt32(HiddenField10.Value);
            
            DataTable dt_masterproduct = BLL.select_mastreproductbyid(id);
            //Session["product"] = dt_masterproduct.ToString();
            hid1.Value = dt_masterproduct.Rows[0]["MPRODUCT_NAME"].ToString();
            HiddenField1.Value = dt_masterproduct.Rows[0]["MPRODUCT_DESC"].ToString();
            HiddenField2.Value = dt_masterproduct.Rows[0]["MPRODUCT_IMAGEURL"].ToString();
            HiddenField3.Value = dt_masterproduct.Rows[0]["mPRODUCT_IMAGETITLE"].ToString();
            HiddenField4.Value = dt_masterproduct.Rows[0]["MPRODUCT_STATUS"].ToString();
            HiddenField5.Value = dt_masterproduct.Rows[0]["MPRODUCT_TITLE"].ToString();
            HiddenField6.Value = dt_masterproduct.Rows[0]["MPRODUCT_CITYID"].ToString();
            HiddenField7.Value = dt_masterproduct.Rows[0]["MPRODUCT_ID"].ToString();


        }

        protected void tele_product_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(HiddenField11.Value);

                PRODUCT obj = new PRODUCT();
                masterproduct BBB = new masterproduct();
                
                obj.PRODUCT_TYPEID = Convert.ToInt32(drp_updatetype.SelectedItem.Value);

                if (obj.PRODUCT_TYPEID == 0)
                {

                    obj.PRODUCT_TYPEID = Convert.ToInt32(product_typid.Value);
                }
                 
              
                if (obj.PRODUCT_SUBTYPEID == 0)
                {

                    obj.PRODUCT_SUBTYPEID = Convert.ToInt32(product_subtype.Value);
                }
                else if (product_subtype.Value == "-1")
                {
                    obj.PRODUCT_SUBTYPEID = 0;
                }
                else
                {
                    obj.PRODUCT_SUBTYPEID = Convert.ToInt32(drp_updatesubtype.SelectedItem.Value);
                }





                obj.PRODUCT_PRICE = Convert.ToDecimal(txt_updateprice.Text);

                bool status = BLL.UPDATEPRODUCTTYPES(obj, id);
                int mid = Convert.ToInt32(HiddenField10.Value);
                DataTable dt_product1 = BLL.GETPRODUCTBYMASTERID(mid);
                tele_product.DataSource = dt_product1;
                tele_product.DataBind();
                div_product.Visible = true;
                BLL.ShowMessage(this, "update successfully");
                div_update.Visible = false;
               
            


            }
            catch (Exception ex)
            {

            }

        }

        protected void drp_updatetype_SelectedIndexChanged(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(drp_updatetype.SelectedItem.Value);

            productsubtype obj = new productsubtype();
            obj.TYPE_MAINTYPEID = id;
            DataTable dt_subtype = BLL.GETSUBTYPESBYTYPEID(obj);

            drp_updatesubtype.DataSource = dt_subtype;
            drp_updatesubtype.DataTextField = "type_name";
            drp_updatesubtype.DataValueField = "type_id";
            drp_updatesubtype.DataBind();
        }
        
        protected void UPDATEMASTER_PRODUCT_Click(object sender, EventArgs e)
        {

         
            
            string path = "";
            bool status = false;
            try
            {
                if (FILE1.HasFile)
                {
                    string str = FILE1.FileName;
                    // product_img.PostedFile.SaveAs(Server.MapPath(".") + "\\PRODUCT_IMGES\\" + str);
                    FILE1.SaveAs(Server.MapPath(@"\PRODUCT_IMG\" + str));
                    path = "/PRODUCT_IMG/" + str.ToString();
                }
                else
                {
                }
                MASTERPRODUCT obj_mpro = new MASTERPRODUCT();
                PRODUCT obj_pro = new PRODUCT();
                obj_mpro.MPRODUCT_NAME = txt_name.Text;
                obj_pro.PRODUCT_NAME = txt_name.Text;
                obj_mpro.MPRODUCT_DESC = txt_DESC.Text;
                obj_pro.PRODUCT_DESC = txt_DESC.Text;
                obj_mpro.MPRODUCT_IMAGETITLE = txt_IMAGETITL.Text;
                obj_pro.PRODUCT_IMAGETITLE = txt_IMAGETITL.Text;
                obj_mpro.MPRODUCT_TITLE = txt_TITLE.Text;
                obj_pro.PRODUCT_TITLE = txt_TITLE.Text;
                if (path != "")
                {
                  obj_mpro.MPRODUCT_IMAGEURL = path;
                  obj_pro.PRODUCT_IMAGEURL = path;
                }
                else
                {
                  obj_mpro.MPRODUCT_IMAGEURL = IMAGE.Value;
                  obj_pro.PRODUCT_IMAGEURL = IMAGE.Value;

                }
                obj_pro.PRODUCT_CITYID = Convert.ToInt32(drp_city.SelectedItem.Value);
                if(obj_pro.PRODUCT_CITYID==0)
                {
                    obj_pro.PRODUCT_CITYID = Convert.ToInt32(cityid.Value);
                    obj_mpro.MPRODUCT_CITYID = Convert.ToInt32(cityid.Value);
                }
                int id=Convert.ToInt32(MASTERID.Value);
                bool product1 = BLL.updatepro(obj_pro,id);
                bool mproduct = BLL.updatemproduct(obj_mpro, id);


                loadproduct();
                tele_masterprdct.DataBind();

                DataTable dt_product = BLL.GETPRODUCTBYMASTERID(id);
                tele_product.DataSource = dt_product;
                tele_product.DataBind();

                div_masterprdct.Visible = true;
                div_updatemaster.Visible = false;
            }
            catch (Exception EX)
            {

            }
        }

    }
}