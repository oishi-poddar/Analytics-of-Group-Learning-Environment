<%-- 
    Document   : DAO_Fetch_Notification_Count
    Created on : 13 Jun, 2017, 11:20:22 AM
    Author     : pratik
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="angle_group.AngleUtility"%>
<%@page import="bean.Notification"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AngleUtility utility = new AngleUtility();
    int userId;
    int count;
    userId = Integer.parseInt(request.getParameter("userId"));
    count = utility.getUnreadNotificationCountForUser(userId);

    Gson gson = new Gson();
    gson.toJson(count);
    out.print(gson.toJson(count));
%>
