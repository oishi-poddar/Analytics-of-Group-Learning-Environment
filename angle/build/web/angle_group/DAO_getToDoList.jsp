<%-- 
    Document   : DAO_getToDoList
    Created on : 28 Jun, 2017, 2:40:08 AM
    Author     : Apurv
--%>

<%@page import="bean.ToDoList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="angle_group.AngleUtility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try 
    {
        int userId = Integer.parseInt(request.getParameter("userId").toString());
        int groupId = Integer.parseInt(request.getParameter("groupId").toString());
        AngleUtility angle = new AngleUtility();
        ToDoList result = null;
        result = angle.getToDoList(userId,groupId);
        Gson gson = new Gson();
        System.out.println(result);
        out.print(gson.toJson(result));
       
    } catch (Exception c) {
        c.printStackTrace();
    }
%>