using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Assignment
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            var identityDbContext = new IdentityDbContext("IdentityConnectionString");
            var userStore = new UserStore<IdentityUser>(identityDbContext);
            var manager = new UserManager<IdentityUser>(userStore);

            var user = new IdentityUser() { UserName = txtRegUserName.Text, Email = txtRegUserName.Text };
            IdentityResult result = manager.Create(user, txtRegPassword.Text);

            if ( result.Succeeded)
            {

            }
            else
            {
                litRegisterError.Text = "An error has occured:" + result.Errors.FirstOrDefault();
            }
        }
    }
}