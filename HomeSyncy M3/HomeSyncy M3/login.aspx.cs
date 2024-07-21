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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_ServerClick(object sender, EventArgs e)

        {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);


            //takings inputs from the html
            String em = Email.Value;
            String pass = Password.Value;
            //intiate the procedure and give it the inputs
            SqlCommand loginProc = new SqlCommand("UserLogin", conn);
            loginProc.CommandType = CommandType.StoredProcedure;
            loginProc.Parameters.Add(new SqlParameter("@email", em));
            loginProc.Parameters.Add(new SqlParameter("@password", pass));

            //getting the output of the procedure
            SqlParameter success = loginProc.Parameters.Add("@success", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            SqlParameter user_id = loginProc.Parameters.Add("@user_id", SqlDbType.Int);
            user_id.Direction = ParameterDirection.Output;


            


            conn.Open();
            loginProc.ExecuteNonQuery();
            
            conn.Close();

            if (success.Value.ToString() == "1")
            {
                Response.Write("Logged in successfully");
                // Session["user"] = id;
                // Store user_id in a session variable
                Session["user_id"] = user_id.Value.ToString();

                Response.Redirect("ViewProfile.aspx");
                //Response.Redirect("HomePage.aspx");

            }
            else
            {
                string script = "alert('does not exist Click signUp tp register');";


                ScriptManager.RegisterStartupScript(this, GetType(), "AlertScript", script, true);
                // Response.Write("does not exist Click signUp tp register");
                // Response.Redirect("Register.aspx");
            }

        }

        protected void SignUpButton_ServerClick(object sender, EventArgs e)

        {
            //take connection string from configurations
            string connStr = WebConfigurationManager.ConnectionStrings["HomeSyncM3"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            Response.Redirect("Register.aspx");
        }
    }
}