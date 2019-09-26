using System;
using System.Data;
using DAL.SQLDataAccess;
using System.Configuration;

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
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet ds = db.ExecuteDataSet("UserLogin", CommandType.StoredProcedure);
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (Convert.ToInt32(ds.Tables[0].Rows[0]["userid"]) == -1)
                {
                    lblErrorMsg.Text = Convert.ToString(ds.Tables[0].Rows[0]["error_message"]);
                }
                else
                {
                    Session["userid"] = ds.Tables[0].Rows[0]["userid"].ToString();
                    Session["email"] = txtmail.Text;
                    Session["contact"] = ds.Tables[0].Rows[0]["mobile"].ToString();
                    Session["name"] = ds.Tables[0].Rows[0]["firstName"].ToString() +" "+ ds.Tables[0].Rows[0]["lastName"].ToString();
                    Session["url"] = ds.Tables[0].Rows[0]["pic_url"].ToString();
                    Session["password"] = txtPassword.Text;
                    Session["type"] = ds.Tables[0].Rows[0]["user_type"].ToString();
                    if (ds.Tables[0].Rows[0]["user_type"].ToString()=="writer")
                    {
                        Response.Redirect("addpost.aspx");
                    }
                    else
                    {                       
                        Response.Redirect("default.aspx");
                    }                                 
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