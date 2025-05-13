using System;
using System.Configuration;
using System.Data.SqlClient;

namespace MRBS.user
{
    public partial class Payment : System.Web.UI.Page
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Email"] == null || Session["PhoneNo"] == null || Session["UserID"] == null)
            {
                Response.Redirect("User_Sign_in.aspx");
            }
        }

        protected void btnProcessPayment_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["Username"] == null || Session["Email"] == null || Session["PhoneNo"] == null || Session["UserID"] == null)
                {
                    Response.Redirect("User_Sign_in.aspx");
                    return;
                }

                if (Request.QueryString["bookingId"] == null ||
                    Request.QueryString["roomId"] == null ||
                    Request.QueryString["roomName"] == null ||
                    Request.QueryString["price"] == null ||
                    Request.QueryString["location"] == null ||
                    Request.QueryString["checkIn"] == null ||
                    Request.QueryString["checkOut"] == null)
                {
                    Response.Write("<script>alert('Error: Missing booking details. Please restart the process.');</script>");
                    return;
                }

                int bookingId = Convert.ToInt32(Request.QueryString["bookingId"]);
                int roomId = Convert.ToInt32(Request.QueryString["roomId"]);
                decimal price = Convert.ToDecimal(Request.QueryString["price"]);
                string roomName = Request.QueryString["roomName"];
                string location = Request.QueryString["location"];
                DateTime checkIn = Convert.ToDateTime(Request.QueryString["checkIn"]);
                DateTime checkOut = Convert.ToDateTime(Request.QueryString["checkOut"]);

                int userId = Convert.ToInt32(Session["UserID"]);
                string username = Session["Username"].ToString();
                string email = Session["Email"].ToString();
                string phoneNo = Session["PhoneNo"].ToString();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlTransaction transaction = con.BeginTransaction(); // Begin Transaction

                    try
                    {
                        //Step 1: Insert Payment Record
                        string insertPaymentQuery = @"
                INSERT INTO Payment (BookingID, Amount, PaymentDate, PaymentStatus, RefundStatus)
                OUTPUT INSERTED.PaymentID
                VALUES (@BookingID, @Amount, GETDATE(), 'Completed', 'Not Requested')";

                        int paymentId;
                        using (SqlCommand cmdPayment = new SqlCommand(insertPaymentQuery, con, transaction))
                        {
                            cmdPayment.Parameters.AddWithValue("@BookingID", bookingId);
                            cmdPayment.Parameters.AddWithValue("@Amount", price);

                            object paymentIdObj = cmdPayment.ExecuteScalar();
                            if (paymentIdObj == null)
                            {
                                throw new Exception("Payment insertion failed.");
                            }
                            paymentId = Convert.ToInt32(paymentIdObj);
                        }

                        // Step 2: Update Booking Status to "Active"
                        string updateBookingQuery = "UPDATE Booking SET Status = 'Active' WHERE BookingID = @BookingID";
                        using (SqlCommand cmdUpdateBooking = new SqlCommand(updateBookingQuery, con, transaction))
                        {
                            cmdUpdateBooking.Parameters.AddWithValue("@BookingID", bookingId);
                            cmdUpdateBooking.ExecuteNonQuery();
                        }

                        // Step 3: Update Room Availability to 0 (Booked)
                        string updateRoomQuery = "UPDATE Rooms SET Availability = 0 WHERE RoomID = @RoomID";
                        using (SqlCommand cmdUpdateRoom = new SqlCommand(updateRoomQuery, con, transaction))
                        {
                            cmdUpdateRoom.Parameters.AddWithValue("@RoomID", roomId);
                            int rowsAffected = cmdUpdateRoom.ExecuteNonQuery();

                            if (rowsAffected == 0)
                            {
                                throw new Exception("Error: Room availability update failed.");
                            }
                        }

                        transaction.Commit(); // Commit transaction if all steps succeed

                        //Redirect to Payment Callback Page
                        string redirectUrl = $"PaymentCallback.aspx?paymentId={paymentId}&userId={userId}&username={username}&email={email}&phoneNo={phoneNo}&bookingId={bookingId}&roomId={roomId}&roomName={roomName}&location={location}&checkIn={checkIn:yyyy-MM-dd}&checkOut={checkOut:yyyy-MM-dd}&price={price}";
                        Response.Redirect(redirectUrl);
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback(); // Rollback on failure
                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }


    }
}
