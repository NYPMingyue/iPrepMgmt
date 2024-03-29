﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffLoginPage.aspx.cs" Inherits="iPrepMgmt.StaffLoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Staff Login</title>

        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
<%--<style type="text/css">
            .auto-style1 {
                background: white;
                width: 778px;
                border-radius: 6px;
                margin: 0 auto 0 auto;
                padding: 0px 0px 70px 0px;
                border: #2980b9 4px solid;
                height: 247px;
            }

</style>--%>
</head>
<body id="page-top">
<form id="form1" runat="server">
            <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top">SIT Claim Mgmt System</a><button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu <i class="fas fa-bars"></i></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="Home.aspx">Home</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="AdminLoginPage.aspx">iPrep Admin</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="StaffLoginPage.aspx">Staff</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="StudentLoginPage.aspx">Student</a></li>
                    </ul>
                </div>
            </div>
        </nav>

    <h1>&nbsp;</h1>
    <h1>Staff Login</h1>

                <asp:Label ID="lblum" runat="server" Text="Username"></asp:Label>
&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblpassword" runat="server" Text="Password"></asp:Label>
&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox2" runat="server" input type="password"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnlogin" runat="server" class="button button1" OnClick="Button1_Click" Text="Login" Width="122px" />
    <!-- End Btn -->

    <!-- End Btn2 -->
    <br />
    <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
    </form>
             <!-- Footer-->
        <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Location</h4>
                        <p class="lead mb-0">180 Ang Mo Kio Avenue 8<br />Singapore, 569830</p>
                    </div>
                    <!-- Footer Social Icons-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Social Medias</h4>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-facebook-f"></i></a><a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-twitter"></i></a><a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-linkedin-in"></i></a><a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-dribbble"></i></a>
                    </div>
                    <!-- Footer About Text-->
                    <div class="col-lg-4">
                        <h4 class="text-uppercase mb-4">Contact Us</h4>
                        <p class="lead mb-0">Tel: 6451 5115 / Email: askNYP@nyp.edu.sg</p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Copyright Section-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Copyright © Nanyang Polytechnic 2020</small></div>
        </div>

            <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

</body>
</html>

<script>
    function field_focus(field, email) {
        if (field.value == email) {
            field.value = '';
        }
    }

    function field_blur(field, email) {
        if (field.value == '') {
            field.value = email;
        }
    }

    //Fade in dashboard box
    $(document).ready(function () {
        $('.box').hide().fadeIn(1000);
    });

    //Stop click event
    $('a').click(function (event) {
        event.preventDefault();
    });
</script>
