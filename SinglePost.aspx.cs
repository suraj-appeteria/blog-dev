using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DAL.SQLDataAccess;
using System.Drawing;
using System.Configuration;


public partial class SinglePost : System.Web.UI.Page
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
        try
        {            
            if (!IsPostBack)
            {

                if (string.IsNullOrEmpty(Convert.ToString(Session["email"])) || string.IsNullOrEmpty(Convert.ToString(Session["password"])))
                {
                    Session["userid"] = "0";
                    FillRp();
                    comment();
                    imgComment.ImageUrl = ConfigurationManager.AppSettings["profileUrl"] + "default.png";
                }
                else
                {
                    imgComment.ImageUrl = ConfigurationManager.AppSettings["profileUrl"] + Session["url"].ToString();
                    FillRp();
                    comment();
                    db.AddParameter("@userid", Session["userid"]);
                    db.AddParameter("@postid", Request.QueryString["postid"]);
                    DataSet ds = db.ExecuteDataSet("get_likes", CommandType.StoredProcedure);
                    if (ds.Tables[0].Rows.Count > 0 || ds.Tables[1].Rows.Count > 0)
                    {
                        if (ds.Tables[0].Rows.Count > 0 && ds.Tables[1].Rows.Count > 0)
                        {
                            lnkLike.Text = "<i class='fa fa-thumbs-up'></i>";
                            lnkLike.ForeColor = ColorTranslator.FromHtml("#450c3a");
                            lnkLike.TabIndex = 1;
                            lnkLike.ToolTip = "Unlike";

                            lnkFav.Text = "<i class='fa fa-heart'></i>";
                            lnkFav.ForeColor = ColorTranslator.FromHtml("#450c3a");
                            lnkFav.TabIndex = 1;
                            lnkFav.ToolTip = "Remove From Favorite";

                        }
                        else if (ds.Tables[0].Rows.Count > 0 && ds.Tables[0].Rows[0]["reactiontypeid"].ToString() == "1")
                        {
                            lnkLike.Text = "<i class='fa fa-thumbs-up'></i>";
                            lnkLike.ForeColor = ColorTranslator.FromHtml("#450c3a");
                            lnkLike.TabIndex = 1;
                            lnkLike.ToolTip = "Unlike";
                        }
                        else if (ds.Tables[1].Rows.Count > 0 && ds.Tables[1].Rows[0]["reactiontypeid"].ToString() == "2")
                        {
                            lnkFav.Text = "<i class='fa fa-heart'></i>";
                            lnkFav.ForeColor = ColorTranslator.FromHtml("#450c3a");
                            lnkFav.TabIndex = 1;
                            lnkFav.ToolTip = "Remove From Favorite";
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void FillRp()
    {
        try
        {
            string postid = Request.QueryString["postid"];
            db.AddParameter("@postid",postid);
            if (Request.QueryString["type"] == "Draft")
            {
                db.AddParameter("@active", 3);
            }
            else
            {
                db.AddParameter("@active", 1);
            }
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet ds = db.ExecuteDataSet("getPostById", CommandType.StoredProcedure);
            lblposttitle.Text = ds.Tables[0].Rows[0]["posttitle"].ToString(); 
            lblTags.Text = ds.Tables[0].Rows[0]["tags"].ToString();
            lblCreatedOn.Text = ds.Tables[0].Rows[0]["CreatedOn"].ToString();
            //lblcreatedbyemail.Text = ds.Tables[0].Rows[0]["createdbyemail"].ToString();
            lblPostDescription.Text = ds.Tables[0].Rows[0]["PostDescription"].ToString();
            
            rpInner.DataSource = ds.Tables[1];
            rpInner.DataBind();            
            
        }
        catch(Exception ex)
        {
           lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void comment()
    {
        try
        {
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            db.AddParameter("@postid", Convert.ToInt32(Request.QueryString["postid"]));
            DataSet ds = db.ExecuteDataSet("get_comments", CommandType.StoredProcedure);
            rpComment.DataSource = ds;
            rpComment.DataBind();
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void btnComment_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["email"])) || string.IsNullOrEmpty(Convert.ToString(Session["password"])))
            {
                Response.Redirect("Login.aspx");
            }
           
            db.AddParameter("@commentsid", 0);
            db.AddParameter("@postid", Convert.ToInt32(Request.QueryString["postid"]));
            db.AddParameter("@userid",Session["userid"].ToString());
            db.AddParameter("@comments", txtComment.Text);
            db.ExecuteNonQuery("save_comments", CommandType.StoredProcedure);
            txtComment.Text = "";
            comment();
            Util.SendEmail(Session["adminemail"].ToString(), "New Comments From "+Session["name"].ToString(), "Hi " + Session["adminName"].ToString() + ", <br / >You have new comments from "+ Session["name"].ToString() + "<br /> on yout post '"+ lblposttitle.Text+ "'. ");
            //Session["adminemail"].ToString(),ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your comment will appear after approval.');", true); //run script
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        try
        {
            if(Request.QueryString["type"]=="admin")
            {
                Response.Redirect("addpost.aspx");
            }
            else if (Request.QueryString["type"] == "Draft")
            {
                Response.Redirect("Draft.aspx");
            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void rpComment_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "DEL")
            {
                db.ExecuteNonQuery("update PostComments set active=0 where commentsid=" + e.CommandArgument.ToString());
                FillRp();
                comment();
            }
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void lnkLike_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["email"])) || string.IsNullOrEmpty(Convert.ToString(Session["password"])))
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (lnkLike.TabIndex.ToString() == "0")
            {
                lnkLike.Text = "<i class='fa fa-thumbs-up'></i>";
                lnkLike.ForeColor = ColorTranslator.FromHtml("#450c3a");
                lnkLike.TabIndex = 1;
                lnkLike.ToolTip = "Unlike";
                lblErrorMsg.Text = "Post Liked";
            }
            else if (lnkLike.TabIndex.ToString() == "1")
            {
                lnkLike.Text = "<i class='fa fa-thumbs-o-up'></i>";
                lnkLike.ForeColor = ColorTranslator.FromHtml("#450c3a");
                lnkLike.TabIndex = 0;
                lnkLike.ToolTip = "Like";
                lblErrorMsg.Text = "Post Unliked";
            }
            db.AddParameter("@reactionid", 0);
            db.AddParameter("@Postid", Request.QueryString["postid"]);
            db.AddParameter("@userid", Session["userid"]);
            db.AddParameter("@reactiontypeid", 1);
            DataSet ds = db.ExecuteDataSet("save_reaction", CommandType.StoredProcedure);
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void lnkFav_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["email"])) || string.IsNullOrEmpty(Convert.ToString(Session["password"])))
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (lnkFav.TabIndex.ToString() == "0")
            {
                lnkFav.Text = "<i class='fa fa-heart'></i>";
                lnkFav.ForeColor = ColorTranslator.FromHtml("#450c3a");
                lnkFav.TabIndex = 1;
                lnkFav.ToolTip = "Remove From Favorite";
                lblErrorMsg.Text = "Post Added To Favorite List";
            }
            else if (lnkFav.TabIndex.ToString() == "1")
            {
                lnkFav.Text = "<i class='fa fa-heart-o'></i>";
                lnkFav.ForeColor = ColorTranslator.FromHtml("#450c3a");
                lnkFav.TabIndex = 0;
                lnkFav.ToolTip = "Add To Favorite";
                lblErrorMsg.Text = "Post Removed From Favorite List";
            }
            db.AddParameter("@reactionid", 0);
            db.AddParameter("@Postid", Request.QueryString["postid"]);
            db.AddParameter("@userid", Session["userid"]);
            db.AddParameter("@reactiontypeid",2);
            DataSet ds = db.ExecuteDataSet("save_reaction", CommandType.StoredProcedure);
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void rpInner_ItemCommand(object source, RepeaterCommandEventArgs e)
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
}

