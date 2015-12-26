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
    public partial class product_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadgird();
                div_grid.Visible = false;
                update.Visible = false;
                add_types.Visible = false;
                DataTable dt_types = BLL.GETTYPES();
             drp_types.DataSource = dt_types;
             drp_types.DataTextField = "TYPE_NAME";

             drp_types.DataValueField = "TYPE_ID";
             drp_types.DataBind();
                product_grid.MasterTableView.CommandItemSettings.ShowAddNewRecordButton = false;
                product_grid.Rebind();
            }

        }
        internal void loadgird()
        {
            try
            {
                DataTable dt_grid = new DataTable();
                dt_grid = BLL.GET_ALLPRODUCTS();
                product_grid.DataSource = dt_grid;
               
                

            }
            catch(Exception e)
            {

            }

        }

        protected void TYPES_Command(object sender, CommandEventArgs e)
        {
            try {
                int ID = Convert.ToInt32(e.CommandArgument.ToString());
                product_id.Value = ID.ToString();
                DataTable dt_types = BLL.GET_PRODUCTTYPESBY(ID);

                rgvendors.DataSource = dt_types;
                rgvendors.DataBind();
                div_grid.Visible = true;


                product_grid.Visible = false;
                LinkButton1.Visible = false;
                back.Visible = true;
            }
            catch(Exception ex)
            {

            }


        }

        protected void lnk_delete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                bool status = BLL.DELETEPRODUCT(id);

                if (status == true)
                {
                    BLL.ShowMessage(this, "PRODUCT deleted successfully");



                    DataTable dt_grid = new DataTable();
                    dt_grid = BLL.GET_ALLPRODUCTS();
                    product_grid.DataSource = dt_grid;
                    product_grid.DataBind();

                }
                else
                {
                    BLL.ShowMessage(this, "contact administrator");
                }
            }
            catch(Exception ex)
            {

            }
        }

        

        protected void product_grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            loadgird();
        }

        protected void lnkEdit_Command(object sender, CommandEventArgs e)
        {
           
             

        }

        protected void rgvendors_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void TYPS_Command(object sender, CommandEventArgs e)
        {

        }

        protected void update_Command(object sender, CommandEventArgs e)
        {
            try
            {

                update.Visible = true;
                div_grid.Visible = false;
                product_grid.Visible = false;
                LinkButton1.Visible = false;






                hid_operation.Value = "update";
                hid_vendorid.Value = e.CommandArgument.ToString();
                btn_update.Text = "update";
                int id = Convert.ToInt32(e.CommandArgument);
                DataTable DT_PRODUCT = BLL.GETPRODUCTID(id);
                txt_name.Text = DT_PRODUCT.Rows[0]["PRODUCT_NAME"].ToString();
                txt_DESC.Text = DT_PRODUCT.Rows[0]["PRODUCT_DESC"].ToString();
                txt_IMAGETITL.Text = DT_PRODUCT.Rows[0]["PRODUCT_IMAGETITLE"].ToString();
                txt_PRICE.Text = DT_PRODUCT.Rows[0]["PRODUCT_PRICE"].ToString();
                txt_TITLE.Text = DT_PRODUCT.Rows[0]["PRODUCT_TITLE"].ToString();
              












            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {

            string path = "";
            bool status = false;
            try
                
            {
                if (FILE1.HasFile)
                {
                    string str = FILE1.FileName;
                    // product_img.PostedFile.SaveAs(Server.MapPath(".") + "\\PRODUCT_IMGES\\" + str);
                    FILE1.SaveAs(Server.MapPath(@"/Admin/PRODUCT_IMGES/" + str));
                    path = "\\PRODUCT_IMGES\\" + str.ToString();
                }
                else
                {
                }



                    PRODUCT OBJ = new PRODUCT();
                    OBJ.PRODUCT_NAME = BLL.ReplaceQuote(txt_name.Text);
                    OBJ.PRODUCT_DESC = BLL.ReplaceQuote(txt_DESC.Text);
                    OBJ.PRODUCT_IMAGETITLE = BLL.ReplaceQuote(txt_IMAGETITL.Text);
                    OBJ.PRODUCT_PRICE = Convert.ToDecimal(BLL.ReplaceQuote(txt_PRICE.Text));
                    OBJ.PRODUCT_TITLE = BLL.ReplaceQuote(txt_TITLE.Text);
                    OBJ.PRODUCT_ID = Convert.ToInt32(hid_vendorid.Value);
                    OBJ.PRODUCT_IMAGEURL = path;
                  


                    status = BLL.updateproduct(OBJ);
                    if (status == true)
                    {
                        BLL.ShowMessage(this, "PRODUCT updated successfully");
                       
                        product_grid.Visible = true;
                        update.Visible = false;

                    DataTable dt_grid = new DataTable();
                    dt_grid = BLL.GET_ALLPRODUCTS();
                    product_grid.DataSource = dt_grid;
                    product_grid.DataBind();


                }
                
            }
            catch (Exception E)
            {

            }
              

        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Product_details.aspx");
        }

        public void loadtype()
        {
            try {
                int id = Convert.ToInt32(pro_id.Text);

                DataTable dt_types = BLL.GET_PRODUCTTYPESBY(id);

                rgvendors.DataSource = dt_types;
                rgvendors.DataBind();
            }
            catch(Exception ex)
            {

            }
        }


        protected void btn_insert_Click(object sender, EventArgs e)
        {
            try {
                back.Visible = false;
                PRODUCT_TYPE OBJ = new PRODUCT_TYPE();
                OBJ.PROD_ID = Convert.ToInt32(pro_id.Text);
                OBJ.PRODUCT_TYPID = drp_types.SelectedItem.Value;
                bool STATUS = BLL.INSERT_PRODUCTTYPES(OBJ);
                if (STATUS == true)
                {

                    loadtype();
                    rgvendors.Visible = true;
                    add_types.Visible = false;
                    lnk_add.Visible = true;
                    BLL.ShowMessage(this, "successfully add Productypes");




                }
            }
            catch(Exception ex)
            {

            }

        }

        protected void Add_Command(object sender, CommandEventArgs e)
        {
            try
            {


                add_types.Visible = true;
                rgvendors.Visible = false;
                int ID = Convert.ToInt32(e.CommandArgument.ToString());
                pro_id.Text = ID.ToString();
                DataTable dt_types = BLL.GET_PRODUCTTYPESBY(ID);
                pro_id.Text = dt_types.Rows[0]["PRODUCT_ID"].ToString();
            }
            catch (Exception ex)
            {
            }
          

        }

        protected void delete_Command(object sender, CommandEventArgs e)
        {
            int ID = Convert.ToInt32(e.CommandArgument.ToString());
            bool status = BLL.deletetype(ID);
            if (status == true)
            {

                int id = Convert.ToInt32(product_id.Value);

                DataTable dt_types = BLL.GET_PRODUCTTYPESBY(id);

                rgvendors.DataSource = dt_types;
                rgvendors.DataBind();
            }
            

        }

        protected void lnk_add_Click(object sender, EventArgs e)
        {

            add_types.Visible = true;
            pro_id.Text = product_id.Value;
            rgvendors.Visible = false;
            lnk_add.Visible = false;
            back.Visible = false;




        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("productinsert.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            
        }

      //protected void Button1_Click1(object sender, EventArgs e)
      //  {
      //      try {
      //          TYPES obj = new TYPES();
      //          obj.TYPE_NAME = txt_type.Text;
      //          bool status = BLL.INSERT_TYPES(obj);
      //          if (status == true)
      //          {
      //          }
      //          else
      //          {
      //          }
      //          DataTable dt_types = BLL.GETTYPES();
      //          drp_types.DataSource = dt_types;
      //          drp_types.DataTextField = "TYPE_NAME";
      //          drp_types.DataValueField = "TYPE_ID";
      //          drp_types.DataBind();
      //          BLL.ShowMessage(this, "Add Type successfully");
      //      }
      //      catch
      //      {
      //      }
      //  }
    }
}