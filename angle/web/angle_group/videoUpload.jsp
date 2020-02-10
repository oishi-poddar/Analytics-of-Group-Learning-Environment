<%-- 
    Document   : verifyConferenceAction
    Created on : Jun 6, 2017, 10:59:01 AM
    Author     : rohit and apurv
--%>


<%@page import="utilities.StoreMessageInDb"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    String message = request.getParameter("message");
    String nick = request.getParameter("nick");
    String jid = request.getParameter("from");
    String topic = request.getParameter("topic");
    String starttime = request.getParameter("starttime");
    String email = request.getParameter("email");
    int groupId = Integer.parseInt(request.getParameter("groupId"));
    String res = message + " " + nick + " " + jid + " from ajax ";
    StoreMessageInDb db = new StoreMessageInDb();
    Gson gson = new Gson();
    gson.toJson(res);

    out.print(gson.toJson(res));
%>

