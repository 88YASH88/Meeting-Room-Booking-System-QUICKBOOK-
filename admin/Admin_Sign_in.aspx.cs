using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRBS
{
    public partial class Admin_Sign_in : System.Web.UI.Page
    {
        private readonly string _connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text.Trim();
            string password = TextBox2.Text.Trim();

            if (AuthenticateUser(username, password, out string email, out string role))
            {
                if (role.Equals("Admin", StringComparison.OrdinalIgnoreCase))
                {
                    // Store admin details in session
                    Session["Username"] = username;
                    Session["Email"] = email;
                    Session["Role"] = role; 

             
                    Response.Redirect("admin_Dashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "Access denied! Only admins can log in.";
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

        private bool AuthenticateUser(string username, string password, out string email, out string role)
        {
            email = null;
            role = null;

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                try
                {
                    conn.Open();
                    string query = "SELECT Email, PasswordHash, Role FROM Users WHERE Username = @Username";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string storedHash = reader["PasswordHash"].ToString();
                                email = reader["Email"].ToString();
                                role = reader["Role"].ToString(); 

                                return VerifyPassword(password, storedHash);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.Visible = true;
                }
            }
            return false;
        }

        private bool VerifyPassword(string enteredPassword, string storedHash)
        {
            string hashedPassword = HashPassword(enteredPassword);
            return hashedPassword == storedHash;
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = Encoding.UTF8.GetBytes(password);
                byte[] hash = sha256.ComputeHash(bytes);
                return Convert.ToBase64String(hash);
            }
        }
    }
}
