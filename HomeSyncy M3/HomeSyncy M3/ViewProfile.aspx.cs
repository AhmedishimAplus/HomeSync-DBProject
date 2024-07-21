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
    public partial class ViewProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            //inputs
            // Retrieve user_id from the session variable
            int user_id = Convert.ToInt32(Session["user_id"]);


            //intiate the procedure 
            SqlCommand Profiles = new SqlCommand("ViewProfile", conn);
            Profiles.CommandType = CommandType.StoredProcedure;
            Profiles.Parameters.Add(new SqlParameter("@user_id", user_id));
            conn.Open();

            // ... Existing code ...
            // Execute the procedure
            SqlDataReader rdr = Profiles.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String userType = rdr.GetString(rdr.GetOrdinal("type"));
                Session["userType"] = userType;
                // Create a div to hold the profile details
                HtmlGenericControl profileDetailsContainer = new HtmlGenericControl("div");
                profileDetailsContainer.Attributes["class"] = "profile-details-box";

                // Iterate through each attribute and add labels to the container
                foreach (var attribute in GetProfileAttributes(rdr))
                {
                    Label attributeLabel = new Label();
                    attributeLabel.Text = $"{attribute.Key}: {attribute.Value}";

                    // Add the label to the container
                    profileDetailsContainer.Controls.Add(attributeLabel);
                    profileDetailsContainer.Controls.Add(new LiteralControl("<br/>"));
                }

                // Add the profile details container to the form
                form1.Controls.Add(profileDetailsContainer);
            }
           

        }
        // Helper method to get profile attributes as key-value pairs
        private Dictionary<string, string> GetProfileAttributes(SqlDataReader rdr)
        {
            guestsetter1.Visible = false;
            guestget1.Visible = false;
            deleteaguest1.Visible = false;
            Dictionary<string, string> attributes = new Dictionary<string, string>();

            attributes.Add("FirstName", rdr.GetString(rdr.GetOrdinal("f_name")));
            attributes.Add("LastName", rdr.GetString(rdr.GetOrdinal("L_name")));
            attributes.Add("Password", rdr.GetString(rdr.GetOrdinal("password")));
            attributes.Add("Email", rdr.GetString(rdr.GetOrdinal("email")));

            int preferenceOrdinal = rdr.GetOrdinal("preference");
            attributes.Add("Preference", !rdr.IsDBNull(preferenceOrdinal) ? rdr.GetString(preferenceOrdinal) : "Not set");
            //needed to know type
            String Type = rdr.GetString(rdr.GetOrdinal("type"));
            attributes.Add("Type", rdr.GetString(rdr.GetOrdinal("type")));

            // Check if the user is an admin to include additional attributes
            string userType = rdr.GetString(rdr.GetOrdinal("type"));
            if (userType.Equals("admin", StringComparison.OrdinalIgnoreCase))
            {
                int numberOfGuestsAllowedOrdinal;
                if (rdr.GetOrdinal("no_of_guests_allowed") != -1 &&
                    !rdr.IsDBNull(numberOfGuestsAllowedOrdinal = rdr.GetOrdinal("no_of_guests_allowed")))
                {
                    int numberOfGuestsAllowed = rdr.GetInt32(numberOfGuestsAllowedOrdinal);
                    attributes.Add("Number of Guests Allowed", numberOfGuestsAllowed.ToString());
                }

                int salaryOrdinal;
                if (rdr.GetOrdinal("salary") != -1 &&
                    !rdr.IsDBNull(salaryOrdinal = rdr.GetOrdinal("salary")))
                {
                    decimal salary = rdr.GetDecimal(salaryOrdinal);
                    attributes.Add("Salary", salary.ToString());
                }
            }
         
           
            // Add the age attribute
            int age = rdr.GetInt32(rdr.GetOrdinal("age"));
            attributes.Add("Age", age.ToString());

            //adds type to session need as an admin will see different things

            Session["userType"] = Type;
            string userType1 = Session["userType"] as string;

            // Redirect based on user type
            if (userType1 != null && userType1.Equals("Admin", StringComparison.OrdinalIgnoreCase))
            {
                guestsetter1.Visible = true;
                guestget1.Visible = true;
                deleteaguest1.Visible = true;
            }
            

            return attributes;
        }

        protected void RoomsButton(object sender, EventArgs e)
        {
            // Retrieve user type from the session variable
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
        protected void TasksButton_Click(object sender, EventArgs e)
        {
            // Retrieve user type from the session variable
            string userType = Session["userType"] as string;

            // Redirect based on user type
            
            
                Response.Redirect("TasksAdmin.aspx");
            
           
            
        }

        protected void DevicesButton(object sender, EventArgs e)
        {
            // Retrieve user type from the session variable
            string userType = Session["userType"] as string;

            // Redirect based on user type
            if (userType != null && userType.Equals("Admin", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("DevicesAdmin.aspx");
            }
            else
            {
                Response.Redirect("DevicesUser.aspx");
            }
        }

        protected void EventsButton(object sender, EventArgs e)
        {
            // Retrieve user type from the session variable
            string userType = Session["userType"] as string;

            // Redirect based on user type
            if (userType != null && userType.Equals("Admin", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("EventsUser.aspx");
            }
            else
            {
                Response.Redirect("EventsUser.aspx");
            }
        }

        protected void guestsetter(object sender, EventArgs e)
        {
            Response.Redirect("GuestSet.aspx");
        }

        protected void guestgetter(object sender, EventArgs e)
        {
            Response.Redirect("GuestGet.aspx");
        }

        protected void guestDeleter(object sender, EventArgs e)
        {
            Response.Redirect("GuestDel.aspx");
        }
    }
}