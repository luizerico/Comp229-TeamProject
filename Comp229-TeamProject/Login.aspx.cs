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

/*
 * <author>Luiz Erico and Rister</author>
 * <date> 11-23-2016 </date>
 * <summary>Login Page</summary>
 */
namespace Comp229_TeamProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Capture the button click and send the username and password
        /// to be checked. Return the user to the login page if login fail.
        /// Redirect to the page requested or default.aspx page if login successful.
        /// </summary>
        protected void cmdLogin_ServerClick(object sender, EventArgs e)
        {
            if (ValidateUser(UserName.Value, UserPass.Value))
                FormsAuthentication.RedirectFromLoginPage(UserName.Value, RememberCookie.Checked);
            else
                Response.Redirect("~/Login.aspx", true);
        }

        /// <summary>
        /// Check if the user and password informed are present in the database
        /// and return true in case positive or false if negative.
        /// </summary>
        /// <param name="username">username</param>
        /// <param name="password">password</param>
        private bool ValidateUser(string username, string password)
        {
            SqlConnection conn;
            SqlCommand comm;
            string connectionString = ConfigurationManager.ConnectionStrings["ConnTeamProject"].ConnectionString;
            conn = new SqlConnection(connectionString);

            string lookupPassword = null;
            int userid = -1;

            if ((username == null) || (username.Length == 0)) { 
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Invalid Username or Password.");
                return false;
            }

            if ((password == null) || (password.Length == 0)){
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Invalid Username or Password.");
                Message.Text = "[ValidateUser] Invalid Username or Password.";
                return false;
            }

            // connect to the database and return the password to be compared with the
            // value passed to the function.
            try
            {
                conn.Open();
                comm = new SqlCommand("Select Id, Password from users where Username=@userName", conn);
                comm.Parameters.Add("@userName", SqlDbType.VarChar, 25).Value = username;
                System.Diagnostics.Trace.WriteLine("[ValidateUser] Error checking the database. " + comm.CommandText.ToString());
                comm.ExecuteNonQuery();

                SqlDataReader reader =comm.ExecuteReader();
                while (reader.Read())
                {
                    userid  = reader.GetInt32(0);
                    lookupPassword = reader.GetString(1);
                }

                //lookupPassword = (string)reader.GetString(0);
                //Console.WriteLine((string)reader.GetString(0));
                //lookupPassword = (string)comm.ExecuteScalar();
                Console.WriteLine("sfasdfasdfasdfasdfasdfasdfasdfads\n");
                reader.Close();
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

            Session["userid"] = userid;
            return (string.Compare(lookupPassword, password, false) == 0);

        }
    }
}