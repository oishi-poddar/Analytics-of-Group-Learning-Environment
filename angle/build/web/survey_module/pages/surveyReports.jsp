<%-- 
    Document   : surveyReports
    Created on : 28 Nov, 2016, 10:53:06 AM
    Author     : dipesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="/include/header.jsp" %>
        <title>Survey| Survey Reports </title>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="/include/menu.jsp" %>
                <div class="right_col" role="main">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Survey Reports</h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="survey_id">Select Survey :<span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select id="surveyid" name="surveyid" class="form-control col-md-7 col-xs-12" onchange="showSurveyReports(this.value);">
                                            <option value="-1">--Select your survey--</option>
                                            <s:iterator value="surveylist" var="surveylist">
                                                <s:if test="#surveylist.enc_survey_id == encSurveyId">
                                                    <option selected value="<s:property value="enc_survey_id"/>"><s:property value="survey_id"/> : <s:property value="survey_name"/></option>   
                                                </s:if><s:else>
                                                    <option value="<s:property value="enc_survey_id"/>"><s:property value="survey_id"/> : <s:property value="survey_name"/></option>
                                                </s:else>
                                            </s:iterator>
                                        </select>
                                    </div>
                                    <div id="surveyIdError" class="errorMsgalert" style="display: none;">
                                        please enter valid survey id
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> 

                    <s:if test="surveyId > 0">
                        <div class="x_panel">
                            <div class="x_content">

                                <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                    click here to get Report in Excel <a class="" id="btnExport"><i class="fa fa-file-excel-o fa-3x" aria-hidden="true"></i></a>
                                    <input id="survey_id" type="hidden" value="<s:property value="surveyId"/>">
                                </div>

                                <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                    Click here to view reports in graphical representation : <button type="button" id="survey_report" name="survey_report" class="btn btn-danger" onclick="survey_report();">Survey Report</button>
                                </div>
                            </div>
                        </div>
                        <div id="report_table" style="display: none;">
                            <table id="all_export" >
                                <tr>
                                    <% int count = 1;%><s:iterator value="surveyreports.all_questions" var="surveyreports.all_questions"><% count++;%></s:iterator>
                                    <th style="background-color: #EEEEEE;text-align: center;border-right: 1px solid black;border-top: 1px solid black;" colspan="<%= count%>"><center><s:property value="surveyreports.getSurvey_index().getSurvey_name()"/></center></th>
                                </tr>
                                <tr>
                                    
                                    <s:iterator value="surveyreports.all_questions" var="surveyreports.all_questions">
                                        <s:if test="%{question_type.question_type_id == 6}"> 
                                            <td style="background-color: #EEEEEE;" colspan="<s:property value="row_values.size"/>"><b><s:property value="question_description"/></b>
                                            </td>
                                        </s:if>
                                        <s:else>
                                            <td style="background-color: #EEEEEE;"><b><s:property value="question_description"/></b>
                                            </td>
                                        </s:else>
                                    </s:iterator>
                                </tr>

                                <tr>  
                                    <s:iterator value="surveyreports.all_questions" var="surveyreports.all_questions">
                                        <s:iterator value="row_values" >
                                            <td><strong><s:property value="option"/></strong></td>
                                        </s:iterator>
                                    </s:iterator>
                                </tr>                                    


                                <s:iterator value="surveyreports.rb" var="surveyreports.rb">
                                    <tr>
                                        <s:iterator value="getOption()" var="getOption()">
                                            <td><s:property></s:property></td>
                                        </s:iterator>
                                    </tr>
                                </s:iterator>

                            </table>
                        </div>        
                    </s:if>
                    <s:else></s:else>
                    </div>
                <%@ include file="/include/footer.jsp" %>
            </div>
        </div>     
        <%@ include file="/include/script.jsp" %>
        <script>
            function showSurveyReports(id){
            window.location.href = "surveyReports.html?sid=" + id;
            }

            function survey_report(){
            var enc_surveyId = document.getElementById("surveyid").value;
            window.open('surveyReportCount.html?sid=' + enc_surveyId, '_blank');
            }
        </script>
        <script type="text/javascript">
            $("#btnExport").click(function (e) {
            var survey_id = document.getElementById("survey_id").value;
            var fileName = 'SurveyReport_' + survey_id;
            var blobURL = tableToExcel('all_export', 'test_table');
            $(this).attr('download', fileName + '.xls');
            $(this).attr('href', blobURL);
            });
        </script>
        <script>
                    var tableToExcel = (function() {     var uri = 'data:application/vnd.ms-excel;base64;filename=exportData.xlsx,'
                            , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
                            , base64 = function(s) {
                            return window.btoa(unescape(encodeURIComponent(s)))
                            }
                    , format = function(s, c) {
        return s.replace(/{(\w+)}/g, function(m, p) {
        return c[p];
        })
        }
return function(table, name) {
        if (!table.nodeType)
            table = document.getElementById(table)
        var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
        ctx.readonly="true";
        var blob = new Blob([format(template, ctx)]);
        var blobURL = window.URL.createObjectURL(blob);
        return blobURL;
        // window.location.href = uri + base64(format(template, ctx))
    }
})()
        </script>
    </body>
</html>
