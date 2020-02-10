<%-- 
    Document   : groupDiscusion
    Created on : 25 Jun, 2017, 2:58:25 AM
    Author     : Chirag
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="s" uri="/struts-tags"%>

<head>


    <title>Survey| Home </title>
    <link href="asset/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">

</head>
    <style>

        #exTab1 .tab-content {
            color: #1e0b0b;
        }
        .modal.modal-wide .modal-dialog {
            width: 90%;
        }
        /*  .modal-wide .modal-body {
              overflow-y: auto;
          }*/

        /* irrelevant styling */


    </style>
<body>
    <table id="logsdetails" class="table table-striped table-bordered" style="border: 1px solid black;">
            <div>
                <h4 class="modal-title"> <b>User Details</b></h4>
            </div>
        <thead id="tablehead" name="tablehead">
            <tr style="color: #000">
                <th>Posts</th>
                <th>Posted By</th>
                <th>Users Participated</th>
                <th>Users Not Participated</th>
                <th>Posted On</th>
                <th>Last Post On</th>
                <th>Number Of Replies</th>


            </tr>
        </thead>
        <tbody id="mytablebody"  name="tablebody" style="color: #000;background-color:  #9FAFD1";>

            <s:iterator value="chartAnalysis">
                <tr>
                    <td onclick="getDetails('<s:property value="queryId" />')"><button  class="btn btn-primary"><s:property value="query" /></button></td>
                    <td><s:property value="userName" /></td>
                    <td><s:property value="numberOfUsers" /></td>
                    <td><s:property value="noParticipants" /></td>
                    <td><s:property value="time"
                                /></td>
                    <td><s:property value="lastTime" /></td>
                    <td><s:property value="replies" /></td>


                </tr>
            <input type="hidden" value="<s:property value="queryId" />" id="queryId">
        </s:iterator>

        </tbody>     


    </table>


    <div id="UserDetails" class="modal modal-wide fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">User Details</h4>
            </div>
            <div class="modal-body">
                     <table id="logs" class="table table-striped table-bordered" style="border: 1px solid black;">

                        <thead id="tablehead" name="tablehead">
                            <tr style="color: #000">
                                <th>User Name</th>
                                <th>Email</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody id="mytablebody"  name="tablebody" style="color: #000;background-color:  #9FAFD1";>


                        </tbody>     


                    </table>


               

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

            </div>
        </div>  
    </div>  
</div>  
    
    
    

</body>
<%@ include file="/include/script.jsp" %>
<script src="asset/datatables/jquery.dataTables.min.js"></script>
<script src="asset/datatables/dataTables.bootstrap.min.js"></script>
<script>
                    $('#logsdetails').dataTable({
                        responsive: true
                    });
                    function getDetails(pid)
                    {
                       


                        var data = "postId=" + pid;

                        $.ajax({
                            url: "angle_group/getUserDetails.jsp",
                            type: "GET",
                            data: data,
                            dataType: "json",
                            success: getList2,
                            error: onError2
                        });
                    }

                    function getList2(data) {

                   
                        li = [];

                        li.push("userName");
                        li.push("email");
                        li.push("status");


                      
                        for (var i = 0; i < data.length; i++) {
                            dataTable2.api().row.add([data[i][li[0]], data[i][li[1]], data[i][li[2]]]).draw();
                    
                        }
                        
                        $('#UserDetails').modal('show');
                        $('#UserDetail').on('hidden.bs.modal', function () {      
                            dataTable2.fnClearTable();                                      
                            })
                    }
                    function onError2() {
                        alert("error");
                    }
                    $('#logs').dataTable({
                        responsive: true
                    });
                      var dataTable2 = $('#logs').dataTable({
                                        columnDefs: [
                                            {type: 'non-empty-string', targets: 0} // define 'name' column as non-empty-string type
                                        ]
                                    });
</script>

<%@ include file="/include/script.jsp" %>
