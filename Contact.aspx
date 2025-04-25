<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication11.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Contact Start -->
    <form id="contact" runat="server">
<div class="container-fluid py-5">
    <div class="container py-5">
        <div class="text-center mb-3 pb-3">
            <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Contact</h6>
            <h1>Contact For Any Query</h1>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="contact-form bg-white" style="padding: 30px;">
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-success"></asp:Label>
                    <asp:Panel ID="pnlContactForm" runat="server">
                        <div class="form-row">
                            <div class="control-group col-sm-6">
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control p-4" 
                                    placeholder="Your Name" required="required"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                    ControlToValidate="txtName" ErrorMessage="Please enter your name"
                                    CssClass="help-block text-danger" Display="Dynamic" />
                            </div>
                            <div class="control-group col-sm-6">
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control p-4" 
                                    placeholder="Your Email" required="required" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                    ControlToValidate="txtEmail" ErrorMessage="Please enter your email"
                                    CssClass="help-block text-danger" Display="Dynamic" />
                                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                    ControlToValidate="txtEmail"
                                    ErrorMessage="Invalid email format"
                                    ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
                                    CssClass="help-block text-danger" />
                            </div>
                        </div>
                        <div class="control-group">
                            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control p-4" 
                                placeholder="Subject" required="required"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" 
                                ControlToValidate="txtSubject" ErrorMessage="Please enter a subject"
                                CssClass="help-block text-danger" Display="Dynamic" />
                        </div>
                        <div class="control-group">
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control py-3 px-4"
                                placeholder="Message" TextMode="MultiLine" Rows="5" required="required"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMessage" runat="server" 
                                ControlToValidate="txtMessage" ErrorMessage="Please enter your message"
                                CssClass="help-block text-danger" Display="Dynamic" />
                        </div>
                        <div class="text-center">
                            <asp:Button ID="btnSend" runat="server" CssClass="btn btn-primary py-3 px-4" 
                                Text="Send Message" OnClick="btnSend_Click" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</div>
        </form>
<!-- Contact End -->

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
                            <a href="Signup.aspx" class="nav-item nav-link">Sign Up</a> 
                            <a href="Login.aspx" class="nav-item nav-link">Login</a>
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


