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
    public partial class city : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                loadgrid();
                tele_city.DataBind();
                div_city.Visible = true;
                div_location.Visible = false;
                div_addcity.Visible = false;
                div_addlocaton.Visible = false;
               
            }
        }
        public void loadgrid()
        {
            DataTable dt_cities = new DataTable();
            cities obj = new cities();
            dt_cities = BLL.GETCITIES(obj);
            tele_city.DataSource = dt_cities;

          
        }
      

        protected void tele_city_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            loadgrid();
        }

        protected void lnk_edit_Command(object sender, CommandEventArgs e)
        {
            hidden_operation.Value = "update";
            hidden_value.Value = e.CommandArgument.ToString();
            int city_id = Convert.ToInt32(e.CommandArgument);
            cities obj=new cities();
            obj.city_id=city_id;
            DataTable dtcity = BLL.GetSelectedCity(obj);

            txt_city.Text = dtcity.Rows[0]["city_name"].ToString();

            div_addcity.Visible = true;
            div_addlocaton.Visible = false;
            div_city.Visible = false;


        }

        protected void lnk_delete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                cities obj = new cities();
                obj.city_id = id;
                bool status = BLL.delete_city(obj);
                if (status == true)
                {
                    loadgrid();
                    tele_city.DataBind();
                    div_city.Visible = true;
                    BLL.ShowMessage(this, "City deleted successfully");
                }
                else
                {
                    BLL.ShowMessage(this, "Contact Administrator");
                }
            }
            catch (Exception ex)
            { }
        }

        protected void lnk_asign_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            hidden_value.Value = e.CommandArgument.ToString();
            LOCATIONS obj = new LOCATIONS();
            obj.LOCATION_CITYID = id;
            DataTable dt_location = BLL.GETLOCATION(obj);

            tele_location.DataSource = dt_location;
            tele_location.DataBind();
            div_location.Visible = true;
            div_city.Visible = false;

        }

        protected void tele_location_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            bool status = false;
            try
            {
                cities obj = new cities();
                obj.city_name = BLL.ReplaceQuote(txt_city.Text);
                if (hidden_operation.Value == "update")
                {
                    obj.city_id = Convert.ToInt32(hidden_value.Value);
                    status = BLL.UPDATE_CITY(obj);

                }
                else if (hidden_operation.Value == "SAVE")
                {
                    status = BLL.INSERT_CITIES(obj);
                }

                if (status == true)
                {
                    loadgrid();
                 
                    tele_city.DataBind();
                    div_city.Visible = true;
                    div_addcity.Visible = false;
                    BLL.ShowMessage(this, "City Created Successfully");
                }

                else
                {
                    BLL.ShowMessage(this, "Contact Administrator");
                }
            }
            catch(Exception ex)
            {

            }
           

        }

              

        protected void lnk_locatndelete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                LOCATIONS obj = new LOCATIONS();
                obj.LOCATION_ID = id;
                bool status = BLL.delete_location(obj);
                if (status == true)
                {
                    loadgrid();
                    tele_location.DataBind();
                    DataTable dt_loc = new DataTable();
                    LOCATIONS obj_loc = new LOCATIONS();
                    int city_id = Convert.ToInt32(hidden_value.Value);
                    obj_loc.LOCATION_CITYID = city_id;
                    dt_loc = BLL.GETLOCATION(obj_loc);
                    tele_location.DataSource = dt_loc;
                    tele_location.DataBind();
                    div_location.Visible = true;

                    BLL.ShowMessage(this, "Location deleted successfully");
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

        protected void lnk_city_Click(object sender, EventArgs e)
        {
            txt_city.Text = "";
            div_city.Visible = false;
            div_addcity.Visible = true;
            hidden_operation.Value = "SAVE";
            hidden_value.Value = "";
            btn_save.Text = "ADD";
        }

        protected void lnk_addloctin_Click(object sender, EventArgs e)
        {
            txt_location.Text = "";
            div_addlocaton.Visible = true;
            div_location.Visible = false;
            Hidden_loc_operatin.Value = "SAVE";
            Hidd_loc_value.Value = "";
            btn_save.Text = "ADD";
        }

        protected void btn_savelocation_Click1(object sender, EventArgs e)
        {
            try
            {
                bool status = false;
                LOCATIONS obj = new LOCATIONS();
                obj.LOCATION_NAME = BLL.ReplaceQuote(txt_location.Text);
                if (Hidden_loc_operatin.Value == "update")
                {
                    obj.LOCATION_ID = Convert.ToInt32(Hidd_loc_value.Value);
                    status = BLL.update_location(obj);

                }
                else if (Hidden_loc_operatin.Value == "SAVE")
                {
                    int city_id = Convert.ToInt32(hidden_value.Value);
                    obj.LOCATION_CITYID = city_id;
                    status = BLL.INSERT_LOCATION(obj);
                }

                if (status == true)
                {

                    loadgrid();

                    DataTable dt_loc = new DataTable();
                    LOCATIONS obj_loc = new LOCATIONS();
                    int city_id = Convert.ToInt32(hidden_value.Value);
                    obj_loc.LOCATION_CITYID = city_id;
                    dt_loc = BLL.GETLOCATION(obj_loc);
                    tele_location.DataSource = dt_loc;
                    tele_location.DataBind();
                    div_addlocaton.Visible = false;
                    div_location.Visible = true;
                    BLL.ShowMessage(this, "Location Created Successfully");
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

        protected void lnk_locatnedit_Command1(object sender, CommandEventArgs e)
        {
            Hidden_loc_operatin.Value = "update";
            Hidd_loc_value.Value = e.CommandArgument.ToString();
            int loc_id = Convert.ToInt32(e.CommandArgument);
            LOCATIONS obj = new LOCATIONS();
            // int city_id = Convert.ToInt32( hidden_value.Value);
            //obj.LOCATION_CITYID = city_id;
            obj.LOCATION_ID = loc_id;
            DataTable dt_loc = BLL.GETLOCATIONBYID(obj);

            txt_location.Text = dt_loc.Rows[0]["LOCATION_NAME"].ToString();
            div_addlocaton.Visible = true;
            div_addcity.Visible = false;
            div_location.Visible = false;
        }

      
       
    }
}