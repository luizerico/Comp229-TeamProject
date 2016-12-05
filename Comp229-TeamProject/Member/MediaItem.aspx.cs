using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_TeamProject
{
    public partial class MediaItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void onInsertComment(object sender, EventArgs e)
        {
            DateTime myDateTime = DateTime.Now;
            ReviewGridDataSource.InsertParameters.Add("Registered_date", myDateTime.ToString("yyyy-MM-dd HH:mm:ss.fff"));
        }
    }
}