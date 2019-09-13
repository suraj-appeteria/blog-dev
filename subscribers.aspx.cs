using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;

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