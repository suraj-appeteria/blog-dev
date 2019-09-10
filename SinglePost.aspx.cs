using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DAL.SQLDataAccess;

public partial class SinglePost : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            if (string.IsNullOrEmpty(Convert.ToString(Session["email"])) || string.IsNullOrEmpty(Convert.ToString(Session["password"])))
            {
                Session["userid"] = "0";
            }
            else
            {
                db.AddParameter("@userid", Session["userid"]);
                db.AddParameter("@postid", Request.QueryString["postid"]);
                DataSet ds = db.ExecuteDataSet("select * from PostReactions where userid=@userid and postid=@postid", CommandType.Text);
                if(ds.Tables[0].Rows.Count>0)
                {
                    lnkLike.Text = "<i class='fa fa-heart'></i>";
                    lnkLike.ForeColor = System.Drawing.Color.Red;
                    lnkLike.TabIndex = 1;
                    lnkLike.ToolTip = "Unlike";
                }
            }
            FillRp();
            comment();
            
        }
    }

    protected void FillRp()
    {
        try
        {
            Int32 postid = Convert.ToInt32(Request.QueryString["postid"]);
            db.AddParameter("@postid",postid);
            DataSet ds = db.ExecuteDataSet("getPostById", CommandType.StoredProcedure);
            lblposttitle.Text = ds.Tables[0].Rows[0]["posttitle"].ToString(); 
            lblCreatedOn.Text = ds.Tables[0].Rows[0]["CreatedOn"].ToString();
            lblcreatedbyemail.Text = ds.Tables[0].Rows[0]["createdbyemail"].ToString();
            lblPostDescription.Text = ds.Tables[0].Rows[0]["PostDescription"].ToString();

            db.AddParameter("@postid", postid);
            ds = db.ExecuteDataSet("getPostById", CommandType.StoredProcedure);
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
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Your Comment Will s');", true); //run script
        }
        catch(Exception ex)
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
            else
            {
                Response.Redirect("post.aspx");
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
        if (string.IsNullOrEmpty(Convert.ToString(Session["email"])) || string.IsNullOrEmpty(Convert.ToString(Session["password"])))
        {
            Response.Redirect("Login.aspx");
            return;
        }
        if (lnkLike.TabIndex.ToString() == "0")
        {
            lnkLike.Text = "<i class='fa fa-heart'></i>";
            lnkLike.ForeColor = System.Drawing.Color.Red;
            lnkLike.TabIndex = 1;
            lnkLike.ToolTip = "Unlike";
            lblErrorMsg.Text = "Post Liked";
            
        }
        else if(lnkLike.TabIndex.ToString() == "1")
        {
            lnkLike.Text = "<i class='fa fa-heart-o'></i>";
            lnkLike.ForeColor = System.Drawing.Color.Red;
            lnkLike.TabIndex = 0;
            lnkLike.ToolTip = "Like";
            lblErrorMsg.Text = "Post Unliked";
        }
        db.AddParameter("@reactionid", 1);
        db.AddParameter("@Postid", Request.QueryString["postid"]);
        db.AddParameter("@userid", Session["userid"]);
        db.AddParameter("@reactiontypeid", 1);
        db.ExecuteDataSet("save_reaction", CommandType.StoredProcedure);
    }
}