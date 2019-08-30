using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DAL.SQLDataAccess;
using System.Text.RegularExpressions;

public partial class Login : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMsg.Text = "";
        if (!IsPostBack)
        {
            lblErrorMsg.Text = "";
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            db.AddParameter("@mail", txtmail.Text);
            db.AddParameter("@Password", txtPassword.Text);
            DataSet ds = db.ExecuteDataSet("UserLogin", CommandType.StoredProcedure);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (Convert.ToInt32(ds.Tables[0].Rows[0]["userid"]) == -1)
                {
                    lblErrorMsg.Text = Convert.ToString(ds.Tables[0].Rows[0]["error_message"]);
                }
                else
                {
                    Response.Redirect("Post.aspx");
                }
            }
            else
            {
                lblErrorMsg.Text = "Invalid Login Credentials";
            }
            
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

}