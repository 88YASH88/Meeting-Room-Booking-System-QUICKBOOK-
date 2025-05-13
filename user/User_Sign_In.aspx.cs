using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace MRBS.user
{
    public partial class User_Sign_In : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Retrieve UserID, Email, and Role from AuthenticateUser method
            if (AuthenticateUser(username, password, out int userId, out string email, out string role, out string phno))
            {
                if (!string.IsNullOrEmpty(role) && role.Equals("User", StringComparison.OrdinalIgnoreCase))
                {
                    
                    Session["UserID"] = userId; 
                    Session["Username"] = username;
                    Session["Email"] = email;
                    Session["Role"] = role;
                    Session["PhoneNo"] = phno;

                    
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lblMessage.Text = "Access denied! Only users can log in.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Visible = true;
                }
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
            }
        }

        private bool AuthenticateUser(string username, string password, out int userId, out string email, out string role, out string phno)
        {
            userId = 0;
            email = null;
            role = null;
            phno = "N/A"; // Default value to avoid unassigned variable error

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT UserID, Email, PasswordHash, Role, PhoneNo FROM Users WHERE Username = @Username";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read()) // User exists
                            {
                                userId = Convert.ToInt32(reader["UserID"]); // Retrieve UserID
                                string storedHash = reader["PasswordHash"].ToString();
                                email = reader["Email"].ToString();
                                role = reader["Role"]?.ToString().Trim(); // Ensure no spaces or null values
                                phno = reader["PhoneNo"]?.ToString(); // Avoid potential conversion issues

                                if (VerifyPassword(password, storedHash))
                                {
                                    return true;
                                }
                                else
                                {
                                    userId = 0; // Reset UserID if password is incorrect
                                    role = null;
                                    phno = "N/A";
                                }
                            }
                        }
                    }
                }
                catch (SqlException ex)
                {
                    lblMessage.Text = "Database error: " + ex.Message;
                    lblMessage.Visible = true;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "An unexpected error occurred: " + ex.Message;
                    lblMessage.Visible = true;
                }
            }

            return false;
        }

        private bool VerifyPassword(string enteredPassword, string storedHash)
        {
            string hashedPassword = HashPassword(enteredPassword);
            return hashedPassword == storedHash; // Compare hashed passwords
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(password);
                byte[] hash = sha256.ComputeHash(bytes);
                return Convert.ToBase64String(hash); // Convert to Base64 for storage
            }
        }
    }
}
