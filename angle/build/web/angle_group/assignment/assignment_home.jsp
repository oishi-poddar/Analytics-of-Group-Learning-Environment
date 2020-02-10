<%-- 
    Document   : assignment_home
    Created on : 21 May, 2017, 12:00:42 PM
    Author     : manushi
--%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpServletRequest req = ServletActionContext.getRequest();
    String url = (req.getRequestURL()).toString();
    String parts[] = url.split("template");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="/include/header.jsp" %>
        <title>Assignment| Home </title>
        <style>
            #name-error{
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


            #name-error::after {
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

            input.error-msg{
                border: 1px solid #CE5454!important;
            }
        </style>
        <script>
            alert("helllllllllo");
        </script>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="/include/menu2.jsp" %>
                <div class="right_col" role="main">

                    <link href="css/daterangepicker.css" rel="stylesheet">
                    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>ASSIGNMENT</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="x_content">
                                    <s:property value="gid"/> <br> <s:property value="a.gid"/>
                                    <form id="assignment_home" style="display: inline;" data-parsley-validate class="form-horizontal form-label-left" action="assignment_home.html"  method="post" enctype="multipart/form-data">
                                        
                                        <input type="hidden" name="a.groupid" id="groupid" value="<s:property value="a.gid"/>" >
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle"> <span class="required">Assignment Title*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="a.name" id="name" type="text"  class="form-control col-md-7 col-xs-12" value="">

                                            </div>
                                            <label class="error-msg"></label>

                                        </div>

                                        <!-- <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                             <input name="a.name" id="name" type="text" placeholder="Assignment Title" class="form-control" >
                                             <label class="error-msg"><s:property value="fieldErrors.get('name').get(0)" /></label>
                                         </div>-->
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle"> <span class="required">Assignment Description*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input name="a.description" id="description"  class="form-control col-md-7 col-xs-12" value="">

                                            </div>

                                        </div>
                                        <!--<div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                            <input name="a.description" id="description" type="text" placeholder="Assignment Description" class="form-control">
                                        </div>   
                                        <div class="form group col-md-3 col-sm-12 col-md-12">


                                            <fieldset>
                                                <div class="control-group">
                                                    <div class="controls">
                                                        <div class="xdisplay_inputx form-group has-feedback">
                                                            <input type="text" class="form-control has-feedback-left" name="a.datepicker" id="datepicker" placeholder="Due Date" aria-describedby="inputSuccessStatus">
                                                            <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                            <span id="inputSuccessStatus" class="sr-only">(success)</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </div>-->
                                         
                                         <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle"> <span class="required">Due Date*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                 <input type="text" class="form-control has-feedback-left col-md-7 col-xs-12" name="a.datepicker" id="datepicker" aria-describedby="inputSuccessStatus">
                                                            <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                            <span id="inputSuccessStatus" class="sr-only">(success)</span>
                                                        
                                            </div>

                                        </div>
                                        
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle"> <span class="required">Due Time</span>
                                            </label>
                                            <div class="col-md-1 col-sm-6 col-xs-12">
                                                  <select class="form-control" name="a.hour" id="hour" type="text">
                                                <option value="00">00</option>
                                                <option value="01">01</option>
                                                <option value="02">02</option>
                                                <option value="03">03</option>
                                                <option value="04">04</option>
                                                <option value="05">05</option>
                                                <option value="06">06</option>
                                                <option value="07">07</option>
                                                <option value="08">08</option>
                                                <option value="09">09</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                                <option value="19">19</option>
                                                <option value="20">20</option>
                                                <option value="21">21</option>
                                                <option value="22">22</option>
                                                <option value="23">23</option>

                                            </select>
                                            </div>
                                            <div class="col-md-1 col-sm-12 col-xs-12">
                                            <select class="form-control" id="min" name="a.min" type="text">
                                                <option value="00">00</option>
                                                <option value="15">15</option>
                                                <option value="30">30</option>
                                                <option value="45">45</option>

                                            </select>
                                        </div>

                                        </div>
                                        
                                         <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle"> <span class="required">Lock Assignment After Due date*</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                <input type="checkbox" name="a.lock_submission" id="lock_submission" value="">
    
                                            </div>

                                        </div>
                       


                                        <!--<div class="col-md-1 col-sm-12 col-xs-12 form-group">


                                            <select class="form-control" name="a.hour" id="hour" type="text">
                                                <option value="00">00</option>
                                                <option value="01">01</option>
                                                <option value="02">02</option>
                                                <option value="03">03</option>
                                                <option value="04">04</option>
                                                <option value="05">05</option>
                                                <option value="06">06</option>
                                                <option value="07">07</option>
                                                <option value="08">08</option>
                                                <option value="09">09</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                                <option value="16">16</option>
                                                <option value="17">17</option>
                                                <option value="18">18</option>
                                                <option value="19">19</option>
                                                <option value="20">20</option>
                                                <option value="21">21</option>
                                                <option value="22">22</option>
                                                <option value="23">23</option>

                                            </select>
                                        </div>



                                        <div class="col-md-1 col-sm-12 col-xs-12 form-group">
                                            <select class="form-control" id="min" name="a.min" type="text">
                                                <option value="00">00</option>
                                                <option value="15">15</option>
                                                <option value="30">30</option>
                                                <option value="45">45</option>

                                            </select>
                                        </div>



                                        <div class="col-md-12 col-sm-12 col-xs-12 form-group">


                                            <input type="checkbox" name="a.lock_submission" id="lock_submission" value="">Lock this assignment after its due date<br>


                                        </div> --> 
                                        
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle"> <span class="required">Add Link</span>
                                            </label>
                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                               <input type="text" name="a.referenceLink" id="referenceLink" class="form-control" placeholder="http:"/>

                                            </div>

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
                                                                    <input type="file" name="a.myFile" id="myFile" value=""  placeholder="browse"/>
                                                                    <s:property value="myFileFileName"/>
                                                                   <!-- <a href="<s:url value="/uploadedfiles/myFileFileName"/>" target="_blank">path</a>-->



                                                                </div></div>


                                                            <div class="modal-footer">

                                                                <button type="button" id="sub1" class="btn btn-default" data-dismiss="modal">OK</button>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                                                   
                                                                   
                                                                   
                                                                           <div>/<select>
                                                                                   <s:iterator value="listofToipcs">
                                                                                       <option value="<s:property value='name'/>"<s:property value='name'/></option>
                                                                       </select></div>

                                        <br><br>
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                                <button class="btn btn-primary" type="button">Cancel</button>
                                                <%-- <button class="btn btn-primary" type="reset">SEND</button>--%>
                                                <button type="submit" id="sub" name="sub" class="btn btn-success">CREATE</button>
                                            </div>
                                        </div>

                                    </form>

                                </div>
                            </div>
                        </div>

                    </div>



                    






                    <%--  <div class="col-md-3 col-sm-12 col-xs-12 form-group">

                            <!-- Trigger the modal with a button -->
                            <button type="button" class="btn btn-info btn-block" data-toggle="modal" data-target="#myModal">Load Previous Assignment</button>

                            <!-- Modal -->
                            <div class="modal fade" id="myModal" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h2 class="modal-title">Load Assignment</h2>
                                        </div>

                                        <div class="col-md-12 col-sm-12 col-xs-12 modal-body">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="ass_name" name="ass_name"/>
                                                <span class="input-group-addon">
                                                    <i class="fa fa-search"></i>
                                                </span>
                                            </div></div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="checkExisting();">OKAY</button>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div> --%>
                     </div>
                <%@ include file="/include/footer.jsp" %>
            </div>
        </div>     
        <%@ include file="/include/script.jsp" %>
        <script src="js/daterangepicker.js"></script> 
        <script src="js/jquery.validate.min.js"></script>
        <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"rel = "stylesheet">


        <script>
            $(function () {
                $("#datepicker").datepicker();

            });

            $("#myFile").change(function () {
                //submit the form here


                var size = 2097152;
                var file_size = document.getElementById('myFile').files[0].size;

                if (file_size >= size) {

                    alert('This file size is too large: ' + this.files[0].size / 1024 / 1024 + "MB\nAcceptable size=2MB");
                    var btn = document.getElementById("sub1");
                    btn.disabled = true;

                } else
                {
                    alert("File size is acceptable");
                    var btn = document.getElementById("sub1");
                    btn.disabled = false;

                }

            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $("#lock_submission").click(function () {
                    if ($(this).is(":checked")) {
                        // var d=new Date();

                        alert("Assignment is locked after the due date.");
                        //alert(d);
                        lock_submission.value = 1;

                    } else if ($(this).is(":not(:checked)")) {
                        alert("Assignment is not locked after the due date.");
                        lock_submission.value = 0;

                    }
                });
            });
        </script>
        <script>
            $().ready(function () {
                $("#assignment_home").validate();

                $("#name").rules("add", {
                    required: true,
                    maxlength: 45,
                    messages: {
                        required: "Please enter title",
                        maxlength: "maximum length of title should be 45"
                    }
                });

            });

        </script>

        <script>
            function checkExisting() {
                var aname = document.getElementById("ass_name").value;

                genlinks(aname)
            }
            function genlinks(ass_name) {
//            alert(ass_name);
                var data = "assname=" + ass_name + "&url=<%=parts[0]%>";
//            var data = "assname="+ass_name;

                $.ajax({
                    url: "angle_group/assignment/load_assignment.jsp",
                    type: "GET",
                    data: data,
                    dataType: "json",
                    success: loadAssignment,
                    error: onError
                });
            }

            function loadAssignment(data) {
                var asdata = data.split("#");

                document.getElementById("name").value = asdata[0];
                document.getElementById("description").value = asdata[1];
                document.getElementById("datepicker").value = asdata[2];
                document.getElementById("hour").value = asdata[3];
                document.getElementById("min").value = asdata[4];
                document.getElementById("reference_title").value = asdata[5];
                document.getElementById("referenceLink").value = asdata[6];



            }
            function onError() {
                alert("TRY AGAIN")
            }



        </script>
        <%
            out.println("<a href='/home/manushi/NetBeansProjects/angle/web/uploadedfiles'"+"<s:property value='myFileFileName'/>");
        %>
    </body>
</html>