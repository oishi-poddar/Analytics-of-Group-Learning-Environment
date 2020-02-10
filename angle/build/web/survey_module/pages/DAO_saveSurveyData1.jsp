<%-- 
    Document   : DAO_saveSurveyData1.jsp
    Created on : 22 Dec, 2016, 10:34:34 AM
    Author     : abinaya
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="survey.SurveyUtility"%>

<%
    SurveyUtility utility = new SurveyUtility();
    String result = "", stitle, spurpose, optionarr = "", surveyid, start_date, end_date,success_title,error_title,success_msg,error_msg;
    int sresult = 0, sresQid = 0, editRes = 0;
    String res = "";
    surveyid = request.getParameter("surveyid");
    stitle = request.getParameter("stitle");
    spurpose = request.getParameter("spurpose");
    start_date = request.getParameter("start_date");
    end_date = request.getParameter("end_date");
    success_title = request.getParameter("success_title");
    error_title = request.getParameter("error_title");
    success_msg = request.getParameter("successMsg");
    error_msg = request.getParameter("errorMsg");
   
    int res1 = utility.updateSurveyDetails1(Integer.parseInt(surveyid), stitle, spurpose, start_date, end_date,success_title,error_title,success_msg,error_msg);

    result = Integer.toString(res1);
    Gson gson = new Gson();
    gson.toJson(result);
    out.print(gson.toJson(result));
%>