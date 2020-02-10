<%-- 
    Document   : DAO_Fetch_Notification
    Created on : 12 Jun, 2017, 3:14:20 PM
    Author     : pratik
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="angle_group.AngleUtility"%>
<%@page import="bean.Notification"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AngleUtility utility = new AngleUtility();
    ArrayList<Notification> unreadNotification = null;
    int userId;
    userId = Integer.parseInt(request.getParameter("userId"));
    unreadNotification = utility.getUnreadNotificationForUser(userId);

    Gson gson = new Gson();
    gson.toJson(unreadNotification);
    out.print(gson.toJson(unreadNotification));
%>
