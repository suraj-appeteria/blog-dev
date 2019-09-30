using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;
using System.Configuration;

public partial class ForgotPassword : System.Web.UI.Page
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

    protected void btnReset_ServerClick(object sender, EventArgs e)
    {
        try
        {
            db.AddParameter("@email", txtEmail.Text);
            db.AddParameter("@otp", partitioned.Text);
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet ds = db.ExecuteDataSet("ValidateOTP", CommandType.StoredProcedure);
            if (ds.Tables[0].Rows[0]["validationstatus"].ToString() == "Y")
            {
                pnlForgrt.Visible = false;
                pnlChangPass.Visible=true;
            }
            else
            {
                pnlForgrt.Visible = true;
                pnlChangPass.Visible = false;
                lblErrorMsg.Text = ds.Tables[0].Rows[0]["validationotp"].ToString();
            }
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void btnOtp_Click(object sender, EventArgs e)
    {
        try
        {
            db.AddParameter("@email", txtEmail.Text);
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet ds = db.ExecuteDataSet("get_users", CommandType.StoredProcedure);

            if (ds.Tables[0].Rows[0]["value"].ToString() == "1")
            {
                lblErrorMsg.Text = "User does not exist";
            }
            else
            {
                db.AddParameter("email", txtEmail.Text);
                db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
                ds = db.ExecuteDataSet("getOTP", CommandType.StoredProcedure);
                Util.SendEmail(txtEmail.Text, "Your Blog One-Time Password", "Hi Member, Your email OTP is : " + ds.Tables[0].Rows[0]["OTP"] + " And Valid Till " + ds.Tables[0].Rows[0]["valid_till"]);
                lblErrorMsg.Text = "OTP sent";
            }
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void btnChange_ServerClick(object sender, EventArgs e)
    {
        try
        {

            db.AddParameter("@email", txtEmail.Text);
            db.AddParameter("@pass", txtConfirm.Text);
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet ds = db.ExecuteDataSet("update usermaster set password=pwdencrypt(@pass) where email=@email and blog_id=@blog_id", CommandType.Text);
            Response.Redirect("Login.aspx");
           
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }
}