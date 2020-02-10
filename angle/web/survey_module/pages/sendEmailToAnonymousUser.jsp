<%-- 
    Document   : sendEmailToAnonymousUser
    Created on : 7 Mar, 2017, 3:42:09 PM
    Author     : dipesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="/include/header.jsp" %>
        <title>Survey| Sent Email To Anonymous User </title>
        <!-- bootstrap-daterangepicker -->
        <link href="css/daterangepicker.css" rel="stylesheet">
        <!-- iCheck -->
        <link href="asset/iCheck/skins/flat/green.css" rel="stylesheet">
        <!-- Switchery -->
        <link href="asset/switchery/dist/switchery.min.css" rel="stylesheet">
        <!-- Select2 -->
        <link href="asset/jquery_alerts/jquery-confirm.min.css" rel="stylesheet">
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
                                    <h2>Anonymous Set of Emails</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <br />
                                    <div id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for=""> Type of Email to be Sent <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12" style="padding-top: 6px;">
                                                <div class="col-md-3 col-sm-4 col-xs-6">
                                                    <input id="typeofmail_1" name="details.typeofmail" value="1" type="radio" class="flat" onClick="show()"/>  Survey &nbsp; &nbsp; </div>
                                                <div class="col-md-3 col-sm-4 col-xs-6"><input id="typeofmail_2" name="details.typeofmail" value="2" type="radio" class="flat" onClick="show()"/>  Generic &nbsp; &nbsp; </div>
                                            </div>
                                        </div>                                        
                                        <!--<div class="ln_solid"></div>-->

                                        <div id="select_survey" class="form-group"  style="display:none; padding-top: 2px;">

                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Survey</label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <select id="surveyid" class="form-control" name="surveyid"  onchange="showSurveyDetails(this.value);">
                                                    <option value="-1">--Select your survey--</option>
                                                    <s:iterator value="surveylist" var="surveylist">
                                                        <option value="<s:property value="survey_id"/>"><s:property value="survey_id"/> : <s:property value="survey_name"/></option>
                                                    </s:iterator>                                                    
                                                </select>
                                            </div>
                                        </div>
                                        <div id="surveyIdError" style="display:none;" class="col-md-12 col-sm-12 col-xs-12 error-div">
                                            Please select survey 
                                        </div>  
                                    </div>

                                </div>
                            </div>


                            <div id="form_enc" class="x_panel" style="display: none;">
                                <div class="x_title">
                                    <h2> Mail Details</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div data-parsley-validate class="form-horizontal form-label-left" style="display:inline;">
                                        <p><input type="hidden" id="survey_id" name="details.survey_id" value="0"/></p>
                                        <p><input type="hidden" id="bulkmail_id" name="details.bulkmail_id" value="0"/></p>
                                        <div class="form-group" id="sdate" style="display: none;">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="datepicker1">Start date of survey <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12" style="margin-bottom: 11px;">
                                                <input type="text" class="form-control has-feedback-left" id="datepicker1" name="details.start_date" placeholder="Start date " aria-describedby="inputSuccess2Status" value="">
                                                <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                <span id="inputSuccess2Status" class="sr-only">(success)</span>

                                            </div>
                                            <div id="startdateError" class="errorMsgalert" style="display:none;">
                                                Please select a valid start date
                                            </div>
                                        </div>

                                        <div class="form-group" id="edate" style="display: none;">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="datepicker2">End date of survey <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12" style="margin-bottom: 11px;">
                                                <input type="text" class="form-control has-feedback-left" id="datepicker2" name="details.end_date" placeholder="End date" aria-describedby="inputSuccess2Status" value="">
                                                <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                <span id="inputSuccess2Status" class="sr-only">(success)</span>                                                

                                            </div>
                                            <div id="enddateError" class="errorMsgalert" style="display:none;">
                                                Please select a valid end date
                                            </div>
                                        </div>

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
                                                <button type="submit" style="display:none;" id="preview" name="preview" class="btn btn-warning" onclick="showPreview1();">Preview</button>
                                                <button type="submit" style="display:none;" id="send_mail" class="btn btn-success" onclick="send_mail();" style="display: inline;">Send Mail</button>
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
                            <div class="x_panel" id="uploadExcel" style="display: none;">
                                <div class="x_title">
                                    <h2> Upload Participant List</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="form-horizontal form-label-left">
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="excelfile">Upload Excel File <span class="required">*</span><br>(max limit 2 mb)
                                              <br>  To download template <a style="text-decoration: underline;" href="<s:url value="survey_module/Excel_sheets/Anonymous_User.xls"></s:url>" >Click Here</a> 
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="file" id="excelfile" name="details.excelfile" class="col-md-7 col-xs-12" >

                                            </div>  
                                            <div id="excelfileError" class="errorMsgalert" style="display: none;">
                                                Please upload a valid excel file
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <button type="submit" style="" id="upload_excel" name="upload_excel" class="btn btn-primary" onclick="return uploadExcelData();">Upload</button>
                                                <button type="submit" style="display: none;" id="validate_excel" name="validate_excel" class="btn btn-danger" onclick="validateAllWithRespId();">Validate</button>
                                                <button type="submit" style="display: none;" id="send_mailGeneric" class="btn btn-success" onclick="send_mailToGeneric();">Send Mail</button>
                                                <button type="submit" style="display: none;" id="send_mailSurvey" class="btn btn-success" onclick="send_mailToSurvey();">Send Mail</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="outRes" style="display: none;" class="form-group">
                                        <p>Total Participant : <label id="totalnum"></label></p>
                                        <p>Valid Email : <label id="validnum"></label></p>
                                        <p>Invalid Email : <label id="invalidnum"></label></p>
                                        <div id="invalidUserLink" style="display: none;" class="form-group">
                                            <p>For Invalid User <span style="cursor: pointer;text-decoration: underline;color:#172D44;" onclick="showInvalidUser()">click here</span> </p>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <p id="initiaed_msg" style="display:none;" class="" role="alert">Bulk Mail initiated. Please wait until you get a successful message. Do not refresh the page.</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <%@ include file="/include/footer.jsp" %>
            </div>
        </div>     
        <%@ include file="/include/script.jsp" %>
        <!--check box and radio-->
        <script src="asset/iCheck/icheck.min.js"></script>        
        <script src="asset/switchery/dist/switchery.min.js"></script>
        <!--date range picker-->
        <script src="js/moment.min.js"></script>
        <script src="js/daterangepicker.js"></script>
        <script src="asset/jquery_alerts/jquery-confirm.min.js"></script>
        <script>
                                                $("input[name='details.typeofmail']").on('ifToggled', function () {
                                                    showDetails1();
                                                });
        </script>
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
                }).val('');
                $('#datepicker2').daterangepicker({
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
        <script>
            function showDetails1() {
                //alert('called')
                var type1, type2;
                type1 = document.getElementById("typeofmail_1").checked;
                type2 = document.getElementById("typeofmail_2").checked;
                document.getElementById("form_enc").style.display = "none";
                document.getElementById("sdate").style.display = "none";
                document.getElementById("edate").style.display = "none";
                document.getElementById("select_survey").style.display = "none";

                resetAllErrorLabel();
                resetAllValues();

                if (type1 == true) {
                    document.getElementById("surveyid").value = "-1"
                    document.getElementById("select_survey").style.display = "inline";
                    //document.getElementById("form_enc").style.display = "inline-block";
                    //document.getElementById("sdate").style.display = "inline";
                    //document.getElementById("edate").style.display = "inline";
                } else if (type2 == true) {
                    document.getElementById("select_survey").style.display = "none";
                    document.getElementById("form_enc").style.display = "inline-block";
                    document.getElementById("sdate").style.display = "none";
                    document.getElementById("edate").style.display = "none";
                }
            }

            function showSurveyDetails(surveyid) {
                document.getElementById("form_enc").style.display = "none";
                document.getElementById("sdate").style.display = "none";
                document.getElementById("edate").style.display = "none";
                type1 = document.getElementById("typeofmail_1").checked;
                if (surveyid != -1 && type1 == true) {
                    document.getElementById("form_enc").style.display = "inline-block";
                    document.getElementById("sdate").style.display = "inline";
                    document.getElementById("edate").style.display = "inline";
                    document.getElementById("survey_id").value = surveyid;
                }
            }
        </script>
        <script>
            function set_saveSurveyMailData1(data) {
                var split = data.result.split("_");
                if (split[0] == "success") {
                    document.getElementById('bulkmail_id').value = split[1];
                    document.getElementById("uploadExcel").style.display="inline-block";
                    document.getElementById("upload").style = "background: green;";
                    document.getElementById("upload").value = "Edit Template";
                    //document.getElementById("send_mail").style.display = "inline";
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
                var errCount = 0;
                var type1, type2;
                var typeofmail = 0;
                type1 = document.getElementById("typeofmail_1").checked;
                type2 = document.getElementById("typeofmail_2").checked;
                var select_surveyid;
                var workshopsid, pstatus, from, cc, subject, mailcontent, attachmentname, attachment;
                from = document.getElementById("from").value.trim();
                cc = document.getElementById("cc").value.trim();
                subject = document.getElementById("subject").value.trim();
                mailcontent = document.getElementById("mailContent").value.trim();
                attachmentname = document.getElementById("attachment").value.trim();
                attachment = document.getElementById("attachment");

                resetAllErrorLabel();

                if (type1 == true) {
                    select_surveyid = document.getElementById("surveyid").value;
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
                        document.getElementById("datepicker1").style.border = "1px solid #CE5454";
                    }
                    if (survey_enddate.trim().length == 0) {
                        errCount++;
                        document.getElementById("enddateError").style.display = "inline";
                        document.getElementById("datepicker2").style.border = "1px solid #CE5454";
                    }
                    survey_startdate = survey_startdate.split("-").reverse().join("-");
                    survey_enddate = survey_enddate.split("-").reverse().join("-");
                }

                if (from.length == 0 || !emailValidator(from)) {
                    errCount++;
                    document.getElementById("fromError").style.display = "inline";
                    document.getElementById("from").style.border = "1px solid #CE5454";
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
                        document.getElementById("cc").style.border = "1px solid #CE5454";
                    }
                }
                if (subject.length == 0) {
                    errCount++;
                    document.getElementById("subjectError").style.display = "inline";
                    document.getElementById("subject").style.border = "1px solid #CE5454";
                }
                if (mailcontent.length == 0) {
                    errCount++;
                    document.getElementById("contentError").style.display = "inline";
                    document.getElementById("mailContent").style.border = "1px solid #CE5454";
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
                if (errCount > 0) {
                    return false;
                } else {
                    var sid = document.getElementById("survey_id").value;
                    var bulkmail_id = document.getElementById('bulkmail_id').value;

                    var file_data = $("#attachment").prop("files")[0];   // Getting the properties of file from file field
                    var form_data = new FormData();                  // Creating object of FormData class
                    if (attachmentname.length > 0) {
                        form_data.append("file", file_data)                    // Appending parameter named file with properties of file_field to form_data
                        form_data.append("details.attachment", attachmentname)
                    }

                    if (type1 != true) {
                        sid = 0;
                        typeofmail = document.getElementById("typeofmail_2").value;
                    }

                    if (type1 == true) {
                        typeofmail = document.getElementById("typeofmail_1").value;
                    }
                    var database_name = "survey";

                    form_data.append("details.survey_id", sid)                 // Adding extra parameters to form_data
                    form_data.append("details.from", from)
                    form_data.append("details.cc", cc)
                    form_data.append("details.subject", subject)
                    form_data.append("details.mail_content", mailcontent)
                    form_data.append("details.start_date", survey_startdate)
                    form_data.append("details.end_date", survey_enddate)
                    form_data.append("details.typeofmail", typeofmail)
                    form_data.append("details.bulkmail_id", bulkmail_id)
                    form_data.append("details.database_name", database_name)

                    $.ajax({
                        url: "saveAnonymousUserTemplate.html",
                        dataType: 'json',
                        cache: false,
                        contentType: false,
                        processData: false,
                        data: form_data, // Setting the data attribute of ajax with file_data
                        type: 'post',
                        success: set_saveSurveyMailData1,
                        error: function (xhr, status, error) {
                            $.alert({
                                title: xhr + " : " + status + " : " + error,
                                content: ''
                            });
                        }
                    });
                }
               
            });

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

            function resetAllErrorLabel() {
                document.getElementById("surveyIdError").style.display = "none";
                document.getElementById("startdateError").style.display = "none";
                document.getElementById("enddateError").style.display = "none";
                document.getElementById("fromError").style.display = "none";
                document.getElementById("ccError").style.display = "none";
                document.getElementById("subjectError").style.display = "none";
                document.getElementById("contentError").style.display = "none";
                document.getElementById("attachmentError").style.display = "none";

                document.getElementById("from").style.border = "";
                document.getElementById("cc").style.border = "";
                document.getElementById("subject").style.border = "";
                document.getElementById("mailContent").style.border = "";
                document.getElementById("datepicker1").style.border = "";
                document.getElementById("datepicker2").style.border = "";
            }

            function resetAllValues() {
                document.getElementById("from").value = "";
                document.getElementById("cc").value = "";
                document.getElementById("subject").value = "";
                document.getElementById("mailContent").value = "";
                //$('#datepicker1').val('');
                document.getElementById("datepicker1").value = "";
                document.getElementById("datepicker2").value = "";
            }

            function uploadExcelData() {
                var bulkmail_id = document.getElementById("bulkmail_id").value;
                //bulkmail_id =1;
                var errorVal = 0;
                var typeofmail = 0, type1, type2;
                type1 = document.getElementById("typeofmail_1").checked;
                type2 = document.getElementById("typeofmail_2").checked;
                var attachmentname = document.getElementById("excelfile").value.trim();
                if (type1 == true) {
                    typeofmail = document.getElementById("typeofmail_1").value;
                } else if (type2 == true) {
                    typeofmail = document.getElementById("typeofmail_2").value;
                }
                var excelfile = document.getElementById("excelfile").value;
                document.getElementById("excelfileError").style.display = "none";
                document.getElementById("excelfile").style.border = "";
                var fileInput = document.getElementById("excelfile");

                if (excelfile.trim() == "" || excelfile.trim() == null) {
                    errorVal++;
                    document.getElementById("excelfile").style.border = "1px solid #CE5454";
                    document.getElementById("excelfileError").style.display = "inline";
                } else {
                    var size = fileInput.files[0].size;
                    if (size / 1024 / 1024 > 2) {
                        errorVal++;
                        document.getElementById("excelfile").style.border = "1px solid #CE5454";
                        document.getElementById("excelfileError").style.display = "inline";
                    }
                    var resExt = validateExcelFile(excelfile);
                    if (resExt == false) {
                        errorVal++;
                        document.getElementById("excelfile").style.border = "1px solid #CE5454";
                        document.getElementById("excelfileError").style.display = "inline";
                    }
                }

                if (errorVal > 0) {
                    return false;
                } else {
                    var file_data = $("#excelfile").prop("files")[0];   // Getting the properties of file from file field
                    var form_data = new FormData();                  // Creating object of FormData class
                    if (attachmentname.length > 0) {
                        form_data.append("file", file_data)                    // Appending parameter named file with properties of file_field to form_data
                        form_data.append("details.attachment", attachmentname)
                    }

                    form_data.append("details.typeofmail", typeofmail)
                    form_data.append("details.bulkmail_id", bulkmail_id)


                    $.ajax({
                        url: "saveExcelUserData.html",
                        dataType: 'json',
                        cache: false,
                        contentType: false,
                        processData: false,
                        data: form_data, // Setting the data attribute of ajax with file_data
                        type: 'post',
                        success: set_saveExcelUserData,
                        error: function (xhr, status, error) {
                            alert(xhr + " : " + status + " : " + error);
                        }
                    })
                    function set_saveExcelUserData(data) {
                        var split = data.result.split("_");
                        if (split[0] == "success") {
                            //document.getElementById('bulkmail_id').value = split[1];
                            //document.getElementById("upload").style = "background: green;";
                            // document.getElementById("upload").value = "Edit Template";
                            document.getElementById("upload_excel").style.display = "none";
                            document.getElementById("validate_excel").style.display = "inline";
                            //document.getElementById("preview").style.display = "inline";
                            $.alert({
                                title: 'Data Save Successfully',
                                content: ''
                            });
                            // alert("data saved successfully");
                        } else {
                            $.alert({
                                title: 'Error',
                                content: ''
                            });
                            // alert("error");
                            // document.getElementById("").innerHTML="Error while saving...";
                        }
                    }
                }
            }

            function validateAllWithRespId() {
                var val = document.getElementById("bulkmail_id").value;
                var type1, type2;
                type1 = document.getElementById("typeofmail_1").checked;
                type2 = document.getElementById("typeofmail_2").checked;
                //val=1;
                if (!val == null || !val == "" || !val == 0) {
                    if (type1 == true) {
                        var sid = document.getElementById("survey_id").value;
                        validateAllSurvey(val, sid);
                    } else if (type2 == true) {
                        validateAllGeneric(val);
                    }
                } else {
                    $.alert({
                        title: 'No Value',
                        content: ''
                    });
                    //alert("no value");
                }
            }

            function validateAllGeneric(val) {
                var data = "fileid=" + val;
                $.ajax({
                    url: "survey_module/pages/DAOGetValidateExcelData.jsp",
                    type: "GET",
                    data: data,
                    dataType: "json",
                    success: setValidateAllGeneric,
                    error: function (xhr, status, error) {
                        alert(xhr + " : " + status + " : " + error);
                    }
                });
            }

            function setValidateAllGeneric(data) {
                $.alert({
                    title: 'Validate Successfully',
                    content: ''
                });
                //alert("validate Successfully")
                data = data.trim();
                var res_sp;
                var val_rs = 0, inval_rs = 0, totl_rs = 0;
                //alert(data)
                if (data != "") {
                    res_sp = data.split("#");
                    totl_rs = res_sp[0];
                    val_rs = res_sp[1];
                    inval_rs = res_sp[2];
                    document.getElementById("send_mailSurvey").style.display = "none";
                    document.getElementById("invalidUserLink").style.display = "none";

                    document.getElementById("totalnum").innerHTML = totl_rs;
                    document.getElementById("validnum").innerHTML = val_rs;
                    document.getElementById("invalidnum").innerHTML = inval_rs;
                    if (totl_rs > 0) {
                        document.getElementById("outRes").style.display = "inline";
                    }
                    if (val_rs > 0) {
                        document.getElementById("send_mailGeneric").style.display = "inline";
                    }if (inval_rs > 0) {
                        document.getElementById("invalidUserLink").style.display = "inline";
                    }
                    
                }
                /*
                    if (totl_rs > 0) {
                        document.getElementById("outRes").style.display = "inline";
                    }
                    if (inval_rs > 0) {
                        document.getElementById("invalidUserLink").style.display = "inline";
                    }

                }
                /*
                 if (totl_rs > 0) {
                 document.getElementById("outRes").style.display = "inline";
                 }
                 if (inval_rs > 0) {
                 document.getElementById("inValData").style.display = "inline";
                 }if(val_rs > 0){
                 document.getElementById("sendmailValid").style.display="inline";
                 }
                 
                 } else {
                 
                 }*/
            }

            function validateAllSurvey(val, sid) {
                var data = "fileid=" + val + "&sid=" + sid;
                $.ajax({
                    url: "survey_module/pages/DAOGetValidateSurveyExcelData.jsp",
                    type: "GET",
                    data: data,
                    dataType: "json",
                    success: setValidateAllSurvey,
                    error: function (xhr, status, error) {
                        alert(xhr + " : " + status + " : " + error);
                    }
                });
            }

            function setValidateAllSurvey(data) {
                $.alert({
                    title: 'Validate Successfully',
                    content: ''
                });
                //alert("validate Successfully")
                data = data.trim();
                var res_sp;
                var val_rs = 0, inval_rs = 0, totl_rs = 0;
                //alert(data)
                if (data != "") {
                    res_sp = data.split("#");
                    totl_rs = res_sp[0];
                    val_rs = res_sp[1];
                    inval_rs = res_sp[2];
                    document.getElementById("send_mailGeneric").style.display = "none";
                    document.getElementById("invalidUserLink").style.display = "none";

                    document.getElementById("totalnum").innerHTML = totl_rs;
                    document.getElementById("validnum").innerHTML = val_rs;
                    document.getElementById("invalidnum").innerHTML = inval_rs;
                    if (totl_rs > 0) {
                        document.getElementById("outRes").style.display = "inline";
                    }
                    if (val_rs > 0) {
                        document.getElementById("send_mailSurvey").style.display = "inline";
                    }
                    if (inval_rs > 0) {
                        document.getElementById("invalidUserLink").style.display = "inline";
                    }

                }
            }

            function send_mailToGeneric() {
                var val = document.getElementById("bulkmail_id").value;
                var type2;
                type2 = document.getElementById("typeofmail_2").checked;
                //val=1;
                if (!val == null || !val == "" || !val == 0) {
                    if (type2 == true) {
                        // send mail method
                        send_mailToGenericUser(val);
                    }
                } else {
                    $.alert({
                        title: 'No Value',
                        content: ''
                    });
                    //alert("no value");
                }
            }

            function send_mailToSurvey() {
                var val = document.getElementById("bulkmail_id").value;
                var type1, surveyid;
                type1 = document.getElementById("typeofmail_1").checked;
                surveyid = document.getElementById("survey_id").value
                //val=1;
                if (!val == null || !val == "" || !val == 0) {
                    if (type1 == true && surveyid != -1) {
                        // send mail method
                        send_mailToGenericUser(val);
                    }
                } else {
                    $.alert({
                        title: 'No Value',
                        content: ''
                    });
                    //alert("no value");
                }
            }

            function validateExcelFile(letter)
            {
                var result = false;
                var filext = (getExt(letter)).toLowerCase();
                result = ((letter != null) && (letter != "") && (filext == "xls"));
                return result;
            }
            function getExt(filename) {
                var dot_pos = filename.lastIndexOf(".");
                if (dot_pos == -1)
                    return "";
                return filename.substr(dot_pos + 1).toLowerCase();
            }

            function showInvalidUser() {
                var templateid = document.getElementById("bulkmail_id").value;
                window.open('invalidUser.html?templateid=' + templateid, '_blank');
                //alert("new window")
            }
        </script>
        <script>
            function send_mailToGenericUser(bulkmail_id) {
                document.getElementById("initiaed_msg").style.display = "inline";
                document.getElementById("send_mailGeneric").style.display = "none";
                document.getElementById("send_mailSurvey").style.display = "none";
                var data = "bulkmail_id=" + bulkmail_id;
                $.ajax({
                    url: "survey_module/pages/DAO_SendBulkMailToGenericUser.jsp",
                    type: "GET",
                    data: data,
                    dataType: "json",
                    success: sendBulkMailGenericUserSuccess,
                    error: function (xhr, status, error) {
                        alert(xhr + " : " + status + " : " + error);
                    }
                });

            }
            function sendBulkMailGenericUserSuccess(data) {
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
            function showPreview1() {
                var templateId = document.getElementById("bulkmail_id").value;
                var type1, type2;
                var typeid = 0;
                type1 = document.getElementById("typeofmail_1").checked;
                type2 = document.getElementById("typeofmail_2").checked;
                if (type1) {
                    typeid = 1;
                } else if (type2) {
                    typeid = 2;
                }
                window.open('viewBulkMailTemplatePreview.html?templateid=' + templateId + "&typeid=" + typeid, '_blank');
            }
        </script>
    </body>
</html>
