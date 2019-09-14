using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DAL.SQLDataAccess;

public partial class CategoryMaster : System.Web.UI.Page
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
            DataSet ds = db.ExecuteDataSet("getAllCategories", CommandType.StoredProcedure);
            rpCategory.DataSource = ds;
            rpCategory.DataBind();
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void loadmorepost_Click(object sender, EventArgs e)
    {
        try
        {
            db.AddParameter("@categoryid", 0);
            db.AddParameter("@category",txtCategory.Text);
            db.AddParameter("@parentid",0);
            db.AddParameter("@sequence",0);
            db.ExecuteNonQuery("save_category", CommandType.StoredProcedure);
            txtCategory.Text = "";
            lblErrorMsg.Text = "Category Added";
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }
}