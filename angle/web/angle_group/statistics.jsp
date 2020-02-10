<%-- 
    Document   : conferenceAnalytics
    Created on : 
    Author     :  Rohit
--%>



<%@page import="angle_group.AngleUtility"%>
<%@page import="utilities.StoreMessageInDb"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    
    AngleUtility angleUtility = new AngleUtility();
 
    String count=angleUtility.countUserGroup();
        
    String res = count;
    
    Gson gson = new Gson();
    gson.toJson(res);

    out.print(gson.toJson(res));
%>

