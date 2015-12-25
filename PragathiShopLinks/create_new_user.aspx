﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="create_new_user.aspx.cs" Inherits="PragathiShopLinks.create_new_user" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Zoyalty</title>
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet"/>
    <link href="css/login.css" rel="stylesheet"/>  
</head>
<body  class="gray-bg">
    <form id="form1" runat="server">
         <div>
                 <h4><img src="Images/logo.png" class="logo-name" alt="Flatize"></h4>   
            </div>
         <h3>Create New Account</h3>


     <div id="create_users" runat="server" class="middle-box text-center loginscreen animated fadeInDown">
              <div class="form-group">
              <asp:TextBox ID="txt_new_user" runat="server" class="form-control" placeholder="Username" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="login"
                                                        ControlToValidate="txt_new_user" ErrorMessage="Enter valid Email" Display="Dynamic" SetFocusOnError="true" ForeColor="red">
                                            </asp:RequiredFieldValidator>
                    


             <asp:TextBox ID="txt_create_email" runat="server" class="form-control" placeholder="Email" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="login"
                                                        ControlToValidate="txt_create_email" ErrorMessage="Enter valid Email" Display="Dynamic" SetFocusOnError="true" ForeColor="red">
                                            </asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Display="Dynamic" ForeColor="red" ID="RegularExpressionValidator4" runat="server" 
       ErrorMessage="Enter a valid email address"
       ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
       ControlToValidate="txt_create_email" >
 </asp:RegularExpressionValidator>



             <asp:TextBox ID="txt_pwd" runat="server" TextMode="Password" class="form-control" placeholder="Password" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="login"
                                                        ControlToValidate="txt_pwd" ErrorMessage="Enter valid password" Display="Dynamic" SetFocusOnError="true" ForeColor="red">
                                            </asp:RequiredFieldValidator>



              <asp:TextBox ID="txt_createa_phone" runat="server" class="form-control" placeholder="Phone" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="login"
                                                        ControlToValidate="txt_createa_phone" ErrorMessage="Enter valid Email" Display="Dynamic" SetFocusOnError="true" ForeColor="red">
                                            </asp:RequiredFieldValidator>
                      <asp:Label runat="server" ID="lbl_emailcheck" Visible="false">Email already exisist</asp:Label>
              <asp:Button ID="btn_create_new_user" runat="server" class="btn btn-primary block full-width m-b" Text="SIGNUP" OnClick="btn_create_new_user_Click"  />
            </div>

        </div>
    </form>
</body>
</html>
