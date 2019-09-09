using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using DAL.SQLDataAccess;

public partial class NewPost : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMsg.Text = "";
        if (!IsPostBack)
        {
            ddlFill();
            hdnPostId.Value = "0";
            if (Request.QueryString["postid"] != null)
            {
                try
                {
                    DataSet ds = db.ExecuteDataSet("select * from posts where postid=" + Request.QueryString["postid"].ToString());
                    txtTitle.Text = ds.Tables[0].Rows[0]["posttitle"].ToString();
                    txtDescription.Text = ds.Tables[0].Rows[0]["postdescription"].ToString();
                    txtTags.Text = ds.Tables[0].Rows[0]["tags"].ToString();
                    ds = db.ExecuteDataSet("select * from PostCategory where postid=" + Request.QueryString["postid"].ToString());
                    hdnPostId.Value = Request.QueryString["postid"].ToString();
                }
                catch (Exception ex)
                {
                    lblErrorMsg.Text = ex.Message.ToString();
                }
            }
        }
    }

    protected void ddlFill()
    {
        try
        {
            DataSet ds = db.ExecuteDataSet("select * from categorymaster where isnull(parentid,0)=0", CommandType.Text);
            required.DataTextField = "category";
            required.DataValueField = "categoryid";
            required.DataSource = ds;
            required.DataBind();
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
            string st = txtDescription.Text;
            db.AddParameter("@postid",hdnPostId.Value);
            db.AddParameter("@postTitle", txtTitle.Text);
            db.AddParameter("@postdescription", st);
            db.AddParameter("@ImageUrl", hdnFileUpload.Value);
            db.AddParameter("@VideoUrl", DBNull.Value);
            db.AddParameter("@CreatedBy", 1);
            db.AddParameter("@tags", txtTags.Text);
            db.AddParameter("@CreatedOn", Convert.ToDateTime(DateTime.Today));
            db.AddParameter("@CreatedByEmail", "sg@gmail.com");
            db.AddParameter("@updated_on", Convert.ToDateTime(DateTime.Today));
            db.AddParameter("@mobile", DBNull.Value);
            int id = Convert.ToInt32(db.ExecuteScalar("Save_posts", CommandType.StoredProcedure));

            string[] arry = (Request.Form["required"]).ToString().Split(',');
            db.ExecuteNonQuery("delete from PostCategory where postid="+hdnPostId.Value, CommandType.Text);
            for (int i = 0; i < arry.Length; i++)
            {
                if (hdnPostId.Value == "0")
                {
                    db.AddParameter("@categoryid", arry[i]);
                    db.AddParameter("@postid", id);
                    db.ExecuteNonQuery("save_postCategory", CommandType.StoredProcedure);
                }
                else
                {
                    db.AddParameter("@categoryid", arry[i]);
                    db.AddParameter("@postid", hdnPostId.Value);
                    db.ExecuteNonQuery("save_postCategory", CommandType.StoredProcedure);
                }
            }
            lblErrorMsg.Text = "Post Shared...";
            txtDescription.Text = "";
            txtTitle.Text = "";
            Response.Redirect("addpost.aspx");
            
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }


    protected void fuImage_PreRender(object sender, EventArgs e)
    {
        try
        {
            if (fuImage.HasFile)
            {
                if (IsPostBack && fuImage.PostedFile != null)
                {
                    string file_name = string.Empty, extension = string.Empty;
                    file_name = fuImage.FileName;
                    extension = file_name.Substring(file_name.LastIndexOf("."));
                    if (extension.ToLower().Equals(".png") || extension.ToLower().Equals(".jpg") || extension.ToLower().Equals(".jpeg"))
                    {                       
                            hdnFileUpload.Value = file_name;
                            fuImage.SaveAs(Server.MapPath("images/PostImage/" + file_name));
                    }
                    else
                    {
                        lblErrorMsg.Text = "Please select .Png, .Jpg or jpeg file only";
                        return;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }
}