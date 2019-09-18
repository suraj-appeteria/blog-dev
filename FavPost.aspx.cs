using System;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;

public partial class FavPost : System.Web.UI.Page
{
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
            db.AddParameter("@active", 1);
            db.AddParameter("@user_id", Request.QueryString["userid"].ToString());            
            DataSet ds = db.ExecuteDataSet("getAllPosts", CommandType.StoredProcedure);
            rpFav.DataSource = ds;
            rpFav.DataBind();
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