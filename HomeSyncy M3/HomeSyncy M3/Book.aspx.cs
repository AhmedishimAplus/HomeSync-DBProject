using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace HomeSyncy_M3
{
    public partial class Book : System.Web.UI.Page
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
                form1.Controls.Add(new LiteralControl("<br/>"));
                Label aV = new Label();
                aV.Text = "Room Available: ";
                form1.Controls.Add(aV);
                form1.Controls.Add(new LiteralControl("<br/>"));

                int roomID = rdr.GetInt32(rdr.GetOrdinal("room_id"));

                Label roomIDLabel = new Label();
                roomIDLabel.Text = "Room ID: " + roomID;
                form1.Controls.Add(roomIDLabel);
                form1.Controls.Add(new LiteralControl("<br/>"));

                String Type = rdr.GetString(rdr.GetOrdinal("type"));
                Label TypeLabel = new Label();
                TypeLabel.Text = "Type: " + Type;
                form1.Controls.Add(TypeLabel);
                form1.Controls.Add(new LiteralControl("<br/>"));


                int floorID = rdr.GetInt32(rdr.GetOrdinal("floor"));
                Label floorIDLabel = new Label();
                floorIDLabel.Text = "Floor Number: " + floorID;
                form1.Controls.Add(floorIDLabel);
                form1.Controls.Add(new LiteralControl("<br/>"));




                String Status = rdr.GetString(rdr.GetOrdinal("status"));
                Label StatusLabel = new Label();
                StatusLabel.Text = "Status: " + Status;
                form1.Controls.Add(StatusLabel);
                form1.Controls.Add(new LiteralControl("<br/>"));

                form1.Controls.Add(new LiteralControl("<br/>"));
                form1.Controls.Add(new LiteralControl("<br/>"));

                HtmlGenericControl containerDiv = new HtmlGenericControl("div");
                containerDiv.Attributes["class"] = "transparent-container";

                // Add the labels and controls to the container div
                containerDiv.Controls.Add(new LiteralControl("<br/>"));
                containerDiv.Controls.Add(aV);
                containerDiv.Controls.Add(new LiteralControl("<br/>"));
                containerDiv.Controls.Add(roomIDLabel);
                containerDiv.Controls.Add(new LiteralControl("<br/>"));
                containerDiv.Controls.Add(TypeLabel);
                containerDiv.Controls.Add(new LiteralControl("<br/>"));
                containerDiv.Controls.Add(floorIDLabel);
                containerDiv.Controls.Add(new LiteralControl("<br/>"));

                // Adding Status label and control to the container div
              
                StatusLabel.Text = "Status: " + Status;
                containerDiv.Controls.Add(StatusLabel);
                containerDiv.Controls.Add(new LiteralControl("<br/>"));

                containerDiv.Controls.Add(new LiteralControl("<br/>"));
                containerDiv.Controls.Add(new LiteralControl("<br/>"));

                // Add the container div to the form
                form1.Controls.Add(containerDiv);

            }
        }

        protected void BookButton(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();

            // Retrieve user_id from the session variable
            int user_id = Convert.ToInt32(Session["user_id"]);
            int RoomID;

            // Parse RoomID from the text box
            if (int.TryParse(RoomIDBox.Text, out RoomID))
            {
                try
                {
                    // Create a new connection
                    using (SqlConnection conn = new SqlConnection(connStr))
                    {
                        // Create the command and specify that it is a stored procedure
                        using (SqlCommand Book = new SqlCommand("AssignRoom", conn))
                        {
                            Book.CommandType = CommandType.StoredProcedure;

                            // Add parameters
                            Book.Parameters.Add(new SqlParameter("@user_id", user_id));
                            Book.Parameters.Add(new SqlParameter("@room_id", RoomID));

                            conn.Open();

                            // Execute the stored procedure
                            int rowsAffected = Book.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                // Data added successfully
                                string insertionMessage = "Room Booked Successfully";
                                // Display a success message
                                SuccessLabel.Text = insertionMessage;
                                FailureLabel.Text = string.Empty; // Clear any previous error messages
                            }
                            else
                            {
                                // No rows affected, data not added
                                FailureLabel.Text = "Room not available or already booked";
                                SuccessLabel.Text = string.Empty; // Clear any previous success messages
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions (e.g., log the error)
                    FailureLabel.Text = "Error: " + ex.Message;
                    SuccessLabel.Text = string.Empty; // Clear any previous success messages
                }
            }
            else
            {
                // Handle the case where parsing fails
                FailureLabel.Text = "Invalid Room ID. Please enter a valid integer value.";
                SuccessLabel.Text = string.Empty; // Clear any previous success messages
            }
        }

        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
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
    }

}