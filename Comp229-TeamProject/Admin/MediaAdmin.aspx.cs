using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*
 * <author>Luiz Erico and Site Li(Rister)</author>
 * <date> 11-30-2016 </date>
 * <summary>Login Page</summary>
 */
namespace Comp229_TeamProject.Admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            MediaEditDataSource.SelectParameters["Id"].DefaultValue = MediaGridView.SelectedValue.ToString();
            MediaFormView.DataBind();
            MediaGridView.Visible = false;
        }

        protected void MediaFormView_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            MediaGridView.DataBind();
            MediaGridView.SetPageIndex(MediaGridView.PageCount);
            MediaGridView.Visible = true;
        }

        protected void MediaFormView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            MediaGridView.DataBind();
            MediaGridView.PagerSettings.Visible = true;
        }

        protected void MediaFormView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            MediaGridView.DataBind();
            MediaGridView.PagerSettings.Visible = true;
        }

        protected void NewItem_Command(object sender, CommandEventArgs e)
        {
            MediaFormView.ChangeMode(FormViewMode.Insert);
            MediaGridView.Visible = false;
        }

        protected void UpdateCancelButton_Click(object sender, EventArgs e)
        {
            MediaGridView.Visible = true;
            MediaEditDataSource.SelectParameters["Id"].DefaultValue = "-1";
        }
    }
}