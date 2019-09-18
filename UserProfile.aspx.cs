using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;
using System.Configuration;

public partial class UserProfile : System.Web.UI.Page
{

    protected void Page_PreInit(object sender, EventArgs e)
    {
        try
        {
            if (Session["type"].ToString() == "writer")
            {
                this.MasterPageFile = "~/AdminMaster.master";                
            }
            else
            {
                this.MasterPageFile = "~/BlogAdmin.master";
            }
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    DatabaseHelper db = new DatabaseHelper();

    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMsg.Text = "";
        if (!IsPostBack)
        {
            lblErrorMsg.Text = "";
            FillDetails();
        }
    }

    protected void FillDetails()
    {
        try
        {
            if (Request.QueryString["userid"] != null)
            {
                db.AddParameter("@userid", Request.QueryString["userid"].ToString());
                DataSet ds = db.ExecuteDataSet("get_users",CommandType.StoredProcedure);
                txtName.Text = ds.Tables[0].Rows[0]["firstname"].ToString();
                txtLastName.Text = ds.Tables[0].Rows[0]["lastname"].ToString();
                txtMobile.Text = ds.Tables[0].Rows[0]["mobile"].ToString();
                txtEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                imgProfile.ImageUrl = ConfigurationManager.AppSettings["profileurl"] + ds.Tables[0].Rows[0]["pic_url"].ToString();
            }
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            if (btnUpdate.TabIndex == 0)
            {
                btnUpdate.Text = "Update";
                btnUpdate.TabIndex = 1;                
                txtMobile.ReadOnly = false;
                txtName.ReadOnly = false;
                txtLastName.ReadOnly = false;
            }
            else
            {
                db.AddParameter("@userid", Request.QueryString["userid"].ToString());
                db.AddParameter("@mobile", txtMobile.Text);                
                db.AddParameter("@FirstName", txtName.Text);
                db.AddParameter("@LastName", txtLastName.Text);                                
                db.ExecuteNonQuery("save_user", CommandType.StoredProcedure);
                if (Request.QueryString["type"].ToString() == "user")
                {
                    BlogAdmin blogmaster = Master as BlogAdmin;
                    blogmaster.userSide();
                }
                else if(Request.QueryString["type"].ToString() == "admin")
                {
                    AdminMaster admin = Master as AdminMaster;
                    admin.AdminSide();
                }               
               
                lblErrorMsg.Text = "Profile Updated Successfully.";
                btnUpdate.Text = "Edit";
                btnUpdate.TabIndex = 0;                
                txtMobile.ReadOnly = true;
                txtName.ReadOnly = true;
                txtLastName.ReadOnly = true;

            }
            
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void fuProfile_PreRender(object sender, EventArgs e)
    {
        try
        {
            if (fuProfile.HasFile)
            {
                if (IsPostBack && fuProfile.PostedFile != null)
                {
                    string file_name = string.Empty, extension = string.Empty;
                    file_name = fuProfile.FileName;
                    extension = file_name.Substring(file_name.LastIndexOf("."));
                    if (extension.ToLower().Equals(".png") || extension.ToLower().Equals(".jpg") || extension.ToLower().Equals(".jpeg"))
                    {
                        fuProfile.SaveAs(Server.MapPath("images/profile/" + file_name));
                        imgProfile.ImageUrl = ConfigurationManager.AppSettings["profileurl"] + file_name;
                        db.AddParameter("@userid", Request.QueryString["userid"].ToString());                        
                        db.AddParameter("@PicUrl", file_name);
                        db.ExecuteNonQuery("update usermaster set pic_url=@picurl where userid=@userid", CommandType.Text);
                        lblErrorMsg.Text = "Profile Picture Change Successfully.";
                        if (Request.QueryString["type"].ToString() == "user")
                        {
                            BlogAdmin blogmaster = Master as BlogAdmin;
                            blogmaster.userSide();
                        }
                        else if (Request.QueryString["type"].ToString() == "admin")
                        {
                            AdminMaster admin = Master as AdminMaster;
                            admin.AdminSide();
                        }
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