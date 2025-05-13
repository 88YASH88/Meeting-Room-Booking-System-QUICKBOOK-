using System;
using System.Web.UI;

namespace MRBS.user
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null && Session["Email"] != null)
            {
                string username = Session["Username"].ToString();
                string email = Session["Email"].ToString();
                lblMessage.Text = $"Welcome {username}"; 
            }
            else
            {
                lblMessage.Text = "You are not logged in.";
                Response.Redirect("User_Sign_in.aspx");
            }
        }
    }
}