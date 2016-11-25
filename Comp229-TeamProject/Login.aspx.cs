using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_TeamProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdLogin_ServerClick(object sender, EventArgs e)
        {
            if (ValidateUser(UserName.Value, UserPass.Value))
                FormsAuthentication.RedirectFromLoginPage(UserName.Value, RememberCookie.Checked);
            else
                Response.Redirect("~/Login.aspx", true);
        }

        private bool ValidateUser(string username, string password)
        {
            SqlConnection conn;
            SqlCommand comm;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnTeamProject"].ConnectionString;
            conn = new SqlConnection(connectionString);

            string lookupPassword = null;

            if ((username == null) || (username.Length == 0)) { 
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Invalid Username or Password.");
                return false;
            }

            if ((password == null) || (password.Length == 0)){
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Invalid Username or Password.");
                Message.Text = "[ValidateUser] Invalid Username or Password.";
                return false;
            }


            try
            {
                conn.Open();
                comm = new SqlCommand("Select pwd from users where uname=@userName", conn);
                comm.Parameters.Add("@userName", SqlDbType.VarChar, 25).Value = username;
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Error checking the database. " + comm.CommandText.ToString());
                comm.ExecuteNonQuery();

                lookupPassword = (string)comm.ExecuteScalar();

                comm.Dispose();
                conn.Dispose();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Error checking the database. " + ex.Message);
            }
            finally
            {
                conn.Close();
            }
            
            
            return (string.Compare(lookupPassword, password, false) == 0);

        }
    }
}