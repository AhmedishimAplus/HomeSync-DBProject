using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services.Description;

namespace HomeSyncy_M3
{
    public partial class GuestGet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand Getguest = new SqlCommand("GuestNumber", conn);
            Getguest.CommandType = CommandType.StoredProcedure;
            //getting admin ID


            int Adminid = Convert.ToInt32(Session["user_id"]);
            //inserting as a parameter
            //input

            Getguest.Parameters.Add(new SqlParameter("@admin_id", Adminid));
            // output

            SqlParameter number = Getguest.Parameters.Add(new SqlParameter("@number", SqlDbType.Int));
            number.Direction = ParameterDirection.Output;
            conn.Open();
            Getguest.ExecuteNonQuery();
            conn.Close();

            MessageID.Text = "You currently have: " + Convert.ToInt32(number.Value);
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }
    }
}