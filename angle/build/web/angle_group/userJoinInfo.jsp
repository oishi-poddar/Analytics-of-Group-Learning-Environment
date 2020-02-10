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
    String email = request.getParameter("email");
    String nickName = request.getParameter("nickName");
    AngleUtility angleUtility = new AngleUtility();
    System.out.println(angleUtility.insertJoinInfo(email, nickName));
    String res = "sdaf";
    Gson gson = new Gson();
    gson.toJson(res);

    out.print(gson.toJson(res));
%>

