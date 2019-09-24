using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DAL.SQLDataAccess;
public partial class Contact : System.Web.UI.Page
{
    DatabaseHelper db = new DatabaseHelper();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubscribe_ServerClick(object sender, EventArgs e)
    {
        try
        {

            DataSet ds = db.ExecuteDataSet("get_users", CommandType.StoredProcedure);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                if (ds.Tables[0].Rows[i]["email"].ToString() == txtEmail.Text)
                {
                    lblError.Text = txtEmail.Text + " id is already subscribed";
                    return;
                }
            }
            db.AddParameter("@Email_id", txtEmail.Text);
            db.ExecuteNonQuery("save_Subscriber", CommandType.StoredProcedure);
            txtEmail.Text = "";
            lblError.Text = "congratulations you are now subscribed.";
        }
        catch (Exception ex)
        {
            lblErrorMsg.Text = ex.Message.ToString();
        }
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