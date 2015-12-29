using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZOYALTY.Code;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;
using System.IO;

namespace Zoyal
{
    public partial class partnerwithus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    clearcontrols();

                }
                catch (Exception ex)
                {

                }
            }
        }

     
        public void clearcontrols()
        {
            try
            {
                txt_yourname.Text = "";
                txt_email.Text = "";
                txt_phonenumber.Text = "";
                txt_subject.Text = "";
                txt_comments.Text = "";
            }
            catch (Exception ex)
            {

            }
        }


        protected void btn_partner_Click(object sender, EventArgs e)
        {
            try
            {
                PARTNERS obj = new PARTNERS();
                obj.PARTNER_NAME = BLL.ReplaceQuote(txt_yourname.Text);
                obj.PARTNER_EMAIL = BLL.ReplaceQuote(txt_email.Text);
                obj.PARTNER_PHONENUMBER = txt_phonenumber.Text;
                obj.PARTNER_SUBJECT = BLL.ReplaceQuote(txt_subject.Text);
                obj.PARTNER_MESSAGE = BLL.ReplaceQuote(txt_comments.Text);
                obj.PARTNER_MODIFIEDBY = 1;
                DataTable dt = BLL.PARTNERE_MAIL(obj);
                DataTable dt_partners = new DataTable();
               DataTable status = BLL.INSERTPARTNER(obj);
                if (status.Rows.Count>0)
                {
                    StreamReader reader = new StreamReader(Path.Combine(System.Web.HttpContext.Current.Server.MapPath(@"~/EMAILS/partnerwithus.html")));
                    string readFile = reader.ReadToEnd();
                    string myString = "";
                    myString = readFile;
                    myString = myString.Replace("$$EMIAL$$", obj.PARTNER_EMAIL);
                    myString = myString.Replace("$$NAME$$", obj.PARTNER_NAME);

                    bool statusemail = BLL.sendemail(myString, "Contactus", "4seduservices@gmail.com", obj.PARTNER_EMAIL);

                    StreamReader reader1 = new StreamReader(Path.Combine(System.Web.HttpContext.Current.Server.MapPath(@"~/EMAILS/partner-prozect.html")));
                    string readfile1 = reader1.ReadToEnd();
                    string mystring1 = "";
                    mystring1 = readfile1;
                    mystring1 = mystring1.Replace("$$email$$", obj.PARTNER_EMAIL);
                    mystring1 = mystring1.Replace("$$NAME$$", obj.PARTNER_NAME);
                    mystring1 = mystring1.Replace("$$phone$$", obj.PARTNER_PHONENUMBER);
                    mystring1 = mystring1.Replace("$$subject$$", obj.PARTNER_SUBJECT);
                    mystring1 = mystring1.Replace("$$messgae$$", obj.PARTNER_MESSAGE);
                    String FROMEMAIL = "vangasrinivas285@gmail.com";
                    bool statusemail1 = BLL.sendemail(mystring1, "COntactus for prozector", "4seduservices@gmail.com", FROMEMAIL);


                    BLL.ShowMessage(this, "Thank you for contacting us, one of our executive will reach you soon");
                    clearcontrols();
                }
                else
                {
                    BLL.ShowMessage(this, "Please contact administrator");
                    clearcontrols();
                }


            }
            catch (Exception ex)
            {

            }
        }
    }
}