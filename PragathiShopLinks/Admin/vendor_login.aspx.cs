using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZOYALTY.Code;
using System.Data;
using System.Net.Mail;

namespace PragathiShopLinks.Admin
{
    public partial class vendor_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {


                vendors obj = new vendors();
                obj.VENDOR_EMAIL = txt_username.Text.Trim();
                obj.VENDOR_PASSWORD = txt_password.Text.Trim();
                DataTable dt_vendor = new DataTable();
                dt_vendor = BLL.VENDOR_LOGIN(obj);
                if (dt_vendor.Rows.Count > 0)
                {
                   
                    Session["VENDORS"] = dt_vendor;
                
                    //BLL.ShowMessage(this, "YOUR ACCOUNT SUCCESSFULLY LOGIN");
                    Response.Redirect("Cartdetails.aspx");
                    clearcontrols();


                }
                else
                {
                    BLL.ShowMessage(this, "incorrecrt emailid or password");
                    clearcontrols();
                }
            }
            catch(Exception ex)
            {

            }

        }
        public void clearcontrols()
        {
            txt_username.Text = "";
            txt_password.Text = "";
        }

        protected void btn_forget_Click(object sender, EventArgs e)
        {
            try
            {

                vendors obj = new vendors();
                obj.VENDOR_EMAIL = txt_fogetpassword.Text;
                MailMessage mailmessage = new MailMessage();
                DataTable dt_user = BLL.VENDORFORGETPWD(obj);
                mailmessage.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("linkskart.com");
                client.Credentials = new System.Net.NetworkCredential("info@linkskart.com", ".santhu143");
                mailmessage.From = new System.Net.Mail.MailAddress("info@linkskart.com");
                // mailmessage.From = new MailAddress("santhosh@pragatipadh.com");
                mailmessage.To.Add(dt_user.Rows[0]["vendor_email"].ToString());
                // mailmessage.CC.Add(emailid);
                mailmessage.Subject = "Password request";
                mailmessage.Body = "<p> Dear " + dt_user.Rows[0]["vendor_email"].ToString() + ",<br /> <br />You password is " + dt_user.Rows[0]["USER_PASSWORD"].ToString() + " please <a href=\"http://www.linkskart.com\">Click Here</a> to visit LINKSKART.</p></div>";
                client.EnableSsl = false;
                try
                {
                    client.Send(mailmessage);
                    //SmtpMail.Send(eMail);
                }
                catch (Exception ae)
                {
                    // Label1.Text = ae.Message;
                }
            }
            catch(Exception EX)
            {

            }
        }
    }
}