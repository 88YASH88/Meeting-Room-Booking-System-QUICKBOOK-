<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YourRooms.aspx.cs" Inherits="MRBS.user.YourRooms" %>


<html lang="en">
<head>
    <meta charset="utf-8">
    <title>QuickBook</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../frontend/lib/animate/animate.min.css" rel="stylesheet">
    <link href="../frontend/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../frontend/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../frontend/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../frontend/css/style.css" rel="stylesheet">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<style>
    /* Card Styling */
    .custom-card {
        transition: all 0.3s ease-in-out;
        border-radius: 15px;
        overflow: hidden;
        /*border: 1px solid #FEA116;*/
    }

    .custom-card:hover {
        transform: scale(1.03);
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    }

    /* Image Styling */
    .custom-img {
        height: 220px;
        object-fit: cover;
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
    }

    /* Card Body */
    .custom-card-body {
        padding: 15px;
        background: #fff;
    }

    /* Title & Text Styling */
    .custom-card-title {
        font-size: 20px;
        font-weight: bold;
        color: #FEA116;
    }

    .custom-card-body p {
        margin-bottom: 5px;
        font-size: 14px;
    }

    /* Footer Styling */
    .custom-card-footer {
        /*background: #FEA116;*/
        color: white;
        padding: 10px;
        border-bottom-left-radius: 15px;
        border-bottom-right-radius: 15px;
    }

    /* Cancel Button */
    .btn-cancel {
        background: white;
        color: #FEA116;
        font-weight: bold;
        border: 2px solid #FEA116;
        transition: 0.3s;
    }

    .btn-cancel:hover {
        background: #FEA116;
        color: white;
    }

    /* Icon Styling */
    .icon {
        color: #000000;
        font-size: 20px;
        margin-right: 5px;
    }
    .footer {
    position: relative;
    margin-top: 80px;
    padding-top: 180px;
}
</style>
</head>

<body class="bg-gray-100">
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->

        <!-- Header Start -->
        <div class="container-fluid bg-dark px-0">
            <div class="row gx-0">
                <div class="col-lg-3 bg-dark d-none d-lg-block">
                    <a href="home.aspx" class="navbar-brand w-100 h-100 m-0 p-0 d-flex align-items-center justify-content-center">
                        <h1 class="m-0 text-primary text-uppercase">QuickBook</h1>
                    </a>
                </div>
                <div class="col-lg-9">
                    <div class="row gx-0 bg-white d-none d-lg-flex">
                        <div class="col-lg-7 px-5 text-start">
                            <div class="h-100 d-inline-flex align-items-center py-2 me-4">
                                <i class="fa fa-envelope text-primary me-2"></i>
                                <p class="mb-0">QuickBookrooms@gmail.com</p>
                            </div>
                            <div class="h-100 d-inline-flex align-items-center py-2">
                                <i class="fa fa-phone-alt text-primary me-2"></i>
                                <p class="mb-0">+91 1234567890</p>
                            </div>
                        </div>
                        <div class="col-lg-5 px-5 text-end">
                            <div class="d-inline-flex align-items-center py-2">
                                <a class="me-3" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="me-3" href=""><i class="fab fa-twitter"></i></a>
                                <a class="me-3" href=""><i class="fab fa-linkedin-in"></i></a>
                                <a class="me-3" href=""><i class="fab fa-instagram"></i></a>
                                <a class="" href=""><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                    <nav class="navbar navbar-expand-lg bg-dark navbar-dark p-3 p-lg-0">
                        <a href="Home.aspx" class="navbar-brand d-block d-lg-none">
                            <h1 class="m-0 text-primary text-uppercase">QuickBook</h1>
                        </a>
                        <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="Home.aspx" class="nav-item nav-link">Home</a>
                                <a href="room.aspx" class="nav-item nav-link">Rooms</a>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Pages</a>
                                    <div class="dropdown-menu rounded-0 m-0">
                                        <a href="YourRooms.aspx" class="dropdown-item active">Your Rooms</a>
                                    </div>
                                </div>
                                <a href="contact.aspx" class="nav-item nav-link">Contact</a>
                            </div>
                            <div class="nav-item dropdown">
                                <asp:Label ID="lblMessage" runat="server" class="btn btn-primary rounded-0 py-4 px-md-5 d-none d-lg-block dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-arrow-right ms-3"></i></asp:Label>
                                <div class="dropdown-menu rounded-0 m-0">
                                     <a href="#" class="dropdown-item" onclick="confirmLogout()">LogOut</a>
                                </div>
                            </div>
                        </div>
                    </nav>                    
                </div>
            </div>
        </div>
        <!-- Header End -->
                <!-- Page Header Start -->
        <div class="container-fluid page-header mb-5 p-0" style="background-image: url(../frontend/img/carousel-1.jpg);">
            <div class="container-fluid page-header-inner py-5">
                <div class="container text-center pb-5">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Your Rooms</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Your Rooms</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <!-- Table Section Start -->
<form runat="server" >
    <div class="container-xxl py-4 px-4">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card shadow">
                    <div class="card-body p-0">
                        <asp:Label ID="lblNoRooms" runat="server" CssClass="text-center d-block text-danger my-3" 
                            Text="No booked rooms found." Visible="false"></asp:Label>

                        <div class="row">
                            <asp:Repeater ID="rptBookedRooms" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-6 col-lg-4 mb-4">
                                        <div class="card custom-card h-100 shadow-sm">
                                            <!-- Room Image -->
                                                                        <asp:Image ID="imgRoom" runat="server" 
ImageUrl='<%# GetImageUrl(Eval("ImagePath")) %>'
 CssClass="card-img-top img-fluid custom-img"  />


                                            <!-- Card Content -->
                                            <div class="card-body custom-card-body">
                                                <h5 class="custom-card-title"><%# Eval("RoomName") %></h5>
                                                <p><i class="bi bi-cash-coin icon"></i><strong>Price:</strong> ₹<%# Eval("Price") %></p>
                                                <p><i class="bi bi-people-fill icon"></i><strong>Capacity:</strong> <%# Eval("Capacity") %></p>
                                                <p><i class="bi bi-geo-alt icon"></i><strong>Location:</strong> <%# Eval("Location") %></p>
                                                <p><i class="bi bi-calendar-check icon"></i><strong>Booking Date:</strong> <%# Convert.ToDateTime(Eval("BookingDate")).ToString("dd MMM yyyy | hh:mm tt") %></p>
                                                <p><i class="bi bi-door-open icon"></i><strong>Check-In:</strong> <%# Convert.ToDateTime(Eval("CheckIn")).ToString("dd MMM yyyy | hh:mm tt") %></p>
                                                <p><i class="bi bi-door-closed icon"></i><strong>Check-Out:</strong> <%# Convert.ToDateTime(Eval("CheckOut")).ToString("dd MMM yyyy | hh:mm tt") %></p>
                                            </div>

                                            <!-- Cancel Button -->
                                            <div class="card-footer text-center custom-card-footer">
                                                <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-cancel w-100"
                                                    Text="Cancel Booking" CommandName="Cancel" CommandArgument='<%# Eval("BookingID") %>'
                                                    OnCommand="CancelBooking"
                                                    OnClientClick="return confirm('Are you sure you want to cancel this booking?');" />
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div> <!-- End row -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

        <!-- Table Section End -->
                <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer wow fadeIn" data-wow-delay="0.1s">
            <div class="container pb-5">
                <div class="row g-5">
                    <div class="col-md-6 col-lg-4">
                        <div class="bg-primary rounded p-4">
                            <a href="home.aspx"><h1 class="text-white text-uppercase mb-3">QuickBook</h1></a>
                            <p class="text-white mb-0">
								QuickBook <a class="text-dark fw-medium" href=""></a>
							</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <h6 class="section-title text-start text-primary text-uppercase mb-4">Contact</h6>
                            <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>Pune, Maharashtra, India.</p>
                            <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+91 1234567890</p>
                            <p class="mb-2"><i class="fa fa-envelope me-3"></i>QuickBookrooms@gmail.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-12">
                        <div class="row gy-5 g-4">
                            <div class="col-md-6">
                                <h6 class="section-title text-start text-primary text-uppercase mb-4">Company</h6>
                                <a class="btn btn-link" href="">About Us</a>
                                <a class="btn btn-link" href="">Contact Us</a>
                                <a class="btn btn-link" href="">Privacy Policy</a>
                                <a class="btn btn-link" href="">Terms & Condition</a>
                                <a class="btn btn-link" href="">Support</a>
                            </div>
                            <div class="col-md-6">
                                <h6 class="section-title text-start text-primary text-uppercase mb-4">Services</h6>
                                <a class="btn btn-link" href="">Audi & Halls</a>
                                <a class="btn btn-link" href="">Meeting Rooms</a>
                                <a class="btn btn-link" href="">Conference Rooms</a>
                                <a class="btn btn-link" href="">Event & Party</a>
                                <a class="btn btn-link" href="">Tech Enhacned Spaces</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">QuickBook.co</a>, All Right Reserved. 
							
							
							Designed By <a class="border-bottom" href="">Yadnesh & Yash</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../frontend/lib/wow/wow.min.js"></script>
        <script src="../ frontend/lib/easing/easing.min.js"></script>
        <script src="../frontend/lib/waypoints/waypoints.min.js"></script>
        <script src="../frontend/lib/counterup/counterup.min.js"></script>
        <script src="../frontend/lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="../frontend/lib/tempusdominus/js/moment.min.js"></script>
        <script src="../frontend/lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="../frontend/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="../frontend/js/main.js"></script>
        <script>
               
           function confirmLogout() {

    if (confirm("Are you sure you want to log out?")) {
              
               window.location.href = "User_Sign_Out.aspx"; 
    }
  
}
        </script>
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>

    </div>
</body>
</html>
