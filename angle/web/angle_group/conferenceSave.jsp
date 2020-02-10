<%-- 
    Document   : conferenceAnalytics
    Created on : 2 Jun, 2017, 3:19:05 AM
    Author     : apurv and Rohit
--%>
<%-- 
    Document   : conferenceAnalytics
    Created on : 2 Jun, 2017, 3:19:05 AM
    Author     : apurv
--%>

<%@page import="utilities.StoreMessageInDb"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    String start = request.getParameter("start");
    String stop = request.getParameter("stop");
    String topic = request.getParameter("topic");
    String email = request.getParameter("email");
    int groupId  = Integer.parseInt(request.getParameter("groupId").toString());
    int noOfParticipants = Integer.parseInt(request.getParameter("noOfParticipants").toString());
   
    String res = start + " " + stop + " " + topic + " from ajax ";
    StoreMessageInDb db = new StoreMessageInDb();
    db.insertConference(start, stop, topic, noOfParticipants, email, groupId);
    Gson gson = new Gson();
    gson.toJson(res);
    out.print(gson.toJson(res));
%>

