using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Message : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["msg"] != null)
        {
            lblError.Text = Request.QueryString["msg"].ToString();
        }
        else
        {
            lblError.Text = "Unexpeted error occured.";
        }
    }
}