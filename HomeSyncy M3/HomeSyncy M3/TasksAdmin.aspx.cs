using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeSyncy_M3
{
    public partial class TasksAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void viewButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewMyTasks.aspx");
        }

        protected void Status_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewStatus.aspx");
        }

        protected void Addreminder_Click(object sender, EventArgs e)
        {
            Response.Redirect("ADDREM.aspx");
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateDedlinePAGE.aspx");
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }
    }
}