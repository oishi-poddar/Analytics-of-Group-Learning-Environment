<%-- 
    Document   : displayQuestions
    Created on : 10 Nov, 2016, 3:32:18 PM
    Author     : abinaya
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="/include/header.jsp" %>
        <title>Survey| Questions Preview</title>

        <!-- iCheck -->
        <link href="asset/iCheck/skins/flat/green.css" rel="stylesheet">
        <!-- Switchery -->
        <link href="asset/switchery/dist/switchery.min.css" rel="stylesheet">
        <link href="ion.rangeSlider/css/ion.rangeSlider.css" rel="stylesheet">
        <link href="ion.rangeSlider/css/ion.rangeSlider.skinModern.css" rel="stylesheet">
        <link href="css/daterangepicker.css" rel="stylesheet">
        <link href="asset/bootstrap_timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                font-size: 140%;
                font-weight: normal;
            }

            .img_resp{
                background: url(images/bg-1.jpg) no-repeat center center fixed; 
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
                background-color: transparent; 
                height:200px;
            }
        </style>
    </head>
    <body class="" style="background: #d7e9c1;">
        <div class="container body" style="background-color: #d7e9c1;">
            <div class="main_container" >
                <div class="row">
                    <div class="col-md-12 col-xs-12 " style="height:200px;background-image: url(images/bg-1.jpg); background-size:cover;  background-color: transparent;">  
                    </div>
                    <%--<div class="col-md-12 col-xs-12 img_resp"></div>--%>
                </div>
                <div class="row">
                    <div class="col-md-2 col-sm-1">               
                    </div>
                    <div class="col-md-8 col-sm-10 " style="min-height: 1105px;position: relative;bottom: 50px;">
                        <div class="row" style="">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2 style="color:#3f5265;"><b><s:property escape="false"  value="sb.survey_index.survey_name" /></b></h2>
                                        <div class="clearfix"></div>
                                    </div>

                                    <div class="x_content">

                                        <!-- start form for validation -->
                                        <form id="demo-form" onsubmit="return spreview();">

                                            <input type="hidden" name="saving_ans.personid" value="<s:property value="personid"/>"/>
                                            <input type="hidden" name="saving_ans.survey_index.survey_id" value="<s:property value="sb.survey_index.survey_id"/>"/>
                                            <input type="hidden" name="saving_ans.survey_index.survey_id_enc" value="<s:property value="sid_enc"/>"/>
                                            <input type="hidden" name="saving_ans.pid_enc" value="<s:property value="pid_enc"/>"/>

                                            <input type="hidden" id="no_of_questions" value="<s:property value="sb.all_questions.size"/>"/>


                                            <s:iterator value="sb.all_questions" status="itStatus">    
                                                <s:set var="action_err" value="%{'action_err' + #itStatus.index}"/>
                                                <input type="hidden" id="question_<s:property value="#itStatus.index"/>" value="<s:property value="question_id"/>"/>
                                                <input type="hidden" id="question_type_<s:property value="#itStatus.index"/>" value="<s:property value="question_type.question_type_id"/>"/>
                                                <input type="hidden" id="question_options_<s:property value="#itStatus.index"/>" value="<s:property value="options.size"/>"/>

                                                <input type="hidden" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].question_type.question_type_id" value="<s:property value="question_type.question_type_id"/>"/>
                                                <br/>
                                                <label >  <s:property escape="false" value="question_description"/> <s:if test="%{required == 1}">*</s:if> </label>
                                                    <br/>
                                                <s:if test="%{question_type.question_type_id == 1}">
                                                    <input type="text"  class="form-control" id="ans_<s:property value="#itStatus.index"/>" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].answers" value=""/>
                                                    <input type="hidden" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].question_id" value="<s:property value="question_id"/>"/>
                                                </s:if>

                                                <s:if test="%{question_type.question_type_id == 2}">
                                                    <input type="hidden" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].question_id" value="<s:property value="question_id"/>"/>
                                                    <textarea  class="form-control" id="ans_<s:property value="#itStatus.index"/>" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].answers" value="" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                                                               data-parsley-validation-threshold="10"></textarea>
                                                </s:if>

                                                <s:if test="%{question_type.question_type_id == 3}">
                                                    <input type="hidden" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].question_id" value="<s:property value="question_id"/>"/>

                                                    <s:if test="%{alignment_type == 1}">
                                                        <s:iterator value="options" status="optionStatus">

                                                            <p style="line-height:200%;"> <input id="<s:property value="#itStatus.index"/>_<s:property value="#optionStatus.index"/>" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].answers" value="<s:property value="value_of_option"/>" type="radio" class="flat" />  <s:property value="option"/> <br/></p>
                                                            </s:iterator>
                                                        </s:if>
                                                        <s:else>
                                                            <s:iterator value="options" status="optionStatus">
                                                            <input id="<s:property value="#itStatus.index"/>_<s:property value="#optionStatus.index"/>" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].answers" value="<s:property value="value_of_option"/>" type="radio" class="flat" />  <s:property value="option"/> &nbsp; &nbsp; 

                                                        </s:iterator>
                                                    </s:else><br/>
                                                </s:if>
                                                <s:if test="%{question_type.question_type_id == 4}">
                                                    <input type="hidden" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].question_id" value="<s:property value="question_id"/>"/>
                                                    <s:if test="%{alignment_type == 1}">
                                                        <p style="line-height:200%;">
                                                            <s:iterator value="options" status="optionStatus1">
                                                                <input type="checkbox" class="flat" id="<s:property value="#itStatus.index"/>_<s:property value="#optionStatus1.index"/>" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].answers"  value="<s:property value="value_of_option"/>" /> <s:property value="option"/>
                                                                <br/>
                                                            </s:iterator>
                                                        </p>
                                                    </s:if>
                                                    <s:else>
                                                        <s:iterator value="options" status="optionStatus1">
                                                            <input type="checkbox" class="flat" id="<s:property value="#itStatus.index"/>_<s:property value="#optionStatus1.index"/>" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].answers"  value="<s:property value="value_of_option"/>" /> <s:property value="option"/>&nbsp; &nbsp; 
                                                        </s:iterator>
                                                    </s:else><br/>
                                                </s:if>

                                                <s:if test="%{question_type.question_type_id == 5}">
                                                    <input type="hidden" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].question_id" value="<s:property value="question_id"/>"/>
                                                    <input class="single-slider" type="text" id="<s:property value="#itStatus.index"/>" value=""  name="saving_ans.all_questions[<s:property value="#itStatus.index" />].answers"/>
                                                    <input type="hidden" id="lowerLimit_<s:property value="#itStatus.index"/>" value="<s:property value="lowerLimit"/>">
                                                    <input type="hidden" id="upperLimit_<s:property value="#itStatus.index"/>" value="<s:property value="upperLimit"/>">
                                                    <input type="hidden" id="step_size_<s:property value="#itStatus.index"/>" value="<s:property value="step_size"/>">
                                                </s:if>            

                                                <s:if test="%{question_type.question_type_id == 6}">
                                                    <div class="form-group">
                                                        <input type="hidden" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].question_id" value="<s:property value="question_id"/>"/>
                                                        <input type="hidden" id="row_size_<s:property value="#itStatus.index"/>" value="<s:property value="row_values.size"/>"/>
                                                        <table style="width:100%;"><tr style="width:100%;">
                                                                <td style="border:none;"></td>
                                                                <s:iterator value="options" status="optionStatus">
                                                                    <td style="text-align: center;border:none;"><b style="font-weight: bold;">&nbsp;&nbsp;<s:property value="option"/>&nbsp;&nbsp;</b></td>  
                                                                </s:iterator>
                                                            </tr>
                                                            <s:iterator value="row_values" status="rowStatus">            
                                                                <tr style="width:100%;color:#3f5265;"> <input type="hidden" id="row_id_<s:property value="#itStatus.index"/>_<s:property value="#rowStatus.index"/>" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].row_values[<s:property value="#rowStatus.index"/>].row_id" value="<s:property value="row_id"/>"/>
                                                                <td style="border-bottom: 1px solid white;font-weight: bold;color:#3f5265;"><s:property value="option"/></td>
                                                                <s:iterator value="options" status="optionStatus">
                                                                    <td style="text-align: center;border-bottom: 1px solid white"> <input class="flat" type="radio" id="<s:property value="#itStatus.index"/>_<s:property value="#rowStatus.index"/>_<s:property value="#optionStatus.index"/>" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].row_values[<s:property value="#rowStatus.index"/>].row_ans" value="<s:property value="value_of_option"/>"/> 
                                                                    </td> 
                                                                </s:iterator>
                                                                </tr></s:iterator>
                                                            </table> 
                                                        </div>
                                                </s:if>
                                                <s:if test="%{question_type.question_type_id == 7}">
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="hidden" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].question_id" value="<s:property value="question_id"/>"/>
                                                        <input type="text" class="form-control has-feedback-left datefield1" id="ans_<s:property value="#itStatus.index"/>" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].answers" placeholder=" " aria-describedby="inputSuccess2Status">
                                                        <span class="fa fa-calendar-o form-control-feedback left datefield1" aria-hidden="true"></span>
                                                        <span id="inputSuccess2Status" class="sr-only">(success)</span>
                                                    </div><br><br>
                                                </s:if>
                                                <s:if test="%{question_type.question_type_id == 8}">
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <div class="input-group bootstrap-timepicker timepicker">
                                                            <input type="hidden" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].question_id" value="<s:property value="question_id"/>"/>
                                                            <input id="ans_<s:property value="#itStatus.index"/>" name="saving_ans.all_questions[<s:property value="#itStatus.index" />].answers" type="text" class="form-control input-small timepicker1">
                                                            <span class="input-group-addon"><i class="fa fa-clock-o" aria-hidden="true"></i></span>
                                                        </div>
                                                    </div><br><br>
                                                </s:if>
                                                <br/>
                                            </s:iterator>

                                            <br/><br/>


                                        </form>
                                        <!-- end form for validations -->

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
        <script src="js/moment.min.js"></script>
        <script src="js/daterangepicker.js"></script>
        <script src="asset/iCheck/icheck.min.js"></script>
        <script src="asset/switchery/dist/switchery.min.js"></script>
        <script src="ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
        <script src="asset/bootstrap_timepicker/bootstrap-timepicker.min.js"></script>
        <script>
                                            $(document).ready(function () {
                                                $(".datefield1").daterangepicker({
                                                    singleDatePicker: true,
                                                    singleClasses: "picker_1",
                                                    locale: {
                                                        format: 'DD-MM-YYYY'
                                                    }
                                                }, function (start, end, label) {
                                                    console.log(start.toISOString(), end.toISOString(), label);
                                                }).val('');
                                            });
        </script>
        <script type="text/javascript">
            //$('#timepicker1').timepicker();
            $('.timepicker1').timepicker({
                showMeridian: false,
                defaultTime: '',
                icons: {
                    up: "fa fa-chevron-circle-up",
                    down: "fa fa-chevron-circle-down"
                }
            });
        </script>
        <script>
            function spreview() {
                return false;
            }
            // code for slider function
            $(document).ready(function ()
            {

                var str = ($('.single-slider'));
                for (var i = 0; i < str.size(); i++) {
                    var id = str[i].id;
                    var from = parseInt(document.getElementById("lowerLimit_" + str[i].id).value);
                    var to = parseInt(document.getElementById("upperLimit_" + str[i].id).value);
                    var step = parseInt(document.getElementById("step_size_" + str[i].id).value);
                    var scale = [];
                    var start = from;
                    scale[0] = from;
                    var def_val = (from + to) / 2;
                    def_val = Math.floor(def_val);
                    document.getElementById(str[i].id).value = def_val;
                    for (var k = 1; start < to; k++) {
                        scale[k] = start + step;
                        start = scale[k];
                    }
                    $('#' + id).ionRangeSlider({
                        type: "single",
                        min: from,
                        max: to,
                        step: step,
                        grid: true,
                        grid_snap: true});
                }
            });
        </script>
    </body>
</html>
