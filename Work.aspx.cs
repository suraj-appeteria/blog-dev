using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DAL.SQLDataAccess;

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
            DataSet ds = db.ExecuteDataSet("get_works", CommandType.StoredProcedure);
            rpWorks.DataSource = ds;
            rpWorks.DataBind();
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    //protected void btnSubscribe_ServerClick(object sender, EventArgs e)
    //{
    //    try
    //    {

    //        DataSet ds = db.ExecuteDataSet("get_users", CommandType.StoredProcedure);
    //        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
    //        {
    //            if (ds.Tables[0].Rows[i]["email"].ToString() == txtEmail.Text)
    //            {
    //                lblError.Text = txtEmail.Text + " id is already subscribed";
    //                return;
    //            }
    //        }
    //        db.AddParameter("@Email_id", txtEmail.Text);
    //        db.ExecuteNonQuery("save_Subscriber", CommandType.StoredProcedure);
    //        lblError.Text = "congratulations you are now subscribed.";
    //    }
    //    catch (Exception ex)
    //    {
    //        lblErrorMsg.Text = ex.Message.ToString();
    //    }
    //}

}