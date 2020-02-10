<%-- 
    Document   : DAOGenerateLinksForTesting
    Created on : 18 Nov, 2016, 11:21:51 AM
    Author     : abinaya
--%>

<%@page import="bean.Person"%>
<%@page import="survey.SurveyUtility"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    SurveyUtility utility = new SurveyUtility();
    String survey_id = request.getParameter("surveyid");
    String url = request.getParameter("url") + "displaySQ.html?sid=";
    String res = "";
    ArrayList<Person> per_list=null;
    try{
        per_list=utility.getEmailList();
        for(int i=0; i < per_list.size(); i++){
            res = res + (utility.generateLinksForTestingSurvey(survey_id, url,per_list.get(i).getEmail()));
        }
    }catch(Exception e){}
    Gson gson = new Gson();
    gson.toJson(res);
    out.print(gson.toJson(res));
%>