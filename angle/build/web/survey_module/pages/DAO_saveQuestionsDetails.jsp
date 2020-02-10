<%-- 
    Document   : DAOCheckIfCanBeWSC
    Created on : 28 Oct, 2015, 4:28:48 PM
    Author     : dipesh
--%>


<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="survey.SurveyUtility"%>

<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    SurveyUtility utility = new SurveyUtility();
    String result = "saved", stitle, spurpose, optionarr = "",optionarr2 = "";
    String question, qid, surveyid, seqid, questype, reqFlag, typeOfoption, typeOfGraph, lowerLimit, upperLimit, step_size, end_date, start_date;
    int sresult = 0, sresQid = 0;
    String res = "";
    //String workshopid = request.getParameter("workshopid");
    question = request.getParameter("question");
    qid = request.getParameter("qid");
    surveyid = request.getParameter("surveyid");
    seqid = request.getParameter("seqid");
    questype = request.getParameter("questype");
    stitle = request.getParameter("stitle");
    spurpose = request.getParameter("spurpose");
    optionarr = request.getParameter("optionarr");
    reqFlag = request.getParameter("reqflag");
    start_date = request.getParameter("start_date");
    end_date = request.getParameter("end_date");
    //System.out.println(optionarr);
    System.out.println(start_date + end_date);
    sresult = utility.insertSurveyDetails(Integer.parseInt(surveyid), stitle, spurpose, start_date, end_date);

    if (Integer.parseInt(questype) == 3 || Integer.parseInt(questype) == 4) {
        typeOfoption = request.getParameter("typeofoption");
        typeOfGraph = request.getParameter("typeOfGraph");
        sresQid = utility.insertSurveyQuestionsTypeDetails(Integer.parseInt(surveyid), Integer.parseInt(qid), question, Integer.parseInt(questype), Integer.parseInt(seqid), optionarr, Integer.parseInt(reqFlag), Integer.parseInt(typeOfoption), Integer.parseInt(typeOfGraph));
    } else if (Integer.parseInt(questype) == 5) {
        typeOfoption = request.getParameter("typeofoption");
        typeOfGraph = request.getParameter("typeOfGraph");
        lowerLimit = request.getParameter("lowerLimit");
        upperLimit = request.getParameter("upperLimit");
        step_size = request.getParameter("step_size");
        sresQid = utility.insertSurveyQuestionsTypeDetails1(Integer.parseInt(surveyid), Integer.parseInt(qid), question, Integer.parseInt(questype), Integer.parseInt(seqid), Integer.parseInt(reqFlag), Integer.parseInt(typeOfoption), Integer.parseInt(typeOfGraph), Integer.parseInt(lowerLimit), Integer.parseInt(upperLimit), Integer.parseInt(step_size));

    }else if(Integer.parseInt(questype) == 6){
        optionarr2 = request.getParameter("optionarr2");
        typeOfoption = request.getParameter("typeofoption");
        typeOfGraph = request.getParameter("typeOfGraph");
        sresQid = utility.insertSurveyQuestionsTypeMultipleGrid(Integer.parseInt(surveyid), Integer.parseInt(qid), question, Integer.parseInt(questype), Integer.parseInt(seqid), optionarr, Integer.parseInt(reqFlag), Integer.parseInt(typeOfoption), Integer.parseInt(typeOfGraph),optionarr2);
    }
    else {
        sresQid = utility.insertSurveyQuestionsDetails(Integer.parseInt(surveyid), Integer.parseInt(qid), question, Integer.parseInt(questype), Integer.parseInt(seqid), Integer.parseInt(reqFlag));
    }

    res = qid + "#" + sresQid;
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