<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Sign_Up.aspx.cs" Inherits="MRBS.user.User_Sign_Up" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="../Header.ascx" %>
<%@ Register TagPrefix="uc" TagName="Footer" Src="../Footer.ascx" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
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
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



    
   
</head>
<body>
        <form id="form1" runat="server">

        <div class="bg-yellow-100 flex items-center justify-center min-h-screen">
            <div class="bg-white rounded-lg shadow-lg flex max-w-4xl w-full">
                <div class="w-1/2 bg-gradient-to-r from-yellow-500 to-yellow-700 p-10 rounded-l-lg flex flex-col justify-center items-center text-white">
                    <h1 class="text-3xl font-bold mb-4">QuickBook</h1>
                    <p class="text-center text-lg">Don't have an account? Sign Up Below</p>
                </div>
                <div class="w-1/2 p-10 flex flex-col justify-center">
                                        <div class="mb-4">
                        <a href="../index.aspx" class="text-amber-600 hover:text-amber-700 text-sm transition-colors">
                            <i class="fas fa-arrow-left mr-2"></i>Back to Home
                        </a>
                    </div>
                    <h2 class="text-2xl font-semibold mb-6">Sign Up</h2>
                    
                    <asp:Panel ID="pnlSignup" runat="server" CssClass="space-y-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="txtUsername">Username</label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-yellow-500 focus:border-yellow-500 sm:text-sm"></asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="txtEmail">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-yellow-500 focus:border-yellow-500 sm:text-sm"></asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="txtEmail">Ph.no</label>
                            <asp:TextBox ID="txtPhno" runat="server" TextMode="number" CssClass="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-yellow-500 focus:border-yellow-500 sm:text-sm"></asp:TextBox>
                        </div>
                        
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="txtPassword">Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-yellow-500 focus:border-yellow-500 sm:text-sm"></asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="txtConfirmPassword">Confirm Password</label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-yellow-500 focus:border-yellow-500 sm:text-sm"></asp:TextBox>
                        </div>
                        <div class="text-center"> 
                            <asp:Label ID="lblMessage" runat="server" CssClass="text-sm text-red-600"></asp:Label>
                        </div>
                        <div class="flex justify-center"> 
                            <asp:Button ID="Button1" runat="server" Text="Sign Up" CssClass="w-full py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-yellow-600 hover:bg-yellow-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-yellow-500" OnClick="Button1_Click" />
                        </div>
                    </asp:Panel>
                    
                    <p class="mt-4 text-center text-sm text-gray-600">
                        Already have an account?
                        <a class="text-yellow-600 hover:text-yellow-500" href="User_Sign_In.aspx">Log In</a>
                    </p>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
