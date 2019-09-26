using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;
using System.Configuration;

public partial class Comments : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMsg.Text = "";
        if(!IsPostBack)
        {
            lblErrorMsg.Text = "";
            FillGrid();
        }
    }
    protected void FillGrid()
    {
        try
        {
            db.AddParameter("@active", 1);
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet ds = db.ExecuteDataSet("get_comments", CommandType.StoredProcedure);
            rpComments.DataSource = ds;
            rpComments.DataBind();
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void rpComments_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            if(e.CommandName== "DEL")
            {
                db.AddParameter("@commentid",e.CommandArgument.ToString());
                db.AddParameter("@active", 1);
                db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
                DataSet ds = db.ExecuteDataSet("get_comments", CommandType.StoredProcedure);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    db.ExecuteNonQuery("update PostComments set active=0 where commentsid=" + e.CommandArgument.ToString());
                    //Util.SendEmail(ds.Tables[0].Rows[0]["email"].ToString(), "Comment Approved", "Hi " + ds.Tables[0].Rows[0]["username"].ToString() + ", <br / >Thanks for your comment ! It have been approved. ");
                    FillGrid();
                    AdminMaster admin = Master as AdminMaster;
                    admin.AdminSide();
                    lblErrorMsg.Text = "Comment Delete Successfully.";
                }
            }
            //else if (e.CommandName == "Reject")
            //{
            //    db.ExecuteNonQuery("update PostComments set active=1 where commentsid=" + e.CommandArgument.ToString());
            //    FillGrid();
            //    db.AddParameter("@active", 2);
            //    db.AddParameter("@commentid", e.CommandArgument.ToString());
            //    DataSet ds = db.ExecuteDataSet("get_comments", CommandType.StoredProcedure);
            //    Util.SendEmail("suraj.appeteria@gmail.com", "Comment Approved", "Hi " + ds.Tables[0].Rows[0]["username"].ToString() + ", <br / >Thanks for your comment ! It have been approved. ");
            //    lblErrorMsg.Text = "Comment Approved";
            //}
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }
}