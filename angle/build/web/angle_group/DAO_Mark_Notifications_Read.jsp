<%-- 
    Document   : DAO_Mark_Notifications_Read
    Created on : 14 Jun, 2017, 12:31:39 PM
    Author     : pratik
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="angle_group.AngleUtility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AngleUtility utility = new AngleUtility();
    int userId, res;
    userId = Integer.parseInt(request.getParameter("userId"));
    res = utility.readAllUnreadNotification(userId);
    Gson gson = new Gson();
    gson.toJson(res);
    out.print(gson.toJson(res));
%>
