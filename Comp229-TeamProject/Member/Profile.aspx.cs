using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
 * <author>Luiz Erico and Rister</author>
 * <date> 11-23-2016 </date>
 * <summary>Login Page</summary>
 */
namespace Comp229_TeamProject
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void uploadFile(object sender, EventArgs e)
        {
            // Using FindControl and a Casting to get the fileupload values
            FileUpload fl1 = ((FileUpload)UserFormView.FindControl("photoFile"));
            if (fl1.FileName != null && fl1.FileContent.Length > 0)
            {
                string folderPath = Server.MapPath("~/Resources/Uploads/");
                fl1.SaveAs(folderPath + Path.GetFileName(fl1.FileName));
                ((TextBox)UserFormView.FindControl("photoTextBox")).Text = fl1.FileName;
            }

        }
    }
}