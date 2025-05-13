<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update.aspx.cs" Inherits="MRBS.admin.update" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Room</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .modal-content {
            animation: slideIn 0.3s ease-out;
        }
        
        @keyframes slideIn {
            from { transform: translateY(-50px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .input-group:hover .input-icon {
            color: #f59e0b;
        }

        .file-upload {
            transition: all 0.3s ease;
        }

        .file-upload:hover {
            border-color: #f59e0b;
            background-color: #fffbeb;
        }
    </style>
</head>
<body class="bg-gray-100">
    <form id="form1" runat="server" enctype="multipart/form-data">
        <!-- Modal -->
        <div id="myModal" class="modal">
            <div class="modal-content bg-white rounded-xl shadow-2xl max-w-2xl mx-auto mt-20">
                <div class="p-8">
                    <!-- Header -->
                    <div class="flex justify-between items-center mb-6">
                        <h2 class="text-2xl font-bold text-gray-800">
                            <i class="fas fa-edit mr-2 text-orange-500"></i>
                            Update Room Details
                        </h2>
                        <button onclick="closeModal();return false;" class="text-gray-500 hover:text-gray-700 transition-colors">
                            <i class="fas fa-times text-xl"></i>
                        </button>
                    </div>

                    <!-- Form Fields -->
                    <div class="space-y-6">
                        <!-- Room Name -->
                        <div class="input-group">
                            <label class="block text-sm font-medium text-gray-700 mb-2">Room Name</label>
                            <div class="relative">
                                <asp:TextBox ID="TextBox1" runat="server" 
                                    class="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-orange-500 outline-none transition-all"
                                    placeholder="Conference Room A"></asp:TextBox>
                                <i class="fas fa-door-open input-icon absolute left-3 top-3.5 text-gray-400"></i>
                            </div>
                        </div>

                        <!-- Location & Price -->
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div class="input-group">
                                <label class="block text-sm font-medium text-gray-700 mb-2">Location</label>
                                <div class="relative">
                                    <asp:TextBox ID="TextBox2" runat="server" 
                                        class="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-orange-500 outline-none transition-all"
                                        placeholder="location" ></asp:TextBox>
                                    <i class="fas fa-map-marker-alt input-icon absolute left-3 top-3.5 text-gray-400"></i>
                                </div>
                            </div>
                            
                            <div class="input-group">
                                <label class="block text-sm font-medium text-gray-700 mb-2">Price (₹)</label>
                                <div class="relative">
                                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Number"
                                        class="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-orange-500 outline-none transition-all"
                                        placeholder="5000"></asp:TextBox>
                                    <i class="fas fa-rupee-sign input-icon absolute left-3 top-3.5 text-gray-400"></i>
                                </div>
                            </div>
                        </div>

                        <!-- Capacity & AC Type -->
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div class="input-group">
                                <label class="block text-sm font-medium text-gray-700 mb-2">Capacity</label>
                                <div class="relative">
                                    <asp:TextBox ID="TextBox5" runat="server" TextMode="Number"
                                        class="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-orange-500 outline-none transition-all"
                                        placeholder="20"></asp:TextBox>
                                    <i class="fas fa-users input-icon absolute left-3 top-3.5 text-gray-400"></i>
                                </div>
                            </div>
                            
                            <div class="input-group">
                                <label class="block text-sm font-medium text-gray-700 mb-2">AC Type</label>
                                <div class="relative">
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        class="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-orange-500 outline-none transition-all appearance-none">
                                        <asp:ListItem Value="AC">Air Conditioned</asp:ListItem>
                                        <asp:ListItem Value="Non-AC">Non Air Conditioned</asp:ListItem>
                                    </asp:DropDownList>
                                    <i class="fas fa-snowflake input-icon absolute left-3 top-3.5 text-gray-400"></i>
                                </div>
                            </div>
                        </div>

                        <!-- Equipment -->
                        <div class="input-group">
                            <label class="block text-sm font-medium text-gray-700 mb-2">Equipment</label>
                            <div class="relative">
                                <asp:TextBox ID="TextBox6" runat="server" 
                                    class="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-orange-500 focus:border-orange-500 outline-none transition-all"
                                    placeholder="Projector, Whiteboard, Video Conferencing"></asp:TextBox>
                                <i class="fas fa-tools input-icon absolute left-3 top-3.5 text-gray-400"></i>
                            </div>
                            <span class="text-sm text-gray-500 mt-1">Separate multiple items with commas</span>
                        </div>

                        <!-- File Upload -->
                        <div class="input-group">
                            <label class="block text-sm font-medium text-gray-700 mb-2">Room Photos</label>
                            <div class="file-upload relative border-2 border-dashed border-gray-300 rounded-lg p-6 text-center hover:border-orange-500 transition-colors">
                                <asp:FileUpload ID="FileUpload1" runat="server" 
                                    class="absolute inset-0 w-full h-full opacity-0 cursor-pointer" />
                                <div class="space-y-2">
                                    <i class="fas fa-cloud-upload-alt text-3xl text-gray-400"></i>
                                    <p class="text-gray-600">
                                        <span class="text-orange-500 font-medium">Click to upload</span> 
                                        or drag and drop
                                    </p>
                                    <p class="text-xs text-gray-500">PNG, JPG up to 5MB</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Form Actions -->
                    <div class="mt-8 flex justify-end space-x-4">
                    <asp:Button ID="btnClose" runat="server" Text="Cancel" 
                        CssClass="px-6 py-2.5 border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors text-gray-700"
                        OnClientClick="closeModal(); return false;" />

                        
                        <asp:Button ID="btnSubmit" runat="server" Text="Save Changes" 
                            CssClass="px-6 py-2.5 bg-orange-500 hover:bg-orange-600 text-white rounded-lg transition-colors shadow-sm hover:shadow-md"
                            OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Popup Messages -->
        <div id="popupMessage" class="fixed bottom-4 right-4 p-4 rounded-lg shadow-lg hidden">
            <div class="flex items-center space-x-3">
                <i class="fas fa-check-circle text-white"></i>
                <span class="text-white"></span>
            </div>
        </div>
    </form>

    <script>
        function closeModal() {
     
                window.location.href = "admin_Dashboard.aspx";
        }

        // Handle file upload styling
        const fileUpload = document.getElementById('<%= FileUpload1.ClientID %>');
        const uploadArea = fileUpload.parentElement;

        fileUpload.addEventListener('change', function (e) {
            if (this.files.length > 0) {
                uploadArea.classList.add('border-orange-500', 'bg-orange-50');
                uploadArea.querySelector('p').innerHTML = `
                    <span class="text-orange-500 font-medium">${this.files.length} file(s) selected</span>
                `;
            }
        });

        // Drag and drop handling
        ['dragenter', 'dragover'].forEach(eventName => {
            uploadArea.addEventListener(eventName, (e) => {
                e.preventDefault();
                uploadArea.classList.add('border-orange-500', 'bg-orange-50');
            });
        });

        ['dragleave', 'drop'].forEach(eventName => {
            uploadArea.addEventListener(eventName, (e) => {
                e.preventDefault();
                uploadArea.classList.remove('border-orange-500', 'bg-orange-50');
            });
        });
    </script>
</body>
</html> 





