using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeSyncy_M3
{
    public partial class AddDevice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand insertDevice = new SqlCommand("AddDevice", conn);
            insertDevice.CommandType = CommandType.StoredProcedure;
            int id;
            String status;
            int room;
            String Type;
            int battery;
            if (string.IsNullOrEmpty(Idbox.Text))
            {
                Message.Text = "Please input an ID.";
                return; // Exit the method early since no further processing is needed
            }
            try {
                id= Convert.ToInt32(Idbox.Text);
                if (string.IsNullOrEmpty(Status.Text))
                {
                    Message.Text = "You Left the status box Empty.";
                    return; // Exit the method early since no further processing is needed
                }
                else
                {
                    status = Status.Text;
                    if (int.TryParse(status, out _))
                    {
                        Message.Text = "Please Input status In letters.";
                        return;
                    }
                    if (string.IsNullOrEmpty(RoomBox.Text))
                    {
                        Message.Text = "You Left the Room box Empty.";
                        return; // Exit the method early since no further processing is needed
                    }
                    try {
                        room = Convert.ToInt32(RoomBox.Text);
                        if (string.IsNullOrEmpty(TypeBox.Text))
                        {
                            Message.Text = "You Left the Type box Empty.";
                            return; // Exit the method early since no further processing is needed
                        }
                        Type=TypeBox.Text;
                        if (int.TryParse(Type, out _))
                        {
                            Message.Text = "Please Input Type In letters.";
                            return;
                        }
                        //Message.Text=id+" "+status+" "+room+" "+Type;
                        if (string.IsNullOrEmpty(BatteryBox.Text))
                        {
                            Message.Text = "Please input a Battery Percentage.";
                            return; // Exit the method early since no further processing is needed
                        }
                        try {
                            battery = Convert.ToInt32(BatteryBox.Text);
                            if(battery>100|| battery < 0)
                            {
                                Message.Text = "Battery percentage cant be " + battery;
                                return;
                            }
                            try
                            {
                                insertDevice.Parameters.Add(new SqlParameter("@device_id", id));
                                insertDevice.Parameters.Add(new SqlParameter("@status", status));
                                insertDevice.Parameters.Add(new SqlParameter("@battery", battery));
                              
                                    insertDevice.Parameters.Add(new SqlParameter("@location", room));
                                
                                //
                                
                                insertDevice.Parameters.Add(new SqlParameter("@type", Type));
                                conn.Open();
                                insertDevice.ExecuteNonQuery();
                                conn.Close();
                                Message.Text = "inserted";
                            }
                            catch (SqlException ex5) {
                                Message.Text = "error";
                            }
                        }
                        catch (FormatException ex3) {
                            Message.Text = "please input a number in Battery TextBox";
                        }
                    }
                    catch (FormatException ex2)
                    {
                        Message.Text = "please input a number in Room TextBox";
                    }

                }
              
            }
            catch (FormatException ex1)
            {
                Message.Text = "please input a number in Id TextBox";
            }

            
            


        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("DevicesAdmin.aspx");
        }

       
    }
}