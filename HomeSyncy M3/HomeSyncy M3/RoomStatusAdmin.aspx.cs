using System;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace HomeSyncy_M3
{
    public partial class RoomStatusAdmin : System.Web.UI.Page
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

            int locationValue;
            string status;

            if (int.TryParse(LocationTextBox.Text, out locationValue) && !string.IsNullOrEmpty(StatusTextBox.Text))
            {
                status = StatusTextBox.Text;


                if (status.ToString().Equals("Available") || status.ToString().Equals("Used"))
                {
                    SqlCommand roomstatus = new SqlCommand("RoomAvailability", conn);
                    roomstatus.CommandType = CommandType.StoredProcedure;

                    roomstatus.Parameters.Add(new SqlParameter("@location", locationValue));
                    roomstatus.Parameters.Add(new SqlParameter("@status", status));

                    try
                    {
                        conn.Open();
                        int rowsAffected = roomstatus.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            string insertionMessage = "Data added successfully";
                            InsertionLabel.Text = insertionMessage;

                            // Redirect with the insertion message in the query string
                            Response.Redirect($"RoomStatusAdmin.aspx?insertionMessage={insertionMessage}");
                        }
                        else
                        {
                            string insertionMessage2 = "Data wasn't added. Please check the details and try again.";
                            InsertionLabel.Text = insertionMessage2;
                        }
                    }
                    catch (Exception ex)
                    {
                        InsertionLabel.Text = "Error: " + ex.Message;
                    }
                    finally
                    {
                        conn.Close();
                    }
                }
                else
                {
                    InsertionLabel.Text = "Please Insert either Available or Used";
                }
            }
            else
            {
                InsertionLabel.Text = "Invalid input. Please enter valid values.";
            }
        }

        protected void RoomSettings(object sender, EventArgs e)
        {
            Response.Redirect("Rooms.aspx");
        }

        protected void Home(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }
    }
}
