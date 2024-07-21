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
    public partial class DevicesAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DeviceCharge(object sender, EventArgs e) { 
                Response.Redirect("ViewCharge.aspx");
        }
        protected void AddDevice1(object sender, EventArgs e)
        {
            Response.Redirect("AddDevice.aspx");
        }
        protected void FindBattery1(object sender, EventArgs e)
        {
            Response.Redirect("FindBattery.aspx"); 
        }
        protected void ChangeStatus1(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand Changestatus = new SqlCommand("Charging", conn);
            Changestatus.CommandType = CommandType.StoredProcedure;
            conn.Open();
            Changestatus.ExecuteNonQuery();
            conn.Close();
            MessageID.Text = "Message: All Out of battery devices are charging";
        }
        protected void Rooms1(object sender, EventArgs e)
        {
            Response.Redirect("Morethantworooms.aspx");
        }
        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }

        
    }
}