using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MRBS.admin
{
    public partial class queryResponse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        protected void btnSendResponse_Click(object sender, EventArgs e)
        {
            // Process response
            string responderName = txtResponderName.Text;
            string responderEmail = txtResponderEmail.Text;
            string subject = txtResponseSubject.Text;
            string message = txtResponseMessage.Text;

            // Your email sending or database logic

            // Clear fields after submission
            txtResponderName.Text = "";
            txtResponderEmail.Text = "";
            txtResponseSubject.Text = "";
            txtResponseMessage.Text = "";
        }

    }
}