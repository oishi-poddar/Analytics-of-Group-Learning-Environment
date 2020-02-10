<%-- 
    Document   : gradeAssignment
    Created on : 6 Jun, 2017, 2:53:09 PM
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
        <title>Grade Assignment</title>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="/include/menu3.jsp" %>
                <div class="right_col" role="main">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <div class="x_panel">
                                <div class="x_title">
                                    
                                   <h3> <u> Grade Assignment</u></h3>
                                    <h4> <s:property value="a.name"/></h4>
                                    <h4> <s:property value="a.datepicker"/></h4>
                                    <div class="top-left">
                                        <h4>Number of submissions: <s:property value="a.count1"/><br>
                                            Number of graded assignments: <s:property value="a.count2"/></h4>
                                    </div>


                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">



                                    <!--  <div ng-controller="knobCtrl">
                                          <ui-knob value="value" options="options"></ui-knob>
                                      </div>-->
                                    <input type="hidden" name="a.groupid" id="groupid" value="<s:property value="a.id"/>" >




                                    <div class="table-responsive">
                                        <table id="gradeTable" class="table table-striped table-bordered">
                                            <div>
                                            <thead id="tablehead" name="tablehead">
                                                <tr>

                                                    <th>Submitted By</th>
                                                    <th>Submitted On</th>
                                                    <th>Submitted File</th>
                                                    <th>Graded By</th>
                                                    <th>Grade</th>
                                                </tr>
                                            </thead>
                                            <tbody id="mytablebody"  name="tablebody">
                                                <s:iterator value="listOfStudents" status="iteratorValue">
                                                    <tr>

                                                        <td><s:property value="username" /></td>
                                                        <td><s:property value="tempDate" /></td>
                                                        <td><s:property value="submittedFile" /> 
                                                            <s:if test="submittedFile!=NULL">
                                                                <a href="<s:url value='/uploadedfiles/'/><s:property value="id"/><s:property value="uid"/><s:property value="submittedFile"/>" target="_blank">
                                                                    <i class="fa fa-file"></i>
                                                                </a>
                                                            </s:if>    
                                                        </td>
                                                        <td><s:property value="gradeBy" /></td>
                                                        
                                                        <td>
                                                            <input type="hidden" id="id_<s:property value="#iteratorValue.index"/>" value="<s:property value="id" />"/>
                                                               <!-- <input id="gradeinput_<s:property value="#iteratorValue.index"/>" onchange="toggleColor())" name="" class="col-md-4 col-sm-12 col-xs-12" placeholder="Not Graded" value="<s:property value="grade" />">
                                                              <button onclick="updateGrade('<s:property value="#iteratorValue.index"/>');">Grade</button>-->
                                                            <s:if test="grade==NULL">

                                                                <input id="<s:property value="#iteratorValue.index"/>" name="gradeinput"  class="col-md-4 col-sm-12 col-xs-12" placeholder="Not Graded" value="<s:property value="grade" />">
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-sm"onclick="submitGrade(<s:property value="id"/>,<s:property value="uid"/>,<s:property value="#iteratorValue.index"/>);">GRADE</button> 
                                                            </s:if>
                                                            <s:else>

                                                                <input id="<s:property value="#iteratorValue.index"/>" name="gradeinput" oninput="toggleColor(this.value,<s:property value="#iteratorValue.index"/>);" class="col-md-4 col-sm-12 col-xs-12" placeholder="Not Graded" value="<s:property value="grade" />">
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit"  class="btn btn-sm"onclick="submitGrade(<s:property value="id"/>,<s:property value="uid"/>,<s:property value="#iteratorValue.index"/>);">UPDATE </button> 
                                                            </s:else>


                                                        </td>
                                                    </tr>
                                                </s:iterator>
                                            </tbody>
                                            </div>
                                        </table>
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
        <!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/3.5.10/d3.min.js"></script>
        <script src="js/ng-knob.min.js"></script>
        <script>
                                        var app = angular.module('KnobDemoApp', ['ui.knob'])
                                        app.controller('knobCtrl', function ($scope) {
                                            $scope.value = 65;
                                            $scope.options = {
                                                size: 300
                                                        //other options
                                            };
                                        });
        </script>-->
        <script>
            function submitGrade(aid,uid,val)
            {
               
                document.getElementById(val).style.borderColor = "green";
                var grade = document.getElementById(val).value;
                var data = "Gradedby="+ <%=userId%> + "&StudentId=" + uid + "&grade=" + grade +"&aid=" + aid;
               // alert(data);
                $.ajax({
                    url: "angle_group/submitGrade.jsp",
                    type: "GET",
                    data: data,
                    dataType: "json",
                    success: gradingSuccess,
                    error: gradingError
                });


            }
            function gradingSuccess(data) {
               if(data==true){
                   //alert(data);
                location.reload();
            }
               

            }
            function gradingError(data) {
                               
                $.alert({
                    title: 'NOT Done',
                    content: ''
                });

            }


            function toggleColor(val, val1) {
                //alert("hi");

                document.getElementById(val1).style.borderColor = "blue";
            }


        </script>

    </body>
</html>
