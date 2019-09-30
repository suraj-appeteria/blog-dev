using System;
using System.Data;
using DAL.SQLDataAccess;
using System.Configuration;

public partial class AddWork : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMsg.Text = "";
        if(!IsPostBack)
        {
            hdnWorkId.Value = "0";
            lblErrorMsg.Text = "";
            FillRp();
        }
    }
    protected void FillRp()
    {
        try
        {

            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet ds = db.ExecuteDataSet("get_works", CommandType.StoredProcedure);
            rpWorks.DataSource = ds;
            rpWorks.DataBind();
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            string file_name = string.Empty, extension = string.Empty;
            file_name = hdnFileUpload.Value;

            db.AddParameter("@workid", hdnWorkId.Value);
            db.AddParameter("@worktitle",txtTitle.Text);
            db.AddParameter("@workurl",txtUrl.Text);
            db.AddParameter("@workdesc",txtDesc.Text);
            db.AddParameter("@workimg",file_name);
            db.AddParameter("@modifiedby", Session["userid"]);
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            int id = Convert.ToInt32(db.ExecuteScalar("save_works", CommandType.StoredProcedure));

            if (file_name != string.Empty)
            {
                extension = file_name.Substring(file_name.LastIndexOf("."));
                if (System.IO.File.Exists(Server.MapPath(ConfigurationManager.AppSettings["workurl"] + id + extension)))
                {
                    System.IO.File.Delete(Server.MapPath(ConfigurationManager.AppSettings["workurl"] + id + extension));
                }
                System.IO.File.Move(Server.MapPath(ConfigurationManager.AppSettings["workurl"] + file_name), Server.MapPath(ConfigurationManager.AppSettings["workurl"] + id + extension));
                db.ExecuteNonQuery("update works set work_image_name='" + id + extension + "' where work_id='" + id + "'");
            }
            FillRp();
            lblErrorMsg.Text = "Work Added";
            txtDesc.Text = "";
            txtTitle.Text = "";
            txtUrl.Text = "";
            hdnWorkId.Value = "0";
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
                        fuImage.SaveAs(Server.MapPath("images/WorkImg/" + file_name));
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

    protected void rpWorks_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        try
        {
            if(e.CommandName == "EDT")
            {
                hdnWorkId.Value = e.CommandArgument.ToString();
                db.AddParameter("@work_id", e.CommandArgument.ToString());                
                db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
                DataSet ds = db.ExecuteDataSet("get_works", CommandType.StoredProcedure);
                txtDesc.Text = ds.Tables[0].Rows[0]["work_desc"].ToString();
                txtTitle.Text = ds.Tables[0].Rows[0]["work_title"].ToString();
                txtUrl.Text = ds.Tables[0].Rows[0]["work_url"].ToString();
                hdnFileUpload.Value = ds.Tables[0].Rows[0]["work_image_name"].ToString();
            }
            else if(e.CommandName  == "DEL")
            {
                db.AddParameter("@work_id", e.CommandArgument.ToString());
                db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
                db.ExecuteNonQuery("update works set active=0 where work_id=@work_id and blog_id=@blog_id", CommandType.Text);
                FillRp();
                
                lblErrorMsg.Text = "Work Deleted Successfully.";
            }

        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString(); 
        }
    }
}