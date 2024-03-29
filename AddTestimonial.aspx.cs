﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;
using System.Configuration;

public partial class Testimonial : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblErrorMsg.Text = "";
        if(!IsPostBack)
        {
            lblErrorMsg.Text = "";
            hdnImg.Value = "";
            hdnTestimonialID.Value = "0";
            ddlWorkFill();
        }
    }

    protected void ddlWorkFill()
    {
        try
        {
            ddlWork.Items.Clear();
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            DataSet ds = db.ExecuteDataSet("get_works", CommandType.StoredProcedure);
            ddlWork.DataTextField = "work_title";
            ddlWork.DataValueField = "work_id";
            ddlWork.DataSource = ds;
            ddlWork.DataBind();
            
            ddlWork.Items.Insert(0, new ListItem("Select Work", "0"));
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }

    protected void btnSubmit_ServerClick(object sender, EventArgs e)
    {
        try
        {
            string file_name = string.Empty, extension = string.Empty;
            file_name = hdnFileUpload.Value;

            db.AddParameter("@testimonial_id",hdnTestimonialID.Value);
            db.AddParameter("@full_name", txtName.Text);
            db.AddParameter("@desingation", txtDesingation.Text);
            db.AddParameter("@company_name", txtCompanyName.Text);
            db.AddParameter("@testimonial", txtTestimonial.Text);
            db.AddParameter("@photo_name", file_name);
            db.AddParameter("@work_id", ddlWork.SelectedValue);
            int id = Convert.ToInt32(db.ExecuteScalar("save_testimonial", CommandType.StoredProcedure));

            if (file_name != string.Empty)
            {
                extension = file_name.Substring(file_name.LastIndexOf("."));
                if (System.IO.File.Exists(Server.MapPath(ConfigurationManager.AppSettings["Testimonial"] + id + extension)))
                {
                    System.IO.File.Delete(Server.MapPath(ConfigurationManager.AppSettings["Testimonial"] + id + extension));
                }
                System.IO.File.Move(Server.MapPath(ConfigurationManager.AppSettings["Testimonial"] + file_name), Server.MapPath(ConfigurationManager.AppSettings["Testimonial"] + id + extension));
                db.ExecuteNonQuery("update testimonial set photo_name='" + id + extension + "' where testimonial_id='" + id + "'");
            }

            txtTestimonial.Text = "";
            txtName.Text = "";
            txtDesingation.Text = "";
            txtCompanyName.Text = "";
            lblErrorMsg.Text = "Testimonial Added Successfully.";
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
                        hdnImg.Value = file_name;
                        fuProfile.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["Testimonial"] + file_name));
                        //imgProfile.ImageUrl = ConfigurationManager.AppSettings["profileurl"] + file_name;                                                
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