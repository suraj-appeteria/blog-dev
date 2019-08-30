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
        //this.username = Session["username"].ToString();
       
    }

    public void DisableCriticalJavaScriptFiles()
    {
        head.Visible = false;
    }
}
