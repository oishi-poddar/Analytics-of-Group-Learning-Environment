<%-- 
    Document   : sendSurveyForm
    Created on : 15 Dec, 2016, 3:22:20 PM
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
        <!-- bootstrap-daterangepicker -->
        <link href="css/daterangepicker.css" rel="stylesheet">
        <!-- iCheck -->
        <link href="asset/iCheck/skins/flat/green.css" rel="stylesheet">
        <!-- Switchery -->
        <link href="asset/switchery/dist/switchery.min.css" rel="stylesheet">
        <!-- Select2 -->
        <link href="select2/dist/css/select2.min.css" rel="stylesheet">
        <link href="asset/jquery_alerts/jquery-confirm.min.css" rel="stylesheet">
        <style>
            .multiple_input_checkbox{
                width: 0px;
            }
        </style>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="/include/menu.jsp" %>
                <div class="right_col" role="main">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>Bulk Mail</h3>
                        </div>    
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Save Bulk Mail Template</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <div id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for=""> Select Database <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="databasename1" name="details.database_name" value="nmeict2014" type="radio" class="flat" onClick="showDetails()" />  Nmeict &nbsp; &nbsp; 
                                                <input id="databasename2" name="details.database_name" value="csr" type="radio" class="flat" onClick="showDetails()"/>  CSR &nbsp; &nbsp; 
                                                <!--<input id="databasename3" name="details.database_name" value="nvli" type="radio" class="flat" onclick="showDetails()"/>  NVLI &nbsp; &nbsp;--> 
                                            </div>
                                            <div id="dberror" style="display:none;" class="col-md-12 col-sm-12 col-xs-12 error-div">
                                                Please select database
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for=""> Type of Email to be Sent <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input id="typeofmail_1" name="details.typeofmail" value="1" type="radio" class="flat" onClick="showMailDetails();"/>  Survey &nbsp; &nbsp; 
                                                <input id="typeofmail_2" name="details.typeofmail" value="2" type="radio" class="flat" onClick="showMailDetails();"/>  Generic &nbsp; &nbsp; 
                                                <input id="typeofmail_3" name="details.typeofmail" value="3" type="radio" class="flat" onClick="showMailDetails();" />  RCC &nbsp; &nbsp; 
                                                <input id="typeofmail_4" name="details.typeofmail" value="4" type="radio" class="flat" onClick="showMailDetails();"/>  Head of Institute &nbsp; &nbsp; 
                                            </div>
                                        </div>                                        
                                        <!--<div class="ln_solid"></div>-->

                                        <div id="select_survey" class="form-group"  style="display:none;">

                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Survey</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select id="surveyid" class="form-control" name="surveyid"  onchange="showSurveyDetails(this.value);">
                                                    <option value="-1">--Select your survey--</option>
                                                    <s:iterator value="surveylist" var="surveylist">
                                                        <option value="<s:property value="survey_id"/>"><s:property value="survey_id"/> : <s:property value="survey_name"/></option>
                                                    </s:iterator>                                                    
                                                </select>
                                                <s:if test="surveydetails.survey_id > 0">
                                                    <input type="submit" id="preview" name="preview" style="width: 80px; float: none; font-size: 14px; background: #995BBE; color: white; font-style: normal;" value="Preview" onclick="showPreview();"/>
                                                    <!--<input type="submit" id="SendMail" name="Send Mail" style="width: 80px; float: none; font-size: 14px; background: green; color: white; font-style: normal;" value="SendMail" onclick="sendMail();"/>-->
                                                    <input type="submit" id="survey_report" name="survey_report" style="width:120px; float: none;font-size: 14px; background: brown ; color:white;" value="Survey report" onclick="survey_report();"/>
                                                </s:if>
                                            </div>
                                        </div>
                                        <div id="select_survey_nmeict" class="form-group" style="display:none;">

                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Survey</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select id="surveyid" class="form-control" name="surveyid"  onchange="showSurveyDetails(this.value);">
                                                    <option value="-1">--Select your survey--</option>
                                                    <s:iterator value="surveylist_nmeict" var="surveylist_nmeict">
                                                        <option value="<s:property value="survey_id"/>"><s:property value="survey_id"/> : <s:property value="survey_name"/></option>
                                                    </s:iterator>                                                    
                                                </select>
                                                <s:if test="surveydetails.survey_id > 0">
                                                    <input type="submit" id="preview" name="preview" style="width: 80px; float: none; font-size: 14px; background: #995BBE; color: white; font-style: normal;" value="Preview" onclick="showPreview();"/>
                                                    <!--<input type="submit" id="SendMail" name="Send Mail" style="width: 80px; float: none; font-size: 14px; background: green; color: white; font-style: normal;" value="SendMail" onclick="sendMail();"/>-->
                                                    <input type="submit" id="survey_report" name="survey_report" style="width:120px; float: none;font-size: 14px; background: brown ; color:white;" value="Survey report" onclick="survey_report();"/>
                                                </s:if>
                                            </div>
                                            <div id="surveyIdError" class="errorMsgalert" style="display: none;">
                                                please select survey
                                            </div>
                                        </div>

                                    </div>
                                    <div id="form_enc" data-parsley-validate class="form-horizontal form-label-left" style="display:none;">
                                        <p><input type="hidden" id="survey_id" name="details.survey_id" value=""/></p>
                                        <p><input type="hidden" id="bulkmail_id" name="details.bulkmail_id" value="0"/></p>
                                        <div class="form-group" id="workshopid_1" style="display: inline;">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Workshop id mapping of participants<br> <span style="font-size: 12px;">(press shift and select multiple options) </span></label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select id="workshop_id" class="select2_multiple form-control" multiple="multiple" name="details.workshop_id" style="display: inline;">
                                                    <option value="-1">--Select Workshopid--</option>
                                                    <s:iterator value="workshops" var="workshops">
                                                        <option value="<s:property value="workshopid"/>"><s:property value="workshopid"/> : <s:property value="workshopname"/></option>
                                                    </s:iterator>
                                                </select>
                                            </div>
                                            <!--                                            <div id="workshop_idError1" style="display:none;" class="col-md-12 col-sm-12 col-xs-12 error-div">
                                                                                            please enter workshop id
                                                                                        </div>-->
                                            <div id="workshop_idError1" class="errorMsgalert" style="display: none;">
                                                please select workshop id
                                            </div>
                                        </div>

                                        <br/>
                                        <div class="form-group" id="workshopid_2" style="display: none;">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Workshop id mapping of participants<br> <span style="font-size: 12px;">(press shift and select multiple options) </span></label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select id="workshop_id2" class="select2_multiple form-control" multiple="multiple" name="details.workshop_id" style="display: inline;">
                                                    <option value="-1">--Select Workshopid--</option>
                                                    <s:iterator value="workshops_2" var="workshops_2">
                                                        <option value="<s:property value="workshopid"/>"><s:property value="workshopid"/>: <s:property value="workshopname"/></option>
                                                    </s:iterator>
                                                </select>
                                            </div>
                                            <!--                                            <div id="workshop_idError2" style="display:none;" class="col-md-12 col-sm-12 col-xs-12 error-div">
                                                                                            please enter workshop id
                                                                                        </div>-->
                                            <div id="workshop_idError2" class="errorMsgalert" style="display: none;">
                                                please select workshop id
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="form-group" id="pstatus1" style="display: none;">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Participants status mapping<br> <span style="font-size: 12px;">(press shift and select multiple options) </span></label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select id="participant_status" class="select2_multiple form-control" multiple="multiple" name="details.participant_status" style="display: inline;">
                                                    <option value="-1">--Select Status--</option>
                                                    <s:iterator value="participant_status" var="participant_status">
                                                        <option value="<s:property/>"><s:property/></option>
                                                    </s:iterator>
                                                </select>
                                            </div>
                                            <div id="participant_statusError" style="display:none;" class="errorMsgalert">
                                                please select participant status
                                            </div>
                                        </div>
                                        <br/>
                                        <!--                                        <div class="ln_solid"></div>-->

                                        <div class="form-group" id="sdate">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="datepicker1">Start date <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control has-feedback-left" id="datepicker1" name="details.start_date" placeholder="Start date " aria-describedby="inputSuccess2Status">
                                                <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                <span id="inputSuccess2Status" class="sr-only">(success)</span>

                                            </div>
                                            <div id="startdateError" class="errorMsgalert" style="display:none;">
                                                Please select a valid start date
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="form-group" id="edate">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="datepicker2">End date <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" class="form-control has-feedback-left" id="datepicker2" name="details.end_date" placeholder="End date" aria-describedby="inputSuccess2Status">
                                                <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                <span id="inputSuccess2Status" class="sr-only">(success)</span>                                                

                                            </div>
                                            <div id="enddateError" class="errorMsgalert" style="display:none;">
                                                Please select a valid end date
                                            </div>
                                        </div>
                                        <br/>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="from">"From" address <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="from" name="details.from" required="required" class="form-control col-md-7 col-xs-12" value="" placeholder="e.g. eoutreach@it.iitb.ac.in">

                                            </div> 
                                            <div id="fromError" class="errorMsgalert" style="display:none;">
                                                Please enter a valid from address
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cc">"cc" address 
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="cc" name="details.cc" class="form-control col-md-7 col-xs-12" value="">

                                            </div>
                                            <div id="ccError" class="errorMsgalert" style="display:none;">
                                                Please enter a valid cc address
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="subject">Subject <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="subject" name="details.subject" required="required" class="form-control col-md-7 col-xs-12" value="">

                                            </div>
                                            <div id="subjectError" class="errorMsgalert" style="display:none;">
                                                Please enter a valid subject
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="attachment">Attachment
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="file" id="attachment" name="details.attachment" class="col-md-7 col-xs-12" >

                                            </div>  
                                            <div id="attachmentError" class="errorMsgalert" style="display:none;">
                                                Please upload a valid attachment
                                            </div>
                                        </div>
                                        <p> Please note that #name# will be replaced by name of participant and &lt;a href="#link#"&gt;#link#&lt;/a&gt; will be replaced by the link of survey form customized for that person.
                                        </p>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="mailContent">Mail Content <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <textarea id="mailContent" name="details.mail_content" required="required" class="form-control"  data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                                                          data-parsley-validation-threshold="10"></textarea>

                                            </div>
                                            <div id="contentError" class="errorMsgalert" style="display:none;">
                                                Please write content
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button type="submit" id="upload" class="btn btn-primary">Save Template</button>
                                                <button type="submit" style="display:none;" id="preview" name="preview" class="btn btn-warning" onclick="showPreview();">Preview</button>
                                                <button type="submit" style="display:none;" id="send_mail" class="btn btn-success" onclick="send_mail();" style="display: inline;">Send Mail</button>
                                                <p id="initiaed_msg" style="display:none;" class="alert alert-success fade in" role="alert">Bulk Mail initiated. Please wait until you get a successful message. Do not refresh the page.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="/include/script.jsp" %>
        <script src="asset/jquery_alerts/jquery-confirm.min.js"></script>
        <!--date  picker-->        
        <script>
            $(document).ready(function () {
                $('#datepicker1').daterangepicker({
                    singleDatePicker: true,
                    singleClasses: "picker_1",
                    locale: {
                        format: 'DD-MM-YYYY'
                    }
                }, function (start, end, label) {
                    console.log(start.toISOString(), end.toISOString(), label);
                });
                $('#datepicker2').daterangepicker({
                    singleDatePicker: true,
                    singleClasses: "picker_1",
                    locale: {
                        format: 'DD-MM-YYYY'
                    }
                }, function (start, end, label) {
                    console.log(start.toISOString(), end.toISOString(), label);
                });
            });

        </script>
        <script type="text/javascript">
            $("input[name='details.database_name']").on('ifToggled', function () {
                showDetails();
            });
            $("input[name='details.typeofmail']").on('ifToggled', function () {
                showMailDetails();
            });
        </script>
        <script >
            function showSurveyDetails(survey_id) {
                if (survey_id != -1) {
                    document.getElementById("survey_id").value = survey_id;
                    document.getElementById("form_enc").style.display = "inline";
                } else if (survey_id == -1) {
                    document.getElementById("form_enc").style.display = "none";
                }
            }

            function showMailDetails() {
                var dbname1, dbname2;
                var type1, type2, type3, type4;
                dbname1 = document.getElementById("databasename1").checked;
                dbname2 = document.getElementById("databasename2").checked;
                if (dbname1) {
                    document.getElementById("select_survey").style.display = "none";
                    document.getElementById("workshopid_1").style.display = "none";
                    document.getElementById("workshopid_2").style.display = "inline";
                } else if (dbname2) {
                    document.getElementById("select_survey_nmeict").style.display = "none";
                    document.getElementById("workshopid_1").style.display = "inline";
                    document.getElementById("workshopid_2").style.display = "none";
                }
                if (dbname1 != false || dbname2 != false) {
                    document.getElementById("dberror").style.display = "none";
                    type1 = document.getElementById("typeofmail_1").checked;
                    type2 = document.getElementById("typeofmail_2").checked;
                    type3 = document.getElementById("typeofmail_3").checked;
                    type4 = document.getElementById("typeofmail_4").checked;
                    resetAllValues(2);
                    resetAllErrorLabels(2);
                    document.getElementById("form_enc").style.display = "none";
                    if (type1 == true) {
                        if (dbname1) {
                            document.getElementById("select_survey_nmeict").style.display = "inline";
                            document.getElementById("select_survey").style.display = "none";
                            document.getElementById("surveyid").value = -1;
                        } else if (dbname2) {
                            document.getElementById("select_survey").style.display = "inline";
                            document.getElementById("select_survey_nmeict").style.display = "none";
                            document.getElementById("surveyid").value = -1;
                        }
                        document.getElementById("survey_id").style.display = "inline";
                        document.getElementById("sdate").style.display = "inline";
                        document.getElementById("edate").style.display = "inline";
                        document.getElementById("pstatus1").style.display = "inline";
                    } else if (type2 == true) {
                        document.getElementById("select_survey").style.display = "none";
                        document.getElementById("select_survey_nmeict").style.display = "none";
                        document.getElementById("pstatus1").style.display = "inline";
                        document.getElementById("form_enc").style.display = "inline";
                        document.getElementById("survey_id").style.display = "none";
                        document.getElementById("sdate").style.display = "none";
                        document.getElementById("edate").style.display = "none";
                    } else if (type3 == true) {
                        document.getElementById("select_survey").style.display = "none";
                        document.getElementById("select_survey_nmeict").style.display = "none";
                        document.getElementById("workshopid_1").style.display = "none";
                        document.getElementById("workshopid_2").style.display = "none";
                        document.getElementById("pstatus1").style.display = "none";
                        document.getElementById("form_enc").style.display = "inline";
                        document.getElementById("survey_id").style.display = "none";
                        document.getElementById("sdate").style.display = "none";
                        document.getElementById("edate").style.display = "none";
                    } else if (type4 == true) {
                        document.getElementById("select_survey").style.display = "none";
                        document.getElementById("select_survey_nmeict").style.display = "none";
                        document.getElementById("workshopid_1").style.display = "none";
                        document.getElementById("workshopid_2").style.display = "none";
                        document.getElementById("pstatus1").style.display = "none";
                        document.getElementById("form_enc").style.display = "inline";
                        document.getElementById("survey_id").style.display = "none";
                        document.getElementById("sdate").style.display = "none";
                        document.getElementById("edate").style.display = "none";
                    }
                } else {
                    document.getElementById("dberror").style.display = "inline";
                }
            }

            function showDetails() {
                document.getElementById("dberror").style.display = "none";
                var dbname1, dbname2;
                var type1, type2, type3, type4;
                dbname1 = document.getElementById("databasename1").checked;
                dbname2 = document.getElementById("databasename2").checked;
                type1 = document.getElementById("typeofmail_1").checked;
                type2 = document.getElementById("typeofmail_2").checked;
                type3 = document.getElementById("typeofmail_3").checked;
                type4 = document.getElementById("typeofmail_4").checked;
                if (dbname1) {
                    document.getElementById("workshopid_1").style.display = "none";
                    document.getElementById("workshopid_2").style.display = "inline";
                    if (type1 == true) {
                        document.getElementById("surveyid").value = -1;
                        document.getElementById("form_enc").style.display = "none";
                        resetAllValues(2);
                        resetAllErrorLabels(2);
                        document.getElementById("select_survey_nmeict").style.display = "inline";
                        document.getElementById("select_survey").style.display = "none";
                        document.getElementById("workshopid_1").style.display = "none";
                        document.getElementById("workshopid_2").style.display = "inline";
                        document.getElementById("pstatus1").style.display = "inline";
                    } else {
                        document.getElementById("select_survey_nmeict").style.display = "none";
                    }
                    if (type2 == true) {
                        resetAllValues(2);
                        resetAllErrorLabels(2);
                        document.getElementById("select_survey_nmeict").style.display = "none";
                        document.getElementById("select_survey").style.display = "none";
                        document.getElementById("form_enc").style.display = "inline";
                        document.getElementById("workshopid_1").style.display = "none";
                        document.getElementById("workshopid_2").style.display = "inline";
                        document.getElementById("pstatus1").style.display = "inline";
                        document.getElementById("sdate").style.display = "none";
                        document.getElementById("edate").style.display = "none";
                    }
                    if (type3 == true) {
                        resetAllValues(2);
                        resetAllErrorLabels(2);
                        document.getElementById("select_survey_nmeict").style.display = "none";
                        document.getElementById("select_survey").style.display = "none";
                        document.getElementById("form_enc").style.display = "inline";
                        document.getElementById("workshopid_1").style.display = "none";
                        document.getElementById("workshopid_2").style.display = "none";
                        document.getElementById("pstatus1").style.display = "none";
                        document.getElementById("sdate").style.display = "none";
                        document.getElementById("edate").style.display = "none";
                    }
                    if (type4 == true) {
                        resetAllValues(2);
                        resetAllErrorLabels(2);
                        document.getElementById("select_survey_nmeict").style.display = "none";
                        document.getElementById("select_survey").style.display = "none";
                        document.getElementById("form_enc").style.display = "inline";
                        document.getElementById("workshopid_1").style.display = "none";
                        document.getElementById("workshopid_2").style.display = "none";
                        document.getElementById("pstatus1").style.display = "none";
                        document.getElementById("sdate").style.display = "none";
                        document.getElementById("edate").style.display = "none";
                    }
                } else if (dbname2) {
                    document.getElementById("workshopid_1").style.display = "inline";
                    document.getElementById("workshopid_2").style.display = "none";
                    if (type1 == true) {
                        document.getElementById("surveyid").value = -1;
                        document.getElementById("form_enc").style.display = "none";
                        resetAllValues(2);
                        resetAllErrorLabels(2);
                        document.getElementById("select_survey").style.display = "inline";
                        document.getElementById("select_survey_nmeict").style.display = "none";
                        document.getElementById("workshopid_1").style.display = "inline";
                        document.getElementById("workshopid_2").style.display = "none";
                        document.getElementById("pstatus1").style.display = "inline";
                    } else {
                        document.getElementById("select_survey").style.display = "none";
                    }
                    if (type2 == true) {
                        resetAllValues(2);
                        resetAllErrorLabels(2);
                        document.getElementById("form_enc").style.display = "inline";
                        document.getElementById("workshopid_1").style.display = "inline";
                        document.getElementById("workshopid_2").style.display = "none";
                        document.getElementById("pstatus1").style.display = "inline";
                        document.getElementById("sdate").style.display = "none";
                        document.getElementById("edate").style.display = "none";
                    }
                    if (type3 == true) {
                        resetAllValues(2);
                        resetAllErrorLabels(2);
                        document.getElementById("select_survey_nmeict").style.display = "none";
                        document.getElementById("select_survey").style.display = "none";
                        document.getElementById("form_enc").style.display = "inline";
                        document.getElementById("workshopid_1").style.display = "none";
                        document.getElementById("workshopid_2").style.display = "none";
                        document.getElementById("pstatus1").style.display = "none";
                        document.getElementById("sdate").style.display = "none";
                        document.getElementById("edate").style.display = "none";
                    }
                    if (type4 == true) {
                        resetAllValues(2);
                        resetAllErrorLabels(2);
                        document.getElementById("select_survey_nmeict").style.display = "none";
                        document.getElementById("select_survey").style.display = "none";
                        document.getElementById("form_enc").style.display = "inline";
                        document.getElementById("workshopid_1").style.display = "none";
                        document.getElementById("workshopid_2").style.display = "none";
                        document.getElementById("pstatus1").style.display = "none";
                        document.getElementById("sdate").style.display = "none";
                        document.getElementById("edate").style.display = "none";
                    }
                }
            }

            function resetAllValues(type) {
                document.getElementById("workshop_id").value = "";
                //document.getElementById("participant_status").value="";
                resetMultipleSelect("participant_status");
                resetMultipleSelect("workshop_id");
                resetMultipleSelect("workshop_id2");
                document.getElementById("from").value = "";
                document.getElementById("cc").value = "";
                document.getElementById("subject").value = "";
                document.getElementById("mailContent").value = "";
                //document.getElementById("").value="";
                if (type == 2) {
                    document.getElementById("survey_id").value = "";
                    document.getElementById("datepicker1").value = "";
                    document.getElementById("datepicker2").value = "";
                }
            }


            function resetAllErrorLabels(type) {
                document.getElementById("workshop_idError1").style.display = "none";
                document.getElementById("workshop_idError2").style.display = "none";
                document.getElementById("participant_statusError").style.display = "none";
                document.getElementById("fromError").style.display = "none";
                document.getElementById("ccError").style.display = "none";
                document.getElementById("subjectError").style.display = "none";
                document.getElementById("contentError").style.display = "none";
                document.getElementById("attachmentError").style.display = "none";
                if (type == 2) {
                    document.getElementById("surveyIdError").style.display = "none";
                    document.getElementById("startdateError").style.display = "none";
                    document.getElementById("enddateError").style.display = "none";
                }
            }

            function checkFileSize(size, requiredSize) {
                var result = false;
                if (size != 0 && size <= requiredSize) {
                    result = true;
                }
                return result;
            }

            function validateLetter(letter, size)
            {
                var result = false;
                var filext = (getExt(letter)).toLowerCase();
                result = ((letter != null) && (letter != "") && (filext == "jpeg" || filext == "jpg"));
                return result;
            }
            function getExt(filename) {
                var dot_pos = filename.lastIndexOf(".");
                if (dot_pos == -1)
                    return "";
                return filename.substr(dot_pos + 1).toLowerCase();
            }

            function emailValidator(email) {
                var result = false;
                var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
                if (email.match(emailExp)) {
                    result = true;
                }
                return result;
            }

            document.getElementById("typeofmail_1").checked = false;
            document.getElementById("typeofmail_2").checked = false;


        </script>
        <script >
            function set_saveSurveyMailData(data) {
                var split = data.result.split("_");
                if (split[0] == "success") {
                    document.getElementById("databasename1").disabled = "true";
                    document.getElementById("databasename2").disabled = "true";
                    document.getElementById('bulkmail_id').value = split[1];
                    document.getElementById("upload").style = "background: green;";
                    document.getElementById("upload").value = "Edit Template";
                    document.getElementById("send_mail").style.display = "inline";
                    document.getElementById("preview").style.display = "inline";
                    $.alert({
                        title: 'Data Save Successfully',
                        content: ''
                    });
                    //alert("data saved successfully");
                } else {
                    $.alert({
                        title: 'Error',
                        content: ''
                    });
                    //alert("error");
                    // document.getElementById("").innerHTML="Error while saving...";
                }
            }
            
            $(document).on("click", "#upload", function () {
                var selectedValues = $('#participant_status').val();
                var selectedValues1 = $('#workshop_id').val();
                var selectedValues2 = $('#workshop_id2').val();

                var errCount = 0;
                var dbname1, dbname2;
                var type1, type2, type3, type4;
                dbname1 = document.getElementById("databasename1").checked;
                dbname2 = document.getElementById("databasename2").checked;
                type1 = document.getElementById("typeofmail_1").checked;
                type2 = document.getElementById("typeofmail_2").checked;
                type3 = document.getElementById("typeofmail_3").checked;
                type4 = document.getElementById("typeofmail_4").checked;
                if (dbname1 == false && dbname2 == false) {
                    document.getElementById("dberror").style.display = "inline";
                    errCount++;
                }
                var typeofmail;
                if (dbname1 != false || dbname2 != false) {
                    if (type1) {
                        typeofmail = document.getElementById("typeofmail_1").value;
                        resetAllErrorLabels(2);
                        var select_surveyid;
                        select_surveyid = document.getElementById("survey_id").value;
                        if (select_surveyid == -1) {
                            errCount++;
                            document.getElementById("surveyIdError").style.display = "inline";
                        }

                        var survey_startdate, survey_enddate;
                        survey_startdate = document.getElementById("datepicker1").value;
                        survey_enddate = document.getElementById("datepicker2").value;
                        if (survey_startdate.trim().length == 0) {
                            errCount++;
                            document.getElementById("startdateError").style.display = "inline";
                        }
                        if (survey_enddate.trim().length == 0) {
                            errCount++;
                            document.getElementById("enddateError").style.display = "inline";
                        }
                        survey_startdate = survey_startdate.split("-").reverse().join("-");
                        survey_enddate = survey_enddate.split("-").reverse().join("-");

                    } else if (type2) {
                        typeofmail = document.getElementById("typeofmail_2").value;
                        resetAllErrorLabels(0);
                    } else if (type3) {
                        typeofmail = document.getElementById("typeofmail_3").value;
                        resetAllErrorLabels(0);
                    } else if (type4) {
                        typeofmail = document.getElementById("typeofmail_4").value;
                        resetAllErrorLabels(0);
                    }
                    var workshopsid, pstatus, from, cc, subject, mailcontent, attachmentname, attachment;
                    //workshopsid=document.getElementById("workshop_id").value.trim();
                    //pstatus=document.getElementById("participant_status").value.trim();
                    if (type4 || type3) {
                        selectedValues2 = "all";
                        selectedValues1 = "all";
                        selectedValues = "all";
                    }

                    if (dbname1) {
                        workshopsid = selectedValues2;
                    } else if (dbname2) {
                        workshopsid = selectedValues1;
                    }
                    pstatus = selectedValues;

                    from = document.getElementById("from").value.trim();
                    cc = document.getElementById("cc").value.trim();
                    subject = document.getElementById("subject").value.trim();
                    mailcontent = document.getElementById("mailContent").value.trim();
                    attachmentname = document.getElementById("attachment").value.trim();
                    attachment = document.getElementById("attachment");

                    if (workshopsid != null) {
                        if (workshopsid.length == 0) {
                            errCount++;
                            if (dbname1) {
                                document.getElementById("workshop_idError2").style.display = "inline";
                            } else if (dbname2) {
                                document.getElementById("workshop_idError1").style.display = "inline";
                            }
                        }
                    } else {
                        errCount++;
                        if (dbname1) {
                            document.getElementById("workshop_idError2").style.display = "inline";
                        } else if (dbname2) {
                            document.getElementById("workshop_idError1").style.display = "inline";
                        }

                    }
                    if (pstatus != null) {
                        if (pstatus.length == 0) {
                            errCount++;
                            document.getElementById("participant_statusError").style.display = "inline";
                        }
                    } else {
                        errCount++;
                        document.getElementById("participant_statusError").style.display = "inline";
                    }
                    if (from.length == 0 || !emailValidator(from)) {
                        errCount++;
                        document.getElementById("fromError").style.display = "inline";
                    }
                    if (cc.length != 0) {
                        //                        errCount++;
                        //                        document.getElementById("ccError").style.display = "inline";

                        var emailArray = cc.split(",");
                        var cc_countError = 0;
                        var k = 0;
                        for (k = 0; k <= (emailArray.length - 1); k++) {
                            var email = emailArray[k].trim();
                            if (!emailValidator(email)) {
                                cc_countError++;
                            }
                        }
                        if (cc_countError > 0) {
                            errCount++;
                            document.getElementById("ccError").style.display = "inline";
                        }
                    }
                    if (subject.length == 0) {
                        errCount++;
                        document.getElementById("subjectError").style.display = "inline";
                    }
                    if (mailcontent.length == 0) {
                        errCount++;
                        document.getElementById("contentError").style.display = "inline";
                    }
                    if (attachmentname.length > 0) {
                        document.getElementById("attachmentError").style.display = "none";
                        var filesize = attachment.files[0];
                        var sizeInMb = (filesize.size / 1024) / 1024;
                        var sizeLimit = 2;
                        if (sizeInMb > sizeLimit) {
                            //alert('File size must be less than 2MB');
                            document.getElementById("attachmentError").innerHTML = "attachment file must be less than 2MB";
                            document.getElementById("attachmentError").style.display = "inline";

                        }
                    }

                }
                if (errCount > 0) {
                    return false;
                } else {
                    var sid = document.getElementById("survey_id").value;
                    if (dbname1 == true) {
                        var database_name = document.getElementById("databasename1").value;
                    } else {
                        var database_name = document.getElementById("databasename2").value;
                    }

                    var bulkmail_id = document.getElementById('bulkmail_id').value;


                    var file_data = $("#attachment").prop("files")[0];   // Getting the properties of file from file field
                    var form_data = new FormData();                  // Creating object of FormData class
                    if (attachmentname.length > 0) {
                        form_data.append("file", file_data)                    // Appending parameter named file with properties of file_field to form_data
                        form_data.append("details.attachment", attachmentname)
                    }

                    if (typeofmail != 1) {
                        sid = 0;
                    }

                    form_data.append("details.survey_id", sid)                 // Adding extra parameters to form_data
                    form_data.append("details.from", from)
                    form_data.append("details.cc", cc)
                    form_data.append("details.subject", subject)
                    form_data.append("details.mail_content", mailcontent)
                    form_data.append("details.database_name", database_name)
                    form_data.append("details.start_date", survey_startdate)
                    form_data.append("details.end_date", survey_enddate)
                    form_data.append("details.participant_status", pstatus)
                    form_data.append("details.typeofmail", typeofmail)
                    form_data.append("details.bulkmail_id", bulkmail_id)
                    form_data.append("details.workshop_id", workshopsid)
                    $.ajax({
                        url: "saveSurveyMailTemplate.html",
                        dataType: 'json',
                        cache: false,
                        contentType: false,
                        processData: false,
                        data: form_data, // Setting the data attribute of ajax with file_data
                        type: 'post',
                        success: set_saveSurveyMailData,
                        error: function (xhr, status, error) {
                            $.alert({
                                title: xhr + " : " + status + " : " + error,
                                content: ''
                            });
                        }
                    })
                }

            });

        </script>
        <script>
            function send_mail() {

                var bulkmail_id = document.getElementById("bulkmail_id").value;
                document.getElementById("initiaed_msg").style.display = "inline";
                document.getElementById("upload").style.display = "none";
                document.getElementById("send_mail").style.display = "none";
                var data = "bulkmail_id=" + bulkmail_id;
                $.ajax({
                    url: "survey_module/pages/DAO_SendBulkMail.jsp",
                    type: "GET",
                    data: data,
                    dataType: "json",
                    success: sendBulkMailSuccess,
                    error: function (xhr, status, error) {
                        $.alert({
                                title: xhr + " : " + status + " : " + error,
                                content: ''
                        });
                    }
                });

            }
            function sendBulkMailSuccess(data) {
                if (data > 0) {
                    $.alert({
                        title: 'Mail Sent Successfully',
                        content: ''
                    });
                    //alert("Mail Sent Successfully");
                    document.getElementById("initiaed_msg").style.display = "inline";
                    document.getElementById("initiaed_msg").innerHTML = "Mail sent successfully"
                } else {
                    $.alert({
                        title: 'Error',
                        content: ''
                    });
                    //alert("error");
                    // document.getElementById("").innerHTML="Error while saving...";
                }
            }
        </script>
        <script>
            function showPreview() {
                var templateId = document.getElementById("bulkmail_id").value;
                var type1, type2, type3, type4;
                var typeid = 0;
                type1 = document.getElementById("typeofmail_1").checked;
                type2 = document.getElementById("typeofmail_2").checked;
                type3 = document.getElementById("typeofmail_3").checked;
                type4 = document.getElementById("typeofmail_4").checked;
                if (type1) {
                    typeid = 1;
                } else if (type2) {
                    typeid = 2;
                } else if (type3) {
                    typeid = 3;
                } else if (type4) {
                    typeid = 4;
                }
                window.open('viewBulkMailTemplatePreview.html?templateid=' + templateId + "&typeid=" + typeid, '_blank');
            }
            function resetMultipleSelect(idname) {
                $("#" + idname + " option:selected").prop("selected", false);
            }
        </script>
        <!--date range picker-->
        <script src="js/moment.min.js"></script>
        <script src="js/daterangepicker.js"></script>
        <!--check box and radio-->
        <script src="asset/iCheck/icheck.min.js"></script>        
        <script src="asset/switchery/dist/switchery.min.js"></script>
        <!--multiple select-->
        <script src="survey_module/multiple_select_js/jquery.multiselect.js"></script>
    </body>
</html>


