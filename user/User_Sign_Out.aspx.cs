using System;
using System.Web;

namespace MRBS.user
{
    public partial class User_Sign_Out : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear the session
            Session.Clear();
            Session.Abandon();

            // Clear authentication cookie if using forms authentication
            if (Request.Cookies[".ASPXAUTH"] != null)
            {
                var authCookie = new HttpCookie(".ASPXAUTH", "");
                authCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(authCookie);
            }

       
            Response.Redirect("../index.aspx"); 
        }
    }
}