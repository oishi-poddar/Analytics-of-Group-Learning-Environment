<%-- 
    Document   : DAO_updateTopicName
    Created on : 26 May, 2017, 2:52:04 PM
    Author     : oishi
--%>

<%@page import="bean.Notes"%>
<%@page import="angle_group.NotesUtility"%>

<%@page import="nl.bitwalker.useragentutils.Browser"%>
<%@page import="nl.bitwalker.useragentutils.OperatingSystem"%>
<%@page import="nl.bitwalker.useragentutils.UserAgent"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page import="com.google.gson.Gson"%>


<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    NotesUtility utility = new NotesUtility();
    int resQuery = 0;
    String res = "";
    Notes n=new Notes();
    n.setMyFileFileName(request.getParameter("files"));
    n.setReferenceLink(request.getParameter("referenceLink"));
    n.setGroupId(Integer.parseInt((request.getParameter("groupId"))));
    n.setCreatedById(Integer.parseInt((request.getParameter("createdById"))));
    n.setNote(request.getParameter("note"));
    
    resQuery = utility.insertNote(n);

    res = res + resQuery;

    Gson gson = new Gson();
    gson.toJson(res);
    out.print(gson.toJson(res));
%>