using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using DAL.SQLDataAccess;

public partial class BlogAdmin : System.Web.UI.MasterPage
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(Convert.ToString(Session["email"])) || string.IsNullOrEmpty(Convert.ToString(Session["password"])))
        {
            ulLogin.Visible = true;
            disqus_thread.Visible = false;
            db.AddParameter("user_type", "writer");
            DataSet ds = db.ExecuteDataSet("get_users", CommandType.StoredProcedure);
            lnkName.Text = Convert.ToString(ds.Tables[0].Rows[0]["username"] );
            imgAdmin.ImageUrl = ConfigurationManager.AppSettings["profileUrl"] + ds.Tables[0].Rows[0]["pic_url"].ToString();
        }
        else
        {
            if (Session["type"].ToString() == "writer")
            {
                Response.Redirect("addpost.aspx");
            }
            ulLogin.Visible = false;
            disqus_thread.Visible = true;
            imgProfile.ImageUrl = ConfigurationManager.AppSettings["profileUrl"] + Session["url"].ToString();
            lblName.Text = Session["name"].ToString();            
            lblNo.Text = Session["contact"].ToString();
        }
    }

    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        
        Session.Clear();
        System.Web.Security.FormsAuthentication.SignOut();
        Response.Redirect("~/post.aspx");
    }
}
