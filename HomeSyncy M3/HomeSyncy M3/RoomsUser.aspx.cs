using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeSyncy_M3
{
    public partial class RoomsUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BookRoomButton(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx");
        }

        protected void ViewAssignButton(object sender, EventArgs e)
        {
            Response.Redirect("ViewAssignedRoom.aspx");
        }

        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }
    }
}