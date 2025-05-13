<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MRBS.index" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="Header.ascx" %>
<%@ Register TagPrefix="uc" TagName="Footer" Src="Footer.ascx" %>

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
    <link href="frontend/lib/animate/animate.min.css" rel="stylesheet">
    <link href="frontend/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="frontend/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="frontend/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="frontend/css/style.css" rel="stylesheet">
    <script>
        /* Add this CSS to your stylesheet */
.custom - dropdown {
            background: rgba(255, 255, 255, 0.15);
            backdrop - filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            box - shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            transition: all 0.3s ease -in -out;
            z - index: 1000;
        }

.custom - item {
            color: #ffffff;
            font - weight: 500;
            transition: background 0.2s ease -in -out, transform 0.2s ease -in -out;
        }

.custom - item:hover {
            background - color: rgba(255, 255, 255, 0.2);
            transform: translateX(4px);
            border - radius: 10px;
            color: #ffdd57;
        }

    </script>
</head>

<body>
    <form id="form1" runat="server">
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
             <a href="index.aspx" class="navbar-brand w-100 h-100 m-0 p-0 d-flex align-items-center justify-content-center">
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
                 <a href="index.aspx" class="navbar-brand d-block d-lg-none">
                     <h1 class="m-0 text-primary text-uppercase">QuickBook</h1>
                 </a>
                
                 <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                     <span class="navbar-toggler-icon"></span>
                 </button>
                 <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                     <div class="navbar-nav mr-auto py-0">
                         <a href="index.aspx" class="nav-item nav-link active">Home</a>
                         <!--<a href="about.aspx" class="nav-item nav-link">About</a>
                         <a href="service.aspx" class="nav-item nav-link">Services</a>
                   
                        <div class="nav-item dropdown">
                             <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                             <div class="dropdown-menu rounded-0 m-0">
                                 <a href="booking.html" class="dropdown-item">Booking</a>
                                 <a href="team.html" class="dropdown-item">Our Team</a>
                                 <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                             </div>
                         </div>
                         <a href="contact.aspx" class="nav-item nav-link">Contact</a>
                     </div>-->
                     <div class="nav-item dropdown">
                         <a href="#" class="btn btn-primary rounded-0 py-4 px-md-5 d-none d-lg-block dropdown-toggle" data-bs-toggle="dropdown">
                             Sign in<i class="fa fa-arrow-right ms-3"></i>
                         </a>
                            <div class="dropdown-menu custom-dropdown rounded-3 p-2 animate__animated animate__fadeIn">
                                <a href="user/User_Sign_In.aspx" class="dropdown-item custom-item">👤 User</a>
                                <a href="admin/Admin_Sign_in.aspx" class="dropdown-item custom-item">🛠 Admin</a>
                            </div>

                     </div>
                 </div>
             </nav>                    
         </div>
     </div>
 </div>
        <!-- Header End -->


        <!-- Carousel Start -->
        <div class="container-fluid p-0 mb-5">
            <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="w-100" src="frontend/img/carousel-1.jpg" alt="Image">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h6 class="section-title text-white text-uppercase mb-3 animated slideInDown">QuickBook Rooms</h6>
                                <h1 class="display-3 text-white mb-4 animated slideInDown">Book, Meet, Succeed – Your Space, Your Time, Simplified!</h1>
                                <a href="../user/User_Sign_In.aspx" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Book A Room</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="w-100" src="frontend/img/carousel-2.jpg" alt="Image">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h6 class="section-title text-white text-uppercase mb-3 animated slideInDown">QuickBook Rooms</h6>
                                <h1 class="display-3 text-white mb-4 animated slideInDown">Book, Meet, Succeed – Your Space, Your Time, Simplified!</h1>
                
                               <a href="../user/User_Sign_In.aspx" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Book A Room</a>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!-- Carousel End -->


        <!-- Booking Start -->
        <!--
        <div class="container-fluid booking pb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container">
                <div class="bg-white shadow" style="padding: 35px;">
                    <div class="row g-2">
                        <div class="col-md-10">
                            <div class="row g-2">
                                <div class="col-md-3">
                                    <div class="date" id="date1" data-target-input="nearest">
                                        <input type="text" class="form-control datetimepicker-input"
                                            placeholder="From" data-target="#date1" data-toggle="datetimepicker" />
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="date" id="date2" data-target-input="nearest">
                                        <input type="text" class="form-control datetimepicker-input" placeholder="To" data-target="#date2" data-toggle="datetimepicker"/>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <select class="form-select">
                                        <option selected>Type</option>
                                        <option value="1">AC</option>
                                        <option value="2">Non AC</option>
                                    </select>
                                </div>
                                <div class="col-md-3">
                                    <select class="form-select">
                                        <option selected>Capacity</option>
                                        <option value="1">50</option>
                                        <option value="2">100</option>
                                        <option value="3">200</option>
                                        <option value="4">300</option>
                                        <option value="5">500</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-primary w-100">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>-->
        <!-- Booking End -->
        

        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6">
                        <h6 class="section-title text-start text-primary text-uppercase">About Us</h6>
                        <h1 class="mb-4">Welcome to <span class="text-primary text-uppercase">QuickBook</span></h1>
                        <p class="mb-4">कृपया थांबा आपली साईट चालू आहे तरी सर्वांनी प्रतीक्षा करा</p>
                        <div class="row g-3 pb-4">
                            <div class="col-sm-4 wow fadeIn" data-wow-delay="0.1s">
                                <div class="border rounded p-1">
                                    <div class="border rounded text-center p-4">
                                        <i class="fa fa-hotel fa-2x text-primary mb-2"></i>
                                        <h2 class="mb-1" data-toggle="counter-up">1234</h2>
                                        <p class="mb-0">Rooms</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 wow fadeIn" data-wow-delay="0.3s">
                                <div class="border rounded p-1">
                                    <div class="border rounded text-center p-4">
                                        <i class="fa fa-users-cog fa-2x text-primary mb-2"></i>
                                        <h2 class="mb-1" data-toggle="counter-up">1234</h2>
                                        <p class="mb-0">Staffs</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 wow fadeIn" data-wow-delay="0.5s">
                                <div class="border rounded p-1">
                                    <div class="border rounded text-center p-4">
                                        <i class="fa fa-users fa-2x text-primary mb-2"></i>
                                        <h2 class="mb-1" data-toggle="counter-up">1234</h2>
                                        <p class="mb-0">Clients</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="btn btn-primary py-3 px-5 mt-2" href="#scroll">Explore More</a>
                    </div>
                    <div class="col-lg-6">
                        <div class="row g-3">
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.1s" src="frontend/img/about-1.jpg" style="margin-top: 25%;">
                            </div>
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.3s" src="frontend/img/about-2.jpg">
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-50 wow zoomIn" data-wow-delay="0.5s" src="frontend/img/about-3.jpg">
                            </div>
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.7s" src="frontend/img/about-4.jpg">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Room Start -->
        <div class="container-xxl py-5" id="scroll">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">Our Rooms</h6>
                    <h1 class="mb-5">Explore Our <span class="text-primary text-uppercase">Rooms</span></h1>
                </div>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="room-item shadow rounded overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="frontend/img/audi-1.jpeg" alt="">
                                <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">₹100</small>
                            </div>
                            <div class="p-4 mt-2">
                                <div class="d-flex justify-content-between mb-3">
                                    <h5 class="mb-0">Audi - 1</h5>
                                  
                                </div>
                                <div class="d-flex mb-3">
                                    <small class="border-end me-3 pe-3"><i class=""></i>Cap - 500</small>
                                    <small class="border-end me-3 pe-3"><i class=""></i>All Equipments Available</small>
                                    <small><i class=""></i>AC</small>
                                </div>
                                <p class="text-body mb-3">Pimpri Chinchwad</p>
                                <div class="d-flex justify-content-between">
                                    <a class="btn btn-sm btn-primary rounded py-2 px-4" href="/user/User_Sign_In.aspx">View Detail</a>
                                    <a class="btn btn-sm btn-dark rounded py-2 px-4" href="/user/User_Sign_In.aspx">Book Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="room-item shadow rounded overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="frontend/img/con.jpeg" alt="">
                                <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">₹100</small>
                            </div>
                            <div class="p-4 mt-2">
                                <div class="d-flex justify-content-between mb-3">
                                    <h5 class="mb-0">Conference Room</h5>
                                    
                                </div>
                                <div class="d-flex mb-3">
                                    <small class="border-end me-3 pe-3"><i class=""></i>Cap - 300</small>
                                    <small class="border-end me-3 pe-3"><i class=""></i>All Equipments Available</small>
                                    <small><i class="fa fa-ac text-primary me-2"></i>Non AC</small>
                                </div>
                                <p class="text-body mb-3">Pune</p>
                                <div class="d-flex justify-content-between">
                                    <a class="btn btn-sm btn-primary rounded py-2 px-4" href="/user/User_Sign_In.aspx">View Detail</a>
                                    <a class="btn btn-sm btn-dark rounded py-2 px-4" href="/user/User_Sign_In.aspx">Book Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.6s">
                        <div class="room-item shadow rounded overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="frontend/img/meet.jpg" alt="">
                                <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">₹100</small>
                            </div>
                            <div class="p-4 mt-2">
                                <div class="d-flex justify-content-between mb-3">
                                    <h5 class="mb-0">Meeting Room</h5>
                                    <!--<div class="ps-2">
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                        <small class="fa fa-star text-primary"></small>
                                    </div>-->
                                </div>
                                <div class="d-flex mb-3">
                                    <small class="border-end me-3 pe-3"><i class=""></i>Cap - 20</small>
                                    <small class="border-end me-3 pe-3"><i class=""></i>Only Projector</small>
                                    <small><i class="fa fa-ac text-primary me-2"></i>AC</small>
                                </div>
                                <p class="text-body mb-3">Mumbai</p>
                                <div class="d-flex justify-content-between">
                                    <a class="btn btn-sm btn-primary rounded py-2 px-4" href="/user/User_Sign_In.aspx">View Detail</a>
                                    <a class="btn btn-sm btn-dark rounded py-2 px-4" href="/user/User_Sign_In.aspx">Book Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Room End -->


       <!-- Video Start -->
<div class="container-xxl py-5 px-0 wow zoomIn" data-wow-delay="0.1s">
    <div class="row g-0">
        <div class="col-md-6 bg-dark d-flex align-items-center">
            <div class="p-5">
                <h6 class="section-title text-start text-white text-uppercase mb-3">QuickBook Rooms</h6>
                <h1 class="text-white mb-4">Book, Meet, Succeed – Your Space, Your Time, Simplified!</h1>
                <p class="text-white mb-4">Book, Meet, Succeed – Your Space, Your Time, Simplified!</p>
      
                <a href="/user/User_Sign_In.aspx" class="btn btn-light py-md-3 px-md-5">Book A Room</a>
            </div>
        </div>
        <div class="col-md-6">
            <!-- Removed the image/video placeholder -->
        </div>
    </div>
</div>

<div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content rounded-0">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Youtube Video</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 16:9 aspect ratio -->
                <div class="ratio ratio-16x9">
                    <iframe class="embed-responsive-item" src="https://youtu.be/TWcSSDtSz0o?si=-4kSroVQLDkX0PdW" id="video" allowfullscreen allowscriptaccess="always"
                        allow="autoplay"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Video Start -->

        <!-- Service Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">Our Services</h6>
                    <h1 class="mb-5">Explore Our <span class="text-primary text-uppercase">Services</span></h1>
                </div>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <a class="service-item rounded" href="">
                            <div class="service-icon bg-transparent border rounded p-1">
                                <div class="w-100 h-100 border rounded d-flex align-items-center justify-content-center">
                                    <i class="fa fa-hotel fa-2x text-primary"></i>
                                </div>
                            </div>
                            <h5 class="mb-3">Audi & Halls</h5>
                            <p class="text-body mb-0">ICCS</p>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.2s">
                        <a class="service-item rounded" href="">
                            <div class="service-icon bg-transparent border rounded p-1">
                                <div class="w-100 h-100 border rounded d-flex align-items-center justify-content-center">
                                    <i class="fa fa-hotel fa-2x text-primary"></i>
                                </div>
                            </div>
                            <h5 class="mb-3">Meeting Rooms</h5>
                            <p class="text-body mb-0">Meet.</p>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <a class="service-item rounded" href="">
                            <div class="service-icon bg-transparent border rounded p-1">
                                <div class="w-100 h-100 border rounded d-flex align-items-center justify-content-center">
                                    <i class="fa fa-hotel fa-2x text-primary"></i>
                                </div>
                            </div>
                            <h5 class="mb-3">Conference Room</h5>
                            <p class="text-body mb-0">Concon Rooms.</p>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.4s">
                        <a class="service-item rounded" href="">
                            <div class="service-icon bg-transparent border rounded p-1">
                                <div class="w-100 h-100 border rounded d-flex align-items-center justify-content-center">
                                    <i class="fa fa-hotel fa-2x text-primary"></i>
                                </div>
                            </div>
                            <h5 class="mb-3">Tech Enhacned Spaces</h5>
                            <p class="text-body mb-0">Techy.</p>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <a class="service-item rounded" href="">
                            <div class="service-icon bg-transparent border rounded p-1">
                                <div class="w-100 h-100 border rounded d-flex align-items-center justify-content-center">
                                    <i class="fa fa-glass-cheers fa-2x text-primary"></i>
                                </div>
                            </div>
                            <h5 class="mb-3">Event & Party</h5>
                            <p class="text-body mb-0">Event & Party.</p>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.6s">
                        <a class="service-item rounded" href="">
                            <div class="service-icon bg-transparent border rounded p-1">
                                <div class="w-100 h-100 border rounded d-flex align-items-center justify-content-center">
                                    <i class="fa fa-hotel fa-2x text-primary"></i>
                                </div>
                            </div>
                            <h5 class="mb-3">Informal Rooms</h5>
                            <p class="text-body mb-0">Informal Rooms.</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Service End -->


        <!-- Testimonial Start -->
        <div class="container-xxl testimonial my-5 py-5 bg-dark wow zoomIn" data-wow-delay="0.1s">
            <div class="container">
                <div class="owl-carousel testimonial-carousel py-5">
                    <div class="testimonial-item position-relative bg-white rounded overflow-hidden">
                        <p>"The service was exceptional, and the team went above and beyond to meet our needs. Highly recommended!"</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded" src="frontend/img/testimonial-1.jpg" style="width: 45px; height: 45px;">
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
                            <img class="img-fluid flex-shrink-0 rounded" src="frontend/img/testimonial-2.jpg" style="width: 45px; height: 45px;">
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
                            <img class="img-fluid flex-shrink-0 rounded" src="frontend/img/testimonial-3.jpg" style="width: 45px; height: 45px;">
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


        <!-- Team Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">Our Team</h6>
                    <h1 class="mb-5">Explore Our <span class="text-primary text-uppercase">Staffs</span></h1>
                </div>
                <div class="row g-4">
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="rounded shadow overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="frontend/img/team-1.jpg" alt="">
                                <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                           <div class="text-center p-4 mt-3">
                                <h5 class="fw-bold mb-0">David Reynolds</h5>
                                <small>Software Engineer</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="rounded shadow overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="frontend/img/team-2.jpg" alt="">
                                <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                                <div class="text-center p-4 mt-3">
                                    <h5 class="fw-bold mb-0">Sophia Martinez</h5>
                                    <small>Product Manager</small>
                                </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="rounded shadow overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="frontend/img/team-3.jpg" alt="">
                                <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                                <div class="text-center p-4 mt-3">
                                    <h5 class="fw-bold mb-0">Liam Bennett</h5>
                                    <small>Data Analyst</small>
                                </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                        <div class="rounded shadow overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="frontend/img/team-4.jpg" alt="">
                                <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-facebook-f"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-twitter"></i></a>
                                    <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                                <div class="text-center p-4 mt-3">
                                    <h5 class="fw-bold mb-0">Emma Johnson</h5>
                                    <small>UX Designer</small>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->


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
                    <a href="index.aspx"><h1 class="text-white text-uppercase mb-3">QuickBook</h1></a>
                    <p class="text-white mb-0">
						QuickBook <a class="text-dark fw-medium" href="https://htmlcodex.com/hotel-html-template-pro"></a>
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
					
					<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
					Designed & Created By <a class="border-bottom" href="#">Yadnesh & Yash</a>
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
    <script src="frontend/lib/wow/wow.min.js"></script>
    <script src="frontend/lib/easing/easing.min.js"></script>
    <script src="frontend/lib/waypoints/waypoints.min.js"></script>
    <script src="frontend/lib/counterup/counterup.min.js"></script>
    <script src="frontend/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="frontend/lib/tempusdominus/js/moment.min.js"></script>
    <script src="frontend/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="frontend/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="frontend/js/main.js"></script>
</form>
</body>
</html>

