using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DAL.SQLDataAccess;

public partial class SignUp : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMsg.Text = "";
        if(!IsPostBack)
        {
            lblErrorMsg.Text = "";
        }
    }

    protected void btnSignUp_ServerClick(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = db.ExecuteDataSet("select * from usermaster", CommandType.Text);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (ds.Tables[0].Rows[i]["mobile"].ToString() == txtMobile.Text)
                {
                    lblErrorMsg.Text = "Mobile number already registerd";
                    return;
                }
                else if(ds.Tables[0].Rows[i]["email"].ToString() == txtEmail.Text)
                {
                    lblErrorMsg.Text = "Email Id already registerd";
                    return;
                }
            }
            db.AddParameter("@userid", 0);
            db.AddParameter("@mobile", txtMobile.Text);
            db.AddParameter("@country_code", +91);
            db.AddParameter("@FirstName", txtFirstName.Text);
            db.AddParameter("@LastName", txtLastName.Text);
            db.AddParameter("@Email", txtEmail.Text);
            db.AddParameter("@password", txtConfPass.Text);
            db.ExecuteDataSet("save_user_with_mobile", CommandType.StoredProcedure);
            txtConfPass.Text = "";
            txtEmail.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtMobile.Text = "";
            txtPass.Text = "";
            Response.Redirect("Login.aspx");

        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

}