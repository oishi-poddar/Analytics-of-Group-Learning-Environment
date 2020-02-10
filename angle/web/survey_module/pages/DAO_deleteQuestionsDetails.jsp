<%-- 
    Document   : DAO_deleteQuestionsDetails
    Created on : 15 Nov, 2016, 11:21:00 AM
    Author     : dipesh
--%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="survey.SurveyUtility"%>

<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    SurveyUtility utility = new SurveyUtility();
    String qid,surveyid,questype,dyid;
    int sresQid=0,sresult=0;
    String res="";
    //String workshopid = request.getParameter("workshopid");
    
     qid = request.getParameter("qid");
     dyid = request.getParameter("dyid");
     questype = request.getParameter("questype");
     surveyid = request.getParameter("surveyid");
     
    
     
    // sresult= utility.insertSurveyDetails(Integer.parseInt( surveyid));
     
     //if(Integer.parseInt(questype) == 3 || Integer.parseInt(questype) == 4){
       sresQid=  utility.deleteSurveyQuestionsDetails(Integer.parseInt(qid), Integer.parseInt(surveyid), Integer.parseInt(questype));
     /*}else{
      sresQid=utility.insertSurveyQuestionsDetails(Integer.parseInt(surveyid),Integer.parseInt(qid), question,Integer.parseInt(questype),Integer.parseInt(seqid));
     }*/
     
     res=dyid+"#"+sresQid;
    /*String wsc_email = utility.WSC_email(workshopid, rcid);
    String if_can_be_nominated = process.checkIfCanBeNominatedAsWSC(email, workshopid, rcid);
    if (if_can_be_nominated.equals("")) {
        if_can_be_nominated = "1";
    }
    ArrayList<String> data = new ArrayList<String>();
    data.add(if_can_be_nominated);
    data.add(email);*/
    Gson gson = new Gson();
    gson.toJson(res);
    out.print(gson.toJson(res));
%>
