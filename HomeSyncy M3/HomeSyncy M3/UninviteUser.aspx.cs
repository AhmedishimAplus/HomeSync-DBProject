using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;

namespace HomeSyncy_M3
{
    public partial class UninviteUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            int eventId = Int16.Parse(TextBox3.Text);
            int userId = Int16.Parse(TextBox2.Text);

            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand uninviteCommand = new SqlCommand("Uninvited", conn);
            uninviteCommand.CommandType = CommandType.StoredProcedure;

            uninviteCommand.Parameters.Add(new SqlParameter("@event_id", eventId));
            uninviteCommand.Parameters.Add(new SqlParameter("@user_id", userId));
            conn.Open();
            uninviteCommand.ExecuteNonQuery();
            conn.Close();

            messageid.Text = "Done";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("EventsUser.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile");
        }
    }
}