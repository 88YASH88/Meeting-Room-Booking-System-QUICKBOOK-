using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Net.Mail;
using System.Net;

namespace MRBS.admin
{
    public partial class Respond : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"]?.ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["QueryID"] != null && int.TryParse(Request.QueryString["QueryID"], out int queryId))
                {
                    LoadQueryDetails(queryId);
                }
                else
                {
                    ShowAlert("Query ID is missing or invalid!");
                }
            }
        }

        private void LoadQueryDetails(int queryId)
        {
            if (string.IsNullOrEmpty(connectionString))
            {
                ShowAlert("Database connection string is not properly configured.");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT q.QueryID, q.Subject AS QuerySubject, q.Message AS QueryMessage, 
                           u.UserName, u.Email AS UserEmail 
                    FROM Query q 
                    INNER JOIN Users u ON q.UserID = u.UserID
                    WHERE q.QueryID = @QueryID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@QueryID", queryId);
                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Bind query details
                        lblQueryID.Text = reader["QueryID"].ToString();
                        lblUserName.Text = reader["UserName"].ToString();
                        lblUserEmail.Text = reader["UserEmail"].ToString();
                        lblQuerySubject.Text = reader["QuerySubject"].ToString();
                        lblQueryMessage.Text = reader["QueryMessage"].ToString();

                        // Admin response fields (empty by default)
                        txtResponseSubject.Text = reader["QuerySubject"].ToString(); 
                        txtResponseMessage.Text = string.Empty; 
                    }
                    else
                    {
                        ShowAlert("No data found for this Query ID.");
                    }
                }
            }
        }

        protected void btnSendResponse_Click(object sender, EventArgs e)
        {
            string toEmail = lblUserEmail.Text.Trim(); 
            string subject = txtResponseSubject.Text.Trim();
            string message = txtResponseMessage.Text.Trim();
            int queryId = Convert.ToInt32(lblQueryID.Text);

            if (string.IsNullOrWhiteSpace(subject) || string.IsNullOrWhiteSpace(message))
            {
                ShowAlert("Subject and Message cannot be empty.");
                return;
            }

            if (SendEmail(toEmail, subject, message))
            {
                UpdateQueryStatus(queryId);
                Response.Write("<script>alert('Response send successfully');</script>");
                Response.Redirect("Queries.aspx");
            }
            else
            {
                ShowAlert("Failed to send response. Please try again.");
            }
        }
        private void UpdateQueryStatus(int queryId)
        {
            if (string.IsNullOrEmpty(connectionString))
            {
                ShowAlert("Database connection string is not configured.");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string updateQuery = "UPDATE Query SET Status = 'Complete' WHERE QueryID = @QueryID";

                using (SqlCommand cmd = new SqlCommand(updateQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@QueryID", queryId);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        ShowAlert("Database error: " + ex.Message);
                    }
                }
            }
        }

        private bool SendEmail(string toEmail, string subject, string body)
        {
            try
            {
                string smtpHost = ConfigurationManager.AppSettings["SMTPHost"];
                int smtpPort = Convert.ToInt32(ConfigurationManager.AppSettings["SMTPPort"]);
                string smtpEmail = ConfigurationManager.AppSettings["SMTPEmail"];
                string smtpPassword = ConfigurationManager.AppSettings["SMTPPassword"];

                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(smtpEmail);
                    mail.To.Add(toEmail);
                    mail.Subject = subject;
                    mail.Body = body;
                    mail.IsBodyHtml = false;

                    using (SmtpClient smtp = new SmtpClient(smtpHost, smtpPort))
                    {
                        smtp.Credentials = new NetworkCredential(smtpEmail, smtpPassword);
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                    }
                }

                return true;
            }
            catch (Exception ex)
            {
                ShowAlert("Error: " + ex.Message);
                return false;
            }
        }

        private void ShowAlert(string message)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}');", true);
        }

        private void ShowAlertAndRedirect(string message, string url)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{message}'); window.location='{url}';", true);
        }
        private void btnclose(object sender, EventArgs e)
        {

        }
    }

}
