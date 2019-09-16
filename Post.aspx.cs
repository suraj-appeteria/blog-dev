using System;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;

public partial class Post : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        lblErrorMsg.Text = "";
        if (!IsPostBack)
        {
            lblError.Text = "";
            lblErrorMsg.Text = "";
            if (string.IsNullOrEmpty(Convert.ToString(Session["email"])) || string.IsNullOrEmpty(Convert.ToString(Session["password"])))
            {
                dvSubscribe.Visible = true;
            }
            else
            {
                dvSubscribe.Visible = false;
            }
                FillRp();
        }
    }
    protected void FillRp()
    {
        try
        {
            Session["type"] = "";
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

    protected void btnSubscribe_ServerClick(object sender, EventArgs e)
    {
        try
        {
            
            DataSet ds = db.ExecuteDataSet("get_users", CommandType.StoredProcedure);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (ds.Tables[0].Rows[i]["email"].ToString() == txtEmail.Text)
                {
                    lblError.Text = txtEmail.Text + " id is already subscribed";
                    return;
                }
            }
            db.AddParameter("@Email_id", txtEmail.Text);
            db.ExecuteNonQuery("save_Subscriber", CommandType.StoredProcedure);
            lblError.Text = "congratulations you are now subscribed.";
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }
}
