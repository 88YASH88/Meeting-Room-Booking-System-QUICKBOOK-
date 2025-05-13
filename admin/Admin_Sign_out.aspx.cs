using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRBS.admin
{
    public partial class Admin_Sign_out : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear the session
            Session.Clear();
            Session.Abandon();

            // Clearing authentication cookie (form authentication)
            if (Request.Cookies[".ASPXAUTH"] != null)
            {
                var authCookie = new HttpCookie(".ASPXAUTH", "");
                authCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(authCookie);
            }

            
            Response.Redirect("Admin_Sign_In.aspx"); 
        }
    }
}