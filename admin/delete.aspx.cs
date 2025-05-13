using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace MRBS.admin
{
    public partial class delete : System.Web.UI.Page
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                string roomID = Request.Params["roomID"];
                var response = new { status = "error", message = "Invalid request." };

                if (!string.IsNullOrWhiteSpace(roomID) && int.TryParse(roomID, out int id))
                {
                    bool isDeleted = DeleteRoom(id);
                    response = isDeleted
                        ? new { status = "success", message = "Room deleted successfully." }
                        : new { status = "error", message = "Room not found or deletion failed." };
                }

                SendJsonResponse(response);
            }
        }

        private static bool DeleteRoom(int roomID)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM Rooms WHERE RoomID = @RoomID";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@RoomID", roomID);
                        conn.Open();
                        return cmd.ExecuteNonQuery() > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                // Log error (if needed)
                return false;
            }
        }

        private void SendJsonResponse(object response)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            string jsonResponse = js.Serialize(response);
            Response.ContentType = "application/json";
            Response.Write(jsonResponse);
            Response.End(); 
        }
    }
}
