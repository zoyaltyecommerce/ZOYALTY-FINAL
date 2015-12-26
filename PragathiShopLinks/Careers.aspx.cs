using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZOYALTY.Code;
using System.Data;

namespace Zoyal
{
    public partial class Careers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                 
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                careers obj = new careers();
                obj.fullname = txt_name.Text;
                obj.email = txt_email.Text;
                obj.phone = txt_contactno.Text;
                obj.position = drp1.SelectedItem.Text;
                bool status = BLL.insert_careers(obj);
                if (status == true)
                {
                    clearcontrol();
                    BLL.ShowMessage(this, "Your Applied Successfully");
                }
                else
                {

                }

            }
            catch (Exception ex)
            { 

            }
        }

        public void clearcontrol()
        {
            txt_name.Text= "";
            txt_email.Text= "";
            txt_contactno.Text= "";
            drp1.ClearSelection();
        }
    }
}