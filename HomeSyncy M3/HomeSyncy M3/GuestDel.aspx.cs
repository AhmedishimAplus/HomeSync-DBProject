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
using System.Runtime.InteropServices;

namespace HomeSyncy_M3
{
    public partial class GuestDel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MessageID.Visible = false;
        }

       

        

        protected void removegees_Click1(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);


            int counter;


            if (string.IsNullOrEmpty(TextBox1.Text))
            {
                MessageID.Visible = true;
                MessageID.Text = "Please input an ID.";
                return; // Exit the method early since no further processing is needed
            }
            int GuestID = Int16.Parse(TextBox1.Text);
            int AdminID = Convert.ToInt32(Session["user_id"]);

            
            
            SqlCommand Remove = new SqlCommand("GuestRemove", conn);
            Remove.CommandType = CommandType.StoredProcedure;
            Remove.Parameters.Add(new SqlParameter("@guest_id", GuestID));
            Remove.Parameters.Add(new SqlParameter("@admin_id", AdminID));
            SqlParameter Numbersql = Remove.Parameters.Add(new SqlParameter("@number_of_allowed_guests", SqlDbType.Int));
            Numbersql.Direction = ParameterDirection.Output;
           
                conn.Open();
                Remove.ExecuteNonQuery();
                conn.Close();

                MessageID.Visible = true;
                MessageID.Text = "Guest Deleted Successfully";
            
           


            }

        protected void back_Click1(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }
    }
}