<%-- 
    Document   : DAO_editQuestionsDetails
    Created on : 15 Nov, 2016, 12:46:48 PM
    Author     : dipesh
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="survey.SurveyUtility"%>

<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    SurveyUtility utility = new SurveyUtility();
    String result = "saved", stitle, spurpose, optionarr = "",optionarr2 = "";
    String question, qid, surveyid, seqid, questype, hidden_qid, reqFlag, typeOfoption, typeOfGraph, lowerLimit, upperLimit, step_size, start_date, end_date;
    int sresult = 0, sresQid = 0, editRes = 0;
    String res = "";
    question = request.getParameter("question");
    qid = request.getParameter("qid");
    surveyid = request.getParameter("surveyid");
    seqid = request.getParameter("seqid");
    questype = request.getParameter("questype");
    stitle = request.getParameter("stitle");
    spurpose = request.getParameter("spurpose");
    optionarr = request.getParameter("optionarr");
    hidden_qid = request.getParameter("hquesid");
    reqFlag = request.getParameter("reqflag");
    start_date = request.getParameter("start_date");
    end_date = request.getParameter("end_date");


    sresult = utility.updateSurveyDetails(Integer.parseInt(surveyid), stitle, spurpose, start_date, end_date);

    if (Integer.parseInt(questype) == 3 || Integer.parseInt(questype) == 4) {
        typeOfoption = request.getParameter("typeofoption");
        typeOfGraph = request.getParameter("typeOfGraph");
        editRes = utility.updateSurveyQuestionsTypeDetails(Integer.parseInt(surveyid), Integer.parseInt(qid), question, Integer.parseInt(questype), Integer.parseInt(seqid), optionarr, Integer.parseInt(hidden_qid), Integer.parseInt(reqFlag), Integer.parseInt(typeOfoption), Integer.parseInt(typeOfGraph));
    } else if (Integer.parseInt(questype) == 5) {
        typeOfoption = request.getParameter("typeofoption");
        typeOfGraph = request.getParameter("typeOfGraph");
        lowerLimit = request.getParameter("lowerLimit");
        upperLimit = request.getParameter("upperLimit");
        step_size = request.getParameter("step_size");
        editRes = utility.updateSurveyQuestionsTypeDetails1(Integer.parseInt(surveyid), Integer.parseInt(qid), question, Integer.parseInt(questype), Integer.parseInt(seqid), Integer.parseInt(hidden_qid), Integer.parseInt(reqFlag), Integer.parseInt(typeOfoption), Integer.parseInt(typeOfGraph), Integer.parseInt(lowerLimit), Integer.parseInt(upperLimit), Integer.parseInt(step_size));

    } else if(Integer.parseInt(questype) == 6){
        optionarr2 = request.getParameter("optionarr2");
        typeOfoption = request.getParameter("typeofoption");
        typeOfGraph = request.getParameter("typeOfGraph");
        editRes = utility.updateSurveyQuestionsTypeMultipleGrid(Integer.parseInt(surveyid), Integer.parseInt(qid), question, Integer.parseInt(questype), Integer.parseInt(seqid), optionarr,Integer.parseInt(hidden_qid), Integer.parseInt(reqFlag), Integer.parseInt(typeOfoption), Integer.parseInt(typeOfGraph),optionarr2);
    }
    else {
        editRes = utility.updateSurveyQuestionsDetails(Integer.parseInt(surveyid), Integer.parseInt(qid), question, Integer.parseInt(questype), Integer.parseInt(seqid), Integer.parseInt(hidden_qid), Integer.parseInt(reqFlag));
    }

    res = qid + "#" + hidden_qid + "#" + editRes;
    Gson gson = new Gson();
    gson.toJson(res);
    out.print(gson.toJson(res));
%>
