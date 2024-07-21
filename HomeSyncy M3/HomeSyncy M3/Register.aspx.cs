using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;

namespace HomeSyncy_M3
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["insertionMessage"] != null)
                {
                    string message = Server.UrlDecode(Request.QueryString["insertionMessage"]);
                    // Display the message as needed, e.g., set it to a label or show it in the UI
                    insertionMessageLabel.Text = message;
                }
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string userType = userTypeBox.Text;
            string Email = emailBox.Text;
            string Password = PasswordBox.Text;
            string FirstName = FirstNameBox.Text;
            string LastName = LastNameBox.Text;

            // Corrected birth date parsing
            if (!DateTime.TryParse(BirthBox.Text, out DateTime birth))
            {
                //Response.Write("Invalid birthdate format");
                string script = "alert('Invalid birthdate format');";


                ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                return;
            }

            // Check for valid userType
            if (string.Compare(userType, "Admin", true) != 0 && string.Compare(userType, "Guest", true) != 0)
            {
               // Response.Write("Error: User type must be 'Admin' or 'Guest' only.");
                string script = "alert('Error: User type must be 'Admin' or 'Guest' only.');";


                ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                return;
            }

            try
            {
                conn.Open();



                // If no duplicate, proceed with registration
                SqlCommand Register = new SqlCommand("UserRegister", conn);
                Register.CommandType = CommandType.StoredProcedure;

                Register.Parameters.Add(new SqlParameter("@usertype", userType));
                Register.Parameters.Add(new SqlParameter("@email", Email));
                Register.Parameters.Add(new SqlParameter("@first_name", FirstName));
                Register.Parameters.Add(new SqlParameter("@last_name", LastName));
                Register.Parameters.Add(new SqlParameter("@birth_date", birth)); // Use the parsed birth date
                Register.Parameters.Add(new SqlParameter("@password", Password));
                SqlParameter user_id = Register.Parameters.Add("@user_id", SqlDbType.Int);
                user_id.Direction = ParameterDirection.Output;

                int rowsAffected = Register.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    string script = "alert(' Data added successfully.');";


                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                    // Data added successfully
                   // insertionMessageLabel.Text = "Data added successfully";
                    //insertionMessageLabel.ForeColor = System.Drawing.Color.Green;
                  //  insertionMessageLabel.Visible = true;
                }
                else
                {
                    string script = "alert('Error: something went wrong on our wnd');";


                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                    // No rows affected, data not added
                    //insertionMessageLabel.Text = "Data not added";
                   // insertionMessageLabel.ForeColor = System.Drawing.Color.Red;
                   // insertionMessageLabel.Visible = true;
                }
            }
            catch (Exception ex)
            {
                string script = "alert('Error: Data not added\".');";


                ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                //Response.Write("Error: ");
            }
            finally
            {
                conn.Close();
            }
        }

        protected void BirthBox_TextChanged(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}