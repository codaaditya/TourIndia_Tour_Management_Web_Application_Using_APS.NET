<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FeedBack.aspx.cs" Inherits="WebApplication11.FeedBack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="form1" runat="server">
        <div class="feedback-container">
            <h2>Feedback Form</h2>

            <asp:TextBox ID="txtName" runat="server" CssClass="input-field" Placeholder="Your Name"></asp:TextBox>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" Placeholder="Your Email"></asp:TextBox>
            <asp:TextBox ID="txtSubject" runat="server" CssClass="input-field" Placeholder="Subject"></asp:TextBox>
            <asp:TextBox ID="txtMessage" runat="server" CssClass="textarea-field" TextMode="MultiLine" Placeholder="Your Message"></asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" CssClass="submit-btn" Text="Send Feedback" OnClick="btnSubmit_Click"/>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
    </form>
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder1">
              
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8"><title>TRAVELER - Free Travel Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
    <!-- Topbar Start -->
   <div class="container-fluid bg-light pt-3 d-none d-lg-block">
    <div class="container">
        <div class="row">
            <!-- Contact Info -->
            <div class="col-lg-6 text-center text-lg-left mb-2 mb-lg-0">
                <div class="d-inline-flex align-items-center">
                    <p><i class="fa fa-envelope mr-2"></i> info@tour.com</p>
                    <p class="text-body px-3">|</p>
                    <p><i class="fa fa-phone-alt mr-2"></i> +012 345 6789</p>
                </div>
            </div>

            <!-- Social Media Links -->
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <!-- Instagram -->
                    <a class="text-primary px-3" href="https://www.instagram.com/codeaaditya?igsh=MXJoaWpyZWoycWJpbw==" target="_blank">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <!-- WhatsApp -->
                    <a class="text-success px-3" href=" https://wa.me/918271298959 " target="_blank">
                        <i class="fab fa-whatsapp"></i>
                    </a>
                    <!-- Add to Cart -->
                    <a class="text-warning px-3" href="AddToCart.aspx">
                        <i class="fas fa-shopping-cart"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

    <!-- Topbar End -->

<!-- Navbar Start -->
        <div class="container-fluid position-relative nav-bar p-0">
            <div class="container-lg position-relative p-0 px-lg-3" style="z-index: 9;">
                <nav class="navbar navbar-expand-lg bg-light navbar-light shadow-lg py-3 py-lg-0 pl-3 pl-lg-5">
                    <a href="" class="navbar-brand">
                    <h1 class="m-0 text-primary"><span class="text-dark">Tour</span>India</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                        <div class="navbar-nav ml-auto py-0">
                             <a href="Home.aspx" class="nav-item nav-link active">Home</a> <a href="Package.aspx" class="nav-item nav-link">Tour Packages</a> <a href="PackageBooking.aspx" class="nav-item nav-link">Booking Report</a>
                              <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu border-0 rounded-0 m-0">
                                <a href="Contact.aspx" class="dropdown-item">Contact Us</a>
                                <a href="FeedBack.aspx" class="dropdown-item">FeedBack</a>
                                <a href="About.aspx" class="dropdown-item">About</a>
                            </div>
                            </div>
                            <a href="Signup.aspx" class="nav-item nav-link">Sign Up</a> <a href="Login.aspx" class="nav-item nav-link">Login</a>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">
                            <asp:Image ID="pImage" runat="server" CssClass="rounded-circle" Width="40" Height="40" />
                            <asp:Label ID="lblUser" runat="server" CssClass="ml-2"></asp:Label>
                            </a>
                            <div class="dropdown-menu border-0 rounded-0 m-0">
                                <a href="Profile.aspx" class="dropdown-item">Profile</a> <a href="Logout.aspx" class="dropdown-item">Logout</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
    <!-- Navbar End -->
            </asp:Content>


