using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace HomeSyncy_M3
{
    public partial class CreateEvent : System.Web.UI.Page
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

        // ... (Your existing code)

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            DateTime remDate;



            if (DateTime.TryParse(Reminder.Text, out remDate))
            {
                // Parsing successful, proceed with your logic
                int user_id = Convert.ToInt32(Session["user_id"]);
                int Ev = int.TryParse(Event.Text, out int result) ? result : 0;
                String Loc = Location.Text;
                String descrpt = Description.Text;
                int OtherUser = int.TryParse(Event.Text, out result) ? result : 0;
                String name = Name.Text;




                SqlCommand creatEv = new SqlCommand("CreateEvent", conn);
                creatEv.CommandType = System.Data.CommandType.StoredProcedure; // Specify that it's a stored procedure

                // Add parameters
                creatEv.Parameters.Add(new SqlParameter("@event_id", Ev));
                creatEv.Parameters.Add(new SqlParameter("@user_id", user_id));
                creatEv.Parameters.Add(new SqlParameter("@name", name));
                creatEv.Parameters.Add(new SqlParameter("@description", descrpt));
                creatEv.Parameters.Add(new SqlParameter("@location", Loc));
                creatEv.Parameters.Add(new SqlParameter("@reminder_date", remDate));
                creatEv.Parameters.Add(new SqlParameter("@other_user_id", OtherUser));


                SqlCommand CreateEv = new SqlCommand("CreateEvent", conn);
                CreateEv.CommandType = System.Data.CommandType.StoredProcedure;
                // Specify that it's a stored procedure

                try
                {
                    conn.Open();
                    int rowsAffected = creatEv.ExecuteNonQuery();


                    if (rowsAffected > 0)
                    {
                        string insertionMessage = "Data added successfully";
                        InsertionLabel.Text = insertionMessage;

                        // Redirect with the insertion message in the query string
                        Response.Redirect($"CreateEvent.aspx?insertionMessage={insertionMessage}");
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
        protected void EventButton(object sender, EventArgs e)
        {
            Response.Redirect("EventsUser.aspx");
        }

    }

}