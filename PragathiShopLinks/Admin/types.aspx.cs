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
    public partial class types : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadtypes();
                tele_types.DataBind();
                div_types.Visible = true;
                div_addtype.Visible = false;
                div_addsubtype.Visible = false;
                div_subtypes.Visible = false;
            }
        }

        public void loadtypes()
        {
            try
            {
                DataTable dt_types = new DataTable();
                dt_types = BLL.SELECTTYPES();
                tele_types.DataSource = dt_types;

            }
            catch (Exception ex)
            { 
            }
        }

        protected void tele_types_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            loadtypes();
        }

        protected void lnk_edit_Command(object sender, CommandEventArgs e)
        {
            try
            {

                hid_operation.Value = "UPDATE";
                hid_value.Value = e.CommandArgument.ToString();
                int id = Convert.ToInt32(e.CommandArgument.ToString());
                TYPES obj = new TYPES();
                obj.TYPE_ID = id;
                DataTable dt_types = BLL.GETSELECTED_TYPE(obj);
                txt_typename.Text = dt_types.Rows[0]["TYPE_NAME"].ToString();
                div_addtype.Visible = true;
                div_types.Visible = false;
            }
            catch (Exception ex)
            {
 
            }
        }

        protected void lnk_delete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32( e.CommandArgument.ToString());
                TYPES obj = new TYPES();
                obj.TYPE_ID = id;
                bool status = BLL.DELETE_TYPES(obj);
                if (status == true)
                {
                    loadtypes();
                    tele_types.DataBind();
                    div_addtype.Visible = false;
                    div_types.Visible = true;
                    BLL.ShowMessage(this, "TYPE DELETED SUCCESSFULLY");
                }
                else
                {
                    BLL.ShowMessage(this,"CONTACT ADMINISTRATOR");
                }
            }
            catch(Exception ex)
            {

            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            bool status = false;
            try
            {
                TYPES obj = new TYPES();
                obj.TYPE_NAME = BLL.ReplaceQuote(txt_typename.Text);
                if (hid_operation.Value == "UPDATE")
                {
                    obj.TYPE_ID = Convert.ToInt32(hid_value.Value);
                    status = BLL.UPDATE_TYPES(obj);
                }
                else if (hid_operation.Value == "SAVE")
                {
                    status = BLL.INSERT_TYPES(obj);
                }

                if (status == true)
                {
                    loadtypes();
                    tele_types.DataBind();
                    div_types.Visible = true;
                    div_addtype.Visible = false;
                    clearcontrols();
                    BLL.ShowMessage(this, "TYPE ADDED SUCCESSFULLY");
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

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            clearcontrols();
        }

        protected void lnk_type_Click(object sender, EventArgs e)
        {
            txt_typename.Text = "";
            hid_operation.Value = "SAVE";
            div_addtype.Visible = true;
            div_types.Visible = false;
        }
        public void clearcontrols()
        {
            txt_typename.Text = "";
        }

        protected void lnk_assignsubtype_Command(object sender, CommandEventArgs e)
        {
            int id =  Convert.ToInt32( e.CommandArgument.ToString());
            hid_value.Value = e.CommandArgument.ToString();
            productsubtype obj = new productsubtype();
            obj.TYPE_MAINTYPEID = id;
            DataTable dt_subtypes = BLL.GETSUBTYPESBYTYPEID(obj);
            tele_subtypes.DataSource = dt_subtypes;
            tele_subtypes.DataBind();
            div_subtypes.Visible = true;
            div_types.Visible = false;

             

        }

        protected void tele_subtypes_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void lnk_editsubtype_Command(object sender, CommandEventArgs e)
        {
            try 
            {
                Hidd_SUBTYPE_OPRTN.Value = "update";
                Hidd_subtype_value.Value = e.CommandArgument.ToString();
                int subtype_id = Convert.ToInt32(e.CommandArgument);
                productsubtype obj=new productsubtype();
                obj.TYPE_ID=subtype_id;
                DataTable dt_subtype=BLL.GETSUBTYPESBYID(obj);

                txt_subtype.Text=dt_subtype.Rows[0]["TYPE_NAME"].ToString();
                div_addsubtype.Visible=true;
                div_addtype.Visible=false;
                div_subtypes.Visible = false;
                
            }
            catch(Exception ex)
            {

            }
        }

        //protected void lnk_subtypedelete_Command(object sender, CommandEventArgs e)
        //{
        //    try
        //    {
        //        int id = Convert.ToInt32(e.CommandArgument);
        //        productsubtype obj = new productsubtype();
        //        obj.TYPE_ID = id;
        //        bool status = BLL.DELETESUBTYPE(obj);
        //        if (status == true)
        //        {
        //            int main_typeid = Convert.ToInt32(hid_value.Value);
        //            obj.TYPE_MAINTYPEID = main_typeid;
        //            DataTable dt_subtypes = BLL.GETSUBTYPESBYTYPEID(obj);
        //            tele_subtypes.DataSource = dt_subtypes;
        //            tele_subtypes.DataBind();
        //            div_types.Visible = false;
        //            div_subtypes.Visible = true;
        //        }
        //        else
        //        {
        //            BLL.ShowMessage(this, "Contact Administrator");
        //        }

        //    }
        //    catch (Exception ex)
        //    {
 
        //    }
        //}

        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {
                bool status = false;
                productsubtype obj = new productsubtype();
                obj.TYPE_NAME = BLL.ReplaceQuote(txt_subtype.Text);
                if (Hidd_SUBTYPE_OPRTN.Value == "update")
                {
                    obj.TYPE_ID = Convert.ToInt32(Hidd_subtype_value.Value);
                    status = BLL.UPDATE_SUBTYPE(obj);
                }
                else if (Hidd_SUBTYPE_OPRTN.Value == "save")
                {
                    obj.TYPE_MAINTYPEID = Convert.ToInt32(hid_value.Value);
                    status = BLL.INSERT_SUBTYPE(obj);
                }
                if (status == true)
                {
                    int main_typeid = Convert.ToInt32(hid_value.Value);
                    obj.TYPE_MAINTYPEID = main_typeid;
                    DataTable dt_subtype = BLL.GETSUBTYPESBYTYPEID(obj);
                    tele_subtypes.DataSource = dt_subtype;
                    tele_subtypes.DataBind();
                    div_subtypes.Visible = true;
                    div_types.Visible = false;
                    div_addsubtype.Visible = false;
                    BLL.ShowMessage(this, "SUB TYPE CREATED SUCCESSFULLY");
                }
                else
                {
                    BLL.ShowMessage(this, "CONTACT ADMINISTRATOR");
                }
            }
            catch (Exception EX)
            {
 
            }
        }

        protected void lnk_suntype_Click(object sender, EventArgs e)
        {
            txt_subtype.Text = "";
            Hidd_SUBTYPE_OPRTN.Value = "save";
            Hidd_subtype_value.Value = "";
            div_addsubtype.Visible = true;
            div_addtype.Visible = false;
            div_subtypes.Visible = false;
        }

       

       

        protected void lnk_dete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                productsubtype obj = new productsubtype();
                obj.TYPE_ID = id;
                bool status = BLL.DELETESUBTYPE(obj);
                if (status == true)
                {
                    int main_typeid = Convert.ToInt32(hid_value.Value);
                    obj.TYPE_MAINTYPEID = main_typeid;
                    DataTable dt_subtypes = BLL.GETSUBTYPESBYTYPEID(obj);
                    tele_subtypes.DataSource = dt_subtypes;
                    tele_subtypes.DataBind();
                    div_types.Visible = false;
                    div_subtypes.Visible = true;
                    div_addsubtype.Visible = false;
                }
                else
                {
                    BLL.ShowMessage(this, "Contact Administrator");
                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}