using System.Collections.Generic;
using System.Web.Security;
using Microsoft.Win32;
using System.Security.Cryptography;
using System;
using System.Text;
using System.Web.UI;
using System.Web;
using System.Data;
using System.Text.RegularExpressions;
using System.Diagnostics;
using System.Configuration;
using System.Data.SqlClient;
using ZOYALTY.Code;
using System.Net.Mail;

namespace ZOYALTY.Code
{
    public class BLL
    {
        #region Messages

        public const string msg_Saved = "Information saved successfully";
        public const string msg_Updated = "Information updated successfully";
        public const string msg_UnSaved = "Information not saved";
        public const string msg_NotUpdated = "Information not Updated";
        public const string msg_ImageNotUploaded = "Please Upload Image";
        public const string msg_ImageRestrict = "Only .jpeg and .png files are allowed!";

        public string MyProperty { get; set; }

        #endregion

        #region crypto  Methods to Encrypt and Decrypt

        static string myKey = "3d5900ae-111a-45be-96b3-d9e4606ca793";
        static TripleDESCryptoServiceProvider cryptDES3 = new TripleDESCryptoServiceProvider();
        static MD5CryptoServiceProvider cryptMD5Hash = new MD5CryptoServiceProvider();

        internal static string Decrypt(string myString)
        {
            cryptDES3.Key = cryptMD5Hash.ComputeHash(ASCIIEncoding.ASCII.GetBytes(myKey));
            cryptDES3.Mode = CipherMode.ECB;
            ICryptoTransform desdencrypt = cryptDES3.CreateDecryptor();
            byte[] buff = Convert.FromBase64String(myString);
            return ASCIIEncoding.ASCII.GetString(desdencrypt.TransformFinalBlock(buff, 0, buff.Length));
        }

        internal static string Encrypt(string myString)
        {
            cryptDES3.Key = cryptMD5Hash.ComputeHash(ASCIIEncoding.ASCII.GetBytes(myKey));
            cryptDES3.Mode = CipherMode.ECB;
            ICryptoTransform desdencrypt = cryptDES3.CreateEncryptor();
            object MyASCIIEncoding = new ASCIIEncoding();
            byte[] buff = ASCIIEncoding.ASCII.GetBytes(myString);
            return Convert.ToBase64String(desdencrypt.TransformFinalBlock(buff, 0, buff.Length));
        }

        #endregion

        internal static DataTable ExecuteQuery(string Query)
        {
            return Dal.ExecuteQuery(Query);
        }


        internal static bool ExecuteNonQuery(string Query)
        {
            return Dal.ExecuteNonQuery(Query);
        }
        internal static void ShowMessage(Control ctrl, string Msg)
        {
            ScriptManager.RegisterStartupScript(ctrl, ctrl.GetType(), Guid.NewGuid().ToString(), "alert('" + Msg + "');", true);
        }

        internal static string ReplaceQuote(string str)
        {
            return str.Replace("'", "''");
        }

        internal static DataTable INSERTCONTACT(CONTACTUS obj)
        {
            
         DataTable status = BLL.ExecuteQuery("EXEC USP_CONTACTUS @OPERATION='INSERTCONTACT', @CONTACT_NAME='" + obj.CONTACT_NAME + "',@CONTACT_EMAIL='" + obj.CONTACT_EMAIL + "',@CONTACT_SUBJECT='" + obj.CONTACT_SUBJECT + "',@CONTACT_PHONENUMBER='" + obj.CONTACT_PHONENUMBER + "',@CONTACT_MESSAGE='" + obj.CONTACT_MESSAGE + "',@CONTACT_CREATEDBY=1,@CONTACT_MODIFIEDBY=1");
            return status;
        }
        internal static DataTable CONTACT_EMAIL(CONTACTUS obj)
        {
            DataTable dt = BLL.ExecuteQuery("EXEC USP_CONTACTUS @CONTACT_EMAIL='" + obj.CONTACT_EMAIL + "',@OPERATION='CONTACT_EMAIL''");
            return dt;
        }

        internal static DataTable INSERTPARTNER(PARTNERS obj)
        {
            
          DataTable  status = BLL.ExecuteQuery("EXEC USP_PARTNERS @PARTNER_NAME='" + obj.PARTNER_NAME + "',@PARTNER_EMAIL='" + obj.PARTNER_EMAIL + "',@PARTNER_PHONENUMBER='" + obj.PARTNER_PHONENUMBER + "',@PARTNER_SUBJECT='" + obj.PARTNER_SUBJECT + "',@PARTNER_MESSAGE='" + obj.PARTNER_MESSAGE + "',@PARTNER_CREATEDBY=1,@OPERATION='INSERTPARTNER'");
            return status;
        }
        internal static DataTable PARTNERE_MAIL(PARTNERS obj)
        {
            DataTable dt = BLL.ExecuteQuery("EXEC USP_PARTNERS @PARTNER_EMAIL='" + obj.PARTNER_EMAIL + "',@OPERATION='PARTNERE_MAIL''");
                return dt;
        }
        internal static DataTable INSERTUSER(USERS obj)
        {
           
          DataTable  dt = BLL.ExecuteQuery("EXEC USP_USERLOGIN @USER_FIRSTNAME='" + obj.USER_FIRSTNAME + "',@USER_PHONE='"+obj.USER_PHONE+ "',@USER_EMAILID='" + obj.USER_EMAILID + "',@USER_USERNAME='" + obj.USER_USERNAME + "',@USER_PASSWORD='" + obj.USER_PASSWORD + "',@USER_MODIFIEDBY='" + obj.USER_MODIFIEDBY + "',@USER_STATUS ='" + obj.USER_STATUS + "',@USER_LOGINTYPE='" + obj.USER_LOGINTYPE + "',@USER_CREATEDBY=1,@OPERATION='INSERTUSER'");
            return dt;
        }

        //FUNCTION TO CHECK USER EXISIST ALREADY OR NOT
        internal static DataTable checkusers(USERS obj)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = BLL.ExecuteQuery("EXEC USP_USERLOGIN @OPERATION='CHECKEMAIL',@USER_EMAILID='"+ obj.USER_EMAILID +"'");
            }
            catch(Exception ex)
            {

            }
            return dt;
        }

        internal static DataTable LOGIN(USERS obj)
        {
            
           DataTable   dt = BLL.ExecuteQuery("EXEC USP_USERLOGIN @OPERATION='LOGIN',@USER_EMAILID='"+ obj.USER_EMAILID + "',@USER_PASSWORD='"+ BLL.Encrypt( obj.USER_PASSWORD) +"'");
            return dt;
        }

        internal static DataTable FORGETPWD(USERS obj)
        {

            DataTable dt = BLL.ExecuteQuery("EXEC USP_USERLOGIN @OPERATION='FORGETPWD',@USER_EMAILID='" + obj.USER_EMAILID + "'");
                return dt;
        }
        //internal static bool InsertShopcart(shop_cart_full obj)
        //{
        //    bool status = false;
        //    status = BLL.ExecuteNonQuery("EXEC USP_CONTACTUS @CONTACT_NAME='" + obj.CONTACT_NAME + "',@CONTACT_EMAIL='" + obj.CONTACT_EMAIL + "',@CONTACT_SUBJECT='" + obj.CONTACT_SUBJECT + "',@CONTACT_PHONENUMBER='" + obj.CONTACT_PHONENUMBER + "',@CONTACT_MESSAGE='" + obj.CONTACT_MESSAGE + "',@CONTACT_CREATEDBY=1,@CONTACT_MODIFIEDBY=1,@OPERATION='INSERTCONTACT'");
        //    return status;
        //}


        internal static bool winderinsert(ADMINLOGINS obj)
        {
            bool status = false;
            status = BLL.ExecuteNonQuery("EXEC WINDER_INSERT @USER_NAME='" + obj.USER_NAME + "',@USER_EMAIL='" + obj.USER_EMAIL + "',@USER_PASSWORD='" + obj.USER_PASSWORD + "',@USER_CREATEDBY='" + obj.USER_CREATEDBY + "',@USER_MODIFIEDBY='" + obj.USER_MODIFIEDBY + "',@USER_ADMIN='" + obj.USER_ADMIN + "',@USER_LOCATIONID='" + obj.USER_LOCATIONID + "',@USER_STATUSID='" + obj.USER_STATUSID + "',@USER_ORGANIZATIONNAME='"+obj.USER_ORGANIZATIONNAME+"'");
            return status;
        }
        internal static DataTable ADMINLOGIN(ADMINLOGINS obj)
        {
            DataTable dt = BLL.ExecuteQuery("EXEC USP_ADMINLOGINS @OPERATION='ADMINLOGIN',@USER_EMAIL='"+obj.USER_EMAIL+"',@USER_PASSWORD='"+obj.USER_PASSWORD+"'");
            return dt;
                
        }

        internal static DataTable ADMINFORGETPWD(ADMINLOGINS obj)
        {
            DataTable dt = BLL.ExecuteQuery("EXEC USP_ADMINLOGINS @OPERATION='ADMINFORGETPWD',@USER_EMAIL='" + obj.USER_EMAIL + "'");
            return dt;
        }
        //internal static DataTable Getlocations()
        //{
        //    DataTable DT = BLL.ExecuteQuery("EXEC USP_GETTINGLOCATIONS @OPERATION='GETLOCATIONS'");
        //    return DT;
        //}
        internal static DataTable GETCITIES(cities obj)
        {
            DataTable DT = BLL.ExecuteQuery("EXEC USP_CITIES @OPERATION='GETCITIES'");
            return DT;
        }

        internal static DataTable GetSelectedCity(cities obj)
        {
            DataTable DT = BLL.ExecuteQuery("EXEC USP_CITIES @OPERATION='CITYCHANGE',@city_id="+ obj.city_id +"");
            return DT;
        }
        internal static DataTable GetSelectedCity(int obj)
        {
            DataTable DT = BLL.ExecuteQuery("EXEC USP_CITIES @OPERATION='CITYCHANGE',@city_id=" + obj+ "");
            return DT;
        }
        internal static DataTable GETLOCATION(LOCATIONS obj)
        {
  
            DataTable DT = BLL.ExecuteQuery("EXEC USP_GETTINGLOCATIONS @OPERATION='GETLOCATION',@LOCATION_CITYID='"+obj.LOCATION_CITYID+"'");
            return DT;
        }
      
        internal static DataTable GETALLPRODUCTS()
        {
          
            DataTable dt = BLL.ExecuteQuery("EXEC USP_PRODUCTS @OPERATION='GETALLPRODUCTS' ");
            return dt;
        }
        internal static DataTable GETSELECTPRODUCTS(int cityid)
        {
            PRODUCT obj = new PRODUCT();
            DataTable dt = BLL.ExecuteQuery("EXEC USP_PRODUCTS @OPERATION='GETSELECTPRODUCTS',@PRODUCT_CITYID='" + cityid + "' ");
            return dt;
        }
        
        internal static DataTable GETPRODUCTBYID(string PRODUCTID)
        {
            DataTable dt = BLL.ExecuteQuery("EXEC USP_PRODUCTS @OPERATION='GETPRODUCTBYID',@PRODUCT_ID='"+ PRODUCTID +"'");
            return dt;
        }
        //internal static DataTable DELETE_CARTITEM(string PRODUCTID)
        //{
        //    DataTable dt = BLL.ExecuteQuery("EXEC USP_PRODUCT @OPERATION='DELETE_CARTITEM',@PRODUCT_ID='" + PRODUCTID + "'");
        //    return dt;
        //}

        //internal static DataTable GETPRODUCT_CART(string PRODUCTID)
        //{
        //    DataTable dt = BLL.ExecuteQuery("EXEC USP_PRODUCTS @OPERATION='GETPRODUCT_CART',@PRODUCT_ID='" + PRODUCTID + "'");
        //    return dt;
        //}
        internal static bool INSERTADDRESS(SHIPPINGADDRESS obj)
        {
            bool status = false;
            status = BLL.ExecuteNonQuery("EXEC USP_SHIPPINGADDRESS @OPERATION='INSERTCART',@ADD_FIRSTNAME='" + obj.ADD_FIRSTNAME + "',@ADD_EMAILID='" + obj.ADD_EMAILID + "',@ADD_PRIMARYPHONE='" + obj.ADD_PRIMARYPHONE + "',@ADD_ALTERNATEPHONE='" + obj.ADD_ALTERNATEPHONE + "',@ADD_COUNTRY='" + obj.ADD_COUNTRY + "',@ADD_CITY='" + obj.ADD_CITY + "',@ADD_STATE='" + obj.ADD_STATE + "',@ADD_ADDRESS2='" + obj.ADD_ADDRESS + "',@ADD_ADDRESS1='" + obj.ADD_ADDRESS2 + "',@ADD_CREATEDBY =1");
            return status;
        }
        internal static DataTable GETCOUPON(COUPONS obj)
        {
            DataTable dt = BLL.ExecuteQuery("EXEC USP_COUPON @OPERATION ='COUPON_PRICE',@COUPON_NAME='" + obj.COUPON_NAME + "'");
            return dt;
        }

        internal static DataTable GETVENDORS()
        {
            DataTable dt_vendors = BLL.ExecuteQuery("EXEC USP_VENDORS @OPERATION ='GETVENDORS'");
            return dt_vendors;
        }

        internal static DataTable GETVENDORBYID(int id)
        {
            DataTable dt_vendors = BLL.ExecuteQuery("EXEC USP_VENDORS @OPERATION ='SELECTVENDORBYID',@USER_ID="+ id +"");
            return dt_vendors;
        }

        internal static bool UPDATEVENDOR(USERS obj_user)
        {
            bool status = false;
            status = BLL.ExecuteNonQuery("EXEC USP_VENDORS @OPERATION ='UPDATINGVENDOR',@USER_ID=" + obj_user.USER_ID + ",@USER_FIRSTNAME='"+ obj_user.USER_FIRSTNAME + "',@USER_EMAILID='"+ obj_user.USER_EMAILID + "',@USER_PASSWORD='"+ obj_user.USER_PASSWORD + "',@USER_PHONE='"+ obj_user.USER_PHONE +"'");
            return status;
        }

        internal static bool SAVEVENDOR(USERS obj_user)
        {
            bool status = false;
            status = BLL.ExecuteNonQuery("EXEC USP_VENDORS @OPERATION ='SAVEVENDOR' ,@USER_FIRSTNAME='" + obj_user.USER_FIRSTNAME + "',@USER_EMAILID='" + obj_user.USER_EMAILID + "',@USER_PASSWORD='" + obj_user.USER_PASSWORD + "',@USER_PHONE='" + obj_user.USER_PHONE + "'");
            return status;
        }

        internal static bool DELETEVENDOR(int id)
        {
            bool status = false;
            status = BLL.ExecuteNonQuery("EXEC USP_VENDORS @OPERATION ='DELETEVENDOR',@USER_ID=" + id + "");
            return status;
        }
         internal static bool SHOPPING(SHOPPINGTRANSACTION obj)
        {
            bool status = false;
            status = BLL.ExecuteNonQuery("EXEC USP_SHOPPINGTRANSACTION @OPERATION='SHOPPING',@TRANS_CREATEDBY='"+obj.TRANS_CREATEDBY+ "',@TRANS_TOTALAMOUNT='"+obj.TRANS_TOTALAMOUNT+ "',@TRANS_STATUS='"+1+ "',@TRANS_COMMENTS='"+obj.TRANS_COMMENTS+ "',@TRANS_PAYMENTTYPE='"+obj.TRANS_PAYMENTTYPE+ "',@TRANS_NUMBER='"+obj.TRANS_NUMBER + "',@TRANS_MODIFIEDBY='"+obj.TRANS_MODIFIEDBY+"'");
                return status;
        }
        internal static bool SHOPPINGMAIN(SHOPPINGTRANSACTION objshoptrans,MAINCART obj)
        {
            bool status = false;
            status = BLL.ExecuteNonQuery("EXEC USP_SHOPPINGTRANSACTION @OPERATION='SHOPPING',@MAINCART_STATUS='" + 1+ "',@MAINCART_USERID='"+obj.MAINCART_USERID+ "',@MAINCART_COUPONID='"+obj.MAINCART_COUPONID+ "',@MAINCART_NOOFAUDIENCE='"+obj.MAINCART_NOOFAUDIENCE+ "',@MAINCART_STARTDATE='"+obj.MAINCART_STARTDATE + "',@MAINCART_ENDDATE='"+obj.MAINCART_ENDDATE + "',@MAINCART_NOOFDAYS='"+obj.MAINCART_NOOFDAYS + "',@MAINCART_SUBTOTAL='"+obj.MAINCART_SUBTOTAL + "',@MAINCART_SHIPPINGCOST='"+obj.MAINCART_SHIPPINGCOST + "',@MAINCART_DISCOUNTEDPRICE='"+obj.MAINCART_DISCOUNTEDPRICE + "',@MAINCART_TOTALPRICE='"+obj.MAINCART_TOTALPRICE + "',@MAINCART_CREATEDBY='"+obj.MAINCART_CREATEDBY + "'");
            return status;
        }

        internal static bool  SHOPPINGCARTINSERT(SHOPPINGCART obj)
        {
            bool status = false;
            status = BLL.ExecuteNonQuery("EXEC USP_SHOPPINGCART @OPERATION='SHOPPINGCART',@CART_PRODUCTID='"+obj.CART_PRODUCTID+ "',@CART_UNITPRICE='"+obj.CART_UNITPRICE + "',@CART_QUANTITY='"+obj.CART_QUANTITY + "',@CART_TOTALPRICE='"+obj.CART_TOTALPRICE + "',@CART_CREATEDBY=1,@CART_STATUS=1");
            return status;
        }


        internal static DataTable GETUSERS()
        {
            DataTable dt_users = BLL.ExecuteQuery("EXEC USP_USERS @OPERATION ='GETUSERS'");
            return dt_users;
        }
        internal static DataTable GETMAINCART()
        {
            DataTable dt_maincart = BLL.ExecuteQuery("EXEC USP_MAINCART @OPERATION='GETMAINCART'");
            return dt_maincart;
        }

        internal static DataTable GETCART_DETAILS(int VENDORID,int VENDOR_CITYID)
        {
            DataTable dt_cartdetails = BLL.ExecuteQuery("EXEC USP_SHOPPINGTRANSACTION @OPERATION='CART_VENDER',@D_VENDORID="+ VENDORID +",@MAINCART_CITY='"+ VENDOR_CITYID + "'");

            return dt_cartdetails;
        }
        internal static DataTable GET_CART_RESULT_SHOW_ADMIN()
        {
            DataTable dt_cartdetails = BLL.ExecuteQuery("EXEC USP_SHOPPINGTRANSACTION @OPERATION='CART_ADMIN'");

            return dt_cartdetails;
        }

        internal static DataTable GETSALES_REPORT(int ADMINID)
        {
            DataTable dt_cartdetails = BLL.ExecuteQuery("EXEC USP_SHOPPINGTRANSACTION @OPERATION='CART_ADMIN',@D_VENDORID=" + ADMINID + "");

            return dt_cartdetails;
        }

        internal static DataTable GETCART_ACCEPET_SHOW(int VENDORID)
        {
            DataTable dt_accepet_show = BLL.ExecuteQuery("EXEC USP_SHOPPINGTRANSACTION @OPERATION='VENDOR_ACCEPETED_SHOW',@MAINCART_ACCEPETEDBY='" + VENDORID + "'");
            return dt_accepet_show;
        }

        internal static DataTable GETCART_ADMIN(int ADMINID )
        {
            DataTable dt_cartdetails = BLL.ExecuteQuery("EXEC USP_SHOPPINGTRANSACTION @OPERATION='CART_ADMIN',@D_VENDORID=" + ADMINID + "");

            return dt_cartdetails;
        }
        internal static bool INSERT_CITIES(cities obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_INSERTCITIES @OPERATION='INSERT_CITIES', @CITY_NAME='" + obj.city_name + "',@CITY_CREATEDBY=1,@CITies_STATUS=1");
            return status;
        }
        internal static bool INSERT_LOCATION(LOCATIONS OBJ)
        {
            bool STATUS = BLL.ExecuteNonQuery("EXEC USP_INSERTCITIES @OPERATION='INSERT_LOCATION', @LOCATION_NAME='" + OBJ.LOCATION_NAME + "',@LOCATION_CITYID='" + OBJ.LOCATION_CITYID + "',@LOCATION_CREATEDBY=1,@LOCATION_STATUS=1");
            return STATUS;
        }
        internal static DataTable VENDOR_ACCEPET(int id, MAINCART OBJ)
        {
            DataTable dt = BLL.ExecuteQuery("EXEC Usp_shoppingtransaction @OPERATION='VENDOR_ACCEPET',@MAINCART_ID='" + id + "',@MAINCART_ACCEPETEDBY='" + OBJ.MAINCART_ACCEPETEDBY + "'");
            return dt;
        }

        internal static DataTable VENDOR_DECLINE(int id, DECLINEDPRODUCTSBYUSER obj)
        {
            DataTable dt = BLL.ExecuteQuery("EXEC USP_DECLINED @OPERATION='INSERT_DECLINED',@D_MAINCARTID='" + id + "',@D_VENDORID='" + obj.D_VENDORID + "',@D_CREATEDBY=1");
            return dt;
        }
        internal static DataTable VENDOR_LOGIN(vendors obj)
        {

            DataTable dt = BLL.ExecuteQuery("EXEC Usp_newvendors @OPERATION='VENDOR_LOGIN',@VENDOR_EMAIL='" + obj.VENDOR_EMAIL + "',@VENDOR_PASSWORD='" + obj.VENDOR_PASSWORD + "'");
            return dt;

        }

        internal static DataTable VENDORFORGETPWD(vendors obj)
        {
            DataTable dt = BLL.ExecuteQuery("EXEC Usp_newvendors @OPERATION='VENDORFORGETPWD',@VENDOR_EMAIL='" + obj.VENDOR_EMAIL + "'");
            return dt;
        }

        internal static bool INSERT_VENDORS(vendors obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_NEWVENDORS @OPERATION='INSERT_VENDORS',@VENDOR_NAME='" + obj.VENDOR_NAME + "',@VENDOR_EMAIL='" + obj.VENDOR_EMAIL + "',@VENDOR_PASSWORD='" + obj.VENDOR_PASSWORD + "',@VENDOR_CONFORMPASSWORD='" + obj.VENDOR_CONFORMPASSWORD + "',@VENDOR_PINCODE='" + obj.VENDOR_PINCODE + "',@VENDOR_BUSINESSNAME='" + obj.VENDOR_BUSINESSNAME + "',@VENDOR_ADDRESS='" + obj.VENDOR_ADDRESS + "',@VENDOR_LANDNUMBER='" + obj.VENDOR_LANDNUMBER + "',@VENDOR_PANCARDNUMBER='" + obj.VENDOR_PANCARDNUMBER + "',@VENDOR_IDENTIFICATIONNUMBER='" + obj.VENDOR_IDENTIFICATIONNUMBER + "',@VENDOR_ACCOUNTHOLDERNAME='" + obj.VENDOR_ACCOUNTHOLDERNAME + "',@VENDOR_ACCOUNTNUMBER='" + obj.VENDOR_ACCOUNTNUMBER + "',@VENDOR_ACCOUNTTYPE='" + obj.VENDOR_ACCOUNTTYPE + "',@VENDOR_IFSCODE='" + obj.VENDOR_IFSCODE + "',@VENDOR_BANKNAME='" + obj.VENDOR_BANKNAME + "',@VENDOR_BRANCH='" + obj.VENDOR_BRANCH + "',@VENDOR_STATE='" + obj.VENDOR_STATE + "',@VENDOR_CITY='" + obj.VENDOR_CITY + "',@VENDOR_CREATEDBY=1,@VENDOR_MODIFIEDBY=1,@VENDOR_STATUS=1,@VENDOR_PHONE='" + obj.VENDOR_PHONE + "',@VENDOR_ALTERPHONE='" + obj.VENDOR_ALTERPHONE + "',@BANK_CITY='" + obj.BANK_CITY + "',@VENDOR_LOCATION='" + obj.VENDOR_LOCATION + "',@VENDOR_CITYID='" + obj.VENDOR_CITYID+"'");
            return status;
        }

        internal static DataTable GETVENDOR_DETAILS()
        {
            DataTable dt_vendors = BLL.ExecuteQuery("EXEC USP_NEWVENDORS @OPERATION='SELECT_VENDORS'");
            return dt_vendors;
        }
        internal static DataTable GETVENDOR_DETAILSBYID(int ID)
        {
            DataTable DT_VENDORS = BLL.ExecuteQuery("SELECT * FROM VENDORS WHERE VENDOR_ID='" + ID + "'");
            return DT_VENDORS;
        }
        internal static bool updatevendor_details(vendors obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_NEWVENDORS @OPERATION='UPDATE_VENDORS',@VENDOR_NAME='" + obj.VENDOR_NAME + "',@VENDOR_EMAIL='" + obj.VENDOR_EMAIL + "',@VENDOR_PASSWORD='" + obj.VENDOR_PASSWORD + "',@VENDOR_ACCOUNTHOLDERNAME='" + obj.VENDOR_ACCOUNTHOLDERNAME + "',@VENDOR_ACCOUNTNUMBER='" + obj.VENDOR_ACCOUNTNUMBER + "',@VENDOR_IFSCODE='" + obj.VENDOR_IFSCODE + "',@VENDOR_BANKNAME='" + obj.VENDOR_BANKNAME + "',@VENDOR_BRANCH='" + obj.VENDOR_BRANCH + "',@VENDOR_CITY='" + obj.VENDOR_CITY + "',@VENDOR_STATUS='" + obj.VENDOR_STATUS + "',@VENDOR_PHONE='" + obj.VENDOR_PHONE + "',@VENDOR_LOCATION='" + obj.VENDOR_LOCATION + "',@BANK_CITY='" + obj.BANK_CITY + "',@VENDOR_ID='" + obj.VENDOR_ID + "'");
            return status;
        }
        internal static bool DELETEVENDOR_DETAILS(int id)
        {
            bool status = BLL.ExecuteNonQuery("update vendors set vendor_status=2 WHERE VENDOR_ID='" + id + "'");
            return status;
        }


        internal static bool  INSERT_PRODUCTTYPES(PRODUCT_TYPE obj)
        {
              bool status = BLL.ExecuteNonQuery ("EXEC USP_PRODUCT_TYPE @OPERATION='INSERT_PRODUCTTYPE',@PRODUCTTYPE_STATUS=1,@PROD_ID='" + obj.PROD_ID + "',@PRODUCT_TYPID='" + obj.PRODUCT_TYPID + "'");
            return status;
        }
        internal static DataTable GETTYPES()
        {
            DataTable DT = BLL.ExecuteQuery("EXEC TYPE @OPERATION='SELECT_TYPE'");
            return DT;
        }



        internal static DataTable INSERT_PRODUCT(PRODUCT obj)
        {

            DataTable status = BLL.ExecuteQuery("EXEC USP_INSERT_PRODUCT @OPERATION='INSERT_PRODUCT',@PRODUCT_NAME='" + obj.PRODUCT_NAME + "',@PRODUCT_DESC='" + obj.PRODUCT_DESC + "',@PRODUCT_IMAGEURL='" + obj.PRODUCT_IMAGEURL + "',@PRODUCT_IMAGETITLE='" + obj.PRODUCT_IMAGETITLE + "',@PRODUCT_CREATEDBY=1,@PRODUCT_STATUS=1,@PRODUCT_TITLE='" + obj.PRODUCT_TITLE + "',@PRODUCT_PRICE='" + obj.PRODUCT_PRICE + "',@PRODUCT_CITYID='"+obj.PRODUCT_CITYID+"'");
            return status;
        }
        internal static DataTable GET_ALLPRODUCTS()
        {
            DataTable DT_ALLPRODUCT = BLL.ExecuteQuery("EXEC Usp_productS @OPERATION='ALL_PRODUCTS'");
            return DT_ALLPRODUCT;
        }
        internal static DataTable GET_PRODUCTTYPESBY(int id)
        {
            DataTable GET_TYPES = BLL.ExecuteQuery("EXEC USP_PRODUCT_TYPE @OPERATION='PRODUCTID_TYPES',@PROD_ID='" + id + "'");
            return GET_TYPES;
        }




        internal static bool updateproduct(PRODUCT OBJ)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_PRODUCTS @OPERATION='upadete_product',@PRODUCT_NAME='" + OBJ.PRODUCT_NAME + "',@PRODUCT_IMAGETITLE='" + OBJ.PRODUCT_IMAGETITLE + "',@PRODUCT_DESC='" + OBJ.PRODUCT_DESC + "',@PRODUCT_TITLE='" + OBJ.PRODUCT_TITLE + "',@PRODUCT_PRICE='" + OBJ.PRODUCT_PRICE + "',@PRODUCT_ID='" + OBJ.PRODUCT_ID + "',@PRODUCT_IMAGEURL='" + OBJ.PRODUCT_IMAGEURL + "'");
            return status;
        }

        internal static bool deletetype(int id)

        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_PRODUCT_TYPE @OPERATION='DELETE_TYPE',@PRODUCTTYPE_ID='" + id + "'");
            return status;
        }
        internal static DataTable vendorsbyid(int id)
        {
            DataTable dt_vendor = BLL.ExecuteQuery("EXEC USP_NEWVENDORS @OPERATION='getvendorsbyid',@VENDOR_ID='" + id + "'");
            return dt_vendor;
        }

        internal static bool DELETEPRODUCT(int ID)
        {
            bool STAUS = BLL.ExecuteNonQuery("EXEC USP_PRODUCTS @OPERATION='delete_product',@PRODUCT_ID='" + ID + "'");
            return STAUS;
        }
        internal static DataTable GETPRODUCTID(int Id)
        {
            DataTable STATUS = BLL.ExecuteQuery("SELECT * FROM PRODUCT WHERE PRODUCT_ID='" + Id + "'");
            return STATUS;


        }

        internal static DataTable GETDATEDIFF(string startdate,string enddate)
        {
            DataTable dt = BLL.ExecuteQuery("EXEC Usp_shoppingtransaction @OPERATION='ADMIN_SALES_REPORT',@MAINCART_STARTDATE='" + startdate+"',@MAINCART_ENDDATE='"+enddate+"'");
            return dt;
        }

        internal static DataTable GETVENDORSSALES(string startdate, string enddate, int vendorid)
        {
            DataTable dt = BLL.ExecuteQuery("EXEC Usp_shoppingtransaction @OPERATION='VENDOR_SALES_REPORT',@MAINCART_ACCEPETEDBY='"+ vendorid + "', @MAINCART_STARTDATE='" + startdate + "',@MAINCART_ENDDATE='" + enddate + "'");
            return dt;
        }

        internal static DataTable SELECTCOUPON(COUPONS obj)
        {
            DataTable dt = BLL.ExecuteQuery("EXEC USP_COUPON @OPERATION ='GETCOUPON'");
            return dt;
        }
        internal static bool INSERTCOUPON(COUPONS obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_COUPON @OPERATION ='INSERT_COUPON',@COUPON_NAME='" + obj.COUPON_NAME + "',@COUPON_DISCOUNT='" + obj.COUPON_DISCOUNT + "',@COUPON_PRICE='" + obj.COUPON_PRICE + "'");
            return status;
        }
        internal static bool DELETECOUPON(COUPONS obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_COUPON @OPERATION ='DELETE_COUPON',@COUPON_ID='" + obj.COUPON_ID + "'");
            return status;
        }
        internal static DataTable SELECTTYPES()
        {
            DataTable DT = BLL.ExecuteQuery("EXEC USP_TYPES @OPERATION='SELECT_TYPE'");
            return DT;
        }

        internal static bool INSERT_TYPES(TYPES obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_TYPES @OPERATION='INSERT_TYPES',@TYPE_NAME='" + obj.TYPE_NAME + "'");
            return status;
        }

        internal static bool UPDATE_TYPES(TYPES obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_TYPES @OPERATION='UPDATE_TYPE', @TYPE_NAME='" + obj.TYPE_NAME + "',@TYPE_ID='" + obj.TYPE_ID + "'");
            return status;
        }
        internal static bool DELETE_TYPES(TYPES obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_TYPES @OPERATION='DELETE_TYPE',@TYPE_ID='" + obj.TYPE_ID + "'");
            return status;
        }
        internal static DataTable GETSELECTED_TYPE(TYPES obj)
        {
            DataTable DT = BLL.ExecuteQuery("EXEC USP_TYPES @OPERATION='GETSELECTED_TYPE',@TYPE_ID='" + obj.TYPE_ID + "'");
            return DT;
        }
        internal static bool delete_city(cities obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_CITIES @OPERATION='DELETE_CITY',@city_id=" + obj.city_id + "");
            return status;
        }

        internal static bool UPDATE_CITY(cities obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_CITIES @OPERATION='UPDATE_CITY', @CITY_NAME='" + obj.city_name + "', @city_id=" + obj.city_id + "");
            return status;
        }
        internal static bool delete_location(LOCATIONS obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC Usp_gettinglocations @OPERATION='DELETE_LOCATION',@LOCATION_ID=" + obj.LOCATION_ID + "");
            return status;
        }
        internal static bool update_location(LOCATIONS obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC Usp_gettinglocations @OPERATION='UPDATE_LOCATION',  @LOCATION_NAME='" + obj.LOCATION_NAME + "'  , @LOCATION_ID=" + obj.LOCATION_ID + "");
            return status;
        }

        internal static DataTable GETLOCATIONBYID(LOCATIONS obj)
        {

            DataTable DT = BLL.ExecuteQuery("EXEC USP_GETTINGLOCATIONS @OPERATION='GETLOCATION_BYID',@LOCATION_ID='" + obj.LOCATION_ID + "'");
            return DT;
        }
        internal static DataTable insert_careers(careers obj)
        {
            DataTable status = BLL.ExecuteQuery("EXEC usp_careers @operation='insert',@fullname='" + obj.fullname + "',@email='" + obj.email + "',@phone='" + obj.phone + "',@position='" + obj.position + "'");
            return status;
        }

        internal static bool sendemail(string message, string subject, string fromemail, string toemail)
        {
            bool status = false;
            MailMessage mailmessage = new MailMessage();
            mailmessage.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("chaloindia.net");

            client.Credentials = new System.Net.NetworkCredential("support@chaloindia.net", "chalo123");
            mailmessage.From = new System.Net.Mail.MailAddress(fromemail);

            // mailmessage.From = new MailAddress("santhosh@pragatipadh.com");
            mailmessage.To.Add(toemail);
            mailmessage.Bcc.Add(fromemail);
            // mailmessage.CC.Add(emailid);
            mailmessage.Subject = subject;

            mailmessage.Body = message;
            client.EnableSsl = false;
            try
            {

                client.Send(mailmessage);
                status = true;
            }
            catch (Exception ae)
            {
                status = false;
            }
            return status;

        }
        internal static DataTable GETSUBTYPESBYTYPEID(productsubtype obj)
        {

            DataTable DT = BLL.ExecuteQuery("EXEC usp_subtype @OPERATION='selectsubtypebyid',@type_maintypeid='" + obj.TYPE_MAINTYPEID + "'");
            return DT;
        }
        internal static DataTable GETSUBTYPESBYID(productsubtype obj)
        {

            DataTable DT = BLL.ExecuteQuery("EXEC usp_subtype @OPERATION='selectsubtype',@type_id='" + obj.TYPE_ID + "'");
            return DT;
        }
        internal static bool DELETESUBTYPE(productsubtype obj)
        {

            bool status = BLL.ExecuteNonQuery("EXEC usp_subtype @OPERATION='deletesubtype',@type_id='" + obj.TYPE_ID + "'");
            return status;
        }
        internal static bool UPDATE_SUBTYPE(productsubtype obj)
        {

            bool status = BLL.ExecuteNonQuery("EXEC usp_subtype @OPERATION='updatesubtype',@type_id='" + obj.TYPE_ID + "',@type_name='" + obj.TYPE_NAME + "'");
            return status;
        }
        internal static bool INSERT_SUBTYPE(productsubtype obj)
        {

            bool status = BLL.ExecuteNonQuery("EXEC usp_subtype @OPERATION='insertsubtype',@type_name='" + obj.TYPE_NAME + "',@type_maintypeid='" + obj.TYPE_MAINTYPEID + "',@type_status=1");
            return status;
        }




        internal static DataTable SELECT_MASTERPRODUCT()
        {

            DataTable dt_master = BLL.ExecuteQuery("EXEC usp_masterproduct @OPERATION='SELECT_MASTERPRODUCT'");
            return dt_master;
        }
        internal static DataTable select_mastreproductbyid(int id)
        {
            DataTable dt_master = BLL.ExecuteQuery("EXEC usp_masterproduct @OPERATION='addtolive',@MPRODUCT_ID='" + id + "'");
            return dt_master;
        }
        internal static bool insertproduct(PRODUCT obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC usp_products @OPERATION='producttypesadd',@PRODUCT_TYPEID='" + obj.PRODUCT_TYPEID + "',@PRODUCT_SUBTYPEID='" + obj.PRODUCT_SUBTYPEID + "',@PRODUCT_NAME='" + obj.PRODUCT_NAME + "',@PRODUCT_CITYID='" + obj.PRODUCT_CITYID + "',  @PRODUCT_DESC='" + obj.PRODUCT_DESC + "',@PRODUCT_IMAGEURL='" + obj.PRODUCT_IMAGEURL + "',@PRODUCT_IMAGETITLE='" + obj.PRODUCT_IMAGETITLE + "',@PRODUCT_CREATEDBY=1, @PRODUCT_STATUS=1, @PRODUCT_TITLE='" + obj.PRODUCT_TITLE + "',  @PRODUCT_PRICE='" + obj.PRODUCT_PRICE + "',@PRODUCT_MASTERTYPEID='" + obj.PRODUCT_MASTERTYPEID + "'");
            return status;
        }

        internal static DataTable GETPRODUCTBYMASTERID(int id)
        {
            DataTable dt_master = BLL.ExecuteQuery("EXEC usp_products @OPERATION='SELECTPRODUCTBYMASTERID',@PRODUCT_MASTERTYPEID='" + id + "'");
            return dt_master;
        }
        internal static bool UPDATEPRODUCTTYPES(PRODUCT OBJ, int id)
        {
            bool status = BLL.ExecuteNonQuery("EXEC usp_products @OPERATION='UPDATEPRODUCTTYPES',@PRODUCT_TYPEID='" + OBJ.PRODUCT_TYPEID + "',@PRODUCT_SUBTYPEID='" + OBJ.PRODUCT_SUBTYPEID + "',@PRODUCT_PRICE='" + OBJ.PRODUCT_PRICE + "',@PRODUCT_ID='" + id + "'");
            return status;
        }
        internal static DataTable SELECTPRODUCTBYID(int id)
        {
            DataTable dt_product = BLL.ExecuteQuery("EXEC USP_PRODUCTS @OPERATION='SELECTBYPRODUCTID',@PRODUCT_ID='" + id + "'");
            return dt_product;
        }
        internal static bool DELETEMASTERPRODUCT(int id)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_MASTERPRODUCT @OPERATION='DELETEPRODUCT',@MPRODUCT_ID='" + id + "'");
            return status;

        }
        internal static bool updatemproduct(MASTERPRODUCT obj, int ID)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_MASTERPRODUCT @OPERATION='UPDATEMASTERPRODUCT', @MPRODUCT_NAME='" + obj.MPRODUCT_NAME + "',@MPRODUCT_DESC='" + obj.MPRODUCT_DESC + "',@MPRODUCT_IMAGEURL='" + obj.MPRODUCT_IMAGEURL + "',@MPRODUCT_IMAGETITLE='" + obj.MPRODUCT_IMAGETITLE + "',@MPRODUCT_CITYID='" + obj.MPRODUCT_CITYID + "',@MPRODUCT_ID='" + ID + "'");
            return status;
        }

        internal static bool updatepro(PRODUCT OBJ, int ID)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_PRODUCTS @OPERATION='upadete_pro',@PRODUCT_NAME='" + OBJ.PRODUCT_NAME + "',@PRODUCT_IMAGETITLE='" + OBJ.PRODUCT_IMAGETITLE + "',@PRODUCT_DESC='" + OBJ.PRODUCT_DESC + "',@PRODUCT_TITLE='" + OBJ.PRODUCT_TITLE + "',@PRODUCT_CITYID='" + OBJ.PRODUCT_CITYID + "',@PRODUCT_MASTERTYPEID='" + ID + "',@PRODUCT_IMAGEURL='" + OBJ.PRODUCT_IMAGEURL + "'");
            return status;
        }
        internal static bool insert_masterproduct(MASTERPRODUCT obj)
        {
            bool status = BLL.ExecuteNonQuery("EXEC USP_MASTERPRODUCT @OPERATION='INSERT_MASTERPRODUCT',@MPRODUCT_NAME='" + obj.MPRODUCT_NAME + "',@MPRODUCT_DESC='" + obj.MPRODUCT_DESC + "',@MPRODUCT_IMAGEURL='" + obj.MPRODUCT_IMAGEURL + "',@MPRODUCT_IMAGETITLE='" + obj.MPRODUCT_IMAGETITLE + "',@MPRODUCT_CITYID='" + obj.MPRODUCT_CITYID + "',@MPRODUCT_TITLE='" + obj.MPRODUCT_TITLE+"'");
            return status;
        }

    }
}