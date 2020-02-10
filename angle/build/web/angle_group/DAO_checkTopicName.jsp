<%-- 
    Document   : DAO_checkTopicName
    Created on : 25 May, 2017, 3:05:05 PM
    Author     : ubuntu
--%>

<%@page import="nl.bitwalker.useragentutils.Browser"%>
<%@page import="nl.bitwalker.useragentutils.OperatingSystem"%>
<%@page import="nl.bitwalker.useragentutils.UserAgent"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="angle_group.AngleUtility"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    AngleUtility utility = new AngleUtility();
    String name = request.getParameter("topicname");
    String gid = request.getParameter("gid");
    int res =0;
    res = utility.checkExistingTopic(name, Integer.parseInt(gid));
    
    Gson gson = new Gson();
    gson.toJson(res);
    out.print(gson.toJson(res));
%>