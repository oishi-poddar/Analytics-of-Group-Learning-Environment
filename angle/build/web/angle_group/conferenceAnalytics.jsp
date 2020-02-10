    <%-- 
    Document   : Analytics of Conference
    Created on : 
    Author     : Rohit
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="s" uri="/struts-tags"%>
<head>


    <link href="asset/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript"></script>
    <script src="js/conferenceAnalytics.js"></script>
    <script src="js/piechart.js"></script>


    <style>
        #exTab1 .tab-content {
            color: #1e0b0b;
        }
        .modal.modal-wide .modal-dialog {
            width: 90%;
        }
        .modal-open {
            padding-right: 0px !important;
        }
        .modal-close {
            padding-right: 0px !important;
        }

        .dropbtn {
            background-color: #4CAF50;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {background-color: #f1f1f1}

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .dropdown:hover .dropbtn {
            background-color: #3e8e41;
        }

    </style>



</head>


<s:iterator value="averageConference">
    <script> topic = "<s:property value="topic" />";</script>
    <script> timeDiff = "<s:property value="timedifference" />";</script>
    <script> noOfConf = "<s:property value="noOfParticipants" />";</script>
    <script>

        var key = topic.toString();
        var temp = timeDiff.toString();
        var value = temp + ":" + noOfConf;
        if (map[key] > 0) {
            var temp = parseInt(map[key]);
            var temp2 = parseInt(value);
            var result = temp + temp2;

            map[key] = result.toString();
        } else {
            map[key] = value;
            length++;
        }

    </script>


</s:iterator>

<script>

    if (length > 0) {
        google.charts.setOnLoadCallback(drawChart);
    }
</script>

<%@ include file="/include/script.jsp" %>
<h3 style="align-content: center">Analytics For Conference</h3>
<li id="resultshow"><a><i class="fa fa-key" aria-hidden="true"></i>Details of Conferences Attended</a></li>
<li id='average'><a><i class="fa fa-key" aria-hidden="true"></i>Details of Conference organized by you</a></li>
<li id='graph'><a><i class="fa fa-key" aria-hidden="true"></i>Bar-Graph of topic vs no of Conferences vs time devoted</a></li>
<li id='piechart'><a><i class="fa fa-key" aria-hidden="true"></i>Pie-Chart of TopicWise Attendance</a></li>
<br><br><hr>   



<!--Result-->

<div id="result"  style="display:none" class="card text-center">
    <div class="card-header" style="background-color: #F3FEBE">
        <br> <h4 class="card-title">Details Of Conferences attended</h4><br>
  </div>
  <div class="card-block">
      <br>
                <p>Total Conferences in the group: <s:property value="attendanceConferenceMember.getTotalConference()" /></p>
                <p>Total Conferences you attended:  <s:property value="attendanceConferenceMember.getConfyouAttended()" /></p>
                <p>Total Conference Duration in the group: <s:property value="attendanceConferenceMember.getTotalTimeConference()" /> Minutes</p>
                <p>Active time  :   <s:property value="attendanceConferenceMember.getTimeYouGive()" /> Minutes </p>

  </div>
  <div class="card-footer text-muted" style="background-color: #F3FEBE">
      <hr><p>Attendance:  <s:property value="attendanceConferenceMember.getAttendance()" />%</p><hr>
  </div>
</div>





<!--Average Conference Details!-->          
<div  class="toshow" style="display:none" id="div">

    <table id="logsdetails2" class="table table-striped table-bordered" style="border: 1px solid black;">

        <thead id="tablehead" name="tablehead">
            <tr style="color: #000">

                <th>Topic of Conference</th>
                <th>No of Conferences</th>
                <th>Total time Duration (Minutes)</th>
                <th>Attendance(%)</th>
                <th>Total Chats</th>
            </tr>
        </thead>
        <caption><strong>Details of Conferences Topic wise</strong></caption>
        <p id="groupId">Group Id:<s:iterator value="conferencelist" begin="0" end="0"><s:property value="groupId"/></s:iterator></p>
        <p id="totalMem"> Total Members in Your Group:<s:iterator value="conferencelist" begin="0" end="0"><s:property value="totalMember"/></s:iterator></p>
            <tbody id="mytablebody"  name="tablebody" style="color: #000;background-color:  #9FAFD1";>

            <s:iterator value="averageConference">
                <tr>

                    <td  onclick="getTopic('<s:property value="topic" />')"><button  class="btn btn-primary"><s:property value="topic" /></button></td>
                    <td><s:property value="noOfParticipants" /></td>
                    <td><s:property value="timedifference" /></td>
                    <td><s:property value="attendance" /></td>
                    <td><s:property value="chatCount" /></td>
                </tr>
            </s:iterator>
        </tbody>     
    </table>

</div>






<!--<div id="result" class="modal fade toshow" style="display:none">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Details Of Conferences attended</h4>
            </div>
            <div class="modal-body">
                <p>Total Conferences in the group: <s:property value="attendanceConferenceMember.getTotalConference()" /></p>
                <p>Total Conferences you attended:  <s:property value="attendanceConferenceMember.getConfyouAttended()" /></p>
                <p>Total Conference Duration in the group: <s:property value="attendanceConferenceMember.getTotalTimeConference()" /> Minutes</p>
                <p>Active time  :   <s:property value="attendanceConferenceMember.getTimeYouGive()" /> Minutes </p>
                <hr>
                <p>Attendance:  <s:property value="attendanceConferenceMember.getAttendance()" />%</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>-->

<!--Average TopicWise-->
<div id="averageConference" class="modal modal-wide fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Modal title</h4>
            </div>
            <div class="modal-body">

                <table id="logsdetails2" class="table table-striped table-bordered" style="border: 1px solid black;">

                    <thead id="tablehead" name="tablehead">
                        <tr style="color: #000">

                            <th>Topic of Conference</th>
                            <th>No of Conferences</th>
                            <th>Total time Duration (Minutes)</th>
                            <th>Attendance(%)</th>
                            <th>Total Chats</th>
                        </tr>
                    </thead>
                    <caption><strong>Details of Conferences Topic wise</strong></caption>
                    <p id="groupId">Group Id:<s:iterator value="conferencelist" begin="0" end="0"><s:property value="groupId"/></s:iterator></p>
                    <p> Total Members in Your Group:<s:iterator value="conferencelist" begin="0" end="0"><s:property value="totalMember"/></s:iterator></p>
                        <tbody id="mytablebody"  name="tablebody" style="color: #000;background-color:  #9FAFD1";>

                        <s:iterator value="averageConference">
                            <tr>

                                <td  onclick="getTopic('<s:property value="topic" />')"><button  class="btn btn-primary"><s:property value="topic" /></button></td>
                                <td><s:property value="noOfParticipants" /></td>
                                <td><s:property value="timedifference" /></td>
                                <td><s:property value="attendance" /></td>
                                <td><s:property value="chatCount" /></td>
                            </tr>
                        </s:iterator>
                    </tbody>     
                </table>
                <script src="asset/datatables/jquery.dataTables.min.js"></script>
                <script src="asset/datatables/dataTables.bootstrap.min.js"></script>
                <script>
                                    $('#logsdetails2').dataTable({
                                        responsive: true
                                    });
                </script>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>


<!--Conference Detailwise-->
<div id="conferenceDetails" class="modal modal-wide fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Details Of Conference Organized by you</h4>
            </div>
            <div class="modal-body">

                <table id="logsdetails4" class="table table-striped table-bordered" style="border: 1px solid black;">

                    <thead id="tablehead" name="tablehead">
                        <tr style="color: #000">

                            <th>Start Time</th>
                            <th>Stop Time</th>
                            <th>Total time Duration (Minutes)</th>
                            <th>No of Participants</th>
                            <th>Attendance(%)</th>
                            <th>Total Chats</th>
                        </tr>
                    </thead>

                    <tbody id="mytablebody"  name="tablebody" style="color: #000;background-color:  #9FAFD1";>


                    </tbody>     
                </table>



                <script src="asset/datatables/jquery.dataTables.min.js"></script>
                <script src="asset/datatables/dataTables.bootstrap.min.js"></script>
                <script>
                                    $('#logsdetails3').dataTable({
                                        responsive: true
                                    });
                </script>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>


<!--ParticipantsDetail-->
<div id="participantAttendance" class="modal modal-wide fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Participants Attendance Details</h4>
            </div>
            <div class="modal-body">



                <table id="logsdetails5" class="table table-striped table-bordered" style="border: 1px solid black;">

                    <thead id="tablehead" name="tablehead">
                        <tr style="color: #000">

                            <th>Name</th>
                            <th>Email</th>
                            <th>Attendance</th>
                            <th>Time Duration</th>
                            <th>Total Chats</th>

                        </tr>
                    </thead>

                    <tbody id="mytablebody"  name="tablebody" style="color: #000;background-color:  #9FAFD1";>


                    </tbody>     
                </table>


                <script src="asset/datatables/jquery.dataTables.min.js"></script>
                <script src="asset/datatables/dataTables.bootstrap.min.js"></script>
                <script>
                                    $('#logsdetails3').dataTable({
                                        responsive: true
                                    });
                </script>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

            </div>
        </div>  
    </div>  
</div>  




<script src="asset/datatables/jquery.dataTables.min.js"></script>
<script src="asset/datatables/dataTables.bootstrap.min.js"></script>
<script>
                                    function setValues(tempTopic, tempAttendance) {

                                        topic = tempTopic;
                                        attendance = parseFloat(tempAttendance);
                                        totalMem = parseInt('<s:iterator value="conferencelist" begin="0" end="0"><s:property value="totalMember"/></s:iterator>');

                                        getPie();

                                    }

                                    function getPie() {
//                                        topic = tempTopic;
//                                        attendance = tempAttendance;
//                                        alert(topic+" "+attendance);
                                        google.charts.setOnLoadCallback(drawChart2);
                                    }

                                    $(document).ready(function () {
                                        $("#average").click(function () {
                                            $("#div").toggle();
                                        });
                                    });

                                    $(document).ready(function () {
                                        $("#piechart").click(function () {
                                            $("#chart").toggle();
                                        });
                                    });
                                    
                                     $(document).ready(function () {
                                        $("#resultshow").click(function () {
                                            $("#result").toggle();
                                        });
                                    });

                                    $(document).ready(function () {
                                        $("#graph").click(function () {
                                            $("#bar").toggle();
                                        });
                                    });

                                    $('#conferenceDetails').on('hidden.bs.modal', function () {
                                        dataTable.fnClearTable();
                                       
//                                       
                                    })

                                    $('#participantAttendance').on('hidden.bs.modal', function () {
                                        dataTable2.fnClearTable();
//                                       
                                    })








                                    var dataTable = $('#logsdetails4').dataTable({
                                        columnDefs: [
                                            {type: 'non-empty-string', targets: 0} // define 'name' column as non-empty-string type
                                        ]
                                    });


                                    var dataTable2 = $('#logsdetails5').dataTable({
                                        columnDefs: [
                                            {type: 'non-empty-string', targets: 0} // define 'name' column as non-empty-string type
                                        ]
                                    });



                                    $('#logsdetails').dataTable({
                                        responsive: true
                                    });

                                    /*
                                     * @author rohit
                                     * @param {type} value
                                     * @returns ajax call to get Details of members present in particular conference
                                     */
                                    function getId(value) {

                                        var groupId = document.getElementById("groupId").value;

                                        var data = "cid=" + value + "&groupId=" + groupId;

                                        $.ajax({
                                            url: "angle_group/attendanceConference.jsp",
                                            type: "GET",
                                            data: data,
                                            dataType: "json",
                                            success: getList,
                                            error: onError
                                        });
                                    }

                                    function getList(data) {

                                        li = [];
                                        li.push("email");
                                        li.push("name");
                                        li.push("status");
                                        li.push("timeDifference");
                                        li.push("totalChats");
                                        for (var i = 0; i < data.length; i++) {
                                            dataTable2.api().row.add([data[i][li[1]], data[i][li[0]], data[i][li[2]], data[i][li[3]], data[i][li[4]]]).draw();
                                        }


                                        $('#participantAttendance').modal('show');
                                        $.fn.dataTable.ext.search = [];
                                        table.draw();

                                    }
                                    function onError() {
                                        // alert("errorhello");
                                    }

                                    /*
                                     * 
                                     * @param {type} value
                                     * @returns ajax call to fetch the list of conferences on particular topic
                                     */
                                    function getTopic(value) {

                                        var groupId = document.getElementById("groupId").value;

                                        var data = "topic=" + value + "&groupId=" + groupId;

                                        $.ajax({
                                            url: "angle_group/getConferenceTopicwise.jsp",
                                            type: "GET",
                                            data: data,
                                            dataType: "json",
                                            success: getList2,
                                            error: onError2
                                        });
                                    }

                                    function getList2(data) {


                                        li = [];
                                        // li.push("email");
                                        li.push("startConferenceTime");
                                        li.push("stopConferenceTime");
                                        li.push("timedifference");
                                        li.push("noOfParticipants");
                                        //li.push("totalMember");
                                        li.push("attendance");
                                        li.push("chatCount");


                                        for (var i = 0; i < data.length; i++) {
                                            dataTable.api().row.add([data[i][li[0]], data[i][li[1]], data[i][li[2]], '<button onclick=getId(' + (data[i]['id']) + '); class="btn btn-primary" >' + (data[i][li[3]]) + '</button>', data[i][li[4]], data[i][li[5]]]).draw();
                                        }
                                        $('#conferenceDetails').modal('show');

                                    }
                                    function onError2() {
                                        //alert("error");
                                    }



    </script>
    
    <!--Bar Graph-->
    <div style="width: 900px; height: 500px; margin-top: 70px; " id="bar">
        <div id="barchart_material" style="width: 900px; height: 500px; margin-top: 70px;"></div>
    </div>
    <!--Chart-->
    <br><br>
    <div style="display: none" id="chart">
        <p style="margin-left: 13%;"><strong>Choose Topics to see Attendance Chart</strong></p>
        <div class="dropdown" style="margin-left: 14%;">
            <button class="dropbtn">Topics</button>
            <div class="dropdown-content">
            <s:iterator status="averageConference" value="averageConference">
                <option onclick="setValues(this.value, '<s:property value="attendance" />');" value="<s:property value="topic" />"><a><s:property value="topic" /></a></option>
                </s:iterator>
        </div>
    </div>

    <div id="chart_div"  style="margin-left: 30%;width: 500px; height: 300px; margin-top: 70px"></div>
</div>



