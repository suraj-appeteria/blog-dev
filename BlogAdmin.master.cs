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
        db.AddParameter("user_type", "writer");
        DataSet ds = db.ExecuteDataSet("get_users", CommandType.StoredProcedure);
        //Session["adminemail"] = Convert.ToString(ds.Tables[0].Rows[0]["email"]);
        //Session["adminName"] = Convert.ToString(ds.Tables[0].Rows[0]["firstname"]) + " " + Convert.ToString(ds.Tables[0].Rows[0]["lastname"]);
        lnkName.Text = Convert.ToString(ds.Tables[0].Rows[0]["firstname"])+ " "+ ds.Tables[0].Rows[0]["lastname"].ToString();
        imgAdmin.ImageUrl = ConfigurationManager.AppSettings["profileUrl"] + ds.Tables[0].Rows[0]["pic_url"].ToString();

        if (string.IsNullOrEmpty(Convert.ToString(Session["email"])) || string.IsNullOrEmpty(Convert.ToString(Session["password"])))
        {
            ulLogin.Visible = true;
            disqus_thread.Visible = false;
        }
        //else if(Session["type"].ToString()=="writer")
        //{
        //    ulLogin.Visible = false;
        //    disqus_thread.Visible = false;
        //}
        else
        {
            userSide();
        }
    }

    public void userSide()
    {
        if (Session["type"].ToString() == "writer")
        {
            Response.Redirect("addpost.aspx");
        }
        ulLogin.Visible = false;
        disqus_thread.Visible = true;
        db.AddParameter("@userid", Session["userid"].ToString());
        DataSet ds = db.ExecuteDataSet("get_users", CommandType.StoredProcedure);
        imgProfile.ImageUrl = ConfigurationManager.AppSettings["profileUrl"] + ds.Tables[0].Rows[0]["pic_url"].ToString();
        lblName.Text = ds.Tables[0].Rows[0]["FirstName"].ToString() +" "+ ds.Tables[0].Rows[0]["LastName"].ToString();
        lblNo.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        
        Session.Clear();
        System.Web.Security.FormsAuthentication.SignOut();
        Response.Redirect("~/post.aspx");
    }

    protected void lblName_Click(object sender, EventArgs e)
    {
        Response.Redirect("userProfile.aspx?type=user&userid=" + Session["userid"].ToString());
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("FavPost.aspx?type=user&userid=" + Session["userid"].ToString());
    }
}
