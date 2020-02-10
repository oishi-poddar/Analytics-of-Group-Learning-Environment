<%-- 
    Document   : DAO_changePassword
    Created on : 5 Apr, 2017, 3:04:43 PM
    Author     : dipesh
--%>

<%@page import="nl.bitwalker.useragentutils.Browser"%>
<%@page import="nl.bitwalker.useragentutils.OperatingSystem"%>
<%@page import="nl.bitwalker.useragentutils.UserAgent"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="survey.SurveyUtility"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    SurveyUtility utility = new SurveyUtility();
    String user_id = request.getParameter("userid");
    String password = request.getParameter("newpass");
    String ipAddress = request.getParameter("ipAddress");
    int res = 0;
    try{
        res = utility.updatePassword(user_id, password,ipAddress);
    }catch(Exception e){
        e.printStackTrace();
    }
    
    Gson gson = new Gson();
    gson.toJson(res);
    out.print(gson.toJson(res));
%>
