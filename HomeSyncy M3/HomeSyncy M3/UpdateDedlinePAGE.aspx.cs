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
    public partial class UpdateDedlinePAGE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox1.Text))
            {
                Exception.Text = "Please input an ID.";
                return; // Exit the method early since no further processing is needed
            }
            else
            {
                try
                {
                    int id = Int16.Parse(TextBox1.Text);
                    if (string.IsNullOrEmpty(TextBox1.Text))
                    {
                        Exception.Text = "Please input a valid Date-Time Format 'YYYY-MM-DD' .";
                        return; // Exit the method early since no further processing is needed
                    }
                    try
                    {


                        DateTime newdedlin = DateTime.Parse(TextBox2.Text);

                        Label1.Visible = false;
                        string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
                        //create a new connection
                        SqlConnection conn = new SqlConnection(connStr);
                        SqlCommand UpdateDedline = new SqlCommand("UpdateTaskDeadline", conn);
                        UpdateDedline.CommandType = CommandType.StoredProcedure;
                        UpdateDedline.Parameters.Add(new SqlParameter("@task_id", id));
                        UpdateDedline.Parameters.Add(new SqlParameter("@deadline", newdedlin));

                        conn.Open();
                        UpdateDedline.ExecuteNonQuery();
                        conn.Close();
                        Exception.Text = "deadline updated";
                    }
                    catch (FormatException sth)
                    {
                        Exception.Text = "input a valid Date-Time Format 'YYYY-MM-DD'";
                    }
                }
                catch (FormatException z3bola)
                {
                    Exception.Text = "input a valid Id";
                }

            }

        }
    }
}