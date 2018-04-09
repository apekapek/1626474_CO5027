using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var identityDBContext = new IdentityDbContext("IdentityConnectionString");
            //create user store and user manager
            var userStore = new UserStore<IdentityUser>(identityDBContext);
            var userManager = new UserManager<IdentityUser>(userStore);
            var user = userManager.Find(txtLogUsername.Text, txtLogPassword.Text);


            if (user != null)
            {
                LogUserIn(userManager, user);
            }
            else
            {
                litLoginError.Text = "Invalid username or password";

            }
        }

        private void LogUserIn(UserManager<IdentityUser> usermanager, IdentityUser user)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = usermanager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
            authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);
            //Note: user is automatically redirected if trying to access another page
            if (Request.QueryString["ReturnUrl"] != null)
            {
                Response.Redirect(Request.QueryString["ReturnUrl"]);
            }
            else
            {
                String userRoles = usermanager.GetRoles(user.Id).FirstOrDefault();

                if(userRoles.Equals("Admin"))
                {
                    Response.Redirect("~/admin/index.aspx");
                }
            }


        }

        
    }
}