﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BlogAdmin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnLogout_ServerClick(object sender, EventArgs e)
    {
        System.Web.Security.FormsAuthentication.SignOut();
        Response.Redirect("~/Login.aspx");
    }
}
