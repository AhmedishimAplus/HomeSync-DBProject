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
    public partial class ViewEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;

        }

        protected void one_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            int user_id = Convert.ToInt32(Session["user_id"]);
            SqlCommand ViewEvent = new SqlCommand("ViewEvents ", conn);
            ViewEvent.CommandType = CommandType.StoredProcedure;

            if (string.IsNullOrEmpty(TextBox1.Text))
            {

                ViewEvent.Parameters.Add(new SqlParameter("@User_id", user_id));
                ViewEvent.Parameters.Add(new SqlParameter("@Event_id", DBNull.Value));
            }


            else
            {
                try
                {


                    int eventid = Int16.Parse(TextBox1.Text);

                    ViewEvent.Parameters.Add(new SqlParameter("@User_id", user_id));
                    ViewEvent.Parameters.Add(new SqlParameter("@Event_id", eventid));
                }
                catch (Exception ex)
                {
                    Label1.Visible = true;
                    Label1.Text = "please input a number ya fala7";
                    return;
                }
            }


            conn.Open();


            SqlDataReader rdr = ViewEvent.ExecuteReader(CommandBehavior.CloseConnection);


            while (rdr.Read())
            {
                int Event = rdr.GetInt32(rdr.GetOrdinal("event_id"));
                Label eventlabel = new Label();
                eventlabel.Text = "Event_id: " + Event.ToString(); // Convert the int to a string
                form1.Controls.Add(eventlabel);
                form1.Controls.Add(new LiteralControl("<br/>"));
                form1.Controls.Add(new LiteralControl("<br/>"));

                int assign_to = rdr.GetInt32(rdr.GetOrdinal("user_assigned_to"));
                Label assgin1 = new Label();
                assgin1.Text = "Assgin to: " + assign_to.ToString(); // Convert the int to a string
                form1.Controls.Add(assgin1);
                form1.Controls.Add(new LiteralControl("<br/>"));
                form1.Controls.Add(new LiteralControl("<br/>"));


                String name = rdr.GetString(rdr.GetOrdinal("name"));
                Label namelabel = new Label();
                namelabel.Text = "name: " + name.ToString(); // Convert the int to a string
                form1.Controls.Add(namelabel);
                form1.Controls.Add(new LiteralControl("<br/>"));

                String description = rdr.GetString(rdr.GetOrdinal("description"));
                Label desclabel = new Label();
                desclabel.Text = "description: " + description.ToString(); // Convert the int to a string
                form1.Controls.Add(desclabel);
                form1.Controls.Add(new LiteralControl("<br/>"));

                String location = rdr.GetString(rdr.GetOrdinal("location"));
                Label locationlabel = new Label();
                locationlabel.Text = "location: " + location.ToString(); // Convert the int to a string
                form1.Controls.Add(locationlabel);
                form1.Controls.Add(new LiteralControl("<br/>"));

                DateTime reminderDate = rdr.GetDateTime(rdr.GetOrdinal("reminder_date"));
                Label ReminderDateLabel = new Label();
                ReminderDateLabel.Text = "Reminder: " + reminderDate.ToString("yyyy-MM-dd");
                form1.Controls.Add(ReminderDateLabel);
                form1.Controls.Add(new LiteralControl("<br/>"));


            }
        }

        protected void three_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void two_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }
    }

}