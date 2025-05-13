<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Respond.aspx.cs" Inherits="MRBS.admin.Respond" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Respond to Query</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #FEA116;
            --secondary: #0F172B;
            --accent: #FFEED9;
            --text: #333333;
        }

        * {
            font-family: 'Poppins', sans-serif;
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            display: none;
            z-index: 999;
        }

        .response-modal {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 40px;
            border-radius: 16px;
            width: 90%;
            max-width: 750px;
            z-index: 1000;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.25);
        }

        .modal-close {
            position: absolute;
            top: 15px;
            right: 15px;
            font-size: 24px;
            cursor: pointer;
            color: var(--primary);
        }

        h3 {
            color: var(--secondary);
            font-size: 28px;
            text-align: center;
            margin-bottom: 20px;
        }

        .modal-content {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .query-section, .response-section {
            flex: 1;
            padding: 20px;
            background: var(--accent);
            border-radius: 12px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: 500;
            color: var(--secondary);
            display: block;
            margin-bottom: 6px;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
        }

        .form-control:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 8px rgba(254, 161, 22, 0.3);
        }

        textarea.form-control {
            height: 120px;
            resize: vertical;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn-send, .btn-close {
            padding: 12px 24px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-weight: 500;
            font-size: 16px;
            transition: 0.3s;
        }

        .btn-send {
            background: var(--primary);
            color: white;
        }

        .btn-send:hover {
            background: #e88d0b;
        }

        .btn-close {
            background: var(--secondary);
            color: white;
        }

        .btn-close:hover {
            background: #1a253f;
        }

        @media (max-width: 768px) {
            .modal-content {
                flex-direction: column;
            }
            .button-group {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="modalOverlay" class="modal-overlay"></div>

        <div id="responseModal" class="response-modal">
            <span class="modal-close" onclick="closeModal()">&times;</span>
            <h3>Respond to Query</h3>
            <div class="modal-content">
                <div class="query-section">
                    <div class="form-group">
                        <label>Query ID</label>
                        <asp:Label ID="lblQueryID" runat="server" CssClass="form-control"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label>User Name</label>
                        <asp:Label ID="lblUserName" runat="server" CssClass="form-control"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label>User Email</label>
                        <asp:Label ID="lblUserEmail" runat="server" CssClass="form-control"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label>Subject</label>
                        <asp:Label ID="lblQuerySubject" runat="server" CssClass="form-control"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label>Message</label>
                        <asp:Label ID="lblQueryMessage" runat="server" CssClass="form-control"></asp:Label>
                    </div>
                </div>
                <div class="response-section">
                    <div class="form-group">
                        <label>Response Subject</label>
                        <asp:TextBox ID="txtResponseSubject" runat="server" CssClass="form-control" placeholder="Enter response subject"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Response Message</label>
                        <asp:TextBox ID="txtResponseMessage" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Write your response here..."></asp:TextBox>
                    </div>
                    <div class="button-group">
                        <asp:Button ID="btnGoToQueries" runat="server" Text="Close" CssClass="btn-close" OnClientClick="closeModal(); return false;" />
                        <asp:Button ID="btnSendResponse" runat="server" Text="Send Response" CssClass="btn-send" OnClick="btnSendResponse_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script>
        function closeModal() {
            document.getElementById('modalOverlay').style.display = 'none';
            document.getElementById('responseModal').style.display = 'none';
            window.location.href = "Queries.aspx";
        }
    </script>
</body>
</html>