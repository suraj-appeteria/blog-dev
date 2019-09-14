using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DAL.SQLDataAccess;

public partial class AddWork : System.Web.UI.Page
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
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            db.AddParameter("@workid", 0);
            db.AddParameter("@worktitle",txtTitle.Text);
            db.AddParameter("@workurl",txtUrl.Text);
            db.AddParameter("@workdesc",txtDesc.Text);
            db.AddParameter("@workimg",hdnFileUpload.Value);
            db.AddParameter("@modifiedby", Session["userid"]);
            db.ExecuteNonQuery("save_works", CommandType.StoredProcedure);
            lblErrorMsg.Text = "Work Added";
            txtDesc.Text = "";
            txtTitle.Text = "";
            txtUrl.Text = "";
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
}