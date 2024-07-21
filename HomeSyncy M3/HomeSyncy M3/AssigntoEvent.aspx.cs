using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeSyncy_M3
{
    public partial class AssigntoEvent : System.Web.UI.Page
    {
        protected TextBox event_id;
        protected TextBox user_id;
        protected Literal resultMessage;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendButton(object sender, EventArgs e)
        {
           
            try
            {
                string connStr = WebConfigurationManager.ConnectionStrings["HomeSync"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                string eventText = event_id.Text;
                if (string.IsNullOrEmpty(eventText))
                {
                    throw new ArgumentException("Event ID cannot be null or empty.");
                }

                if (!int.TryParse(eventText, out int eventID) || eventID <= 0)
                {
                    throw new ArgumentException("Event ID must be a positive integer.");
                }
                string userText = user_id.Text;
                if (string.IsNullOrEmpty(userText))
                {
                    throw new ArgumentException("User ID cannot be null or empty.");
                }

                if (!int.TryParse(userText, out int ouserId) || ouserId <= 0)
                {
                    throw new ArgumentException("User ID must be a positive integer.");
                }

                int userid = 0;
                int.TryParse(HttpContext.Current.Session["user_id"].ToString(), out userid);

                using (SqlCommand assignEventProc = new SqlCommand("IF EXISTS (SELECT 1 FROM Calender WHERE event_id = @event_id) SELECT 1 ELSE SELECT 0", conn))
                {
                    assignEventProc.Parameters.AddWithValue("@user_id2", ouserId);
                    assignEventProc.Parameters.AddWithValue("@event_id", eventID);

                    conn.Open();
                    bool eventExists = (int)assignEventProc.ExecuteScalar() == 1;
                    conn.Close();

                    if (!eventExists)
                    {
                        throw new InvalidOperationException("Didn't find the Event with the specified Event ID");
                    }
                }

                using (SqlCommand assignEventProc = new SqlCommand("IF EXISTS (SELECT 1 FROM Users WHERE id = @user_id2) SELECT 1 ELSE SELECT 0", conn))
                {
                    assignEventProc.Parameters.AddWithValue("@user_id2", ouserId);
                    assignEventProc.Parameters.AddWithValue("@event_id", eventID);

                    conn.Open();
                    bool userExists = (int)assignEventProc.ExecuteScalar() == 1;
                    conn.Close();

                    if (!userExists)
                    {
                        throw new InvalidOperationException("Didn't find the User with the specified User ID");
                    }
                }

                using (SqlCommand assignEventProc = new SqlCommand("IF EXISTS (SELECT 1 FROM Calender WHERE event_id = @event_id AND user_assigned_to = @user_id2) SELECT 0 ELSE SELECT 1", conn))
                {
                    assignEventProc.Parameters.AddWithValue("@user_id2", ouserId);
                    assignEventProc.Parameters.AddWithValue("@event_id", eventID);

                    conn.Open();
                    bool eventUserExists = (int)assignEventProc.ExecuteScalar() == 1;
                    conn.Close();

                    if (!eventUserExists)
                    {
                        throw new InvalidOperationException("User is already assigned to the Event");
                    }
                }

                using (SqlCommand assignEventProc = new SqlCommand("AssignUser", conn))
                {
                    assignEventProc.CommandType = CommandType.StoredProcedure;
                    assignEventProc.Parameters.Add(new SqlParameter("@user_id2", ouserId));
                    assignEventProc.Parameters.Add(new SqlParameter("@user_id", userid));
                    assignEventProc.Parameters.Add(new SqlParameter("@event_id", eventID));

                    conn.Open();
                    assignEventProc.ExecuteNonQuery();
                    conn.Close();

                    resultMessage.Text = "You assigned a user to the event";
                }
            }
            catch (Exception ex)
            {
                resultMessage.Text = $"An error occurred: {ex.Message}";
            }
        }

        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("ProfilePage.aspx");
        }
    }
}