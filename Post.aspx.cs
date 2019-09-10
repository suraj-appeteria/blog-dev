using System;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;

public partial class Post : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
     
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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
            if(e.CommandName=="Read")
            {
                db.AddParameter("@postid", e.CommandArgument);
                db.ExecuteNonQuery("save_PostView",CommandType.StoredProcedure);
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
