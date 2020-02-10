<%-- 
    Document   : viewBulkMailTemplatePreview
    Created on : 29 Dec, 2016, 12:09:22 PM
    Author     : dipesh
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="/include/header.jsp" %>
        <title>Survey| Home </title>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@include file="/include/menu.jsp" %>
                <div class="right_col" role="main">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2 style="color:#3f5265;"><b>Preview  <s:property value="%{#itStatus.count}" /></b></h2>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="x_content" >
                                    <div class="form-horizontal form-label-left">
                                        <div  class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="test_mail_to">Please enter only one test mail address : <span class="required">*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="text" id="test_mail_to" required="required" class="form-control col-md-7 col-xs-12" value="">
                                            </div> 
                                            <div id="fromError" class="" >
                                                <button type="submit" id="upload" class="btn btn-primary" onclick="callfn();">Send Test Mail</button>                                                
                                            </div>
                                        </div>
                                        <div id="initiaed_msg" class="col-md-12 col-sm-12 col-xs-12 alert alert-info" style="display:none;">Bulk Mail initiated. Please wait until you get a successful message. Do not refresh the page.</div>
                                        <div id="test_log" style="display:none;" class="col-md-12 col-sm-12 col-xs-12">
                                            Logs of users the mail will be sent <a href="bulk_mail_attachments/logs/test_participant_log_<s:property value="bulkmaildetails.bulkmail_id"/>.txt" download><i class="fa fa-file-text"></i> Download</a>
                                        </div>
                                        <input type="hidden" id="bulkmail_id" value="<s:property value="bulkmaildetails.bulkmail_id"/>"/>
                                        <s:if test="bulkmaildetails.database_name == 'survey'">
                                        </s:if><s:else>test
                                        <div  class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">Workshops :
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <s:property value="bulkmaildetails.workshop_id"/>
                                            </div>                                        
                                        </div>
                                        <div  class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">Status :
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <s:property value="bulkmaildetails.participant_status"/>
                                            </div>                                        
                                        </div>
                                        <div  class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="">Total Participant Count :
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <s:property value="participantTotalCount"/>
                                            </div>                                        
                                        </div>
                                        </s:else>
                                        <div class="panel-body">
                                            <table class="table table-striped" style="border:2px solid  #DDD ">
                                                <thead>
                                                    <tr>
                                                        <th style="background-color: #F9F9F9;">Subject : </th>
                                                        <th style="background-color: #F9F9F9;"><s:property value="bulkmaildetails.subject"/></th>                                                                                                     
                                                    </tr>
                                                    <tr>
                                                        <th style="background-color: #F9F9F9;" scope="row">From : </th>
                                                        <th style="background-color: #F9F9F9;"><s:property value="bulkmaildetails.from"/></th>
                                                    </tr>
                                                    <tr>
                                                        <th style="background-color: #F9F9F9;" scope="row">cc : </th>
                                                        <th style="background-color: #F9F9F9;"><s:property value="bulkmaildetails.cc"/></th>
                                                    </tr>
                                                </thead>
                                                <tbody>                                                    
                                                    <tr>
                                                        <td style="background-color: #FFF;" scope="row">Content :</td>
                                                        <td style="background-color: #FFF;"><s:property escape="false" value="bulkmaildetails.mail_content"/></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <s:if test="%{bulkmaildetails.attachment != null}">
                                            <label id="hidden_filename" style="display: none;"><s:property value="bulkmaildetails.attachment"/></label>
                                            <div id="fileAttachment" class="note" style="">
                                                <table style="margin: 0 0 0 0;" cellspacing="0">
                                                    <tr>
                                                        <td style="background: #F5F5F5; border-top: 0px; padding: 0px;"><span id="file_ext" style="color: #fff; background: #658E15; padding: 1px; margin-top: 0px;"></span></td> 
                                                        <td style="background: #F5F5F5; border-top: 0px; "><a id="file_attachment" href="bulk_mail_attachments/<s:property value="bulkmaildetails.attachment"/>" style="color: #777;">Attachment_1</a></td>
                                                    </tr>
                                                </table>
                                                <%-- <span id="file_ext" style="color: #fff; margin-right: 5px; background: #658E15; padding: 1px;"></span><a id="file_attachment" href="bulk_mail_attachments/<s:property value="bulkmaildetails.attachment"/>" style="color: #777;"><s:property value="bulkmaildetails.attachment"/></a>--%>
                                            </div>
                                        </s:if>
                                        <s:else>
                                            <label id="hidden_filename" style="display: none;"><s:property value="bulkmaildetails.attachment"/></label>
                                            <span id="file_ext" style="color: #fff; margin-right: 5px; background: #658E15; padding: 1px; display: none;"></span><a id="file_attachment" href="" style="display: none;"></a>
                                            </s:else>

                                    </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%@include file="/include/footer.jsp" %>
            </div>
            <%@include file="/include/script.jsp" %>

            <script>
                var filename = document.getElementById("hidden_filename").innerHTML;
                var ext = filename.substr(filename.lastIndexOf('.') + 1);
                if (ext == "xls") {
                    $('#file_ext').css({"background-color": "#658E15"});
                    document.getElementById("file_ext").innerHTML = "xls";
                    $('#fileAttachment').removeClass('').addClass('note');
                } else if (ext == "pdf") {
                    $('#file_ext').css({"background-color": "#FB4C2F"});
                    document.getElementById("file_ext").innerHTML = "pdf";
                    $('#fileAttachment').removeClass('').addClass('note_pdf');
                } else if (ext == "doc") {
                    $('#file_ext').css({"background-color": "#4285F4"});
                    document.getElementById("file_ext").innerHTML = "doc";
                    $('#fileAttachment').removeClass('').addClass('note_doc');
                } else {
                    $('#file_ext').css({"background-color": "#F4B400"});
                    document.getElementById("file_ext").innerHTML = ext;
                    $('#fileAttachment').removeClass('').addClass('note_other');
                }

                function callfn() {
                    var send_to = document.getElementById("test_mail_to").value;
                    if (send_to == "" || send_to == null) {
                        alert("Please enter valid email address")
                        return false;
                    } else {
                        if (!emailValidator(send_to)) {
                            alert("Please enter valid email address");
                            return false;
                        } else {
                            document.getElementById("initiaed_msg").innerHTML = "Trying to send mail.. Do not refresh page"
                            var bulkmail_id = document.getElementById("bulkmail_id").value;
                            document.getElementById("initiaed_msg").style.display = "inline";
                            var data = "bulkmail_id=" + bulkmail_id + "&email=" + send_to;
                            $.ajax({
                                url: "survey_module/pages/DAO_SendTestBulkMail.jsp",
                                type: "GET",
                                data: data,
                                dataType: "json",
                                success: sendTestBulkMailSuccess,
                                error: onError
                            });
                        }
                    }
                }

                function sendTestBulkMailSuccess(data) {
                    if (data > 0) {
                        document.getElementById("initiaed_msg").style.display = "inline";
                        document.getElementById("initiaed_msg").innerHTML = "Mail sent successfully"
                        document.getElementById("test_log").style.display = "inline";
                    } else {
                        alert("error");
                        // document.getElementById("").innerHTML="Error while saving...";
                    }
                }
                function onError(jqXHR, textStatus) {
                    alert("Error : " + textStatus);
                }

                function emailValidator(email) {
                    var result = false;
                    var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
                    if (email.match(emailExp)) {
                        result = true;
                    }
                    return result;
                }

            </script>
        </div>
    </body>
</html>