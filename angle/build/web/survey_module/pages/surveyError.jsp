<%-- 
    Document   : surveyError
    Created on : 16 Nov, 2016, 3:52:30 PM
    Author     : abinaya
--%>

<%@page import="bean.Content"%>
<%@page import="survey.SurveyUtility"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
    <head>
        <%@ include file="/include/header.jsp" %>
        <title>Survey| Already Filled Survey</title>    
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                font-size: 140%;
                font-weight: normal;
            }
        </style>
    </head>
    <body style="background: #d7e9c1;">
        <div class="container body" style="background-color: #d7e9c1;">
            <div class="main_container" >
                <div class="row">
                    <div class="col-md-12 col-xs-12" style="height:200px;background-image: url(images/bg-1.jpg) ;background-size:cover; background-color: transparent;">  
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2 col-xs-1">               
                    </div>
                    <div class="col-md-8 col-xs-10" style="min-height: 1105px;position: relative;bottom: 50px;">
                        <div class="row" style="">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="color:#3f5265;"><b>Incorrect URL!</b></h2>
                                        <div class="clearfix"></div>
                                    </div>

                                    <div class="x_content">

                                        <% String success_content = "";
                                            ArrayList<Content> contents = null;
                                            Content data = new Content();
                                            SurveyUtility process = new SurveyUtility();
                                            try {
                                                contents = new ArrayList<Content>();
                                                //contents = process.getPage_Content("surveyError");
                                                for (int k = 0; k < contents.size(); k++) {
                                                    data = (bean.Content) contents.get(k);
                                                    success_content = (String) data.getContent();
                                                }
                                            } catch (Exception e) {
                                                success_content = "";
                                            }
                                        %>
                                        <% if (!success_content.trim().equals("")) {%>
                                        <s:set var="content"><%= success_content%></s:set>  
                                            <br/>
                                        <s:property escape="false" value="content"/>
                                        <% } else {%>
                                        <br/>
                                        <p>The url entered is incorrect. </p>        
                                        <% }%>

                                    </div>
                                </div>        
                            </div>    
                        </div> 

                    </div>
                    <div class="col-md-2 ">               
                    </div>
                </div>

            </div>
        </div>     
        <%@ include file="/include/script.jsp" %>   
    </body>
</html>