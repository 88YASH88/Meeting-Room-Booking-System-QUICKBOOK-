using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRBS.admin
{
    public partial class admin_Dashboard : System.Web.UI.Page
    {
        
        private static string connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Email"] == null)
            {
                Response.Redirect("Admin_Sign_in.aspx"); // Redirect to login if not authenticated
            }
            else
            {
                lblUsername.Text = Session["Username"].ToString();

            }

        }
        protected void btnAddroom_Click(object sender, EventArgs e)
        {
            string roomName = txtRoomname.Text.Trim();
            string location = txtLocation.Text.Trim();
            string price = txtPrice.Text.Trim();
            string capacity = txtCapacity.Text.Trim();
            string equipments = txtEquipments.Text.Trim();
            string acType = DropDownList1.SelectedValue;
            string imagePath = null;

            // File upload validation
            const int maxFileSize = 2 * 1024 * 1024; // 2MB
            string[] allowedExtensions = { ".jpg", ".jpeg", ".png" };

            if (FileUpload1.HasFile)
            {
                string fileExt = Path.GetExtension(FileUpload1.FileName).ToLower();
                int fileSize = FileUpload1.PostedFile.ContentLength;

                // Check for valid image extension and size
                if (!allowedExtensions.Contains(fileExt))
                {
                    Response.Write("<script>alert('Only JPG, JPEG, and PNG files are allowed!');</script>");
                    return;
                }
                if (fileSize > maxFileSize)
                {
                    Response.Write("<script>alert('File size cannot exceed 2MB.');</script>");
                    return;
                }

                // Define folder path
                string uploadFolder = Server.MapPath("~/uploads/");
                if (!Directory.Exists(uploadFolder))
                {
                    Directory.CreateDirectory(uploadFolder);
                }

                // Generate unique file name to avoid overwrites
                string fileName = Guid.NewGuid().ToString() + fileExt;
                string filePath = Path.Combine(uploadFolder, fileName);

                // Save the file
                FileUpload1.SaveAs(filePath);
                imagePath = "uploads/" + fileName; // Relative path for DB storage
            }

            // Insert into database
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "INSERT INTO Rooms (RoomName, Location, Price, Capacity, Equipments, AC_Type, ImagePath) " +
                                   "VALUES (@RoomName, @Location, @Price, @Capacity, @Equipments, @AC_Type, @ImagePath)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@RoomName", roomName);
                        cmd.Parameters.AddWithValue("@Location", location);
                        cmd.Parameters.AddWithValue("@Price", price);
                        cmd.Parameters.AddWithValue("@Capacity", capacity);
                        cmd.Parameters.AddWithValue("@Equipments", equipments);
                        cmd.Parameters.AddWithValue("@AC_Type", acType);
                        cmd.Parameters.AddWithValue("@ImagePath", (object)imagePath ?? DBNull.Value);

                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>alert('Room added successfully!');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Error adding room. Please try again.');</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Database Error: " + ex.Message + "');</script>");
                }
            }
        }




        [WebMethod]
        public static string GetRoomsData()
        {
            DataTable dt = new DataTable();
            string query = "SELECT RoomID, RoomName, Location, Price, Availability FROM Rooms";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(query, conn))
                {
                    da.Fill(dt);
                }
            }

            // Convert DataTable to JSON
            List<Dictionary<string, object>> roomsList = new List<Dictionary<string, object>>();

            foreach (DataRow row in dt.Rows)
            {
                var room = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    room[col.ColumnName] = row[col];
                }
                roomsList.Add(room);
            }

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(roomsList);
        }






    }
}