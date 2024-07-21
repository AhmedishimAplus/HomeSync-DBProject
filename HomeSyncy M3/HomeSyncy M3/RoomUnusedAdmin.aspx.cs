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
    public partial class RoomUnusedAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ViewUnesd = new SqlCommand("ViewRoom", conn);
            ViewUnesd.CommandType = CommandType.StoredProcedure;
            conn.Open();


            //execute the procedure
            SqlDataReader rdr = ViewUnesd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
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

        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }

        protected void RoomSettings(object sender, EventArgs e)
        {
            Response.Redirect("Rooms.aspx");
        }
    }
}