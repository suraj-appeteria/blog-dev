using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;
using System.Configuration;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
          
                if (string.IsNullOrEmpty(Convert.ToString(Session["email"])) || string.IsNullOrEmpty(Convert.ToString(Session["password"])))
                {
                    Response.Redirect("post.aspx");
                }
                if (Session["type"].ToString() != "writer")
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    lnkName.Text = Session["name"].ToString();
                    if (Session["url"].ToString() != null)
                    {
                        imgProfile.ImageUrl = ConfigurationManager.AppSettings["profileUrl"] + Session["url"].ToString();
                    }
                    else
                    {
                        imgProfile.ImageUrl = ConfigurationManager.AppSettings["profileUrl"] + Session["url"].ToString();
                    }
                    db.AddParameter("@active", 2);
                    DataSet ds = db.ExecuteDataSet("get_comments",CommandType.StoredProcedure);
                    lblReq.Text = "Comment (" + ds.Tables[0].Rows.Count.ToString() + ")";

                    db.AddParameter("@active", 3);
                    ds = db.ExecuteDataSet("select * from posts where active=@active", CommandType.Text);
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

    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        System.Web.Security.FormsAuthentication.SignOut();
        Response.Redirect("~/post.aspx");
    }
}
