<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="iPrepMgmt.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image--><img class="masthead-avatar mb-5" src="assets/img/nyplogo.png" alt=""/><!-- Masthead Heading-->
                <%--<h1 class="masthead-heading text-uppercase mb-0">Start Bootstrap</h1>--%>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">IMDA aims to build a competitive and sustainable infocomm media industry, developing Singapore as a nucleus for media content, services and applications, while growing the seed of technological innovation and fostering collaboration between local and multinational corporations in the sectors.</p>
            </div>
        </header>
        <!-- About Section-->
        <section class="page-section bg-primary text-white mb-0" id="about">
            <div class="container">
                <!-- About Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-white">About</h2>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- About Section Content-->
                <div class="row">
                    <div class="col-lg-4 ml-auto"><p class="lead">IMDA strives to create an environment for Singapore to develop quality content, exploit opportunities in digital media and move up the value chain. Already, Singapore’s broadcast, film, publishing, animation and interactive media and games have been recognised worldwide for their ground-breaking originality and high quality.</p></div>
                    <div class="col-lg-4 mr-auto"><p class="lead">It is also IMDA’s goal to foster an ecosystem where local infocomm companies and startups can work alongside the world’s top MNCs and innovative foreign firms to develop the “next big thing” for the industry.</p></div>
                </div>
                <!-- About Section Button-->
                <div class="text-center mt-4">
                    <%--<a class="btn btn-xl btn-outline-light" href="https://startbootstrap.com/themes/freelancer/"><i class="fas fa-download mr-2"></i>Free Download!</a>--%>
                </div>
            </div>
        </section>
</asp:Content>
