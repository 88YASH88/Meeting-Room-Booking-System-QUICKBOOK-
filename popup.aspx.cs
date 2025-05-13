using System;

namespace MRBS
{
    public partial class popup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get query parameters for dynamic message
                string title = Request.QueryString["title"] ?? "Alert";
                string message = Request.QueryString["message"] ?? "Something happened!";

                // Assign values to the frontend elements
                popupTitle.InnerText = title;
                popupMessage.InnerText = message;
            }
        }
    }
}
