<%-- 
    Document   : generateSurveyLinkForTesting
    Created on : 18 Nov, 2016, 10:56:09 AM
    Author     : abinaya
--%>

<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    HttpServletRequest req = ServletActionContext.getRequest();
    String url = (req.getRequestURL()).toString();
    String parts[] = url.split("template");
    System.out.println((parts[0]));

%>

<html>
    <head>
        <%@ include file="/include/header.jsp" %>
        <title>Survey| Generate Survey link</title>
        <style>
            .alink{
                text-decoration: underline;
            }
        </style>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="/include/menu.jsp" %>
                <div class="right_col" role="main">
                    <s:if test="hasActionErrors()">
                        <div class="msg msg-error">
                            <s:actionerror/>
                            <a href="javascript:void(0);" class="close">close</a>
                        </div>
                    </s:if>

                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Generate Survey Link (preview)</h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="survey_id">Enter the survey id :<span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="survey_id"  class="form-control col-md-7 col-xs-12" value="">
                                    </div>
                                    <div id="surveyIdError" class="errorMsgalert" style="display: none;">
                                                please enter valid survey id
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-9 col-sm-9 col-xs-12">
                                        NOTE : Enter only valid survey id - this doesn't have validations to check if survey exists.
                                    </label>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                        <button type="button"  class="btn btn-success" onclick="callfn();">Submit</button>
                                    </div>
                                </div>
                                <div id="link_div" class="form-group">

                                </div>
                            </div>
                        </div>
                            
                    </div>

                </div>
                <%@ include file="/include/footer.jsp" %>
            </div>
        </div>
        <%@ include file="/include/script.jsp" %>
        <script>
            var isnumber = /^0|[1-9]\d*$/;
    
            function isNumber(num) {
                var result = false;
                var regexp = /^[7-9][0-9]*$/;
                if (num.match(regexp)) {
                    result = true;
                }
                return result;
            }
            function callfn(){
                var sid= document.getElementById("survey_id").value; 
                document.getElementById("survey_id").style.border="";
                document.getElementById("surveyIdError").style.display="none";
                if (!sid.match(isnumber)) {
                    document.getElementById("survey_id").style.border="1px solid #CE5454";
                    document.getElementById("surveyIdError").style.display="inline";
                    //alert("Enter a valid survey id");
                    return false;
                }else{
                    //alert("here ..");
                    genlinks(sid);
                }                 
            }
    
            function genlinks(sid){
                var data = "surveyid="+sid+"&url=<%=parts[0]%>";  
                //alert("data : "+ data);
                $.ajax({
                    url: "survey_module/pages/DAOGenerateLinksForTesting.jsp",
                    type: "GET",
                    data: data,
                    dataType: "json",
                    success: setGenerateLinksForTesting,
                    error: onError
                });  
            }
            function setGenerateLinksForTesting(data) {        
                if(data != "" || data != null){
           
                    document.getElementById("link_div").innerHTML="";
                    document.getElementById("link_div").innerHTML=data;            
                }else{
                    alert("error - enter valid survey id");
                }
            }
            function onError(){
                alert("error .. ");
            }
        </script>
    </body>
</html>




