using System;
using System.Data;
using DAL.SQLDataAccess;
using System.Configuration;

public partial class subscribers : System.Web.UI.Page
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
            db.AddParameter("@user_type", "reader");
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet ds = db.ExecuteDataSet("get_users", CommandType.StoredProcedure);
            rpSubscriber.DataSource = ds;
            rpSubscriber.DataBind();
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }
}