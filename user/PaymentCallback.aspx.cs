using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;

namespace MRBS.user
{
    public partial class PaymentCallback : System.Web.UI.Page
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Email"] == null || Session["PhoneNo"] == null || Session["UserID"] == null)
            {
                Response.Redirect("User_Sign_in.aspx");
            }
            int userId, bookingId, paymentId;
            decimal price;
            DateTime checkIn, checkOut;

            // Retrieve values from Query String
            string username = Request.QueryString["username"];
            string email = Request.QueryString["email"];
            string phoneNo = Request.QueryString["phoneNo"];
            string roomName = Request.QueryString["roomName"];
            string location = Request.QueryString["location"];

            if (!int.TryParse(Request.QueryString["userId"], out userId) ||
                !int.TryParse(Request.QueryString["bookingId"], out bookingId) ||
                !int.TryParse(Request.QueryString["paymentId"], out paymentId) ||
                !decimal.TryParse(Request.QueryString["price"], out price) ||
                !DateTime.TryParse(Request.QueryString["checkIn"], out checkIn) ||
                !DateTime.TryParse(Request.QueryString["checkOut"], out checkOut) ||
                string.IsNullOrEmpty(username) ||
                string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(phoneNo) ||
                string.IsNullOrEmpty(roomName) ||
                string.IsNullOrEmpty(location))
            {
                Response.Write("<script>alert('Error: Missing or invalid query string parameters. Please try again.');</script>");
                return;
            }

            try
            {
                // Generate Invoice Text
                string invoiceMessage = $@"
                    ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
                       🏨 **QuickBook - Booking Confirmation**  
                    ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

                    **Dear {username},**  

                    Thank you for choosing QuickBook! We are pleased to confirm your booking. Below are the details:

                    ────────────────────────────────────────  
                    **📌 Booking Details:**  
                    **🔹 Booking ID:** {bookingId}  
                    **🔹 Payment ID:** {paymentId}  
                    **🔹 Room:** {roomName}  
                    **🔹 Location:** {location}  
                    **🔹 Check-In:** {checkIn:dd MMM yyyy | hh:mm tt} ⏳  
                    **🔹 Check-Out:** {checkOut:dd MMM yyyy | hh:mm tt} 🏁  
                    **🔹 Total Price:** ₹{price} 💰  
                    ────────────────────────────────────────  

                    ✅ **Your payment was successful!**  

                    📩 An invoice has been sent to your registered email. If you have any questions, feel free to contact our support team.  

                    ℹ️ **Need Help?**  
                    Visit our [Support Center](https://www.quickbook.com/support) or reach out to us at support@quickbook.com.  

                    **Best Regards,**  
                    **QuickBook Team**  
                ";



                // Send Email with Invoice
                bool emailSent = SendEmail(email, "Booking Confirmation", invoiceMessage);

                if (emailSent)
                {
                    // Store Notification
                    StoreNotification(userId, "Payment Confirmation", $"Your payment for Booking ID {bookingId} was successful. An invoice has been sent to your email.");

                    // Success Message & Redirect
                    Response.Write("<script>alert('Payment confirmed! Email sent Successfully.'); window.location='YourRooms.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Error: Failed to send email. Please contact support.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }

        private bool SendEmail(string toEmail, string subject, string body)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("QuickBookrooms@gmail.com");  
                mail.To.Add(toEmail);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = false;

                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.Credentials = new System.Net.NetworkCredential("QuickBookrooms@gmail.com", "cdeb efgv eiiy xfyr");
                smtp.EnableSsl = true;
                smtp.Send(mail);

                return true;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: Email sending failed - " + ex.Message + "');</script>");
                return false;
            }
        }


        private void StoreNotification(int userId, string type, string message)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = @"
                    INSERT INTO Notification (Type, Message, RecipientUserID, SentAt) 
                    VALUES (@Type, @Message, @RecipientUserID, GETDATE())";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Type", type);
                    cmd.Parameters.AddWithValue("@Message", message);
                    cmd.Parameters.AddWithValue("@RecipientUserID", userId);

                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
