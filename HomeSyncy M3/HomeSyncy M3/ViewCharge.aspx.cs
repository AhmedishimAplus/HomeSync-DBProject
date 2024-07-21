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
    public partial class ViewCharge : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //click to view device
        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            if (string.IsNullOrEmpty(TextBox1.Text))
            {
                
                Label1.Text = "Please input an ID.";
                return; // Exit the method early since no further processing is needed
            }
            else {


                int DeviceId ;

                try
                {
                    DeviceId = Int16.Parse(TextBox1.Text);
                    SqlCommand Device = new SqlCommand("ViewMyDeviceCharge", conn);
                    Device.CommandType = CommandType.StoredProcedure;
                    //input
                    Device.Parameters.Add(new SqlParameter("@device_id", DeviceId));
                    //output
                    SqlParameter charge = Device.Parameters.Add(new SqlParameter("@charge", SqlDbType.Int));
                    SqlParameter Room = Device.Parameters.Add(new SqlParameter("@location", SqlDbType.Int));

                    charge.Direction = ParameterDirection.Output;
                    Room.Direction = ParameterDirection.Output;
                    conn.Open();
                    Device.ExecuteNonQuery();
                    conn.Close();
                    try
                    {
                        Label1.Text = "RoomId: " + Convert.ToInt32(Room.Value) + " " + "Charge: " + Convert.ToInt32(charge.Value);
                    }
                    catch (Exception ex)
                    {
                        Label1.Text = DeviceId + " Doesn't exist in the database";

                        
                    }
                }
                catch(FormatException ex1) {
                   Label1.Text = "please input a number";
                   
                }
                
            }

        }
        //goback
        protected void Button2_Click(object sender, EventArgs e)
        {
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
    }
}