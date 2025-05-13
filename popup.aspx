<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="popup.aspx.cs" Inherits="MRBS.popup" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Popup Alert</title>
    <script type="text/javascript">
        function closePopup() {
            window.close();  // Close the popup window
        }
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 20px;
        }
        .popup-container {
            width: 100%;
            max-width: 400px;
            margin: auto;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
            border: none;
            cursor: pointer;
        }
        .btn-close {
            background: #dc3545;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="popup-container">
            <h2 id="popupTitle" runat="server"></h2>
            <p id="popupMessage" runat="server"></p>
            <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-close" OnClientClick="closePopup(); return false;" />
        </div>
    </form>
</body>
</html>
