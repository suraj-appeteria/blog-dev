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
        FillRp();
    }

    protected void FillRp()
    {
        try
        {
            DataSet ds = db.ExecuteDataSet("getAllPosts", CommandType.StoredProcedure);
            rpPost.DataSource = ds;
            rpPost.DataBind();
        }
        catch (Exception ex)
        {
            ex.Message.ToString();
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
}