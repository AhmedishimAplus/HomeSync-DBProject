using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HomeSyncy_M3
{
    public partial class DevicesUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DeviceCharge(object sender, EventArgs e)
        {
            Response.Redirect("ViewCharge.aspx");
        }
        protected void Back(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }
    }
}