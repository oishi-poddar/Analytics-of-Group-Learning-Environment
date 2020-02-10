<%-- 
    Document   : getUserDetails
    Created on : 27 Jun, 2017, 5:16:04 PM
    Author     : Chirag
--%>

<%@page import="utilities.Utility"%>
<%@page import="angle_group.JforumUtility"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.JforumData"%>
<%@page import="angle_group.AngleUtility"%>
<%@page import="utilities.StoreMessageInDb"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%

    
    int postId = Integer.parseInt(request.getParameter("postId").toString());

  
    ArrayList<JforumData> tempList = new ArrayList<JforumData>();
    tempList = new JforumUtility().tableList(postId);
    System.out.println(tempList);
    Gson gson = new Gson();
    gson.toJson(tempList);
    out.print(gson.toJson(tempList));

%>