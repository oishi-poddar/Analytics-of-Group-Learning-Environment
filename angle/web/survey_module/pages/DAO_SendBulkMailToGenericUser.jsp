<%-- 
    Document   : DAO_SendBulkMailToGenericUser
    Created on : 10 Mar, 2017, 11:24:41 AM
    Author     : dipesh
--%>

<%@page import="survey.SendMailThroughExcelUtility"%>
<%@page import="survey.BulkMailUtility"%>
<%@page import="com.google.gson.Gson"%>
<%
    //BulkMailUtility b_utility = new BulkMailUtility();
    SendMailThroughExcelUtility b_utility=new SendMailThroughExcelUtility();
    String context_path = getServletContext().getRealPath("/");
    String uri = request.getScheme() + "://" + // "http" + "://
            request.getServerName() + // "myhost"
            ":" + // ":"
            request.getServerPort(); // "8080"   

    String url = request.getRequestURL().toString();

    String server_type = "";
    if (url.contains("localhost")) {
        server_type = "localhost";
    } else if (url.contains("10.129.50.220") || url.contains("ekalavyatest")) {
        server_type = "test";
    } else if (url.contains("10.129.1.135")) {
        server_type = "main";
    }
    String result = "";
    String bulkmail_id = request.getParameter("bulkmail_id");
    
    result = b_utility.sendBulkMailToGenericUser(Integer.parseInt(bulkmail_id), context_path, server_type,uri);
    Gson gson = new Gson();
    gson.toJson(result);
    out.print(gson.toJson(result));
%>