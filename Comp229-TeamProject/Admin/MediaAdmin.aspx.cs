using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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

            // Populate the DropDownList
            //getStatus((DropDownList)MediaFormView.FindControl("DropDownListStatus"));
            //ErrorLabel.Text = ((DropDownList)MediaFormView.FindControl("DropDownListStatus")).Items.ToString();

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
            // getStatus((DropDownList)MediaFormView.FindControl("DropDownListStatus"));
            MediaGridView.Visible = false;
        }

        protected void UpdateCancelButton_Click(object sender, EventArgs e)
        {
            MediaGridView.Visible = true;
            MediaEditDataSource.SelectParameters["Id"].DefaultValue = "-1";
        }

        protected void getStatus(DropDownList myDropDown, String sqlCommand, String idField, String nameField)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnTeamProject"].ConnectionString);
            SqlCommand comm = new SqlCommand(sqlCommand, conn);
            SqlDataReader reader;
            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                myDropDown.DataSource = reader;
                myDropDown.DataValueField = idField;
                myDropDown.DataTextField = nameField;
                myDropDown.DataBind();
                //ErrorLabel.Text = reader.FieldCount.ToString() + "   " + myDropDown.Items.Count.ToString();

        }
    }
}