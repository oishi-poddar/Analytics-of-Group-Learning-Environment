<%-- 
    Document   : alreadyFilledSurvey
    Created on : 16 Nov, 2016, 3:46:00 PM
    Author     : abinaya
--%>

<%@page import="survey.SurveyUtility"%>
<%@page import="bean.Content"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                <div class="col-md-12 col-xs-12" style="height:200px;background-image: url(images/bg-1.jpg) ;background-size:cover;">  
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
                                    <h2 style="color:#3f5265;">
                                        <b>
                                            <s:if test="surveydata.getErrorTitle() != '' || surveydata.getErrorTitle().length() > 0">
                                                    <s:property escape="false" value="surveydata.errorTitle"/>
                                            </s:if><s:else>
                                            Already Filled Survey!
                                            </s:else>
                                        </b>
                                    </h2>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="x_content">
                                       <s:if test="surveydata.getErrorContent() != '' || surveydata.getErrorContent().length() > 0">
                                                    <s:property escape="false" value="surveydata.errorContent"/>
                                        </s:if>
                                        <s:else>
                                                <p>Dear User,</p>
                                                <p>You have already filled this survey</p>
                                        </s:else>

                                    

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