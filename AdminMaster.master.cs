﻿using System;
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
                AdminSide();
            }

        }
        catch (Exception)
        {
            Response.Redirect("~/Login.aspx");
        }

    }

    public void AdminSide()
    {
        db.AddParameter("@userid", Session["userid"].ToString());
        DataSet ds = db.ExecuteDataSet("get_users", CommandType.StoredProcedure);        
        lnkName.Text = ds.Tables[0].Rows[0]["FirstName"].ToString() + " " + ds.Tables[0].Rows[0]["LastName"].ToString();
        
        if (Session["url"].ToString() != null)
        {
            imgProfile.ImageUrl = ConfigurationManager.AppSettings["profileUrl"] + ds.Tables[0].Rows[0]["pic_url"].ToString();            
        }
        else
        {
            imgProfile.ImageUrl = ConfigurationManager.AppSettings["profileUrl"] + "default.png";
        }
        db.AddParameter("@active", 2);
        ds = db.ExecuteDataSet("get_comments", CommandType.StoredProcedure);
        lblReq.Text = "Comment (" + ds.Tables[0].Rows.Count.ToString() + ")";

        db.AddParameter("@active", 3);
        ds = db.ExecuteDataSet("select * from posts where active=@active", CommandType.Text);
        lblDraft.Text = "Drafts (" + ds.Tables[0].Rows.Count.ToString() + ")";
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

    protected void lnkName_Click(object sender, EventArgs e)
    {
        Response.Redirect("userProfile.aspx?type=admin&userid=" + Session["userid"].ToString());
    }
    
}
