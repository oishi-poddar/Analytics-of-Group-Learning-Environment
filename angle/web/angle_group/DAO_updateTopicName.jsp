<%-- 
    Document   : DAO_updateTopicName
    Created on : 26 May, 2017, 2:52:04 PM
    Author     : pratik
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="bean.Topic"%>
<%@page import="angle_group.AngleUtility"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    AngleUtility utility = new AngleUtility();
    int resQuery = 0;
    String res = "";
    resQuery = utility.updateTopic(request.getParameter("topicName"), Integer.parseInt(request.getParameter("tid")));

    res = res + resQuery;

    Gson gson = new Gson();
    gson.toJson(res);
    out.print(gson.toJson(res));
%>