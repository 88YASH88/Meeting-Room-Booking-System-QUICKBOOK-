using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRBS.user
{
    public partial class YourRooms : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["Username"] == null || Session["Email"] == null)
            {
                Response.Redirect("User_Sign_in.aspx");
            }

            lblMessage.Text = $"{Session["Username"]}";

            if (!IsPostBack)
            {
                LoadBookedRooms();
                UpdateExpiredBookings();
            }
        }

        private void LoadBookedRooms()
        {
            int userId = Convert.ToInt32(Session["UserID"]);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    // Step 1: Delete pending bookings for the logged-in user
                    string deleteQuery = "DELETE FROM Booking WHERE Status = 'Pending' AND UserID = @UserID";
                    using (SqlCommand deleteCmd = new SqlCommand(deleteQuery, con))
                    {
                        deleteCmd.Parameters.AddWithValue("@UserID", userId);
                        deleteCmd.ExecuteNonQuery(); 
                    }

                    // Step 2: Load active bookings after deletion
                    string selectQuery = @"
                SELECT 
                    r.RoomName, 
                    r.Location, 
                    r.Capacity, 
                    r.ImagePath, 
                    r.Price,  
                    b.CheckInDate AS CheckIn, 
                    b.CheckOutDate AS CheckOut, 
                    b.BookingDate, 
                    b.BookingID
                FROM Booking b
                INNER JOIN Rooms r ON b.RoomID = r.RoomID
                WHERE b.UserID = @UserID AND b.Status = 'Active'
                ORDER BY b.BookingDate DESC;";

                    using (SqlCommand cmd = new SqlCommand(selectQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userId);

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rptBookedRooms.DataSource = dt;
                            rptBookedRooms.DataBind();
                        }
                        else
                        {
                            lblNoRooms.Text = "No active bookings found.";
                            lblNoRooms.Visible = true;
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblNoRooms.Text = "Error loading bookings. Please try again.";
                    lblNoRooms.Visible = true;
                    Console.WriteLine("Error: " + ex.Message); // Log error
                }
            }
        }


        protected void CancelBooking(object sender, CommandEventArgs e)
        {
            int bookingId = Convert.ToInt32(e.CommandArgument);
            decimal refundAmount = 0;
            string userEmail = Session["Email"]?.ToString(); 

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlTransaction transaction = con.BeginTransaction(); 

                    try
                    {
                        // Retrieve RoomID and Price in a single query (Avoids extra subquery)
                        string selectQuery = @"
                SELECT r.Price, b.RoomID 
                FROM Booking b
                INNER JOIN Rooms r ON b.RoomID = r.RoomID
                WHERE b.BookingID = @BookingID";

                        int roomId = 0;
                        using (SqlCommand cmd = new SqlCommand(selectQuery, con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@BookingID", bookingId);
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    decimal pricePaid = reader.GetDecimal(0);
                                    roomId = reader.GetInt32(1);
                                    refundAmount = pricePaid * 0.8m; // Deduct 20% for cancellation fee
                                }
                            }
                        }

                        if (roomId == 0)
                        {
                            throw new Exception("Invalid Booking ID. Room not found.");
                        }

                        //  Update Booking status to "Cancelled"
                        string updateBookingQuery = "UPDATE Booking SET Status = 'Cancelled' WHERE BookingID = @BookingID";
                        using (SqlCommand cmd = new SqlCommand(updateBookingQuery, con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@BookingID", bookingId);
                            cmd.ExecuteNonQuery();
                        }

                        //  Update Payment status to indicate refund processing
                        string updatePaymentQuery = "UPDATE Payment SET RefundStatus = 'Refund Initiated' WHERE BookingID = @BookingID";
                        using (SqlCommand cmd = new SqlCommand(updatePaymentQuery, con, transaction))
                        {
                            cmd.Parameters.AddWithValue("@BookingID", bookingId);
                            cmd.ExecuteNonQuery();
                        }

                        // Update Room availability to 1 (room is now available)
                        string updateRoomAvailabilityQuery = "UPDATE Rooms SET Availability = 1 WHERE RoomID = @RoomID";
                        using (SqlCommand cmdRoom = new SqlCommand(updateRoomAvailabilityQuery, con, transaction))
                        {
                            cmdRoom.Parameters.AddWithValue("@RoomID", roomId);
                            int rowsAffected = cmdRoom.ExecuteNonQuery();

                            
                            if (rowsAffected == 0)
                            {
                                throw new Exception("Error: Room availability update failed for RoomID " + roomId);
                            }
                        }


                        transaction.Commit(); //  Commit transaction if all queries succeed

                        //  Send cancellation email if user email is available
                        if (!string.IsNullOrEmpty(userEmail))
                        {
                            SendCancellationEmail(userEmail, refundAmount);
                        }

                        //  Reload page to reflect changes
                        Response.Redirect(Request.RawUrl);
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback(); //  Rollback if any query fails
                        throw new Exception("Transaction failed: " + ex.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                lblNoRooms.Text = "Error canceling booking. Please try again.";
                lblNoRooms.ForeColor = System.Drawing.Color.Red;
                lblNoRooms.Visible = true;
                Console.WriteLine("Error: " + ex.Message);
            }
        }
        private void UpdateExpiredBookings()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "EXEC UpdateExpiredBookings;";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.ExecuteNonQuery();
                }
            }
        }
        protected string GetImageUrl(object imagePath)
        {
            if (imagePath != null && !string.IsNullOrEmpty(imagePath.ToString()))
            {
                return ResolveUrl("~/" + imagePath.ToString());
            }
            else
            {
                return ResolveUrl("~/images/default.jpg");
            }
        }





        private void SendCancellationEmail(string email, decimal refundAmount)
        {
            try
            {
                string invoiceMessage = $@"
                                        Dear Valued Customer,  

                                        We regret to inform you that your booking has been successfully canceled as per your request. Please note that, in accordance with our cancellation policy, a 20% cancellation fee has been applied to your refund.  

                                        🔹 **Refund Details:**  
                                        - **Refund Amount:** ₹{refundAmount:0.00}  
                                        - **Processing Time:** Within 24 hours  

                                        Your refund will be processed shortly and should reflect in your account within the stipulated time.  

                                        If you have any further questions or require assistance, please do not hesitate to contact our support team.  

                                        Thank you for choosing our service. We look forward to serving you again in the future.  

                                        Best Regards,  
                                        QuickBook .
                                        ";

                bool emailSent = SendEmail(email, "Booking Cancellation", invoiceMessage);
                if (emailSent)
                {
                    Response.Write("<script>alert('Email Send Successfully!!!');</script>");
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
    }
}