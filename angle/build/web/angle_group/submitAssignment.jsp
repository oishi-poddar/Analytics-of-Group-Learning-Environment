<%-- 
    Document   : submitAssignment
    Created on : 6 Jun, 2017, 12:10:09 AM
    Author     : manushi
--%>

<%@page import="bean.Person"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpServletRequest req = ServletActionContext.getRequest();
    String url = (req.getRequestURL()).toString();
    String parts[] = url.split("template");
    Person p = new Person();
    p = (Person) session.getAttribute("loggedInUser");
    int userId = p.getLoginId();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="/include/header.jsp" %>
        <title>Assignment Display</title>
        <style>

            #comment-error{
                float: left;
                margin: 0 0 10px 35px;
                padding: 3px 10px;
                color: #FFF;
                border-radius: 3px 4px 4px 3px;
                background-color: #CE5454;
                max-width: 250px;
                /*white-space: pre;*/
                position: relative;
                left: -15px;
                opacity: 1;
                z-index: 1;
                transition: 0.15s ease-out;
            }


            #comment-error::after {
                content: '';
                display: block;
                height: 0;
                width: 0;
                border-color: transparent #CE5454 transparent transparent;
                border-style: solid;
                border-width: 11px 7px;
                position: absolute;
                left: -13px;
                top: 1px;
            }



        </style>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="/include/menu3.jsp" %>
                <div class="right_col" role="main">

                    <%    if (session.getAttribute("submitAssignment") == "success") {
                            session.setAttribute("submitAssignment", null);    %>

                    <div class="alert alert-success alert-dismissable fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> You have successfully submitted the assignment.
                    </div>                    
                    <%       }%>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <div class="x_panel">
                                <div class="x_title">
                                    <h4>Assignment Submission</h4>
                                    <h3> <s:property value="a.name"/></h3>

                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">


                                    <form id="submitAssignment" style="display: inline;" data-parsley-validate class="form-horizontal form-label-left" action="submitAssignment1.html"  method="post" enctype="multipart/form-data">
                                        <!-- <s:property value="a.id"/>-->


                                        <input type="hidden" name="a.groupid" id="groupid" value="<s:property value="a.id"/>" >

                                        <div class="form-group">


                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle"> <span class="required">Comments</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="a.comment" id="comment"  class="form-control col-md-7 col-xs-12" value="">

                                            </div>
                                            <label class="error-msg"><s:property value="fieldErrors.get('name').get(0)" /></label>

                                        </div>


                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle"> <span class="required">Upload File</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal2" title="Upload File">
                                                    <span class="fa fa-file-text fa-lg"></span> </button>
                                                <!-- Modal -->
                                                <div class="modal fade" id="myModal2" role="dialog">
                                                    <div class="modal-dialog">

                                                        <!-- Modal content-->
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                <h2 class="modal-title">UPLOAD FILES</h2>
                                                            </div>

                                                            <div class="col-md-12 col-sm-12 col-xs-12 modal-body">
                                                                <div class="input-group ">
                                                                    <input type="file" name="a.myFile" id="myFile" value="" onchange ="fileValidation()" placeholder="browse"/>
                                                                    <s:property value="myFileFileName"/>


                                                                </div></div>


                                                            <div class="modal-footer">

                                                                <button type="button" id="sub1" class="btn btn-default" data-dismiss="modal">OK</button>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>


                                            </div>
                                        </div>

                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button type="submit" id="sub" name="sub" class="btn btn-success">SUBMIT</button>
                                            </div>
                                        </div>
                                    </form>

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
            $().ready(function () {
                $("#submitAssignment").validate();
                $("#comment").rules("add", {
                    required: true,
                    messages: {
                        required: "Please enter comments"

                    }
                });


            });

            function fileValidation() {
                var size = 2097152;
                var file_size = document.getElementById("myFile").files[0].size;
                if (file_size >= size) {
                   alert('This file size is too large: ' + file_size / 1024 / 1024 + "MB\nAcceptable size=2MB");
                    var btn = document.getElementById("sub1");
                    btn.disabled = true;
                } else
                {
                    //alert("File size is acceptable");
                    var btn = document.getElementById("sub1");
                    btn.disabled = false;
                }

            }
        </script>
        <script src="js/jquery.validate.min.js"></script>

    </body>
</html>

