using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeSyncy_M3
{
    public partial class EventsUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Remove.Visible = false; 
            string userType = Session["userType"] as string;
            if (userType != null && userType.Equals("Admin", StringComparison.OrdinalIgnoreCase)) { 
            Remove.Visible = true;  
            }
        }

        protected void Create_Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateEvent.aspx");
        }

        protected void View_Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewEvent.aspx");
        }

        protected void Assign_Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AssigntoEvent.aspx");
        }



        protected void Button_uninvite_Click(object sender, EventArgs e)
        {
            Response.Redirect("UninviteUser.aspx");
        }

        

        protected void Remove_Click(object sender, EventArgs e)
        {
            Response.Redirect("RemoveEvent.aspx");
        }
    }
}