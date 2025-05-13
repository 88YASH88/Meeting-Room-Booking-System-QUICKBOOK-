using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace MRBS.user
{
    public partial class contact : System.Web.UI.Page
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                if (Session["Username"] != null && Session["Email"] != null && Session["PhoneNo"] != null)
                {
                    string username = Session["Username"].ToString();
                    string email = Session["Email"].ToString();
                    string phoneNo = Session["PhoneNo"].ToString(); 

                    lblMessage.Text = username;
                    txtName.Text = username;
                    txtEmail.Text = email;
                    txtPhone.Text = phoneNo; 
                    txtName.Enabled = false;
                    txtEmail.Enabled = false;
                    txtPhone.Enabled = false;
                }
                else
                {
                    lblMessage.Text = "You are not logged in.";
                    Response.Redirect("User_Sign_in.aspx", false);
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["Username"] == null)
                {
                    Response.Write("<script>alert('Error: Session expired. Please log in again.');</script>");
                    Response.Redirect("User_Sign_in.aspx", false);
                    return;
                }

                string username = Session["Username"].ToString();
                string message = txtMessage.Text;
                string subject = txtSubject.Text;
                string contactNo = txtPhone.Text;
                int userId = -1;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                
                    string getUserIdQuery = "SELECT UserID FROM Users WHERE Username = @Username";
                    using (SqlCommand cmdUser = new SqlCommand(getUserIdQuery, con))
                    {
                        cmdUser.Parameters.AddWithValue("@Username", username);
                        object result = cmdUser.ExecuteScalar();

                        if (result != null)
                        {
                            userId = Convert.ToInt32(result);
                        }
                        else
                        {
                            Response.Write("<script>alert('Error: User not found.');</script>");
                            return;
                        }
                    }

                   
                    string insertQuery = @"INSERT INTO Query (UserID, Message, Subject, ContactNo, SubmissionDate, ResponseStatus)  
                                   VALUES (@UserID, @Message, @Subject, @ContactNo, GETDATE(), @ResponseStatus);";

                    using (SqlCommand cmdInsert = new SqlCommand(insertQuery, con))
                    {
                        cmdInsert.Parameters.AddWithValue("@UserID", userId);
                        cmdInsert.Parameters.AddWithValue("@Message", message);
                        cmdInsert.Parameters.AddWithValue("@Subject", subject);
                        cmdInsert.Parameters.AddWithValue("@ContactNo", contactNo);
                        cmdInsert.Parameters.AddWithValue("@ResponseStatus", "Pending");

                        int rowsAffected = cmdInsert.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Message", "showMessage('success');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Message", "showMessage('error');", true);
                        }
                    }

                    con.Close();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Message", "showMessage('error');", true);
            }
        }
    }
}
