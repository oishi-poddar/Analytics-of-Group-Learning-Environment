<%-- 
    Document   : DAO_FeaturesFromGroupPage
    Created on : 23 Jun, 2017, 2:12:01 AM
    Author     : ubuntu
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="angle_group.AngleUtility"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
  String temp="";
  int GroupId= Integer.parseInt(request.getParameter("gid"));
   AngleUtility util = new AngleUtility();
    try{
      temp=util.getFeatures(GroupId);
      
    }
    catch(Exception e)
    {
        
    }
    System.out.println(temp);
  Gson gson = new Gson();
  gson.toJson(String.valueOf(temp));
  out.print(gson.toJson(String.valueOf(temp)));
  
%>
