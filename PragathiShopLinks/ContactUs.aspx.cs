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
    public partial class contact : System.Web.UI.Page
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
                txt_email.Text = "";
                txt_yourname.Text = "";
                txt_phonenumber.Text = "";
                txt_comments.Text = "";
                txt_subject.Text = "";
            }
            catch (Exception ex)
            {

            }
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                CONTACTUS obj = new CONTACTUS();
                obj.CONTACT_NAME = BLL.ReplaceQuote(txt_yourname.Text);
                obj.CONTACT_EMAIL = BLL.ReplaceQuote(txt_email.Text);
                obj.CONTACT_MESSAGE = BLL.ReplaceQuote(txt_comments.Text);
                obj.CONTACT_MODIFIEDBY = 1;
                obj.CONTACT_PHONENUMBER = txt_phonenumber.Text;
                obj.CONTACT_SUBJECT = BLL.ReplaceQuote(txt_subject.Text);
                DataTable dt = BLL.CONTACT_EMAIL(obj);
                DataTable dt_contact = new DataTable();
                DataTable status = BLL.INSERTCONTACT(obj);
                if (status.Rows.Count>0)
                {
                    StreamReader reader = new StreamReader(Path.Combine(System.Web.HttpContext.Current.Server.MapPath(@"~/EMAILS/Contacts.html")));
                    string readFile = reader.ReadToEnd();
                    string myString = "";
                    myString = readFile;
                    myString = myString.Replace("$$EMIAL$$", obj.CONTACT_EMAIL);
                    myString = myString.Replace("$$NAME$$", obj.CONTACT_NAME);

                    bool statusemail = BLL.sendemail(myString, "Contactus", "4seduservices@gmail.com", obj.CONTACT_EMAIL);

                    StreamReader reader1 = new StreamReader(Path.Combine(System.Web.HttpContext.Current.Server.MapPath(@"~/EMAILS/Contact-prozect.html")));
                    string readfile1 = reader1.ReadToEnd();
                    string mystring1 = "";
                    mystring1 = readfile1;
                    mystring1 = mystring1.Replace("$$email$$", obj.CONTACT_EMAIL);
                    mystring1 = mystring1.Replace("$$NAME$$", obj.CONTACT_NAME);
                    mystring1 = mystring1.Replace("$$phone$$", obj.CONTACT_PHONENUMBER);
                    mystring1 = mystring1.Replace("$$subject$$", obj.CONTACT_SUBJECT);
                    mystring1 = mystring1.Replace("$$messgae$$", obj.CONTACT_MESSAGE);
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

        [WebMethod]
        public static string delete_cartitemweb(int id)
        {

            DataTable dt_cart = (DataTable)HttpContext.Current.Session["CART"];


            string productid = id.ToString();

            DataRow[] result = dt_cart.Select("PRODUCT_ID = " + id + "");
            foreach (DataRow row in result)
            {
                if (row["PRODUCT_ID"].ToString().Equals("" + productid + ""))
                {
                    dt_cart.Rows.Remove(row);
                }
            }

            HttpContext.Current.Session["CART"] = dt_cart;
            object delamount = dt_cart.Compute("Sum(PRODUCT_SUB_TOTAL)", string.Empty);

            int count = dt_cart.Rows.Count;


            if (dt_cart.Rows.Count > 0)
            {
                HttpContext.Current.Session["CART"] = dt_cart;
            }
            else
            {
                HttpContext.Current.Session["CART"] = null;

            }

            // return count.ToString();
            return delamount.ToString() + "," + count.ToString();



        }
    }
}