using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Collections.Generic;

namespace MRBS.user
{
    public partial class room : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null && Session["Email"] != null)
            {
                string username = Session["Username"].ToString();
                lblMessage.Text = Session["Username"].ToString(); 
            }
            else
            {
                lblMessage.Text = "You are not logged in.";
                Response.Redirect("User_Sign_in.aspx");
            }

            if (!IsPostBack)
            {
                LoadRoomsData(); 
                UpdateExpiredBookings();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadRoomsData(); // Load rooms based on search 
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
        private void LoadRoomsData()
        {
            string roomName = txtSearch.Text.Trim();
            string location = txtLocation.Text.Trim();
            string priceText = txtPrice.Text.Trim();
            string capacityText = txtCapacity.Text.Trim();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT RoomID, RoomName, Location, Price, Availability, Capacity, AC_Type, Equipments, ImagePath FROM Rooms WHERE Availability = 1";

                List<string> conditions = new List<string>();
                List<SqlParameter> parameters = new List<SqlParameter>();

                if (!string.IsNullOrEmpty(roomName))
                {
                    conditions.Add("RoomName LIKE @RoomName");
                    parameters.Add(new SqlParameter("@RoomName", "%" + roomName + "%"));
                }

                if (!string.IsNullOrEmpty(location))
                {
                    conditions.Add("Location LIKE @Location");
                    parameters.Add(new SqlParameter("@Location", "%" + location + "%"));
                }

                if (!string.IsNullOrEmpty(priceText) && decimal.TryParse(priceText, out decimal maxPrice))
                {
                    conditions.Add("Price <= @Price");
                    parameters.Add(new SqlParameter("@Price", maxPrice));
                }

                if (!string.IsNullOrEmpty(capacityText) && int.TryParse(capacityText, out int minCapacity))
                {
                    conditions.Add("Capacity >= @Capacity");
                    parameters.Add(new SqlParameter("@Capacity", minCapacity));
                }

                if (conditions.Count > 0)
                {
                    query += " AND " + string.Join(" AND ", conditions);
                }

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddRange(parameters.ToArray());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Binding the DataTable to the repeater
                    roomsRepeater.DataSource = dt;
                    roomsRepeater.DataBind();
                }
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
    }
}
