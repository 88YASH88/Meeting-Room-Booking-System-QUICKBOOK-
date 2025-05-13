using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace MRBS.admin
{
    public partial class update : Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Email"] == null)
            {
                Response.Redirect("Admin_Sign_in.aspx"); 
            }
            if (!IsPostBack)
            {
                LoadRoomDetails();
            }
        }


        private void LoadRoomDetails()
        {
            string roomID = Request.QueryString["roomID"];
            if (!string.IsNullOrEmpty(roomID) && int.TryParse(roomID, out int parsedRoomID))
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT RoomID, RoomName, Location, Price, Capacity, Equipments, AC_Type, ImagePath FROM Rooms WHERE RoomID = @RoomID";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@RoomID", parsedRoomID);
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                TextBox1.Text = reader["RoomName"].ToString();
                                TextBox2.Text = reader["Location"].ToString();
                                TextBox3.Text = reader["Price"].ToString();
                                TextBox5.Text = reader["Capacity"].ToString();
                                TextBox6.Text = reader["Equipments"].ToString();
                                DropDownList2.SelectedValue = reader["AC_Type"].ToString();
                                ViewState["RoomID"] = parsedRoomID; // Store RoomID for later updates
                            }
                        }
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ViewState["RoomID"] == null)
            {
                Response.Redirect("admin_Dashboard.aspx?status=updateFailure&error=roomNotFound");
                return;
            }

            int roomId = Convert.ToInt32(ViewState["RoomID"]);
            string newRoomName = TextBox1.Text.Trim();
            string location = TextBox2.Text.Trim();
            decimal price;
            int capacity;

            if (!decimal.TryParse(TextBox3.Text, out price) || !int.TryParse(TextBox5.Text, out capacity))
            {
                Response.Redirect("admin_Dashboard.aspx?status=updateFailure&error=invalidInput");
                return;
            }

            string equipments = TextBox6.Text.Trim();
            string roomType = DropDownList2.SelectedValue;
            string imagePath = null;

            // Handle file upload
            if (FileUpload1.HasFile)
            {
                string uploadFolder = Server.MapPath("~/uploads/");
                if (!Directory.Exists(uploadFolder))
                {
                    Directory.CreateDirectory(uploadFolder);
                }

                string fileName = Path.GetFileName(FileUpload1.FileName);
                string filePath = Path.Combine(uploadFolder, fileName);
                FileUpload1.SaveAs(filePath);

                imagePath = "uploads/" + fileName; // Store relative path in DB
            }

            
            bool isUpdated = UpdateRoom(roomId, newRoomName, location, price, capacity, equipments, roomType, imagePath);

            Response.Redirect("admin_Dashboard.aspx?status=" + (isUpdated ? "updateSuccess" : "updateFailure"));
        }

        private bool UpdateRoom(int roomId, string newRoomName, string location, decimal price, int capacity, string equipments, string roomType, string imagePath)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "UPDATE Rooms SET RoomName = @NewRoomName, Location = @Location, Price = @Price, " +
                                   "Capacity = @Capacity, Equipments = @Equipments, AC_Type = @RoomType, " +
                                   "ImagePath = COALESCE(@ImagePath, ImagePath), UpdatedAt = GETDATE() WHERE RoomID = @RoomID;";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@NewRoomName", newRoomName);
                        cmd.Parameters.AddWithValue("@Location", location);
                        cmd.Parameters.AddWithValue("@Price", price);
                        cmd.Parameters.AddWithValue("@Capacity", capacity);
                        cmd.Parameters.AddWithValue("@Equipments", equipments);
                        cmd.Parameters.AddWithValue("@RoomType", roomType);
                        cmd.Parameters.AddWithValue("@ImagePath", (object)imagePath ?? DBNull.Value);
                        cmd.Parameters.AddWithValue("@RoomID", roomId);

                        conn.Open();
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch (Exception ex)
            {
              
                System.Diagnostics.Debug.WriteLine("Update error: " + ex.Message);
                return false;
            }
        }
    }
}
