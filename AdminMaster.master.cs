using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    DatabaseHelper db = new DatabaseHelper();
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
            if (Session["type"].ToString() != "writer")
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                DataSet ds = db.ExecuteDataSet("select * from PostComments where active=2");
                lblReq.Text = "Comment (" + ds.Tables[0].Rows.Count.ToString() + ")";
                ds = db.ExecuteDataSet("select * from posts where active=3");
                lblDraft.Text = "Drafts (" + ds.Tables[0].Rows.Count.ToString() + ")";
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
