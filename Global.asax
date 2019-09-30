﻿<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %> 

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup
        //RegisterRoutes(RouteTable.Routes);

    }
    static void RegisterRoutes(RouteCollection routes)
    {
        //routes.MapPageRoute("SinglePost", "Post/{postid}", "~/singlepost.aspx");
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs
       // Code that runs when an unhandled error occurs
        Exception ex = Server.GetLastError();        
        Util.LogError((Exception)ex.InnerException);                       
        Response.Redirect("Message.aspx?msg=Unexpected error occured. Please contact Administrator. Error Details" + ex.InnerException.ToString());

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
