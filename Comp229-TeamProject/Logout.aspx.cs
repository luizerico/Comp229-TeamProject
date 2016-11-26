using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
 * <author>Luiz Erico and Rister</author>
 * <date> 11-23-2016 </date>
 * <summary>Login Page</summary>
 */
namespace Comp229_TeamProject
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Logout and redirect to the login page.
        /// </summary>
        protected void Logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

        protected void ReturnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx", true);
        }
    }
}