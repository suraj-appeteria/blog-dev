using System;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;
using System.Configuration;

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
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet ds = db.ExecuteDataSet("getAllPosts", CommandType.StoredProcedure);
            rpPost.DataSource = ds;
            rpPost.DataBind();
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet dsCount = db.ExecuteDataSet("select count(postid) as posts from posts where active=1 and blog_id=@blog_id", CommandType.Text);
            if (ds.Tables[0].Rows.Count == Convert.ToInt32(dsCount.Tables[0].Rows[0]["posts"]))
            {
                btnLoad.Visible = false;
            }
            else
            {
                btnLoad.Visible = true;
            }

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
                db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
                db.ExecuteNonQuery("update posts set active=0 where postid=@postid and blog_id=@blog_id", CommandType.Text);
                FillRp();
                FillTrashGrid(true, false);
                lblErrorMsg.Text = "Post Deleted Successfully.";
            }
            else if (e.CommandName == "UNPublish")
            {
                db.AddParameter("@postid", e.CommandArgument.ToString());
                db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
                db.ExecuteNonQuery("update posts set active=3 where postid=@postid and blog_id=@blog_id", CommandType.Text);
                FillRp();
                FillTrashGrid(true, false);
                AdminMaster admin = Master as AdminMaster;
                admin.AdminSide();
                lblErrorMsg.Text = "Post Unpublished Successfully.";
            }
            else if (e.CommandName == "Active")
            {
                db.AddParameter("@postid", e.CommandArgument.ToString());
                db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
                db.ExecuteNonQuery("update posts set active=1 where postid=@postid and blog_id=@blog_id", CommandType.Text);
                FillTrashGrid(false, true);             
                FillRp();
                lblErrorMsg.Text = "Post Active Successfully.";
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
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
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