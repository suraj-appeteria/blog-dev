using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

using System.Web;
using System.Collections.Specialized;
using DAL.SQLDataAccess;
using System.IO;
//using Newtonsoft.Json;

public class Util
{
    DatabaseHelper db = new DatabaseHelper();


    public Util()
    {

    }
   public static void FillDropDown(DropDownList cbo, string ssql, string DataTextField, string DataValueField, DatabaseHelper db)
    {
        DataSet ds = db.ExecuteDataSet(ssql,CommandType.Text);
        cbo.DataTextField = DataTextField;
        cbo.DataValueField = DataValueField;
        cbo.DataSource = ds;
        cbo.DataBind();
        cbo.Items.Insert(0, "Select----->");
        cbo.Items[0].Value = "0";
        //reader.Close();
    }

    public static void FillDropDownAll(DropDownList cbo, string ssql, string DataTextField, string DataValueField, DatabaseHelper db)
    {
        DataSet ds = db.ExecuteDataSet(ssql, CommandType.Text);
        cbo.DataTextField = DataTextField;
        cbo.DataValueField = DataValueField;
        cbo.DataSource = ds;
        cbo.DataBind();
        cbo.Items.Insert(0, "All");
        cbo.Items[0].Value = "0";
        //reader.Close();
    }

    public static void FillDropDownByDefault(DropDownList cbo, string ssql, string DataTextField, string DataValueField, DatabaseHelper db)
    {
            DataSet ds = db.ExecuteDataSet(ssql,CommandType.Text);
    cbo.DataTextField = DataTextField;
        cbo.DataValueField = DataValueField;
        cbo.DataSource = ds;
        cbo.DataBind();
//reader.Close();
    }
    //public static string sendSMS(string msg, string number)
    //{
    //    String message = HttpUtility.UrlEncode(msg);
    //    using (var wb = new WebClient())
    //    {
    //        byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
    //            {
    //            {"apikey" , "kxliytpgNxg-i8r3FOTSUUaTRbEMD1IFNY1eYm1rby"},
    //            {"numbers" , "91" + "9920393933" },//number},
    //            { "message" , msg},
    //            {"sender" , "SOCUNT"}
    //            });
    //        string result = System.Text.Encoding.UTF8.GetString(response);
    //        dynamic resultArray = JsonConvert.DeserializeObject(result);
    //        if (resultArray.status == "failure")
    //        {
    //            SendEmail("vidyesh.appeteria@gmail.com", "No Error Code", "To Mobile: " + number + "\n" + "Error: " + resultArray.errors[0].message);
    //        }
    //        return result;
    //    }
    //}
    public static void SendEmail(string toemail, string subject, string message)
    {
        string fromemail = System.Configuration.ConfigurationManager.AppSettings["fromemail"].ToString();
        //"marathi.lekhmala.app@gmail.com";
        string password = System.Configuration.ConfigurationManager.AppSettings["password"].ToString();
        //"@ppeteria369";
        string smtpserver = System.Configuration.ConfigurationManager.AppSettings["smtpserver"].ToString();
        //"smtp.gmail.com";
        int port = Convert.ToInt16(System.Configuration.ConfigurationManager.AppSettings["port"]);
        //587;

        MailMessage MailObj = new MailMessage();
        MailObj.To.Add(new MailAddress(toemail));
//        MailObj.Bcc.Add(new MailAddress("appeteria@gmail.com"));
        MailObj.From = new MailAddress(fromemail);
        MailObj.IsBodyHtml = true;
        MailObj.Priority = MailPriority.Normal;
        MailObj.Subject = subject;
        MailObj.Body = message ;
        SmtpClient smtpcli = new SmtpClient(smtpserver, port);
        // smtpcli.EnableSsl = true;
        smtpcli.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtpcli.UseDefaultCredentials = false;
        smtpcli.Credentials = new NetworkCredential(fromemail, password);
        smtpcli.Send(MailObj);
    }

    public static void HandleError(string msg, Label lblError, bool unexpected)
    {
        if(unexpected)
        lblError.Text = "Something went wrong : " + msg;
        else
            lblError.Text = msg;
    }

    public static bool CheckImage(string url)
    {
        HttpWebRequest httpReq = (HttpWebRequest)WebRequest.Create(url);
        HttpWebResponse httpRes = null;
        try
        {
            httpRes = (HttpWebResponse)httpReq.GetResponse(); // Error 404 right here,
            if (httpRes.StatusCode == HttpStatusCode.NotFound)
            {
                return false;
            }
        }
        catch (WebException wec)
        {
            return false;
        }
        catch (Exception)
        {
            return false;
        }
        finally
        {
            // Close the response.
            if(httpRes!=null)
            httpRes.Close();
        }
        return true;
    }

    public static void LogError(Exception ex)
    {
        string seperator = "------------------------------------------------------------------------";
        string path = System.Web.HttpContext.Current.Server.MapPath("ErrorLog.txt");
        if (ex == null) return;
        string txt2add = string.Format("{0}\n\r{1} \n\r {2}{0}\n\r", seperator, DateTime.Now.ToString(), ex.ToString());

        if (!File.Exists(path))
            File.WriteAllText(path, txt2add);
        else try { System.IO.File.AppendAllText(path, txt2add); }
            catch { }
    }

}