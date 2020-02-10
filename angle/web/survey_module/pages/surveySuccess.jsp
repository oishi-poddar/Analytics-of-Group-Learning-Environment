<%-- 
    Document   : surveySuccess
    Created on : 16 Nov, 2016, 12:02:48 PM
    Author     : abinaya
--%>

<%@page import="bean.Content"%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
    <head>
        <%@ include file="/include/header.jsp" %>
        <title>Survey| Submit Survey</title>
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
                                        <h2 style="color:#3f5265;">
                                            <b>
                                                <s:if test="surveydata.getSuccessTitle() != '' || surveydata.getSuccessTitle().length() > 0">
                                                    <s:property escape="false" value="surveydata.successTitle"/>
                                                </s:if><s:else>
                                                Dear User,
                                                </s:else>
                                            </b>
                                        </h2>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <s:if test="surveydata.getSuccessContent() != '' || surveydata.getSuccessContent().length() > 0">
                                                    <s:property escape="false" value="surveydata.successContent"/>
                                        </s:if>
                                        <s:else>
                                                <p style="font-size: 14px;">Your answers have been recorded.</p>
                                                <p style="font-size: 14px;">Thank you for answering the survey.</p>
                                        </s:else>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>     
            </div>
        </div>    

    </body>
</html>
