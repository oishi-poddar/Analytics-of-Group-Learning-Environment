<%-- 
    Document   : DAO_SavePoll
    Created on : 23 Jun, 2017, 12:17:06 PM
    Author     : kunal
--%>

<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="bean.Person"%>
<%@page import="angle_group.AngleUtility"%>
<%
    try 
    {
        String userId=request.getParameter("uid");
        String groupId=request.getParameter("gid");
        String date= request.getParameter("end_date");
        String question = request.getParameter("question");
        String graph_type=request.getParameter("graph");
        String options=request.getParameter("options");
        String optionsArray[]=options.split("__");
        Date end_date=new Date(date);
        
        AngleUtility utility = new AngleUtility();
        boolean status=utility.createPoll(Integer.parseInt(userId), Integer.parseInt(groupId), question,end_date,Integer.parseInt(graph_type), optionsArray);
        Gson gson = new Gson();
        out.println(gson.toJson(status));
    } catch (Exception c) {
        c.printStackTrace();
    }

%>