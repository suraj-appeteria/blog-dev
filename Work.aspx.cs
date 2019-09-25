using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DAL.SQLDataAccess;
using System.Configuration;

public partial class Work : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMsg.Text = "";
        if(!IsPostBack)
        {
            lblErrorMsg.Text = "";
            FillRp();
        }
    }
    protected void FillRp()
    {
        try
        {
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet ds = db.ExecuteDataSet("get_works", CommandType.StoredProcedure);
            rpWorks.DataSource = ds;
            rpWorks.DataBind();
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }
}