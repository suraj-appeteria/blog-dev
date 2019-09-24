using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;

public partial class Draft : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        try
        {
            if (Session["type"].ToString() == "writer")
            {
                this.MasterPageFile = "~/AdminMaster.master";
            }
            else
            {
                this.MasterPageFile = "~/BlogAdmin.master";
            }
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMsg.Text = "";
        if (!IsPostBack)
        {
            lblErrorMsg.Text = "";
            FillRp();
           
        }
    }
    protected void FillRp()
    {
        try
        {
            int counter = Convert.ToInt32(hdnPageNo.Value) + 1;
            hdnPageNo.Value = counter.ToString();
            db.AddParameter("@page_no", counter);
            db.AddParameter("@active", 3);
            DataSet ds = db.ExecuteDataSet("getAllPosts", CommandType.StoredProcedure);
            rpDraft.DataSource = ds;
            rpDraft.DataBind();

            if(ds.Tables[0].Rows.Count<1)
            {
                lblErrorMsg.Text = "You don't have any saved drafts.Saving a draft allows you to keep a message you aren't ready to send yet.";
            }

            DataSet dsCount = db.ExecuteDataSet("select count(postid) as posts from posts where active=3", CommandType.Text);
            if (ds.Tables[0].Rows.Count == Convert.ToInt32(dsCount.Tables[0].Rows[0]["posts"]))
            {
                btnLoad.InnerText = "End";
            }
            else
            {
                btnLoad.InnerText = "More";
            }
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }


    protected void rpDraft_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {            
            if (e.CommandName == "Publish")
            {
                db.AddParameter("@postid", e.CommandArgument.ToString());
                db.ExecuteNonQuery("update posts set active=1 where postid=@postid", CommandType.Text);
                lblErrorMsg.Text = "Post Published";
                FillRp();
                AdminMaster master = Master as AdminMaster;
                master.AdminSide();
            }
            else if (e.CommandName == "Read")
            {
                Response.Redirect("singlepost.aspx?postid=" + e.CommandArgument.ToString() + "&type=Draft");
            }

        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void btnLoad_ServerClick(object sender, EventArgs e)
    {
        FillRp();
    }
}