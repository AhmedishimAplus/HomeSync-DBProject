using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace HomeSyncy_M3
{
    public partial class RemoveEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // You can add any initialization logic here
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Assuming you have eventId and userId values from your UI or somewhere else
            int eventId;
            int userId;

            if (int.TryParse(TextBox8.Text, out eventId) && int.TryParse(TextBox7.Text, out userId))
            {
                RemoveEventFromSystem(eventId, userId);
            }
            else
            {
                Message3.Text = "Invalid input. Please enter valid numeric values.";
            }
        }

        protected void RemoveEventFromSystem(int eventId, int userId)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand removeEventCommand = new SqlCommand("RemoveEvent", conn))
                {
                    removeEventCommand.CommandType = CommandType.StoredProcedure;

                    try
                    {
                        conn.Open();

                        // Assuming you have appropriate parameters in the "RemoveEvent" stored procedure
                        removeEventCommand.Parameters.Add(new SqlParameter("@event_id", eventId));
                        removeEventCommand.Parameters.Add(new SqlParameter("@user_id", userId));

                        int rowsAffected = removeEventCommand.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Event removal successful
                            Message1.Text = "Event removed successfully from the system.";
                        }
                        else
                        {
                            // No rows affected, event not removed
                            Message2.Text = "Event not removed from the system.";
                        }
                    }
                    catch (SqlException ex)
                    {
                        Message3.Text = "Error removing event: " + ex.Message;
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
            }
        }
    }
}