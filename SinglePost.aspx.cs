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
            db.AddParameter("@commentsid", 0);
            db.AddParameter("@postid", Convert.ToInt32(Request.QueryString["postid"]));
            db.AddParameter("@userid",1);
            db.AddParameter("@comments", txtComment.Text);
            db.ExecuteNonQuery("save_comments", CommandType.StoredProcedure);
            txtComment.Text = "";
            comment();
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }
}