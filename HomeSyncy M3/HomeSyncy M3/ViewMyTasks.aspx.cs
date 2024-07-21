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
    public partial class ViewMyTasks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            int user_id = Convert.ToInt32(Session["user_id"]);

            SqlCommand Changestatus = new SqlCommand("ViewMyTask", conn);
            Changestatus.CommandType = CommandType.StoredProcedure;
            Changestatus.Parameters.Add(new SqlParameter("@user_id", user_id));
            conn.Open();


            SqlDataReader rdr = Changestatus.ExecuteReader(CommandBehavior.CloseConnection);
            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    int TaskID = rdr.GetInt32(rdr.GetOrdinal("Task_id"));
                    Label id = new Label();
                    id.Text = "TaskID : " + TaskID.ToString(); // Convert the int to a string
                    form1.Controls.Add(id);
                    form1.Controls.Add(new LiteralControl("<br/>"));

                    String name = rdr.GetString(rdr.GetOrdinal("name"));
                    Label namelabel = new Label();
                    namelabel.Text = "Name: " + name.ToString(); // Convert the int to a string
                    form1.Controls.Add(namelabel);
                    form1.Controls.Add(new LiteralControl("<br/>"));

                    DateTime creation_Date = rdr.GetDateTime(rdr.GetOrdinal("creation_date"));
                    Label CreationDate = new Label();
                    CreationDate.Text = "CreationDate: " + creation_Date.ToString("yyyy-MM-dd");
                    form1.Controls.Add(CreationDate);
                    form1.Controls.Add(new LiteralControl("<br/>"));

                    DateTime due_date = rdr.GetDateTime(rdr.GetOrdinal("due_date"));
                    Label DueDate = new Label();
                    DueDate.Text = "Due Date: " + due_date.ToString("yyyy-MM-dd");
                    form1.Controls.Add(DueDate);
                    form1.Controls.Add(new LiteralControl("<br/>"));

                    String CategoryString = rdr.GetString(rdr.GetOrdinal("category"));
                    Label CategoryLabel = new Label();
                    CategoryLabel.Text = "Category: " + CategoryString.ToString(); // Convert the int to a string
                    form1.Controls.Add(CategoryLabel);
                    form1.Controls.Add(new LiteralControl("<br/>"));

                    String StatusString = rdr.GetString(rdr.GetOrdinal("status"));
                    Label Statuslabel = new Label();
                    Statuslabel.Text = "Status: " + StatusString.ToString(); // Convert the int to a string
                    form1.Controls.Add(Statuslabel);
                    form1.Controls.Add(new LiteralControl("<br/>"));

                    DateTime reminderDate = rdr.GetDateTime(rdr.GetOrdinal("reminder_date"));
                    Label ReminderDateLabel = new Label();
                    ReminderDateLabel.Text = "Reminder: " + reminderDate.ToString("yyyy-MM-dd");
                    form1.Controls.Add(ReminderDateLabel);
                    form1.Controls.Add(new LiteralControl("<br/>"));

                    int priority = rdr.GetInt32(rdr.GetOrdinal("Task_id"));
                    Label priorityLabel = new Label();
                    priorityLabel.Text = "priority : " + priority.ToString(); // Convert the int to a string
                    form1.Controls.Add(priorityLabel);
                    form1.Controls.Add(new LiteralControl("<br/>"));
                    form1.Controls.Add(new LiteralControl("<br/>"));

                }
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "No Tasks";
            }
        }

        protected void FinishMethod(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TaskName.Text))
            {
                Label2.Text = "Please input a Task name.";
                return; // Exit the method early since no further processing is needed
            }
            else
            {



                if (string.IsNullOrEmpty(TaskName.Text))
                {
                    Label2.Text = "Please input a valid task name";
                    return; // Exit the method early since no further processing is needed
                }
                try
                {
                    string name = TaskName.Text;
                    string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
                    //create a new connection
                    SqlConnection conn = new SqlConnection(connStr);
                    int user_id = Convert.ToInt32(Session["user_id"]);
                    SqlCommand Finishtask = new SqlCommand("FinishMyTask", conn);
                    Finishtask.CommandType = CommandType.StoredProcedure;
                    Finishtask.Parameters.Add(new SqlParameter("@user_id", user_id));
                    Finishtask.Parameters.Add(new SqlParameter("@title", name));


                    conn.Open();
                    Finishtask.ExecuteNonQuery();
                    conn.Close();
                    Label2.Text = "Task Done";
                }
                catch (Exception one)
                {
                    Label2.Text = "input a valid task name";
                }
            }


        }


    }
}