<%-- 
    Document   : DAO_SendBulkMail
    Created on : 28 Dec, 2016, 12:59:32 PM
    Author     : abinaya
--%>

<%@page import="survey.BulkMailUtility"%>
<%@page import="com.google.gson.Gson"%>
<%
    BulkMailUtility b_utility = new BulkMailUtility();
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

    result = b_utility.sendBulkMail(Integer.parseInt(bulkmail_id), context_path, server_type,uri);
    Gson gson = new Gson();
    gson.toJson(result);
    out.print(gson.toJson(result));
%>