using System;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;
using System.Configuration;

public partial class Default : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {        
        lblErrorMsg.Text = "";
        if (!IsPostBack)
        {            
            lblErrorMsg.Text = "";            
            FillCategories();
            FillRp();
        }
    }

    private void FillCategories()
    {
        DataSet ds = db.ExecuteDataSet("select distinct c.categoryid, c.category from CategoryMaster c inner join PostCategory p on c.categoryid = p.categoryid");
        rpCategory.DataSource = ds;
        rpCategory.DataBind();
    }

    protected void FillRp()
    {
        try
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["email"])) || string.IsNullOrEmpty(Convert.ToString(Session["password"])))
            {
                Session["type"] = "";
            }            
            int counter = Convert.ToInt32(hdnPageNo.Value) + 1;
            hdnPageNo.Value = counter.ToString();
            if (Request.QueryString["c"] != null)
            {
                db.AddParameter("@category_id", Request.QueryString["c"].ToString());
            }
            else {
                btnAll.Attributes.Add("class", "submit-btn-selected");
                //btnAll.Attributes.CssStyle.Value= "submit-btn-selected";
            }
            db.AddParameter("@page_no", counter);
            db.AddParameter("@active", 1);
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet ds = db.ExecuteDataSet("getAllPosts", CommandType.StoredProcedure);
            rpPost.DataSource = ds;
            rpPost.DataBind();
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet dsCount = db.ExecuteDataSet("select count(postid) as posts from posts where blog_id=@blog_id and active=1", CommandType.Text);
            if (ds.Tables[0].Rows.Count >= Convert.ToInt32(dsCount.Tables[0].Rows[0]["posts"]))
            {
                btnLoad.Visible = false;// "End";
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
                db.AddParameter("@postid", e.CommandArgument);
                db.ExecuteNonQuery("save_PostView", CommandType.StoredProcedure);
                Response.Redirect("singlepost.aspx?postid=" + e.CommandArgument.ToString());
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
