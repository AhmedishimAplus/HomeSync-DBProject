using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeSyncy_M3
{
    public partial class ViewStatus : System.Web.UI.Page
    {
        protected void ViewingStatus(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(InsertID.Text))
            {
                Exception.Text = "Please input an ID.";
                return; // Exit the method early since no further processing is needed
            }
            else
            {
                try
                {
                    int id = Int16.Parse(InsertID.Text);
                    if (string.IsNullOrEmpty(InsertID.Text))
                    {
                        Exception.Text = "Please input a valid Task ID .";
                        return; // Exit the method early since no further processing is needed
                    }
                    try
                    { 
                

                     
                        string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
                        //create a new connection
                        SqlConnection conn = new SqlConnection(connStr);
                        SqlCommand ViewStat = new SqlCommand("ViewTaskStatus", conn);
                        ViewStat.CommandType = CommandType.StoredProcedure;
                        ViewStat.Parameters.Add(new SqlParameter("@task_id", id));
                        conn.Open();
                        ViewStat.ExecuteNonQuery();

                        SqlDataReader rdr = ViewStat.ExecuteReader(CommandBehavior.CloseConnection);
                        if (rdr.HasRows)
                        {
                            while (rdr.Read())
                            {
                                String StatusString = rdr.GetString(rdr.GetOrdinal("status"));
                                Label Statuslabel = new Label();
                                Statuslabel.Text = "Status: " + StatusString.ToString(); // Convert the int to a string
                                form1.Controls.Add(Statuslabel);
                                form1.Controls.Add(new LiteralControl("<br/>"));
                            }
                           
                            
                        }
                    }
                    catch (FormatException what)
                    {
                        Exception.Text = "input a valid Task ID";
                    }
                }
                catch (FormatException ay7aga)
                {
                    Exception.Text = "input a valid Id";
                }

            }

        }

        
    }
}