<%-- 
    Document   : bulkMailLogs
    Created on : 2 Jan, 2017, 5:09:40 PM
    Author     : dipesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="/include/header.jsp" %>
        <title>Survey| Bulk Mail Logs </title>
        <link href="asset/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
        <style>
            #mask{
                position: absolute;
                background-color: #000;
                z-index: 9000;
                display: none;
            }

            #boxes .window{
                position: fixed;
                height: 555px;
                width: 910px;
                z-index: 9999;
                /*padding: 20px;*/
                border: 1px solid orange;
                display: none;
                /*background: #3d2c10;*/
                background: #496dad;

            }

            #boxes #dialog {
                height: 560px;
                width: 900px;
            }

            #top{
                /*color: olive;*/
                color: white;
                /*background: #3d2c10;*/
                background: #496dad;
                font-size: 20px;
                margin-left: 10px;
            }

            #top1{
                /*color: olive;*/
                color: white;
                /*background: #3d2c10;*/
                background: #496dad;
                font-size: 16px;
                margin-left: 10px;
                margin-top: 10px;
            }


            #dialog .close{
                position: absolute;
                top: 0;
                right: 0;
                text-align: right;
                text-decoration: none;
                /*color: olive;*/
                color: white;
                margin-right: 10px;

            }

            #dialog1 .close{
                position: absolute;
                top: 0;
                right: 0;
                text-align: right;
                text-decoration: none;
                /*color: olive;*/
                color: white;
                margin-right: 10px;

            }

            #inwindow{
                margin-top: 0;
                /*background: wheat;*/ 
                height: 470px;
                border-top:  5px solid #1d1b6d;
                overflow: scroll;
                background: whitesmoke;
            }

            #invalid_list{
                margin-left: 20px;
                font-size: 14px;
                padding: 5px;
            }
            #other_div{
                margin-left: 20px;
            }
            #sendM{
                margin-left: 150px;
                background: #000;
                color: white;
                font-size: 15px;
                padding: 5px;
            }
        </style> 
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="/include/menu.jsp" %>
                <div class="right_col" role="main">
                    <div id="boxes">
                        <div id="dialog" class="window">
                            <p id="top">
                                <a href="#" class="close">Close</a>

                            </p>
                            <p id="top1"><label id="subjectContent" style=""></label></p>
                            <div id="inwindow">
                                <div id="mail_content" style="padding: 5px;">
                                </div>
                            </div>
                        </div>
                        <div id="mask"></div>
                    </div>



                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Bulk Mail Logs</h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="table-responsive">
                            <table id="logsdetails" class="table table-striped table-bordered">
                                <thead id="tablehead" name="tablehead">
                                    <tr>
                                        <th>Bulk Mail Id</th>
                                        <th>No. Users Mail Sent</th>
                                        <th>Date</th>
                                        <th>Subject</th>
                                        <th>From</th>
                                        <th>Cc</th>
                                        <th style="display: none;">Mail Content</th>
                                        <th>User Logs</th>
                                        <th>Test Logs</th>
                                    </tr>
                                </thead>
                                <tbody id="mytablebody"  name="tablebody">
                                    <s:iterator value="logs_details">
                                        <tr>
                                            <td><s:property value="bulkmail_id"/></td>
                                            <td><s:property value="participant_count"/></td>
                                            <td><s:property value="updated_date"/></td>
                                            <td style="width: 30%;"><label style="text-decoration: underline; color: #61A8D6; cursor: pointer;" id="subject_<s:property value="bulkmail_id"/>" data-toggle="modal" data-target="#myModal" onclick="showMailContent('<s:property value="bulkmail_id"/>')"><s:property value="subject"/></label></td>
                                            <td><s:property value="from"/></td>
                                            <td><s:property value="cc"/></td>
                                            <td style="width: 40%; display: none;"><p id="mail_content_<s:property value="bulkmail_id" />"><s:property value="mail_content"/></p></td>
                                            <td><s:if test="%{participant_count == 0}"></s:if><s:else><a href="bulk_mail_attachments/logs/logs_<s:property value="bulkmail_id"/>.txt">user log</a></s:else></td>
                                            <td><a href="bulk_mail_attachments/logs/logs_test<s:property value="bulkmail_id"/>.txt">test log</a></td>
                                        </tr>
                                    </s:iterator>
                                </tbody>
                            </table>
                            </div>    
                        </div>
                    </div>
                    

                    <!-- Modal -->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 id="modal_title" class="modal-title"></h4>
                                </div>
                                <div id="modal_body" class="modal-body" style="word-wrap: break-word;">
                                    <p></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div style="padding : 10px;">
                        <div>

                        </div> 
                    </div>
                </div>
                <%@ include file="/include/footer.jsp" %>
            </div>
        </div>     
        <%@ include file="/include/script.jsp" %>
        <script src="asset/datatables/jquery.dataTables.min.js"></script>
        <script src="asset/datatables/dataTables.bootstrap.min.js"></script>
        <script>
            $('#logsdetails').dataTable({
                responsive: true
            });
        </script>
        <script>
            function showMailContent(bulk_mail_id){
                //alert(bulk_mail_id)
                //call_modalBox();
                document.getElementById("modal_title").innerHTML="";
                document.getElementById("modal_body").innerHTML="";
                var subjectText=document.getElementById("subject_"+bulk_mail_id).innerHTML;
                document.getElementById("modal_title").innerHTML=subjectText;
                var content=document.getElementById("mail_content_"+bulk_mail_id).innerHTML;
                document.getElementById("modal_body").innerHTML=unescapeHTML(content);   
            }
 
            function unescapeHTML(escapedHTML) {
                return escapedHTML.replace(/&lt;/g,'<').replace(/&gt;/g,'>').replace(/&amp;/g,'&');
            }
        </script>
        <script>
            $('.window .close').click(function(e) {
                e.preventDefault();
                $('#mask, .window').hide();
            });

            $('#mask').click(function() {
                $(this).hide();
                $('.window').hide();
            });
        </script>
        <script>
            function call_modalBox() {
                // div id which will be used in cover the all screen
                var id = "#dialog";
                //Get the screen height and width
                var maskheight = $(document).height();
                var maskwidth = $(window).width();
                //Set height and width to mask to fill up the whole screen
                $('#mask').css({'width': maskwidth, 'height': maskheight});
                //transition effect   
                $('#mask').fadeIn(1000);
                $('#mask').fadeTo('slow', 0.8);
                //Get the window height and width
                var winH = $(window).height();
                var winW = $(window).width();
                //Set the popup window to center
                $(id).css('top', winH / 2 - $(id).height() / 2);
                $(id).css('left', winW / 2 - $(id).width() / 2);
                //connecting to database and retrieve data
                //fetclistlookups();
                //transition effect
                $(id).fadeIn(2000);
                // $('#dialog').hide();
                // $("#other_msg").val("");
                // });

                //if close button is clicked
                $('.window .close').click(function(e) {
                    // alert("close");
                    e.preventDefault();
                    $('#mask, .window').hide();
                });

                $('#mask').click(function() {
                    $(this).hide();
                    $('.window').hide();
                });
            }
        </script>
    </body>
</html>
