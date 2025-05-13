<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="MRBS.user.contact" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>QuickBook</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../frontend/img/favicon.ico" rel="icon">

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
                          
                           <a href="room.aspx" class="nav-item nav-link">Rooms</a>
                           <div class="nav-item dropdown">
                               <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                               <div class="dropdown-menu rounded-0 m-0">
                                   <a href="YourRooms.aspx" class="dropdown-item">Your Rooms</a>
                                 
                               </div>
                           </div>
                           <a href="contact.aspx" class="nav-item nav-link active">Contact</a>
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
                    <h1 class="display-3 text-white mb-3 animated slideInDown">Contact</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Contact</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Page Header End -->




        <!-- Contact Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">Contact Us</h6>
                    <h1 class="mb-5"><span class="text-primary text-uppercase">Contact</span> For Any Query</h1>
                </div>
                <div class="row g-4">
                    <div class="col-12">
                        <div class="row gy-4">
                            <div class="col-md-4">
                                <h6 class="section-title text-start text-primary text-uppercase">Booking</h6>
                                <p><i class="fa fa-envelope-open text-primary me-2"></i>QuickBooking@example.com</p>
                            </div>
                            <div class="col-md-4">
                                <h6 class="section-title text-start text-primary text-uppercase">General</h6>
                                <p><i class="fa fa-envelope-open text-primary me-2"></i>QuickBookrooms@example.com</p>
                            </div>
                            <div class="col-md-4">
                                <h6 class="section-title text-start text-primary text-uppercase">Technical</h6>
                                <p><i class="fa fa-envelope-open text-primary me-2"></i>QuickBooktech@example.com</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 wow fadeIn" data-wow-delay="0.1s">
                        <iframe class="position-relative rounded w-100 h-100"
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3001156.4288297426!2d-78.01371936852176!3d42.72876761954724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4ccc4bf0f123a5a9%3A0xddcfc6c1de189567!2sNew%20York%2C%20USA!5e0!3m2!1sen!2sbd!4v1603794290143!5m2!1sen!2sbd"
                            frameborder="0" style="min-height: 350px; border:0;" allowfullscreen="" aria-hidden="false"
                            tabindex="0"></iframe>
                    </div>
                    <div class="col-md-6">
                        <div class="wow fadeInUp" data-wow-delay="0.2s">
                            
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <asp:TextBox ID="txtName" type="text" runat="server" CssClass="form-control" placeholder="Your Name"></asp:TextBox>
                                    <label for="txtName">Your Name</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <asp:TextBox ID="txtEmail" type="text" runat="server" CssClass="form-control" placeholder="Your Email"></asp:TextBox>
                                    <label for="txtEmail">Your Email</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <asp:TextBox ID="txtPhone" type="number" runat="server" CssClass="form-control" placeholder="Phone No"></asp:TextBox>
                                    <label for="txtPhone">Phone No</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-floating">
                                    <asp:TextBox ID="txtSubject" type="text" runat="server" CssClass="form-control" placeholder="Subject" required></asp:TextBox>
                                    <label for="txtSubject">Subject</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-floating">
                                    <asp:TextBox ID="txtMessage" type="text" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" placeholder="Message" required></asp:TextBox>
                                    <label for="txtMessage">Message</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <asp:Button ID="btnSubmit"   runat="server" CssClass="btn btn-primary w-100 py-3" Text="Send Message" OnClick="btnSubmit_Click" />
                            </div>
                        </div>



                            

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->


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
							
							<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
							Designed By <a class="border-bottom" href="#">Yadnesh & Yash</a>
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

    function showMessage(status) {
        if (status === "success") {
            alert("Message Sent Successfully!");
            setTimeout(function () {
                // Redirect instead of reloading to break loop
                window.location.href = window.location.href.split('?')[0];
            }, 1000);
        } else {
            alert("Error! Please try again.");
        }
    } 

</script>

        </form>
  
</body>

</html>