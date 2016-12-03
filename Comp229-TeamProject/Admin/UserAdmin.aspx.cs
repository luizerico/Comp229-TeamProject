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
namespace Comp229_TeamProject.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserEditDataSource.SelectParameters["Id"].DefaultValue = UserGridView.SelectedValue.ToString();
            UserFormView.DataBind();
            gridViewPanel.Visible = false;

        }

        protected void UserFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            UserGridView.DataBind();
            UserGridView.SetPageIndex(UserGridView.PageCount);
            gridViewPanel.Visible = true;
        }

        protected void UserFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            UserGridView.DataBind();
            gridViewPanel.Visible = true;
            UserGridView.PagerSettings.Visible = true;
        }

        protected void UserFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            UserGridView.DataBind();
            UserGridView.PagerSettings.Visible = true;
        }

        protected void NewItem_Command(object sender, CommandEventArgs e)
        {
            UserFormView.ChangeMode(FormViewMode.Insert);
            // getStatus((DropDownList)UserFormView.FindControl("DropDownListStatus"));
            gridViewPanel.Visible = false;
        }

        protected void UpdateCancelButton_Click(object sender, EventArgs e)
        {
            gridViewPanel.Visible = true;
            UserEditDataSource.SelectParameters["Id"].DefaultValue = "-1";
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