<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Sign_In.aspx.cs" Inherits="MRBS.user.User_Sign_In" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>

</head>
<body >
    <div class="bg-yellow-100 flex items-center justify-center min-h-screen">
        <form id="form1" runat="server">
            <div class="bg-white rounded-lg shadow-lg flex max-w-4xl w-full">
                <div class="w-1/2 bg-gradient-to-r from-yellow-500 to-yellow-700 p-10 rounded-l-lg flex flex-col justify-center items-center text-white">
                    <h1 class="text-3xl font-bold mb-4">QuickBook</h1>
                    <p class="text-center text-lg">Book Your Room After Login</p>

                </div>
                <div class="w-1/2 p-10 flex flex-col justify-center">
                                        <div class="mb-4">
                        <a href="../index.aspx" class="text-amber-600 hover:text-amber-700 text-sm transition-colors">
                            <i class="fas fa-arrow-left mr-2"></i>Back to Home
                        </a>
                    </div>
                    <h2 class="text-2xl font-semibold mb-6">Log In</h2>
                    <asp:Panel runat="server" CssClass="space-y-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="txtUsername">Username</label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-yellow-500 focus:border-yellow-500 sm:text-sm"></asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700" for="txtPassword">Password</label>
                            <div class="relative mt-1">
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-yellow-500 focus:border-yellow-500 sm:text-sm"></asp:TextBox>
                                <span class="absolute inset-y-0 right-0 pr-3 flex items-center text-sm leading-5">
                                    <i class="fas fa-eye" onclick="togglePassword()"></i>
                                </span>
                            </div>
                        </div>
                        <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="w-full py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-yellow-600 hover:bg-yellow-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-yellow-500" OnClick="btnLogin_Click"/>
                    </asp:Panel>
                    <asp:Label ID="lblMessage" runat="server" CssClass="mt-4 text-center text-sm text-red-600"></asp:Label>
                    <p class="mt-4 text-center text-sm text-gray-600">
                        Not a member yet?
                        <a class="text-yellow-600 hover:text-yellow-500" href="User_Sign_Up.aspx">Sign Up Now</a>
                    </p>

                </div>

            </div>
        </form>
        </div>

    <script>
        function togglePassword() {
            var passwordField = document.getElementById("<%= txtPassword.ClientID %>");
            passwordField.type = passwordField.type === "password" ? "text" : "password";
        }
    </script>
</body>
</html>