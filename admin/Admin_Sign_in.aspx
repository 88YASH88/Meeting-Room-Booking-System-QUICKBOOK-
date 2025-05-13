<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Sign_in.aspx.cs" Inherits="MRBS.Admin_Sign_in" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin Login | QuickBook</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"/>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #fef3c7 0%, #ffedd5 100%);
        }
        .login-container {
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease;
        }
        .login-container:hover {
            transform: translateY(-5px);
        }
        .gradient-side {
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
        }
        .input-group {
            transition: all 0.3s ease;
        }
        .input-group:focus-within {
            transform: translateX(5px);
        }
    </style>
</head>
<body>
    <div class="min-h-screen flex items-center justify-center p-4">
        <form id="form1" runat="server">
            <div class="login-container bg-white rounded-2xl flex flex-col md:flex-row max-w-4xl w-full overflow-hidden">
                <!-- Left Side -->
                <div class="gradient-side p-10 md:w-1/2 flex flex-col justify-center items-center text-center text-white space-y-8">
                    <div class="space-y-4">
                        <div class="inline-block p-4 rounded-2xl bg-white/10 backdrop-blur-sm">
                            <i class="fas fa-lock text-4xl text-amber-100"></i>
                        </div>
                        <h1 class="text-4xl font-bold tracking-tight">QuickBook</h1>
                        <p class="text-lg font-medium  mb-2">Admin Login</p>
                    </div>
                </div>

                <!-- Right Side -->
                <div class="md:w-1/2 p-10 flex flex-col justify-center">
                    <!-- Back Button -->
                    <div class="mb-4">
                        <a href="../index.aspx" class="text-amber-600 hover:text-amber-700 text-sm transition-colors">
                            <i class="fas fa-arrow-left mr-2"></i>Back to Home
                        </a>
                    </div>

                    <h2 class="text-3xl font-semibold mb-6">Log In</h2>
                    <asp:Panel runat="server" CssClass="space-y-4">
                        <div class="input-group">
                            <label class="block text-sm font-medium text-gray-700" for="txtUsername">Username</label>
                            <div class="relative">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-amber-500 focus:border-amber-500 sm:text-sm" placeholder="Enter your username"></asp:TextBox>
                                <span class="absolute inset-y-0 left-0 pl-3 flex items-center text-gray-500">
                              
                                </span>
                            </div>
                        </div>
                        <div class="input-group">
                            <label class="block text-sm font-medium text-gray-700" for="txtPassword">Password</label>
                            <div class="relative">
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-amber-500 focus:border-amber-500 sm:text-sm" placeholder="Enter your password"></asp:TextBox>
                                <span class="absolute inset-y-0 right-0 pr-3 flex items-center text-sm leading-5">
                                    <i class="fas fa-eye" id="togglePassword" onclick="togglePassword()"></i>
                                </span>
                            </div>
                        </div>
                        <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="w-full py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-amber-600 hover:bg-amber-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-amber-500 transition-transform transform hover:scale-105" OnClick="btnLogin_Click"/>
                         <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                        <div class="mt-4 text-center space-y-2">
                            <!-- Mobile Back Button -->
                            <div class="md:hidden mt-4">
                                <a href="../index.aspx" class="text-sm text-gray-500 hover:underline">
                                    <i class="fas fa-arrow-left mr-2"></i>Return to Home
                                </a>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </form>
    </div>

    <script>
        function togglePassword() {
            var passwordField = document.getElementById("<%= TextBox2.ClientID %>");
            var toggleIcon = document.getElementById("togglePassword");
            passwordField.type = passwordField.type === "password" ? "text" : "password";
            toggleIcon.classList.toggle("fa-eye");
            toggleIcon.classList.toggle("fa-eye-slash");
        }
    </script>
</body>
</html>

