using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Assignment
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Clicks(object sender, EventArgs e)
        {
            // Sends email using a mail server that requires login credentials and a secure connection, e.g. gmail

            //create mail client and message with to and from address, and set message subject and body
            SmtpClient smtpClient = new SmtpClient();
            MailMessage msg = new MailMessage("apekassignment@gmail.com", "apekassignment@gmail.com");


            //settings sepcific to the mail service, e.g. server location, port number and that ssl is required
            smtpClient.Host = "smtp.gmail.com";
            smtpClient.Port = 587;
            smtpClient.EnableSsl = true;

            //create credentials - e.g. username and password for the account
            System.Net.NetworkCredential credentials = new System.Net.NetworkCredential("apekassignment@gmail.com", "lola1lola");
            smtpClient.Credentials = credentials;

            msg.Subject = "Dear " + txtName.Text + ", thank you for your feedback!";
            msg.Body = "Dear " + txtName.Text + "( " + txtEmail.Text + " )" + ". This is to notify you that we have received your message from our website: [" + txtSubject.Text + "], Message details: " + txtMessage.Text;
            

            try
            {
                smtpClient.Send(msg);
                litResult.Text =
                    "<p>Success, mail sent using SMTP with secure connection and credentials</p>";
                txtName.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtSubject.Text = string.Empty;
                txtMessage.Text = string.Empty;
            }
            catch (Exception ex)
            {
                //display the full error to the user
                litResult.Text =
                    "<p>Send failed: " + ex.Message + ":" + ex.InnerException + "</p>";
            }
        }
    }
}
