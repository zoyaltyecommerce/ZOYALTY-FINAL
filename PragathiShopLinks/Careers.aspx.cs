using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZOYALTY.Code;
using System.Data;
using System.IO;

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
               DataTable status = BLL.insert_careers(obj);
                if (status.Rows.Count>0)
                {
                    StreamReader reader = new StreamReader(Path.Combine(System.Web.HttpContext.Current.Server.MapPath(@"~/EMAILS/CAREER.html")));
                    string readFile = reader.ReadToEnd();
                    string myString = "";
                    myString = readFile;
                    myString = myString.Replace("$$EMIAL$$", obj.email);
                    myString = myString.Replace("$$NAME$$", obj.fullname);

                    bool statusemail = BLL.sendemail(myString, "Contactus", "4seduservices@gmail.com", obj.email);

                    StreamReader reader1 = new StreamReader(Path.Combine(System.Web.HttpContext.Current.Server.MapPath(@"~/EMAILS/CAREER-PROZECT.html")));
                    string readfile1 = reader1.ReadToEnd();
                    string mystring1 = "";
                    mystring1 = readfile1;
                    mystring1 = mystring1.Replace("$$email$$", obj.email);
                    mystring1 = mystring1.Replace("$$NAME$$", obj.fullname);
                    mystring1 = mystring1.Replace("$$phone$$", obj.phone);
                    mystring1 = mystring1.Replace("$$POSITION$$", obj.position);
                    
                    String FROMEMAIL = "vangasrinivas285@gmail.com";
                    bool statusemail1 = BLL.sendemail(mystring1, "COntactus for prozector", "4seduservices@gmail.com", FROMEMAIL);



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