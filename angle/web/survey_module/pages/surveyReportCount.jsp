<%-- 
    Document   : surveyReportCount
    Created on : 22 Nov, 2016, 10:38:39 AM
    Author     : abinaya
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="/include/header.jsp" %>
        <title>Survey| Home </title>
        <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                font-size: 140%;
                font-weight: normal;
            }
            
            .chart{
                width: 100%; 
                min-height: 400px;
            }
        </style>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="/include/menu.jsp" %>
                <div class="right_col" role="main">
                    <div class="top_tiles">
                        <div class="animated flipInY col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <div class="">
                            <h3><s:property escape="false"  value="sb.survey_index.survey_name" /></h3>
                            </div>
                        </div>
                        <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="tile-stats">
                            <div class="icon"><i class="fa fa-user"></i></div>
                            <div class="count"><s:property value="sb.survey_index.number_of_responses"/></div>
                            <h3>Total Response</h3>
                            <p></p>
                            </div>
                        </div>
                    </div>
                    <%--<div class="row">
                        <div class="col-md-8  col-xs-12">
                            <div class="page-title">
                                <div class="title_left">
                                    <h3><s:property escape="false"  value="sb.survey_index.survey_name" /></h3>
                                    <!--<h4 align="left" >Total number of responses : <s:property value="sb.survey_index.number_of_responses"/></h4>-->

                                </div>    
                            </div>
                        </div>
                        <div class="col-md-4  col-xs-12">
                            <div class="row tile_count">
                                <div class="tile_stats_count">
                                    <span class="count_top"><i class="fa fa-user"></i> Total Responses</span>
                                    <div class="count"><s:property value="sb.survey_index.number_of_responses"/></div>
                                    <!--<span class="count_bottom"><i class="green">4% </i> From last Week</span>-->
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <input type="hidden" name="saving_ans.survey_index.survey_id" value="<s:property value="sb.survey_index.survey_id"/>"/>
                    <input type="hidden" name="saving_ans.survey_index.survey_id_enc" value="<s:property value="sid_enc"/>"/>
                    <input type="hidden" id="no_of_questions" value="<s:property value="sb.all_questions.size"/>"/>
                    <s:iterator value="sb.all_questions" status="itStatus"> 
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="color:#3f5265;"><b>Question <s:property value="%{#itStatus.count}" /></b></h2>
                                        <ul class="nav navbar-right panel_toolbox">
                                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                        </ul>
                                        <%--<s:property escape="false"  value="question_description"/>--%>
                                        <div class="clearfix"></div>
                                    </div>

                                    <div class="x_content">
                                        <s:set var="action_err" value="%{'action_err' + #itStatus.index}"/>
                                        <input type="hidden" id="question_<s:property value="#itStatus.index"/>" value="<s:property value="question_id"/>"/>
                                        <input type="hidden" id="question_type_<s:property value="#itStatus.index"/>" value="<s:property value="question_type.question_type_id"/>"/>
                                        <input type="hidden" id="question_options_<s:property value="#itStatus.index"/>" value="<s:property value="options.size"/>"/>
                                        <input type="hidden" id="question_desc_<s:property value="#itStatus.index"/>" value="<s:property value="question_description"/> "/>
                                        <input type="hidden" id="option_array_<s:property value="#itStatus.index"/>" value="<s:property value="option_array"/>"/>
                                        <input type="hidden" id="graph_type_<s:property value="#itStatus.index"/>" value="<s:property value="graph_type"/>"/>


                                        <label><s:property escape="false"  value="question_description"/></label>

                                        <s:if test="%{question_type.question_type_id == 1 || question_type.question_type_id == 2 || question_type.question_type_id == 7 || question_type.question_type_id == 8}">
                                            <div class="FixedHeightContainer"><div class="Content_FixedHeightContainer">               
                                                    <s:iterator value="ans_text"> <p  style="border-bottom:solid 1px #4993C0;"><br/><s:property /></p></s:iterator></div> 
                                                </div>
                                        </s:if>                
                                        <s:if test="%{question_type.question_type_id == 3 || question_type.question_type_id == 4 || question_type.question_type_id == 5}">
                                            <input type="hidden" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].question_id" value="<s:property value="question_id"/>"/>
                                            <div class="row">
                                                <div class="col-md-9 col-sm-9 col-xs-12">
                                                    <s:if test='%{graph_type == 1}'>
                                                        <div class="chart"  id="piechart_<s:property value="#itStatus.index" />" ></div>
                                                    </s:if>
                                                    <s:if test='%{graph_type == 0}'>
                                                        <div class="chart"  id="columnchart_material_<s:property value="#itStatus.index" />"></div>
                                                    </s:if>
                                                </div>
                                                <div class="col-md-3 col-sm-3 col-xs-12">
                                                    <s:iterator value="options" status="optionStatus">
                                                        <div class="row">
                                                            <div class="col-md-8 col-sm-6 col-xs-6">
                                                                Count of '<s:property value="option"/>'
                                                            </div>
                                                            <div class="col-md-4 col-sm-6 col-xs-6">
                                                                <s:property value="count_of_option"/>
                                                            </div>
                                                        </div>
                                                    </s:iterator>
                                                </div>
                                            </div>
                                           <%-- <table  class="table" style="position: relative;align:center;width:100%;border: 1px solid #ccc;">
                                                <tr>
                                                    <s:if test='%{graph_type == 1}'>
                                                        <td style="width:75%;"><div id="piechart_<s:property value="#itStatus.index" />" ></div></td>
                                                        </s:if>
                                                        <s:if test='%{graph_type == 0}'>
                                                        <td style="width:75%;"><div id="columnchart_material_<s:property value="#itStatus.index" />"></div></td>
                                                        </s:if>
                                                    <td style="width: 25%;">
                                                        <div>
                                                            <table>
                                                                <s:iterator value="options" status="optionStatus">
                                                                    <tr><td style="">Count of  &nbsp;<b style="color:#036;">'<s:property value="option"/>'&nbsp;&nbsp; :</b></td><td >  &nbsp;&nbsp;  <b><s:property value="count_of_option"/></b></td></tr>
                                                                </s:iterator>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>--%>
                                                
                                        </s:if>
                                        <s:if test="%{question_type.question_type_id == 6}">
                                            <div class="" id="columnchart_material_<s:property value="#itStatus.index" />" style="border: 1px solid #ccc; height : 450px;"></div>
                                        </s:if>
                                        <input type="hidden" id="required_<s:property value="#itStatus.index" />" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].required" value="<s:property value="required"/>"/>        
                                        <label id="error_<s:property value="#itStatus.index" />" style="color:red;"></label>
                                        <label class="errorLabel"><s:property value="fieldErrors.get('#action_err').get(0)"/></label>
                                        <br/> <br/> 


                                    </div>
                                </div>
                            </div>
                        </div>
                    </s:iterator>
                </div>
                <%@ include file="/include/footer.jsp" %>
            </div>
        </div>     
        <%@ include file="/include/script.jsp" %>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script>

            // Load Charts and the corechart and barchart packages.
            google.charts.load('current', {'packages': ['corechart']});

            // Draw the pie chart and bar chart when Charts is loaded.
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

                var no_of_questions = document.getElementById("no_of_questions").value;
                for (i = 0; i < no_of_questions; i++)
                {
                    var question_type = document.getElementById("question_type_" + i).value;
                    if (question_type == 3 || question_type == 4 || question_type == 5) {
                        var op_arr = document.getElementById("option_array_" + i).value.trim();
                        op_arr = op_arr.replace(/'/g, '"');
                        op_arr = op_arr.slice(0, -1);
                        
                        var ac = op_arr.split(",");
                        
                        for (var l = 0; l < ac.length; l++) {
                            ac[l] = ac[l].replace("[", "");
                            ac[l] = ac[l].replace("]", "");
                            //alert(ac[l]);
                        }

                        //alert(ac);

                        var data = new google.visualization.DataTable();
                        data.addColumn('string', 'Options');
                        data.addColumn('number', 'Number of responses');
                        data.addColumn({
                            type: 'string',
                            role: 'style'
                        });


                        for (var l = 0; l < ac.length; l++) {
                            data.addRow([ac[l], parseInt(ac[l + 1]), getRandomColor()]);
                            l++;

                        }
                        var options = {
                            title: document.getElementById("question_desc_" + i).value
                        };

                        var graph_type = document.getElementById("graph_type_" + i).value;

                        if (graph_type == 1) {
                            var piechart_options = {title: "",
                                height: 400
                            };
                            var piechart = new google.visualization.PieChart(document.getElementById('piechart_' + i));
                            piechart.draw(data, piechart_options);
                        }
                        if (graph_type == 0) {
                            var barchart_options = {title: "", height: 400,
                                legend: 'none'};
                            var barchart = new google.visualization.ColumnChart(document.getElementById('columnchart_material_' + i));
                            barchart.draw(data, barchart_options);
                        }
                    }
                    if (question_type == 6) {

                        var op_arr = document.getElementById("option_array_" + i).value.trim();
                        //alert(op_arr);
                        var element_arr = op_arr.split(";");

                        var column_data = element_arr[0].split(",");


                        var data = new google.visualization.DataTable();
                        data.addColumn('string', column_data[0]);
                        for (var z = 1; z < column_data.length; z++) {
                            data.addColumn('number', column_data[z]);
                        }




                        for (var y = 1; y < (element_arr.length - 1); y++) {
                            var column_data = element_arr[y].split(",");
                            for (var l = 1; l < column_data.length; l++) {
                                column_data[l] = parseInt(column_data[l]);
                            }
                            //alert("column data : "+column_data);     
                            data.addRow(column_data);
                        }


                        var options = {

                        };
                        var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_material_' + i));

                        chart.draw(data, options);


                    }
                }
            }
            
            $(window).resize(function(){
                drawChart()
            });

            function getCustomColor(i) {
                //alert(i);
                if (i == 0) {
                    return "#ff5733";
                }
                if (i == 2) {
                    return "#0f5607";
                }
                if (i == 4) {
                    return "#e42a8a";
                }
                if (i == 6) {
                    return "#217db8";
                }
                if (i == 8) {
                    return "#092d74";
                }
                if (i == 10) {
                    return "#573c90";
                }
                if (i == 12) {
                    return "#b98dd3";
                }
                if (i == 14) {
                    return "#790e80";
                }
                if (i == 16) {
                    return "#d27dd7";
                }
                if (i == 18) {
                    return "#21b86a";
                }
            }

            function getRandomColor() {
                var letters = '0123456789ABCDEF';
                var color = '#';
                for (var i = 0; i < 6; i++) {
                    color += letters[Math.floor(Math.random() * 16)];
                }
                color = LightenDarkenColor(color, -50);
                return color;
            }

            function LightenDarkenColor(col, amt) {
                var usePound = false;
                if (col[0] == "#") {
                    col = col.slice(1);
                    usePound = true;
                }
                var num = parseInt(col, 16);
                var r = (num >> 16) + amt;
                if (r > 255)
                    r = 255;
                else if (r < 0)
                    r = 0;
                var b = ((num >> 8) & 0x00FF) + amt;
                if (b > 255)
                    b = 255;
                else if (b < 0)
                    b = 0;
                var g = (num & 0x0000FF) + amt;
                if (g > 255)
                    g = 255;
                else if (g < 0)
                    g = 0;
                return (usePound ? "#" : "") + (g | (b << 8) | (r << 16)).toString(16);
            }

        </script>
    </body>
</html>





