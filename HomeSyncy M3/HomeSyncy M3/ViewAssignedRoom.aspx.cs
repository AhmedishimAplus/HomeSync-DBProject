using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HomeSyncy_M3
{
    public partial class ViewAssignedRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            // Create a new connection
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand ViewRoom = new SqlCommand("ViewRoomsFirst", conn);
                ViewRoom.CommandType = CommandType.StoredProcedure;

                // Retrieve user_id from the session variable
                int user_id = Convert.ToInt32(Session["user_id"]);
                ViewRoom.Parameters.Add(new SqlParameter("@user_id", user_id));
                conn.Open();

                SqlDataReader rdr = ViewRoom.ExecuteReader();
                while (rdr.Read())
                {
                    // Create a div for the transparent container
                    HtmlGenericControl containerDiv = new HtmlGenericControl("div");
                    containerDiv.Attributes["class"] = "container"; // Apply container class

                    // Add the labels and controls to the container div
                    containerDiv.Controls.Add(new LiteralControl("<br/>"));

                    int roomID = rdr.GetInt32(rdr.GetOrdinal("room_id"));
                    Label roomIDLabel = new Label();
                    roomIDLabel.Text = "Room ID: " + roomID;
                    containerDiv.Controls.Add(roomIDLabel);
                    containerDiv.Controls.Add(new LiteralControl("<br/>"));

                    String Type = rdr.GetString(rdr.GetOrdinal("type"));
                    Label TypeLabel = new Label();
                    TypeLabel.Text = "Type: " + Type;
                    containerDiv.Controls.Add(TypeLabel);
                    containerDiv.Controls.Add(new LiteralControl("<br/>"));

                    int floorID = rdr.GetInt32(rdr.GetOrdinal("floor"));
                    Label floorIDLabel = new Label();
                    floorIDLabel.Text = "Floor Number: " + floorID;
                    containerDiv.Controls.Add(floorIDLabel);
                    containerDiv.Controls.Add(new LiteralControl("<br/>"));

                    String Status = rdr.GetString(rdr.GetOrdinal("status"));
                    Label StatusLabel = new Label();
                    StatusLabel.Text = "Status: " + Status;
                    containerDiv.Controls.Add(StatusLabel);
                    containerDiv.Controls.Add(new LiteralControl("<br/>"));

                    containerDiv.Controls.Add(new LiteralControl("<br/>"));
                    containerDiv.Controls.Add(new LiteralControl("<br/>"));

                    // Add the container div to the form
                    form1.Controls.Add(containerDiv);
                }
            }
        }

        protected void RoomSettings(object sender, EventArgs e)
        {
            string userType = Session["userType"] as string;

            // Redirect based on user type
            if (userType != null && userType.Equals("Admin", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("Rooms.aspx");
            }
            else
            {
                Response.Redirect("RoomsUser.aspx");
            }
        }

        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }
    }
}