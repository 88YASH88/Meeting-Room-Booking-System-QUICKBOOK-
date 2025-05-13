<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Queries.aspx.cs" Inherits="MRBS.admin.Queries" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Queries Management</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        :root {
            --primary-color: #FEA116;
            --primary-hover: #fe8a0a;
        }

        .sidebar {
            width: 280px;
            background: #fff;
            color: #333;
            padding: 20px;
            position: fixed;
            height: 100vh;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
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

        .table-container {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .table-header {
            background: var(--primary-color);
            color: white;
        }

        .action-btn {
            transition: all 0.2s ease;
        }

        .action-btn:hover {
            transform: scale(1.05);
        }

        .scrollable-content {
            max-height: 400px;
            overflow-y: auto;
        }

        /* Modal Styles */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
            display: none;
            z-index: 1000;
        }

        .response-modal {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 2rem;
            border-radius: 10px;
            width: 90%;
            max-width: 500px;
            display: none;
            z-index: 1001;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        .response-modal h3 {
            margin-bottom: 1.5rem;
            color: var(--primary-color);
        }

        .modal-close {
            position: absolute;
            top: 1rem;
            right: 1rem;
            cursor: pointer;
            font-size: 1.5rem;
            color: #666;
        }

        .modal-close:hover {
            color: #333;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .form-group textarea {
            height: 150px;
            resize: vertical;
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
        function confirmLogout()
        {
               
                if (confirm("Are you sure you want to log out?")) {
                    
                    window.location.href = "Admin_Sign_Out.aspx";
                }
               
        };
    </script>
</head>

<body class="bg-gray-50">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"/>

        <div class="flex">
            <!-- Sidebar -->
            <div class="sidebar">
                <div class="text-center mb-8">
                    <div class="text-2xl font-bold text-gray-800">Admin Dashboard</div>
                    <div class="text-sm text-gray-600 mt-2">Welcome, <asp:Label ID="lblUsername" runat="server" class="font-medium"></asp:Label></div>
                </div>
                <nav class="space-y-2">
                    <a href="admin_Dashboard.aspx" class="flex items-center space-x-3">
                        <i class="fas fa-door-open"></i>
                        <span>Manage Rooms</span>
                    </a>
                    <a href="Queries.aspx" class="flex items-center space-x-3">
                        <i class="fas fa-question-circle"></i>
                        <span>Queries</span>
                    </a>
                    <a onclick="confirmLogout()" class="flex items-center space-x-3">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Sign Out</span>
                    </a>
                </nav>
            </div>

            <!-- Main Content -->
            <div class="ml-[280px] p-8 w-full">
                <h1 class="text-3xl font-bold text-gray-800 mb-6">Queries</h1>

                <!-- Query Counts -->
                <div class="flex justify-between mb-4">
                    <div class="bg-white p-4 rounded-lg shadow-md w-1/2 text-center">
                        <h2 class="text-xl font-bold">Pending Queries</h2>
                        <asp:Label ID="lblPendingQueryCount" runat="server" class="text-2xl font-semibold"></asp:Label>
                      
                    </div>
                    <div class="bg-white p-4 rounded-lg shadow-md w-1/2 text-center">
                        <h2 class="text-xl font-bold">Completed Queries</h2>
                        <asp:Label ID="lblCompleteQueryCount" runat="server" class="text-2xl font-semibold"></asp:Label>
                       
                    </div>
                </div>

                <!-- Search Box and Dropdown -->
                <div class="mb-4 flex items-center">
                    <select id="queryStatus" class="p-2 border rounded-lg mr-2">
                        <option value="all">All Queries</option>
                        <option value="pending">Pending Queries</option>
                        <option value="completed">Completed Queries</option>
                    </select>
                    <input type="text" id="searchBox" placeholder="Search..." class="p-2 border rounded-lg flex-grow">
                </div>

                <!-- Queries Table -->
                <div class="flex justify-between w-full">
<!-- Pending Queries Table -->

<div class="table-container scrollable-content mb-6">
    <h2 class="text-2xl font-bold mb-4">Pending Queries</h2>
    <table class="w-full">
        
        <thead class="table-header">
            <tr>
                <th class="p-4 text-left">User ID</th>
                <th class="p-4 text-left">Subject</th>
                <th class="p-4 text-left">Date</th>
                <th class="p-4 text-left">Status</th>
                <th class="p-4 text-center">Action</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="PendingQueryRepeater" runat="server">
                <ItemTemplate>
                    <tr class="hover:bg-gray-50 transition-colors">
                         <asp:HiddenField ID="hfQueryID" runat="server" Value='<%# Eval("QueryID") %>' />
                        <td class="p-4"><%# Eval("UserID") %></td>
                        <td class="p-4"><%# Eval("Subject") %></td>
                        <td class="p-4"><%# Eval("SubmissionDate") %></td>
                        <td class="p-4">
                            <span class="px-3 py-1 rounded-full text-sm bg-yellow-100 text-yellow-800">
                                <%# Eval("ResponseStatus") %>
                            </span>
                        </td>
                        <td class="p-4 text-center">
             <asp:HyperLink ID="lnkRespond" runat="server" 
                    NavigateUrl='<%# "Respond.aspx?QueryID=" + Eval("QueryID") %>' 
                    CssClass="action-btn bg-blue-100 text-blue-800 px-4 py-2 rounded-lg hover:bg-blue-200">
                    Respond
                </asp:HyperLink>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
</div>

<!-- Completed & Rejected Queries Table -->

<div class="table-container scrollable-content">
    <h2 class="text-2xl font-bold mb-4">Completed & Rejected Queries</h2>
    <table class="w-full">
        <thead class="table-header">
            <tr>
                <th class="p-4 text-left">User ID</th>
                <th class="p-4 text-left">Subject</th>
                <th class="p-4 text-left">Date</th>
                <th class="p-4 text-left">Status</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater ID="CompletedQueryRepeater" runat="server">
                <ItemTemplate>
                    <tr class="hover:bg-gray-50 transition-colors">
                        <td class="p-4"><%# Eval("UserID") %></td>
                        <td class="p-4"><%# Eval("Subject") %></td>
                        <td class="p-4"><%# Eval("SubmissionDate") %></td>
                        <td class="p-4">
                            <span class="px-3 py-1 rounded-full text-sm 
                                <%# Eval("ResponseStatus").ToString() == "Completed" ? "bg-green-100 text-green-800" : "bg-red-100 text-red-800" %>">
                                <%# Eval("ResponseStatus") %>
                            </span>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
</div>

                    </div>

                                <!-- Response Modal -->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="modal-overlay" id="modalOverlay"></div>
                <div class="response-modal" id="responseModal">
                    <span class="modal-close" id="closeModal">&times;</span>
                    <h3 class="text-xl font-bold">Respond to Query</h3>
                    <div class="form-group">
                        <label>Your Name</label>
                        <asp:TextBox ID="txtResponderName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Your Email</label>
                        <asp:TextBox ID="txtResponderEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Subject</label>
                        <asp:TextBox ID="txtResponseSubject" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Message</label>
                        <asp:TextBox ID="txtResponseMessage" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSendResponse" runat="server" Text="Send Response" 
                                CssClass="bg-[#FEA116] text-white px-4 py-2 rounded-lg hover:bg-[#fe8a0a] transition-colors" 
                                OnClick="btnSendResponse_Click"/>
                </div>
         
            </ContentTemplate>
        </asp:UpdatePanel>

                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        const modal = document.getElementById('responseModal');
                        const overlay = document.getElementById('modalOverlay');
                        const closeBtn = document.getElementById('closeModal');

                       
                        window.openModal = function () {
                            modal.style.display = 'block';
                            overlay.style.display = 'block';
                            sessionStorage.setItem("modalOpen", "true"); // Store modal state
                       
                        }



                        
                        function closeModal() {
                            modal.style.display = 'none';
                            overlay.style.display = 'none';
                            sessionStorage.removeItem("modalOpen"); // Remove modal state
                        }

                        closeBtn.addEventListener('click', closeModal);
                        overlay.addEventListener('click', closeModal);

                        // Close modal on ESC key
                        document.addEventListener('keydown', (e) => {
                            if (e.key === 'Escape') closeModal();
                        });

                        // Restore modal state after postback
                        if (sessionStorage.getItem("modalOpen") === "true") {
                            openModal();
                        }
                    });

                </script>
         
    </form>
</body>
</html>
