<%-- 
    Document   : DAO_getCopiableGroups
    Created on : 26 Jun, 2017, 5:11:08 PM
    Author     : apurv
--%>

<%@page import="bean.Group"%>
<%@page import="angle_group.AngleUtility"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    try 
    {
        int groupId = Integer.parseInt(request.getParameter("gid"));
        Group  result = null;
        AngleUtility angle = new AngleUtility();
        result = angle.getGroupById(groupId);
        Gson gson = new Gson();
        out.print(gson.toJson(result));
       
    } catch (Exception c) {
        c.printStackTrace();
    }
     
%>
