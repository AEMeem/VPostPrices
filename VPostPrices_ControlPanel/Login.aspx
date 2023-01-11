<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="VPostPrices_ControlPanel.NewLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8" />
    <title>لوحة التحكم في الأسعار </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="SP" name="description" />
    <meta content="sp.com.sa" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
     <link rel="shortcut icon" href="Resources/Images/LogoSPL.png">

    <link href="assets/css/bootstrap-material-dark.min.css" rel="stylesheet" type="text/css" id="bs_dark_stylesheet" />
    <link href="assets/css/app-material-dark-rtl.min.css" rel="stylesheet" type="text/css" id="app_dark_stylesheet" />
    <!-- App css -->
    <link href="assets/css/bootstrap-material.min.css" rel="stylesheet" type="text/css" id="bs_default_stylesheet" />
    <link href="assets/css/app-material-rtl.min.css" rel="stylesheet" type="text/css" id="app_default_stylesheet" />
    <!-- icons -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
   <link href="Resources/CSS/PostCSS.css" rel="stylesheet" />
    <!-- Datepicker jquery-ui CSS -->



    <link href="assets/libs/jquery-ui/jquery-ui.css" rel="stylesheet" />
    <link href="assets/libs/jquery-ui/jquery-ui.structure.css" rel="stylesheet" />
    <link href="assets/libs/jquery-ui/jquery-ui.theme.css" rel="stylesheet" />

    <link href="assets/css/sp.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
        .pull-right {
            float: left !important;
        }

        .pull-left {
            float: right !important;
        }

        body {
            background-color: #000;
        }

        .valid {
            position: absolute;
            color: #e63737;
            font-size: 23px;
            left: 24px;
            top: 10px;
            font-weight: bold;
        }

        div#error {
            background: #ffe3e3;
            color: #9c0f0f;
            padding: 9px;
            border: 1px solid;
            text-align: center;
        }
    </style>



    <style type="text/css">
        h1, h2, h3, h4, h5, h6, p, a, label {
            color: #909090 !important;
        }

            a:hover {
                color: #909090 !important;
            }

       .login-box {
            background-color: rgb(236, 236, 236);
            border-radius: 20px;
            border: 1px solid rgba(204, 204, 204, 0.63);
        }
        .btn-info, .btn-info.disabled {
            background: #075357;
            border: 1px solid#075357;
        }

            .btn-info:hover, .btn-info.disabled:hover {
                background: #136e81;
                border: 1px solid #136e81;
            }

        input.form-control {
            padding: 0 10px !important;
        }

        .none {
            display: none;
        }

        .alert-message {
            margin: 13px 0;
            padding: 13px;
            border-right: 5px solid #eee;
        }

            .alert-message h4 {
                margin-top: 0;
                margin-bottom: 5px;
            }

            .alert-message p:last-child {
                margin-bottom: 0;
            }

            .alert-message code {
                background-color: #fff;
                border-radius: 3px;
            }

        .alert-message-success {
            background-color: #F4FDF0;
            border-color: #3C763D;
        }

            .alert-message-success h4 {
                color: #3C763D;
            }

        .alert-message-danger {
            background-color: #fdf7f7;
            border-color: #d9534f;
        }

            .alert-message-danger h4 {
                color: #d9534f;
            }

        .alert-message-warning {
            background-color: #fcf8f2;
            border-color: #f0ad4e;
        }

            .alert-message-warning h4 {
                color: #f0ad4e;
            }

        .alert-message-info {
            background-color: #ffffff;
            border-color: #5bc0de;
        }

            .alert-message-info h4 {
                color: #5bc0de;
            }

        .alert-message-default {
            background-color: #EEE;
            border-color: #B4B4B4;
        }

            .alert-message-default h4 {
                color: #000;
            }

        .alert-message-notice {
            background-color: #FCFCDD;
            border-color: #BDBD89;
        }

            .alert-message-notice h4 {
                color: #444;
            }

        .text-danger-err {
            color: #f62d51 !important;
            font-size: 12px;
            font-weight: 700;
        }

        .login-register {
            overflow: auto;
        }

        .form-control {
            color: #13a8fd;
        }

        ::-webkit-input-placeholder { /* Edge */
            color: #616161 !important;
        }

        :-ms-input-placeholder { /* Internet Explorer */
            color: #3B3B3C !important;
        }

        ::placeholder {
            color: #434444 !important;
        }

        .userlogin {
            width: 142px;
            border-radius: 50%;
            border: 3px solid #8a8a8a;
            padding: 2px;
            margin-bottom: 18px;
            margin-top: 19px;
        }

        .login-register {
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  height: 100%;
  width: 100%;
  padding: 10% 0;
  position: fixed; }

.login-box {
  width: 400px;
  margin: 0 auto; }
  .login-box .footer {
    width: 100%;
    left: 0px;
    right: 0px; }
  .login-box .social {
    display: block;
    margin-bottom: 30px; }

#recoverform {
  display: none; }

.login-sidebar {
  padding: 0px;
  margin-top: 0px; }
  .login-sidebar .login-box {
    right: 0px;
    position: absolute;
    height: 100%; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
       <div class="login-register" style="background: #f2f7f8">
                <div class="login-box card animated zoomIn">
                    <div class="card-body">
                        <div class="form-horizontal form-material">
                            <div class="text-center p-b-10">

                                <img src="assets/images/find_user.png" />
                                <br />
                                <br />
                                <h3> لوحة التحكم في الأسعار</h3>
                                <h6>فضلاً ادخل البيانات المطلوبة لتسجيل الدخول </h6>
                            </div>
                            <div class="login-form" id="login_form">


                                
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <asp:TextBox ID="UserName" class="form-control" placeholder="إسم المستخدم" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ControlToValidate="UserName" ErrorMessage="الرجاء إدخال أسم المستخدم"></asp:RequiredFieldValidator>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <asp:TextBox ID="Paswword" class="form-control" placeholder=" كلمة السر" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ControlToValidate="Paswword" ErrorMessage="الرجاء إدخال كلمة المرور"></asp:RequiredFieldValidator>

                                    </div>
                                </div>
                                <div class="form-group col-9 col-milddle" style="display: none">

                                    <div class="clr"></div>
                                </div>
                                <div class="form-group action-raw  col-sm-12">
                                  
                                      <asp:Button ID="Button1" runat="server" class="btn btn-block btn-info" OnClick="Button1_Click" Text="الدخول" />
                                </div>


                                <div class="form-group   col-sm-12 animated zoomIn" >
                                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                                </div>



                            </div>

                        </div>



                    </div>

                </div>


            </div>

              </div>
    </form>
</body>
</html>
