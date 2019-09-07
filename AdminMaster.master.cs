using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    public string username
    {
        get { return lblUser.InnerText; }
        set { lblUser.InnerText = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["email"])) || string.IsNullOrEmpty(Convert.ToString(Session["password"])))
            {
                Response.Redirect("Login.aspx");
            }
        }
        catch (Exception)
        {
            Response.Redirect("~/Login.aspx");
        }

    }

    public void DisableCriticalJavaScriptFiles()
    {
        head.Visible = false;
    }
}
