<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MRBS.user.Cart" %>

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

   
   <style>
      
       .img-container {
           display: flex;
           justify-content: center;
           align-items: center;
           width: 100%;
           height: auto;
           overflow: hidden;
           background-color: #f8f9fa;
           padding: 10px;
           border-radius: 10px;
       }
       .img-container img {
           max-width: 100%;
           height: auto;
           object-fit: contain; 
           border-radius: 10px;
       }

 
       .glowing-price {
           font-size: 1.3rem;
           font-weight: bold;
           color: #FEA116;
           animation: glowFade 2s infinite alternate ease-in-out;
       }

       @keyframes glowFade {
           0% {
               text-shadow: 0 0 10px rgba(254, 161, 22, 0.9);
               opacity: 1;
           }
           100% {
               text-shadow: 0 0 20px rgba(254, 161, 22, 0.5);
               opacity: 0.5;
           }
       }
   </style>
</head>

<body>
    
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

        <!-- Booking Cart Start -->
            <form id="form1" runat="server">
                <div class="container my-5">
                    <!-- Error Message Label -->
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" CssClass="d-block text-center mb-3"></asp:Label>

                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <div class="card shadow-lg p-4">
                                <div class="row">
                                    <!-- Room Image (Fits Without Cropping) -->
                                    <div class="col-md-5 d-flex align-items-center">
                                        <div class="img-container">
                                                                    <asp:Image ID="imgRoom" runat="server" 
                        ImageUrl='<%# GetImageUrl(Eval("ImagePath")) %>'
                        CssClass="img-fluid"  />
                                        </div>
                                    </div>

                                    <!-- Room Details -->
                                    <div class="col-md-7">
                                        <h3 class="mb-3">
                                            <asp:Label ID="lblRoomName" runat="server" CssClass="fw-bold"></asp:Label>
                                        </h3>
                            
                                        <!-- Price with Glow & Fade Effect -->
                                        <p class="glowing-price">
                                            <strong>Price: </strong>
                                            <asp:Label ID="lblPrice" runat="server"></asp:Label>
                                        </p>

                                        <p class="text-muted">
                                            <strong>Capacity: </strong>
                                            <asp:Label ID="lblCapacity" runat="server"></asp:Label>
                                        </p>
                                        <p class="text-muted">
                                            <strong>Location: </strong>
                                            <asp:Label ID="lblLocation" runat="server"></asp:Label>
                                        </p>

                                        <!-- Check-In & Check-Out Date & Time -->
                                        <div class="mb-3">
                                            <label class="form-label">Check-In Date & Time:</label>
                                            <asp:TextBox ID="txtCheckIn" runat="server" TextMode="DateTimeLocal" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Check-Out Date & Time:</label>
                                            <asp:TextBox ID="txtCheckOut" runat="server" TextMode="DateTimeLocal" CssClass="form-control"></asp:TextBox>
                                        </div>

                                        <!-- Go To Payment Button -->
                                        <div class="text-center">
                                            <asp:Button ID="btnGoToPayment" runat="server" CssClass="btn btn-primary px-4 py-2" 
                                                Text="Go To Payment" OnClick="btnGoToPayment_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- End of Card -->
                        </div>
                    </div>
                </div>

 
            </form>






        <!-- Booking Cart End -->



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
        
            function confirmLogout() {
  
     if (confirm("Are you sure you want to log out?")) {
                
                window.location.href = "User_Sign_Out.aspx"; 
     }
    
 }
    
       
        function updateMinDateTime() {
            let now = new Date();
            let today = now.toISOString().slice(0, 16); // Format: YYYY-MM-DDTHH:MM

            // Set minimum for check-in and check-out
            let checkInInput = document.getElementById('<%= txtCheckIn.ClientID %>');
            let checkOutInput = document.getElementById('<%= txtCheckOut.ClientID %>');

            checkInInput.setAttribute('min', today);
            checkOutInput.setAttribute('min', today);

            checkInInput.addEventListener('change', function () {
                let selectedCheckIn = new Date(this.value);
                if (selectedCheckIn < now) {
                    this.value = today; // Reset if past time is selected
                }
                checkOutInput.setAttribute('min', this.value); // Ensure check-out is after check-in
            });

            checkOutInput.addEventListener('change', function () {
                let selectedCheckOut = new Date(this.value);
                let selectedCheckIn = new Date(checkInInput.value);
                if (selectedCheckOut <= selectedCheckIn) {
                    this.value = ""; // Reset if checkout is before check-in
                    alert("Check-Out time must be after Check-In!");
                }
            });
        }

        window.onload = updateMinDateTime;
    

    </script>


</body>
</html>
