﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DAL.SQLDataAccess;
using System.IO;

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
            db.AddParameter("@userid", 0);
            db.AddParameter("@mobile", txtMobile.Text);
            db.AddParameter("@country_code", +91);
            db.AddParameter("@FirstName", txtFirstName.Text);
            db.AddParameter("@LastName", txtLastName.Text);
            db.AddParameter("@Email", txtEmail.Text);
            db.AddParameter("@password", txtConfPass.Text);
            db.ExecuteDataSet("save_user_with_mobile", CommandType.StoredProcedure);
            txtConfPass.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtMobile.Text = "";
            txtPass.Text = "";
            lblErrorMsg.Text = "Account Created";
            pnlemail.Visible = false;
            pnlInfo.Visible = false;
            pnlProfile.Visible = true;
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }


    protected void btnOtp_Click(object sender, EventArgs e)
    {
        try
        {
            
            DataSet ds = db.ExecuteDataSet("get_users", CommandType.StoredProcedure);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (ds.Tables[0].Rows[i]["email"].ToString() == txtEmail.Text)
                {
                    lblErrorMsg.Text = "Email Id already registerd";
                    return;
                }
            }
            btnOtp.TabIndex = 1;
            db.AddParameter("email", txtEmail.Text);
            ds = db.ExecuteDataSet("getOTP", CommandType.StoredProcedure);
            Util.SendEmail(txtEmail.Text, "OTP To Varify Your Account", "Your 4 Digit OTP for account varification is "+ds.Tables[0].Rows[0]["OTP"]+" And Valid Till "+ ds.Tables[0].Rows[0]["valid_till"]);
            lblErrorMsg.Text = "OTP sent to "+txtEmail.Text;
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }


    protected void btnNext_ServerClick(object sender, EventArgs e)
    {
        try
        {
            if (btnOtp.TabIndex != 0)
            {
                db.AddParameter("@email", txtEmail.Text);
                db.AddParameter("@otp", partitioned.Text);
                DataSet ds = db.ExecuteDataSet("ValidateOTP", CommandType.StoredProcedure);
                if (ds.Tables[0].Rows[0]["validationstatus"].ToString() == "Y")
                {
                    pnlemail.Visible = false;
                    pnlInfo.Visible = true;
                }
                else
                {
                    lblErrorMsg.Text = ds.Tables[0].Rows[0]["validationotp"].ToString();
                    partitioned.Text = "";
                }
            }
            else
            {
                lblErrorMsg.Text = "Please Verifiy Otp";
            }
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }



    protected void fuImg_PreRender(object sender, EventArgs e)
    {
        try
        {
            if (fuImg.HasFile)
            {
                if (IsPostBack && fuImg.PostedFile != null)
                {
                    string file_name = string.Empty, extension = string.Empty;
                    file_name = fuImg.FileName;
                    extension = file_name.Substring(file_name.LastIndexOf("."));
                    if (extension.ToLower().Equals(".png") || extension.ToLower().Equals(".jpg") || extension.ToLower().Equals(".jpeg"))
                    {
                        hdnFileName.Value = file_name;
                        fuImg.SaveAs(Server.MapPath("images/profile/" + file_name));
                        imgProfile.ImageUrl = "images/profile/" + file_name;
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

    protected void btnProfile_ServerClick(object sender, EventArgs e)
    {
        try
        {
            pnlemail.Visible = true;
            pnlInfo.Visible = true;
            db.AddParameter("@url", hdnFileName.Value);
            db.AddParameter("@email", txtEmail.Text);
            if (hdnFileName.Value != null)
            {
                db.ExecuteNonQuery("update usermaster set pic_url=@url where email=@email", CommandType.Text);
            }
            else
            {
                db.ExecuteNonQuery("update usermaster set pic_url=default.png where email=@email", CommandType.Text);
            }
            Response.Redirect("login.aspx");
        }
        catch(Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }
}