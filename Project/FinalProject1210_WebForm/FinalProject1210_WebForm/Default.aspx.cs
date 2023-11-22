using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.Xml;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;


namespace FinalProject1210_WebForm
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                lblUserName.Text = (string)Session["UserName"];
                btnLogOut.Text = "LogOut";
            }               
            else
            {
                lblUserName.Text = "Unknown User";
                btnLogOut.Text = "LogIn";
            }
            //Session["SelectedCust"] = "";
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            if (btnLogOut.Text == "LogOut")
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                authenticationManager.SignOut();
            }
            Response.Redirect("~/Login.aspx");
        }
    }
}