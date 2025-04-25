<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WebApplication11.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Payment Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
    .whatsapp-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    background-color: #25D366;
    color: white;
    font-size: 14px;
    font-weight: 600;
    padding: 10px 18px; /* Balanced padding for a button-like look */
    border: none;
    border-radius: 6px;
    text-decoration: none;
    transition: background 0.3s ease-in-out;
    min-width: auto; /* Prevents it from stretching */
    width: fit-content; /* Keeps the button compact */
    }

    .whatsapp-btn i {
    margin-left: 6px;
    font-size: 16px;
    }

    .whatsapp-btn:hover {
    background-color: #1EBE5D;
    }


    </style>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


    <div class="container mt-5">
        <h2 class="text-center">Tour Payment</h2>
         <form id="form1" runat="server">
    <div class="package-details-container">
        <asp:DataList ID="dlTourPackagepay" runat="server" RepeatLayout="Table" OnItemCommand="dlTourPackagepay_ItemCommand" OnSelectedIndexChanged="dlTourPackagepay_SelectedIndexChanged">
            <ItemTemplate>
                <div class="package-box">
                    <!-- Tour Image -->
                    <div class="package-image">
                         <img src='<%# ResolveUrl("~/admin/" + Eval("ImagePath")) %>' alt="Tour Image" width="200" height="200" />
                    </div>

                    <div class="package-header">
                        <h1><%# Eval("PackageName") %></h1>
                        <span class="price">₹ <%# Eval("AdultAmount") %> / Per Adult</span>

                    </div>
                    <div class="package-info">
                         <p><strong>Tour Date:</strong> <%# Eval("TourDate", "{0:dd-MM-yyyy}") %></p>
                         <p><strong>Number of People Allowed:</strong> <%# Eval("NoOfPerson") %></p>
                    </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
             
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    
            <div class="form-group">
                <label>Full Name:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Amount:</label>
                <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Payment Method:</label>
                <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="form-control">
                    <asp:ListItem>Credit Card</asp:ListItem>
                    <asp:ListItem>Debit Card</asp:ListItem>
                    <asp:ListItem>Net Banking</asp:ListItem>
                    <asp:ListItem>UPI</asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button ID="btnPay" runat="server" Text="Proceed to Pay" CssClass="btn btn-success" OnClick="btnPay_Click" />
        </form>

        <div class="mt-3">
            <asp:Label ID="lblMessage" runat="server" CssClass="text-success" Visible="false"></asp:Label>
        </div>
         <a id="A2" class="whatsapp-btn" href="https://wa.me/918271298959?text=Hello, I am interested in your tour packages." target="_blank">
    Connect with WhatsApp <i class="fab fa-whatsapp"></i></a>
    </div>
</body>
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
                            <p>
                                <i class="fa fa-envelope mr-2"></i>info@tour.com</p>
                            <p class="text-body px-3">
                                |</p>
                            <p>
                                <i class="fa fa-phone-alt mr-2"></i>+012 345 6789</p>
                        </div>
                    </div>

            <!-- Social Media Links -->
                    <div class="col-lg-6 text-center text-lg-right">
                        <div class="d-inline-flex align-items-center">
                    <!-- Instagram -->
                            <a class="text-primary px-3" href="https://www.instagram.com/codeaaditya?igsh=MXJoaWpyZWoycWJpbw==" target="_blank"><i class="fab fa-instagram"></i></a>
                    <!-- WhatsApp -->
                            <a class="text-success px-3" href=" https://wa.me/918271298959 " target="_blank"><i class="fab fa-whatsapp"></i></a>
                    <!-- Add to Cart -->
                            <a class="text-warning px-3" href="AddToCart.aspx"><i class="fas fa-shopping-cart"></i></a>
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


