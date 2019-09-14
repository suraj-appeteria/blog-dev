using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DAL.SQLDataAccess;

public partial class AddPost : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillRp();
            FillTrashGrid(true, false);
        }
    }

    protected void FillRp()
    {
        try
        {
            int counter = Convert.ToInt32(hdnPageNo.Value) + 1;
            hdnPageNo.Value = counter.ToString();
            db.AddParameter("@page_no", counter);
            db.AddParameter("@active", 1);
            DataSet ds = db.ExecuteDataSet("getAllPosts", CommandType.StoredProcedure);
            rpPost.DataSource = ds;
            rpPost.DataBind();
            
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void rpPost_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Read")
            {
                //db.AddParameter("@postid", e.CommandArgument);
                //db.ExecuteNonQuery("save_PostView", CommandType.StoredProcedure);
                Response.Redirect("singlepost.aspx?postid=" + e.CommandArgument.ToString()+"&type=admin");
            }
            else if(e.CommandName=="EDT")
            {
                Response.Redirect("newpost.aspx?postid="+e.CommandArgument.ToString());
            }
            else if (e.CommandName == "DEL")
            {
                db.AddParameter("@postid", e.CommandArgument.ToString());
                db.ExecuteNonQuery("update posts set active=0 where postid=@postid", CommandType.Text);
                FillRp();
                lblErrorMsg.Text = "Post Deleted Successfully.";
            }
            else if (e.CommandName == "UNPublish")
            {
                db.AddParameter("@postid", e.CommandArgument.ToString());
                db.ExecuteNonQuery("update posts set active=3 where postid=@postid", CommandType.Text);
                FillRp();
                lblErrorMsg.Text = "Post Unpublished Successfully.";
            }
            else if (e.CommandName == "Active")
            {
                db.AddParameter("@postid", e.CommandArgument.ToString());
                db.ExecuteNonQuery("update posts set active=1 where postid=@postid", CommandType.Text);
                FillTrashGrid(false, true);             
                FillRp();
                lblErrorMsg.Text = "Post Publish Successfully.";
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

    protected void lnkDraft_Click(object sender, EventArgs e)
    {
        try
        {
            DatabaseHelper db = new DatabaseHelper();
            if (lnkDraft.Text == "Close")
            {
                pnlPost.Visible = true;
                FillTrashGrid(true, false);
                rpDraft.DataSource = null;
                rpDraft.DataBind();
                FillRp();


            }
            else
            {
                lnkDraft.Text = "Close";
                lnkDraft.CssClass = "";
                pnlPost.Visible = false;
                FillTrashGrid(false, true);
                FillRp();
                
            }
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    private void FillTrashGrid(bool showCount, bool showGrid)
    {
        try
        {

            db.AddParameter("@active", 0);
            DataSet ds = db.ExecuteDataSet("getAllPosts", CommandType.StoredProcedure);
            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                if (showCount)
                {
                    lnkDraft.Visible = true;
                    lnkDraft.Text = " Trash (" + ds.Tables[0].Rows.Count + ")";
                }

            }
            else
            {
                lnkDraft.Visible = false;
                pnlPost.Visible = true;
            }
            pnlDraft.Visible = false;
            if (showGrid)
            {
                rpDraft.DataSource = ds;
                rpDraft.DataBind();
                pnlDraft.Visible = rpDraft.Items.Count > 0;
            }
           
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

}