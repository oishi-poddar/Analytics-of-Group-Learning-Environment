<%-- 
    Document   : conferenceLinkShare
    Created on : Jun 16, 2017, 4:21:31 PM
    Author     : rohitkr2997
--%>

<%@page import="utilities.StoreMessageInDb"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    
    String link = request.getParameter("link");
    String conferenceLink = "<a href='verifyConference.html?topic="+link+"' target='_blank'>join conference</a>";
    int groupId=Integer.parseInt(request.getParameter("gid"));
    String res = link + " from ajax " + groupId;
    StoreMessageInDb db = new StoreMessageInDb();
    db.notification(conferenceLink, groupId);
    Gson gson = new Gson();
    gson.toJson(res);

    out.print(gson.toJson(res));
%>