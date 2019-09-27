using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;

public partial class Testimonial : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMsg.Text = "";
        if (!IsPostBack)
        {
            lblErrorMsg.Text = "";
            rpFill();
        }
    }
    protected void rpFill()
    {
        try
        {
            if (Request.QueryString["workId"] != null)
            {
                db.AddParameter("@active", 1);
                db.AddParameter("@work_id", Request.QueryString["workId"].ToString());
                DataSet ds = db.ExecuteDataSet("get_testimonial", CommandType.StoredProcedure);
                rptestimonial.DataSource = ds;
                rptestimonial.DataBind();
                lblWork.Text = ds.Tables[0].Rows[0]["work_title"].ToString();
            }
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();        
        }
    }
}