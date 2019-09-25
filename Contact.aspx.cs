using System;
using System.Data;
using DAL.SQLDataAccess;
using System.Configuration;

public partial class Contact : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_ServerClick(object sender, EventArgs e)
    {
        try
        {
            db.AddParameter("@contactid", 0);
            db.AddParameter("@name", txtName.Text);
            db.AddParameter("@email", txtContactEmail.Text);
            db.AddParameter("@mobile", txtPhn.Text);
            db.AddParameter("@subject", txtSubject.Text);
            db.AddParameter("@Msg", txtMsg.Text);
            db.AddParameter("@country", txtCity.Text);
            db.AddParameter("@blog_id", ConfigurationManager.AppSettings["BlogId"].ToString());
            db.ExecuteDataSet("save_contactMe", CommandType.StoredProcedure);
            txtCity.Text = "";
            txtContactEmail.Text = "";
            txtMsg.Text = "";
            txtName.Text = "";
            txtPhn.Text = "";
            txtSubject.Text = "";
            lblErrorMsg.Text = "Your message sent successfully.";
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
    }
}