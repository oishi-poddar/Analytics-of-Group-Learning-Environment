<%-- 
    Document   : DAO_saveQuizData
    Created on : 19 Jun, 2017, 9:13:11 PM
    Author     : pratik
--%>

<%@page import="utilities.Utility"%>
<%@page import="bean.Person"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="angle_group.AngleUtility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userId;
    AngleUtility utility = new AngleUtility();
    String result="", title, dateStr, groupId, duration;
    int res = 0;
    Timestamp qdate;
    userId = request.getParameter("userId");
    groupId = request.getParameter("groupId");
    title = request.getParameter("title");
    dateStr = request.getParameter("date");
    duration = request.getParameter("duration");

    result = utility.saveQuizDetails(Integer.parseInt(userId), Integer.parseInt(groupId), title, dateStr, Integer.parseInt(duration));
    Gson gson = new Gson();
    gson.toJson(result);
    out.print(gson.toJson(result));
%>