<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="MRBS.user.Payment" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <title>Processing Payment</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        /* Blurred Background Effect */
        .modal-backdrop.show {
            backdrop-filter: blur(5px);
        }

        /* Modal Header with Theme Color */
        .modal-header {
            background-color: #FEA116 !important;
            color: white;
            border-bottom: none;
        }

        /* Process Payment Button with Theme Color */
        .btn-theme {
            background-color: #FEA116 !important;
            color: white !important;
            border: none;
            transition: 0.3s;
        }
        .btn-theme:hover {
            background-color: #d98c0a !important; /* Darker shade for hover */
        }

        /* Fullscreen Loading Screen */
        #loadingScreen {
            display: none;
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.7);
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 24px;
            z-index: 1050;
            flex-direction: column;
        }

        .spinner-border {
            width: 3rem;
            height: 3rem;
            color: #FEA116 !important;
        }
    </style>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            // Check if the page was accessed via the back button
            if (performance.navigation.type === 2) {
                if (document.referrer) {
                    window.location.href = document.referrer; // Redirect to the previous page dynamically
                } else {
                    window.history.back(); // Fallback if no referrer
                }
            }

            // Show the modal when the page loads
            var myModal = new bootstrap.Modal(document.getElementById('cancelModal'));
            myModal.show();
        });


        // Show loading screen, hide popup, then proceed with payment after 3 seconds
        function processPayment() {
            var modalElement = document.getElementById('cancelModal');
            var modal = bootstrap.Modal.getInstance(modalElement);
            modal.hide(); // Hide popup

            // Show the loading screen
            document.getElementById("loadingScreen").style.display = "flex";

            // Wait for 1 seconds, then trigger ASP.NET button click
            setTimeout(function () {
                document.getElementById('<%= btnProcessPayment.ClientID %>').click();
            }, 1000);
        }

        // Redirect back when "Cancel" is clicked
        function goBack() {
            if (document.referrer) {
                window.location.href = document.referrer; // Redirect to the previous page
            } else {
                window.history.back(); 
            }
        }

    </script>

</head>

<body>

    <form id="formPayment" runat="server">

        <!-- Payment Processing Button (Hidden in Main Page, Used in Modal) -->
        <asp:Button ID="btnProcessPayment" runat="server" Text="Process Payment" 
            OnClick="btnProcessPayment_Click" style="display:none;" />

        <!-- Payment Confirmation Modal -->
        <div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="cancelModalLabel">Confirm Payment</h5>
                    </div>
                    <div class="modal-body text-center">
                        <p>Do you want to proceed with the payment?</p>
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="button" class="btn btn-theme px-4 py-2" onclick="processPayment();">Yes, Process Payment</button>
                        <button type="button" class="btn btn-danger px-4 py-2" onclick="goBack();">No, Cancel</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Fullscreen Loading Screen (Appears when processing payment) -->
        <div id="loadingScreen">
            <div class="spinner-border" role="status">
                <span class="visually-hidden">Processing...</span>
            </div>
            <p class="mt-3">Processing Payment...</p>
        </div>

    </form>

</body>
</html>
