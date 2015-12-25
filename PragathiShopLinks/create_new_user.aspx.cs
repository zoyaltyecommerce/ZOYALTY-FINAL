using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZOYALTY.Code;

namespace PragathiShopLinks
{
    public partial class create_new_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btn_create_new_user_Click(object sender, EventArgs e)
        {

            try
            {
                USERS obj = new USERS();
                obj.USER_FIRSTNAME = BLL.ReplaceQuote(txt_new_user .Text);
                obj.USER_EMAILID = BLL.ReplaceQuote(txt_create_email .Text);
                obj.USER_USERNAME = BLL.ReplaceQuote(txt_create_email.Text);
                obj.USER_PASSWORD = BLL.Encrypt(BLL.ReplaceQuote (txt_pwd .Text));
                obj.USER_PHONE = BLL.ReplaceQuote(txt_createa_phone .Text);
                obj.USER_CREATEDBY = 1;
                DataTable dt = BLL.checkusers(obj);
                DataTable dt_user = new DataTable();
                if (dt.Rows.Count == 0)
                {
                    dt_user = BLL.INSERTUSER(obj);
                    if (dt_user.Rows.Count > 0)
                    {
                        BLL.ShowMessage(this, "YOUR ACCOUNT SUCCESSFULLY CREATED");
                        Response.Redirect("logincheck.aspx");
                        clearcontrols();
                    }
                    else
                    {
                        BLL.ShowMessage(this, "contact admin");
                    }
                }
                else
                {
                  lbl_emailcheck.Visible = true;
                }


                MailMessage mailmessage = new MailMessage();
                mailmessage.IsBodyHtml = true;

                SmtpClient client = new SmtpClient("linkskart.com");
                client.Credentials = new System.Net.NetworkCredential("info@linkskart.com", ".santhu143");
                mailmessage.From = new System.Net.Mail.MailAddress("info@linkskart.com");
                // mailmessage.From = new MailAddress("santhosh@pragatipadh.com");
                mailmessage.To.Add(dt_user.Rows[0]["USER_EMAILID"].ToString());
                // mailmessage.CC.Add(emailid);
                mailmessage.Subject = "your account is created";
                mailmessage.Body = "<p> Dear " + dt_user.Rows[0]["USER_EMAILID"].ToString() + " " + ",<br /> <br />Your account is successfully created " + " please <a href=\"http://www.linkskart.com\">Click Here</a> to visit LINKSKART.</p></div>";
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
            catch (Exception ex)
            {

            }
        }
        public void clearcontrols()
        {
            txt_new_user.Text = "";
            txt_create_email.Text = "";
            txt_createa_phone.Text = "";
            txt_pwd.Text = "";
        }
    }
}