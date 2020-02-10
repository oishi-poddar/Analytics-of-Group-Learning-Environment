<%-- 
    Document   : DAO_checkGroupName
    Created on : 27 May, 2017, 4:01:00 PM
    Author     : ubuntu
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
    String name = request.getParameter("groupname");
    String uid = request.getParameter("uid");
    int res =0;
    try{
     res = utility.checkExistingGroup(name, Integer.parseInt(uid));   
    }catch(Exception e){}
    
    Gson gson = new Gson();
    gson.toJson(res);
    out.print(gson.toJson(res));
%>