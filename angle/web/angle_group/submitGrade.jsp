<%-- 
    Document   : submitGrade
    Created on : 9 Jun, 2017, 11:17:28 AM
    Author     : manushi
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="bean.AssignmentBean"%>
<%@page import="angle_group.AngleUtility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    int resQuery = 0;
    //String res = "";
    String name = request.getParameter("grade");
    int submissionId = Integer.parseInt(request.getParameter("StudentId"));
    int assignmentId = Integer.parseInt(request.getParameter("aid"));
    int Gradedby = Integer.parseInt(request.getParameter("Gradedby"));
    boolean status=false;
    AngleUtility utility = new AngleUtility();
    resQuery = utility.submitGrade(Gradedby,assignmentId, name, submissionId);
    //res = res + resQuery;
    if(resQuery==1)
        status=true;
    else
        status=false;
    
    Gson gson = new Gson();
    gson.toJson(resQuery);
    out.println(gson.toJson(status));
%>



