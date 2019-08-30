using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using DAL.SQLDataAccess;

public partial class NewPost : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMsg.Text = "";
    }

    protected void loadmorepost_Click(object sender, EventArgs e)
    {
        try
        {
            string st = txtDescription.Text;
            db.AddParameter("@postid", 0);
            db.AddParameter("@postTitle", txtTitle.Text);
            db.AddParameter("@postdescription", st);
            db.AddParameter("@ImageUrl", DBNull.Value);
            db.AddParameter("@VideoUrl", DBNull.Value);
            db.AddParameter("@CreatedBy", 1);
            db.AddParameter("@CreatedOn", Convert.ToDateTime(DateTime.Today));
            db.AddParameter("@CreatedByEmail", "sg@gmail.com");
            db.AddParameter("@updated_on", Convert.ToDateTime(DateTime.Today));
            db.AddParameter("@mobile", DBNull.Value);
            db.ExecuteDataSet("Save_posts", CommandType.StoredProcedure);
            lblErrorMsg.Text = "Post Shared...";
            
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            string st = txtDescription.Text;
            db.AddParameter("@postid", 0);
            db.AddParameter("@postTitle", txtTitle.Text);
            db.AddParameter("@postdescription", st);
            db.AddParameter("@ImageUrl", DBNull.Value);
            db.AddParameter("@VideoUrl", DBNull.Value);
            db.AddParameter("@CreatedBy", 1);
            db.AddParameter("@CreatedOn", Convert.ToDateTime(DateTime.Today));
            db.AddParameter("@CreatedByEmail", "sg@gmail.com");
            db.AddParameter("@updated_on", Convert.ToDateTime(DateTime.Today));
            db.AddParameter("@mobile", DBNull.Value);
            db.ExecuteDataSet("Save_posts", CommandType.StoredProcedure);
            lblErrorMsg.Text = "Post Shared...";

        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }
}