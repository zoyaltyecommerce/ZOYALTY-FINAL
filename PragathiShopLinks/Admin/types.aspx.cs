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
    }
}