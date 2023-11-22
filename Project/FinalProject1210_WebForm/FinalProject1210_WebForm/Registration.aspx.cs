//PROG1210
//Vanscoy

//Registration Page for new users

using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNetCore.Session;

namespace SearchMovie
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
            UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);
            IdentityUser user = new IdentityUser(txtUser.Text);
            IdentityResult idResult = manager.Create(user, txtPass.Text);
            if (idResult.Succeeded)
            {
                this.lblMessage.Text = "User " + user.UserName + " created successfully";
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;

                var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                authenticationManager.SignIn(userIdentity);

                if (User.Identity.IsAuthenticated)
                {
                    Session["UserName"] = txtUser.Text;
                }
                Response.Redirect("~/Default.aspx");

            }
            else
            {
                this.lblMessage.Text = idResult.Errors.FirstOrDefault();
            }
        }
    }
}