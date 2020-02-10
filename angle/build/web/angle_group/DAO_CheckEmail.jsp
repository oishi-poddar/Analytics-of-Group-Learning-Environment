<%-- 
    Document   : DAO_CheckEmail
    Created on : 19 May, 2017, 8:59:55 AM
    Author     : pratik
--%>

<%@page import="angle_group.AngleUtility"%>
<%@page import="nl.bitwalker.useragentutils.Browser"%>
<%@page import="nl.bitwalker.useragentutils.OperatingSystem"%>
<%@page import="nl.bitwalker.useragentutils.UserAgent"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    AngleUtility utility = new AngleUtility();
    String email_id = request.getParameter("emailId");
    int res =0;
    try {
        res = utility.checkExistingEmail(email_id);
    }catch(Exception e){}
    
    Gson gson = new Gson();
    gson.toJson(res);
    out.print(gson.toJson(res));
%>
