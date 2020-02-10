<%-- 
    Document   : DAO_addTopic
    Created on : 26 May, 2017, 10:51:18 AM
    Author     : pratik
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="bean.Topic"%>
<%@page import="angle_group.AngleUtility"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
   AngleUtility utility = new AngleUtility();
    Topic t = new Topic();
    int resQuery = 0;
    String res = "";
    //String workshopid = request.getParameter("workshopid");
    t.setName(request.getParameter("topicName"));
    t.setGroupId(Integer.parseInt(request.getParameter("gid")));
    t.setCreatedById(Integer.parseInt(request.getParameter("uid")));
    resQuery = utility.addTopic(t);

    res = t.getGroupId() + "#" + resQuery;

    Gson gson = new Gson();
    gson.toJson(res);
    out.print(gson.toJson(res));    
%>
