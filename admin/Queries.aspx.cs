using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRBS.admin
{

    public partial class Queries : System.Web.UI.Page
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["MRBSConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["Email"] == null)
            {
                Response.Redirect("Admin_Sign_in.aspx"); 
            }
            else
            {
                lblUsername.Text = Session["Username"].ToString();
                lblPendingQueryCount.Text = getPendingcount().ToString();
                lblCompleteQueryCount.Text = getCompletedAndRejectedCount().ToString();

                getPendingQueries();   
                getCompletedAndRejectedQueries(); 
            }

        }

      
        private void getPendingQueries()
        {
            string query = "SELECT QueryID, UserId, Subject, SubmissionDate, ResponseStatus FROM Query WHERE ResponseStatus = 'Pending'";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                PendingQueryRepeater.DataSource = dataTable;
                PendingQueryRepeater.DataBind();
            }
        }

       
        private void getCompletedAndRejectedQueries()
        {
            string query = "SELECT UserId, Subject, SubmissionDate, ResponseStatus FROM Query WHERE ResponseStatus IN ('Completed', 'Rejected')";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter adapter = new SqlDataAdapter(query, conn);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                CompletedQueryRepeater.DataSource = dataTable;
                CompletedQueryRepeater.DataBind();
            }
        }

   
        private int getPendingcount()
        {
            int count = 0;
            string pendingQuery = "SELECT COUNT(*) FROM Query WHERE ResponseStatus='Pending'";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                try
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(pendingQuery, conn))
                    {
                        count = (int)cmd.ExecuteScalar();
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error in getting pending query count.')</script>");
                }
            }
            return count;
        }


        private int getCompletedAndRejectedCount()
        {
            int count = 0;
            string completedQuery = "SELECT COUNT(*) FROM Query WHERE ResponseStatus IN ('Completed', 'Rejected')";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand(completedQuery, conn))
                    {
                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            count = Convert.ToInt32(result);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error in getting Completed and Rejected Query count: " + ex.Message + "')</script>");
            }

            return count;
        }

        protected void btnSendResponse_Click(object sender, EventArgs e)
        {
          
            string responderName = txtResponderName.Text;
            string responderEmail = txtResponderEmail.Text;
            string subject = txtResponseSubject.Text;
            string message = txtResponseMessage.Text;

       

            
            txtResponderName.Text = "";
            txtResponderEmail.Text = "";
            txtResponseSubject.Text = "";
            txtResponseMessage.Text = "";
        }




    }
}