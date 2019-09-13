﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;

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
            db.AddParameter("@active", 2);
            DataSet ds = db.ExecuteDataSet("get_comments", CommandType.StoredProcedure);
            rpComments.DataSource = ds;
            rpComments.DataBind();
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }
}