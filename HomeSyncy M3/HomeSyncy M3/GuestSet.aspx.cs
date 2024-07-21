using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeSyncy_M3
{
    public partial class GuestSet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MessageID.Visible = false;
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            MessageID.Visible = false;
            if (string.IsNullOrEmpty(TextBox1.Text))
            {
                MessageID.Visible = true;
                MessageID.Text = "You left Textbox empty";
                return; // Exit the method early since no further processing is needed
            }
            else
            {


                int NoG;
                int adminID = Convert.ToInt32(Session["user_id"]);

                try
                {
                    NoG = Int16.Parse(TextBox1.Text);
                    SqlCommand GuestsAllowed = new SqlCommand("GuestsAllowed", conn);
                    GuestsAllowed.CommandType = CommandType.StoredProcedure;
                    //input
                    GuestsAllowed.Parameters.Add(new SqlParameter("@admin_id", adminID));

                    GuestsAllowed.Parameters.Add(new SqlParameter("@number_of_guests", NoG));




                    conn.Open();
                    GuestsAllowed.ExecuteNonQuery();
                    conn.Close();


                    MessageID.Visible = true;
                    MessageID.Text = "your allowed guests succesfully updated";


                }
                catch (FormatException ex1)
                {
                    MessageID.Visible = true;
                    MessageID.Text = "please input a number";
                }

            }
        }
    }
}