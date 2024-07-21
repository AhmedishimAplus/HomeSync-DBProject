using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeSyncy_M3
{
    public partial class Rooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BookRoomButton(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomScheduleAdmin.aspx");
        }

        protected void ChangeStatus(object sender, EventArgs e)
        {
            Response.Redirect("RoomStatusAdmin.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomUnusedAdmin.aspx");
        }
        //both will be shown for admin and user
        protected void ViewAssignedRoom(object sender, EventArgs e)
        {
            Response.Redirect("ViewAssignedRoom.aspx");
        }

     

        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }
    }
}