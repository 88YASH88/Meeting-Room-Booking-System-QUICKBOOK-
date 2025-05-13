<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="room.aspx.cs" Inherits="MRBS.user.room" %>

<!DOCTYPE html>
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
     <script>
     function confirmLogout() {

         if (confirm("Are you sure you want to log out?")) {

             window.location.href = "User_Sign_Out.aspx"; 
         }
 
     }
     </script>
</head>

<body>
   <form runat="server">
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
                        <a href="Home.aspx" class="nav-item nav-link ">Home</a>
                       
                        <a href="room.aspx" class="nav-item nav-link active">Rooms</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="YourRooms.aspx" class="dropdown-item">Your Rooms</a>
                              
                            </div>
                        </div>
                        <a href="contact.aspx" class="nav-item nav-link">Contact</a>
                    </div>
                    <div class="nav-item dropdown">
                         <asp:Label ID="lblMessage" runat="server" Text="Label" class="btn btn-primary rounded-0 py-4 px-md-5 d-none d-lg-block dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-arrow-right ms-3"></i></asp:Label>
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
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Rooms</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            
                            <li class="breadcrumb-item text-white active" aria-current="page">Rooms</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


<!-- Booking Start -->
            <div class="container-fluid booking pb-5 wow fadeIn" data-wow-delay="0.1s">
                <div class="container">
                    <div class="bg-white shadow p-4">
                        <div class="row g-2">
                            <div class="col-md-10">
                                <div class="row g-2">
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Room Name" />
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" placeholder="Location" />
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Max Price" TextMode="Number" />
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtCapacity" runat="server" CssClass="form-control" placeholder="Min Capacity" TextMode="Number" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary w-100" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!-- Booking End -->





        <!-- Room Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">Our Rooms</h6>
                    <h1 class="mb-5">Explore Our <span class="text-primary text-uppercase">Rooms</span></h1>
                </div>
               <div class="row g-4">
               <asp:Repeater ID="roomsRepeater" runat="server">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6 wow fadeInUp room-item-container"
                        data-roomname="<%# Eval("RoomName") %>"
                        data-location="<%# Eval("Location") %>"
                        data-price="<%# Eval("Price") %>"
                        data-capacity="<%# Eval("Capacity") %>">
            
                        <div class="room-item shadow rounded overflow-hidden">
                            <div class="position-relative">
                        <asp:Image ID="imgRoom" runat="server" 
                        ImageUrl='<%# GetImageUrl(Eval("ImagePath")) %>'
                        CssClass="img-fluid" />

                          
                                <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">
                                    ₹<%# Eval("Price") %>
                                </small>
                            </div>
                            <div class="p-4 mt-2">
                                <div class="d-flex justify-content-between mb-3">
                                    <h5 class="mb-0"><%# Eval("RoomName") %></h5>
                                </div>
                                <div class="d-flex mb-3">
                                    <small class="border-end me-3 pe-3">
                                        <i class="fa fa-expand text-primary me-2"></i>Cap - <%# Eval("Capacity") %>
                                    </small>
                                    <small class="border-end me-3 pe-3">
                                        <i class="fa fa-toolbox text-primary me-2"></i><%# Eval("Equipments") %>
                                    </small>
                                    <small>
                                        <i class="fa fa-snowflake text-primary me-2"></i><%# Eval("AC_Type") %>
                                    </small>
                                </div>
                                <p class="text-body mb-3">Location: <%# Eval("Location") %></p>
                                <a class="btn btn-sm btn-dark rounded py-2 px-4"
                                   href="Cart.aspx?roomid=<%# Eval("RoomID") %>&roomName=<%# Eval("RoomName") %>&price=<%# Eval("Price") %>&capacity=<%# Eval("Capacity") %>&location=<%# Eval("Location") %>">
                                    Book Now
                                </a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
                </div>
                </div>
            </div>
        </div>
        <!-- Room End -->


        <!-- Testimonial Start -->
        <div class="container-xxl testimonial my-5 py-5 bg-dark wow zoomIn" data-wow-delay="0.1s">
            <div class="container">
                <div class="owl-carousel testimonial-carousel py-5">
                    <div class="testimonial-item position-relative bg-white rounded overflow-hidden">
                        <p>"The service was exceptional, and the team went above and beyond to meet our needs. Highly recommended!"</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="../frontend/img/testimonial-1.jpg" style="width: 45px; height: 45px;">
                            <div class="ps-3">
                                <h6 class="fw-bold mb-1">Sarah Thompson</h6>
                                <small>Marketing Director, TechCorp</small>
                            </div>
                        </div>
                        <i class="fa fa-quote-right fa-3x text-primary position-absolute end-0 bottom-0 me-4 mb-n1"></i>
                    </div>
                    <div class="testimonial-item position-relative bg-white rounded overflow-hidden">
                        <p>Absolutely fantastic experience! The team was professional, and the results exceeded my expectations.</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="../frontend/img/testimonial-2.jpg" style="width: 45px; height: 45px;">
                            <div class="ps-3">
                                <h6 class="fw-bold mb-1">James Anderson</h6>
                                <small>CEO, Innovate Solutions</small>
                            </div>
                        </div>
                        <i class="fa fa-quote-right fa-3x text-primary position-absolute end-0 bottom-0 me-4 mb-n1"></i>
                    </div>
                    <div class="testimonial-item position-relative bg-white rounded overflow-hidden">
                        <p>"Great attention to detail and outstanding customer service. I would definitely work with them again!"</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="../frontend/img/testimonial-3.jpg" style="width: 45px; height: 45px;">
                            <div class="ps-3">
                                <h6 class="fw-bold mb-1">Emily Carter</h6>
                                <small>Senior Designer, Creative Hub</small>
                            </div>
                        </div>
                        <i class="fa fa-quote-right fa-3x text-primary position-absolute end-0 bottom-0 me-4 mb-n1"></i>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->


        <!-- Newsletter Start -->
        <div class="container newsletter mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="row justify-content-center">
                <div class="col-lg-10 border rounded p-1">
                    <div class="border rounded text-center p-1">
                        <div class="bg-white rounded text-center p-5">
                            <h4 class="mb-4">Give us ur mail to <span class="text-primary text-uppercase">Notify</span></h4>
                            <div class="position-relative mx-auto" style="max-width: 400px;">
                                <input class="form-control w-100 py-3 ps-4 pe-5" type="text" placeholder="Enter your email">
                                <button type="button" class="btn btn-primary py-2 px-3 position-absolute top-0 end-0 mt-2 me-2">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Newsletter Start -->
        

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


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../frontend/lib/wow/wow.min.js"></script>
    <script src="../frontend/lib/easing/easing.min.js"></script>
    <script src="../frontend/lib/waypoints/waypoints.min.js"></script>
    <script src="../frontend/lib/counterup/counterup.min.js"></script>
    <script src="../frontend/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="../frontend/lib/tempusdominus/js/moment.min.js"></script>
    <script src="../frontend/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="../frontend/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="../frontend/js/main.js"></script>
       <script>
           function filterRooms() {
               let searchText = document.getElementById("txtSearch").value.trim().toLowerCase();
               let locationText = document.getElementById("txtLocation").value.trim().toLowerCase();
               let maxPriceText = document.getElementById("txtPrice").value.trim();
               let minCapacityText = document.getElementById("txtCapacity").value.trim();

               let maxPrice = maxPriceText ? parseFloat(maxPriceText) : null;
               let minCapacity = minCapacityText ? parseInt(minCapacityText) : null;

               let rooms = document.querySelectorAll(".room-item-container");

               rooms.forEach(room => {
                   let roomName = room.getAttribute("data-roomname").trim().toLowerCase();
                   let location = room.getAttribute("data-location").trim().toLowerCase();
                   let price = parseFloat(room.getAttribute("data-price"));
                   let capacity = parseInt(room.getAttribute("data-capacity"));

                   let show = true;

                   if (searchText && !roomName.includes(searchText)) {
                       show = false;
                   }
                   if (locationText && !location.includes(locationText)) {
                       show = false;
                   }
                   if (!isNaN(maxPrice) && price > maxPrice) {
                       show = false;
                   }
                   if (!isNaN(minCapacity) && capacity < minCapacity) {
                       show = false;
                   }

                   room.style.display = show ? "block" : "none";
               });
           }

       </script>

       </form>
</body>

</html>