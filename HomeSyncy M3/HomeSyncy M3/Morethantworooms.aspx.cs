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
    public partial class Morethantworooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand Charge = new SqlCommand("NeedCharge", conn);
            Charge.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = Charge.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int room_No = rdr.GetInt32(rdr.GetOrdinal("room"));
                Label room = new Label();
                room.Text = "Location: " + room_No.ToString(); // Convert the int to a string
                form1.Controls.Add(room);
                form1.Controls.Add(new LiteralControl("<br/>"));
                form1.Controls.Add(new LiteralControl("<br/>"));

            }
        }

        protected void BacktoDevicebtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("DevicesAdmin.aspx");
        }
    }
}