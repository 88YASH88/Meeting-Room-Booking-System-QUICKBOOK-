using System;
using System.Data.SqlClient;
using System.Configuration;

namespace MRBS.user
{
    public partial class Cart : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Email"] == null)
            {
                Response.Redirect("User_Sign_in.aspx");
            }

            lblMessage.Text = $"{Session["Username"]}";

            if (!IsPostBack)
            {
                LoadRoomDetails();
            }
        }

        private void LoadRoomDetails()
        {
            if (Request.QueryString["roomid"] != null)
            {
                int roomId = Convert.ToInt32(Request.QueryString["roomid"]);

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = "SELECT RoomName, Price, Capacity, Location, ImagePath FROM Rooms WHERE RoomID = @RoomID";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@RoomID", roomId);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                lblRoomName.Text = reader["RoomName"].ToString();
                                lblPrice.Text = "₹" + Convert.ToDecimal(reader["Price"]).ToString("F2");
                                lblCapacity.Text = "Capacity: " + reader["Capacity"].ToString();
                                lblLocation.Text = "Location: " + reader["Location"].ToString();

                                string imagePath = reader["ImagePath"].ToString();
                                imgRoom.ImageUrl = GetImageUrl(imagePath); // Set Image
                            }
                            else
                            {
                                lblMessage.Text = "Room not found!";
                            }
                        }
                    }
                }
            }
            else
            {
                lblMessage.Text = "Room details not found!";
            }
        }


        protected void btnGoToPayment_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    int userId = Convert.ToInt32(Session["UserID"]);
                    int roomId = Convert.ToInt32(Request.QueryString["roomid"]);

                    DateTime bookingDate = DateTime.Now;
                    DateTime checkInDate, checkOutDate;

                    // Validate Check-In & Check-Out dates
                    if (!DateTime.TryParse(txtCheckIn.Text, out checkInDate) || !DateTime.TryParse(txtCheckOut.Text, out checkOutDate))
                    {
                        Label1.Text = "Please select valid Check-In and Check-Out dates!";
                        return;
                    }
                    if (checkInDate < DateTime.Today)
                    {
                        Label1.Text = "Check-In date cannot be in the past!";
                        return;
                    }
                    if (checkOutDate <= checkInDate)
                    {
                        Label1.Text = "Check-Out date must be after Check-In!";
                        return;
                    }

                    // Insert Booking Record
                    string insertQuery = @"
            INSERT INTO Booking (UserID, RoomID, BookingDate, CheckInDate, CheckOutDate, Status)
            OUTPUT INSERTED.BookingID
            VALUES (@UserID, @RoomID, @BookingDate, @CheckIn, @CheckOut, 'Pending')";

                    using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userId);
                        cmd.Parameters.AddWithValue("@RoomID", roomId);
                        cmd.Parameters.AddWithValue("@BookingDate", bookingDate);
                        cmd.Parameters.AddWithValue("@CheckIn", checkInDate);
                        cmd.Parameters.AddWithValue("@CheckOut", checkOutDate);

                        object bookingIdObj = cmd.ExecuteScalar();
                        if (bookingIdObj == null)
                        {
                            Response.Write("<script>alert('Error: Booking failed. Please try again.');</script>");
                            return;
                        }

                        int bookingId = Convert.ToInt32(bookingIdObj);

                        // Redirect to Payment.aspx with all required data
                        string redirectUrl = $"Payment.aspx?roomid={roomId}&bookingId={bookingId}&roomName={Request.QueryString["roomName"]}&price={Request.QueryString["price"]}&location={Request.QueryString["location"]}&checkIn={checkInDate:yyyy-MM-dd}&checkOut={checkOutDate:yyyy-MM-dd}";
                        Response.Redirect(redirectUrl);
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
        }
        protected string GetImageUrl(object imagePath)
        {
            if (imagePath != null && !string.IsNullOrEmpty(imagePath.ToString()))
            {
                return ResolveUrl("~/" + imagePath.ToString()); // Use stored image path
            }
            else
            {
                return ResolveUrl("~/images/default.jpg"); // Default image when no image is uploaded
            }
        }

    }
}
