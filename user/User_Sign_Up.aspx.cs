using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace MRBS.user
{
    public partial class User_Sign_Up : System.Web.UI.Page
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open(); 

                    
                    string username = txtUsername.Text.Trim();
                    string password = txtPassword.Text.Trim();
                    string confirmPassword = txtConfirmPassword.Text.Trim();
                    string email = txtEmail.Text.Trim();

                    
                    if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password) || string.IsNullOrWhiteSpace(email))
                    {
                        lblMessage.Text = "Please fill in all fields.";
                        return;
                    }

                    if (password != confirmPassword)
                    {
                        lblMessage.Text = "Passwords do not match.";
                        return;
                    }

                    // Check if the email already exists
                    if (EmailExists(email, con))
                    {
                        lblMessage.Text = "Email is already taken. Please choose a different email.";
                        return;
                    }

                    // Check if the username already exists
                    if (UsernameExists(username, con))
                    {
                        lblMessage.Text = "Username is already taken. Please choose a different username.";
                        return;
                    }

                    // Hash the password
                    string passwordHash = HashPassword(password);

                    // SQL query with parameterized placeholders
                    string query = @"INSERT INTO Users (Username, Email, PasswordHash, Role, CreatedAt) 
                                     VALUES (@username, @email, @passwordHash, 'User ', GETDATE());";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                      
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@passwordHash", passwordHash);

                        // Execute the query
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Registration successful!";
                            
                            Response.Redirect("User_Sign_In.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Registration failed. Please try again.";
                        }
                    }
                }
                catch (SqlException ex)
                {
                    
                    lblMessage.Text = $"Database error: {ex.Message}";
                }
                catch (Exception ex)
                {
                    
                    lblMessage.Text = $"An unexpected error occurred: {ex.Message}";
                }
            }
        }

        private bool EmailExists(string email, SqlConnection con)
        {
            string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                int count = (int)cmd.ExecuteScalar();
                return count > 0; // Return true if the email exists
            }
        }

        private bool UsernameExists(string username, SqlConnection con)
        {
            string query = "SELECT COUNT(*) FROM Users WHERE Username = @Username";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Username", username);
                int count = (int)cmd.ExecuteScalar();
                return count > 0; // Return true if the username exists
            }
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