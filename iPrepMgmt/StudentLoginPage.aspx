<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentLoginPage.aspx.cs" Inherits="iPrepMgmt.StudentLoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Student Login</title>


<%--Index.Master Code--%>
         <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    <%--End--%>

            <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="Home.aspx">SIT Claim Mgmt System</a><button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">Menu <i class="fas fa-bars"></i></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="Home.aspx">Home</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="ClaimProg.aspx">Claim Programme</a></li>
                        <%--<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="MainLogin.aspx">Login</a></li>--%>                        
                        <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Login</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown01">
                          <a class="dropdown-item" href="MainLogin.aspx">Staff</a>
                          <a class="dropdown-item" href="StudentLoginPage.aspx">Student</a>
                          <%--<a class="dropdown-item" href="#">Overseas Exposure</a>--%>
            </div>
          </li>

                    </ul>
                </div>
            </div>
        </nav>


<style type="text/css">
	.login-form {
		width: 340px;
    	margin: 50px auto;
	}
    .login-form form {
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .btn {        
        font-size: 15px;
        font-weight: bold;
    }
</style>
      <script type="text/javascript" language="javascript">

          function Validate() {

              var UName = document.getElementById('TextBox1');

              var Password = document.getElementById('TextBox2');

              if ((UName.value == '') || (Password.value == '')) {

                  alert('User Name or Password should not be blank');

                  return false;

              }

              else {

                  return true;

              }

          }

      </script>

</head>

<body>

    </br>
    </br>
    </br>
    </br>

    <div class="login-form">
<%--    <form action="AfterLoginAdmin.aspx" method="post">--%>
        <form runat="server">
        <h2 class="text-center">Log in</h2>       
        <div class="form-group">
            <%--<input type="text" class="form-control" name="uid" placeholder="User ID" required="required">--%>
            <asp:TextBox ID="TextBox_user_name" CssClass="form-control" placeholder="User ID" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <%--<input type="password" class="form-control" name="pwd" placeholder="Password" required="required">--%>
            <asp:TextBox ID="TextBox_password" CssClass="form-control"  placeholder="Password" input type="password" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <%--<button type="submit" class="btn btn-primary btn-block" id="btnLogin">Log in</button>--%>
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Width="281px" />
        </div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <div class="clearfix">
        </div>        
    </form>
</div>
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




  

