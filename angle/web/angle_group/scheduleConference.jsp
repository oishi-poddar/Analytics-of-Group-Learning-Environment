<%-- 
    Document   : 
    Created on : 
    Author     : Rohit
--%>



<%@page import="utilities.StoreMessageInDb"%>


<%@page import="angle_group.AngleUtility"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
                String topic = request.getParameter("topic");
                String startDate  = request.getParameter("startdate");
                String endDate = request.getParameter("enddate");
                int groupId = Integer.parseInt(request.getParameter("groupId").toString());
                String feature = request.getParameter("feature");
                int userId = Integer.parseInt(request.getParameter("userId").toString());
              
                new StoreMessageInDb().toDoList(topic, groupId, userId, startDate, endDate, feature);
                    String res="saf";
    Gson gson = new Gson();
    gson.toJson(res);

    out.print(gson.toJson(res));
%>


     
