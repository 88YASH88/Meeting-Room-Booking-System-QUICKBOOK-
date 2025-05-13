<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_Dashboard.aspx.cs" Inherits="MRBS.admin.admin_Dashboard" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meeting Room Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        :root {
            --primary-color: #FEA116;
            --primary-hover: #fe8a0a;
        }

        .popup-message {
            position: fixed;
            top: 20px;
            right: -300px;
            padding: 15px 25px;
            border-radius: 5px;
            color: white;
            z-index: 1000;
            transition: right 0.3s ease-in-out;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .popup-message.show {
            right: 20px;
        }

        .popup-message.success {
            background-color: #28a745;
        }

        .popup-message.error {
            background-color: #dc3545;
        }

        .sidebar {
            width: 280px;
            background: #fff;
            color: #333;
            padding: 20px;
            position: fixed;
            height: 100vh;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .sidebar h2 {
            color: var(--primary-color);
            border-bottom: 2px solid var(--primary-color);
            padding-bottom: 15px;
        }

        .sidebar a {
            color: #555;
            padding: 12px;
            margin: 8px 0;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .sidebar a:hover {
            background: rgba(254, 161, 22, 0.1);
            color: var(--primary-color);
            transform: translateX(5px);
        }

        .form-container {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.3s ease-out, opacity 0.2s ease;
            opacity: 0;
        }

        .form-container.open {
            max-height: 1000px;
            opacity: 1;
        }

        .btn-primary {
            background: var(--primary-color);
            color: white;
            padding: 12px 24px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(254, 161, 22, 0.3);
        }

        .table-container {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .table-header {
            background: var(--primary-color);
            color: white;
        }

        .table-row:nth-child(even) {
            background: #f8f9fa;
        }

        .action-btn {
            transition: all 0.2s ease;
        }

        .action-btn:hover {
            transform: scale(1.05);
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
        }
    </style>
        <script>
            function confirmLogout() {
                // Show a confirmation dialog
                if (confirm("Are you sure you want to log out?")) {
                    // If the user clicks "OK", redirect to User_Sign_Out.aspx
                    window.location.href = "Admin_Sign_Out.aspx"; // Adjust the path as necessary
                }
                // If the user clicks "Cancel", do nothing
            }
        </script>
</head>

<body class="bg-gray-50">
    <form runat="server">
        <div class="flex">
            <!-- Sidebar -->
            <div class="sidebar">
                <div class="text-center mb-8">
                    <div class="text-2xl font-bold text-gray-800">Admin Dashboard</div>
                    <div class="text-sm text-gray-600 mt-2">Welcome, <asp:Label ID="lblUsername" runat="server" class="font -medium"></asp:Label></div>
                </div>
                <nav class="space-y-2">
                    <a href="Manage_room.aspx" class="flex items-center space-x-3">
                        <i class="fas fa-door-open"></i>
                        <span>Manage Rooms</span>
                    </a>
                    <a href="Queries.aspx" class="flex items-center space-x-3">
                        <i class="fas fa-question-circle"></i>
                        <span>Queries</span>
                    </a>
                    <a   onclick="confirmLogout()" class="flex items-center space-x-3">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Sign Out</span>
                    </a>
                </nav>
            </div>

            <!-- Main Content -->
            <div class="ml-[280px] p-8 w-full">
                <div class="flex justify-between items-center mb-8">
                    <h1 class="text-3xl font-bold text-gray-800">Meeting Room Management</h1>
                    <button type="button" onclick="toggleForm()" class="btn-primary">
                        <i class="fas fa-plus mr-2"></i>Add New Room
                    </button>
                </div>

                <!-- Add Room Form -->
                <div id="formContainer" class="form-container bg-white p-6 rounded-lg shadow-md mb-8">
                    <h2 class="text-xl font-bold mb-6 text-gray-700">Room Details</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Room Name</label>
                            <asp:TextBox ID="txtRoomname" runat="server" CssClass="w-full p-3 border rounded-lg focus:ring-2 focus:ring-orange-200 focus:border-orange-500"></asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Location</label>
                            <asp:TextBox ID="txtLocation" runat="server" CssClass="w-full p-3 border rounded-lg focus:ring-2 focus:ring-orange-200 focus:border-orange-500"></asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Room Image</label>
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="w-full p-2 border rounded-lg" />
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Price</label>
                            <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" CssClass="w-full p-3 border rounded-lg focus:ring-2 focus:ring-orange-200 focus:border-orange-500"></asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Capacity</label>
                            <asp:TextBox ID="txtCapacity" runat="server" TextMode="Number" CssClass="w-full p-3 border rounded-lg focus:ring-2 focus:ring-orange-200 focus:border-orange-500"></asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Equipment</label>
                            <asp:TextBox ID="txtEquipments" runat="server" CssClass="w-full p-3 border rounded-lg focus:ring-2 focus:ring-orange-200 focus:border-orange-500"></asp:TextBox>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Room Type</label>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="w-full p-3 border rounded-lg focus:ring-2 focus:ring-orange-200 focus:border-orange-500">
                                <asp:ListItem Value="AC">AC</asp:ListItem>
                                <asp:ListItem Value="Non-AC">Non-AC</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <asp:Button ID="btnAddroom" runat="server" Text="Add Room" 
                        CssClass="btn-primary w-full mt-6" OnClick="btnAddroom_Click" />
                </div>

                <!-- Rooms Table -->
                <div class="bg-white rounded-lg shadow-md table-container">
                    <div class="p-4">
                        <input type="text" id="searchBox" placeholder="Search rooms..." 
                            class="w-full p-3 border rounded-lg focus :ring-2 focus:ring-orange-200 focus:border-orange-500">
                    </div>
                    <table class="w-full">
                        <thead class="table-header">
                            <tr>
                                <th class="p-4 text-left">Name</th>
                                <th class="p-4 text-left">Location</th>
                                <th class="p-4 text-left">Price</th>
                                <th class="p-4 text-left">Status</th>
                                <th class="p-4 text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="roomsTableBody">
                            <!-- Room Data will Showen Here-->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script>
            //display room data
            document.addEventListener("DOMContentLoaded", function () {
                loadRoomsData();
            });

            function loadRoomsData() {
                fetch("admin_Dashboard.aspx/GetRoomsData", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({})
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.d) {
                            displayRooms(JSON.parse(data.d)); // Parse JSON data and display
                        } else {
                            console.error("No room data found.");
                        }
                    })
                    .catch(error => console.error("Error loading room data:", error));
            }

            function displayRooms(rooms) {
                const tableBody = document.getElementById("roomsTableBody");
                tableBody.innerHTML = ""; // Clear existing content

                rooms.forEach(room => {
                    const row = document.createElement("tr");
                    row.classList.add("table-row", "hover:bg-gray-50", "transition-colors");

                    row.innerHTML = `
            <input type="hidden" value="${room.RoomID}" />
            <td class="p-4">${room.RoomName}</td>
            <td class="p-4">${room.Location}</td>
            <td class="p-4">${formatPrice(room.Price)}</td>
            <td class="p-4">
                <span class="px-3 py-1 rounded-full text-sm ${room.Availability ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}">
                    ${room.Availability ? "Available" : "Booked"}
                </span>
            </td>
            <td class="p-4 flex justify-center space-x-3">
                <a href="update.aspx?roomID=${room.RoomID}" 
                   class="action-btn bg-blue-100 text-blue-800 px-4 py-2 rounded-lg hover:bg-blue-200">
                   <i class="fas fa-edit mr-2"></i>Edit
                </a>
                <button onclick="confirmDelete(${room.RoomID})" 
                        class="action-btn bg-red-100 text-red-800 px-4 py-2 rounded-lg hover:bg-red-200">
                    <i class="fas fa-trash mr-2"></i>Delete
                </button>
            </td>
        `;

                    tableBody.appendChild(row);
                });
            }

            function formatPrice(price) {
                return new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(price);
            }



            //toggel form
            function toggleForm() {
                const formContainer = document.getElementById('formContainer');
                formContainer.classList.toggle('open');
            }

            function confirmDelete(roomID) {
                if (confirm("Are you sure you want to delete this room?")) {
                    fetch("delete.aspx", {
                        method: "POST",
                        headers: { "Content-Type": "application/x-www-form-urlencoded" },
                        body: "roomID=" + encodeURIComponent(roomID)
                    })
                        .then(response => {
                            if (!response.ok) {
                                throw new Error("Server returned an error.");
                            }
                            return response.text(); // Getting raw response first
                        })
                        .then(text => {
                            console.log("Raw Response:", text);

                            try {
                                return JSON.parse(text); // Ensure we have valid JSON
                            } catch (error) {
                                console.error("JSON Parse Error:", error, "Response:", text);
                                throw new Error("Invalid JSON response from server.");
                            }
                        })
                        .then(data => {
                            console.log("Parsed JSON:", data);

                            if (data.status === "success") {
                                showMessage("Room deleted successfully.", "success");
                               // setTimeout(() => location.reload(), 1500); // Reload after success
                            } else {
                                showMessage("Error: " + (data.message || "Unexpected response."), "error");
                            }
                        })
                        .catch(error => {
                            console.error("Fetch error:", error);
                            showMessage("An unexpected error occurred.", "error");
                        });
                }
            }
            document.addEventListener("DOMContentLoaded", function () {
                const params = new URLSearchParams(window.location.search);
                if (params.has("status")) {
                    const status = params.get("status");
                    if (status === "updateSuccess") {
                        showMessage("Room updated successfully!", "success");
                    } else if (status === "updateFailure") {
                        showMessage("Update failed. Please try again.", "error");
                    }
                }
            });


            function showMessage(message, type) {
                //romov message
                const existingPopup = document.querySelector(".popup-message");
                if (existingPopup) {
                    existingPopup.remove();
                }

              //message div
                const messageDiv = document.createElement("div");
                messageDiv.innerText = message;
                messageDiv.className = "popup-message " + type;

                // Append the message div to the body
                document.body.appendChild(messageDiv);

                // Show animation
                setTimeout(() => {
                    messageDiv.classList.add("show");
                }, 100);

                
                setTimeout(() => {
                    messageDiv.classList.remove("show");
                    setTimeout(() => {
                        messageDiv.remove();
                    }, 300);
                }, 2000);

                // to prevent after message (refresh)
                sessionStorage.setItem("lastOperation", JSON.stringify({ message, type }));
            }

            window.onload = function () {
                const lastOperation = sessionStorage.getItem("lastOperation");

                if (lastOperation) {
                    const { message, type } = JSON.parse(lastOperation);
                    showMessage(message, type);

                    // clear stored message

                    sessionStorage.removeItem("lastOperation");
                }
            };

        </script>
    </form>
</body>
</html>

