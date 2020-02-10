<%-- 
    Document   : DAO_checkProfileName
    Created on : 9 Jun, 2017, 3:55:23 PM
    Author     : ubuntu
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="angle_group.AngleUtility"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>

<%  
    String profileName = request.getParameter("profileName");
    int temp=0;
    if(profileName.length() != 0){
    AngleUtility angle = new AngleUtility();
    try{
    temp = angle.getMatchingProfileName(profileName);
    }catch(Exception e)
    {
        System.out.println(e);
    }
    }
    else
    {
        temp=4;
    }
    Gson gson = new Gson();
    gson.toJson(String.valueOf(temp));
    out.print(gson.toJson(String.valueOf(temp)));
    
%>
