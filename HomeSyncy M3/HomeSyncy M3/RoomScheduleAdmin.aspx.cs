using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace HomeSyncy_M3
{
    public partial class RoomSchedule : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the page is not in postback to avoid executing this code on every page load
            if (!IsPostBack)
            {
                // Check if the insertion message is present in the URL
                string insertionMessage = Request.QueryString["insertionMessage"];
                if (!string.IsNullOrEmpty(insertionMessage))
                {
                    InsertionLabel.Text = insertionMessage;
                }
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            DateTime startTime;
            DateTime endTime;

            if (DateTime.TryParse(Start.Text, out startTime) && DateTime.TryParse(End.Text, out endTime))
            {
                // Parsing successful, proceed with your logic
                int user_id = Convert.ToInt32(Session["user_id"]);
                int room_id = int.TryParse(RoomID.Text, out int result) ? result : 0;
                String action = Action.Text;


                SqlCommand roomSch = new SqlCommand("CreateSchedule", conn);
                roomSch.CommandType = System.Data.CommandType.StoredProcedure; // Specify that it's a stored procedure

                // Add parameters
                roomSch.Parameters.Add(new SqlParameter("@creator_id", user_id));
                roomSch.Parameters.Add(new SqlParameter("@room_id", room_id));
                roomSch.Parameters.Add(new SqlParameter("@start_time", startTime));
                roomSch.Parameters.Add(new SqlParameter("@end_time", endTime));
                roomSch.Parameters.Add(new SqlParameter("@action", action));

                try
                {
                    conn.Open();
                    int rowsAffected = roomSch.ExecuteNonQuery();


                    if (rowsAffected > 0)
                    {
                        string insertionMessage = "Data added successfully";
                        InsertionLabel.Text = insertionMessage;

                        // Redirect with the insertion message in the query string
                        Response.Redirect($"RoomScheduleAdmin.aspx?insertionMessage={insertionMessage}");
                    }
                    else
                    {
                        string insertionMessage2 = "Data wasn't added. Please check the details and try again.";
                        InsertionLabel.Text = insertionMessage2;
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions (e.g., log the error)
                    Response.Write("Error: " + ex.Message);
                }
                finally
                {
                    conn.Close();
                }
            }
            else
            {
                // Handle the case where parsing fails
                InsertionLabel.Text = "Invalid input. Please enter valid values.";
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