<!-- 
    Document   : conferenceAnalytics
    Created on : 2 Jun, 2017, 3:19:05 AM
    Author     : apurv-->



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="s" uri="/struts-tags"%>

<head>


    <title>Survey| Home </title>
    <link href="asset/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <style>
        #exTab1 .tab-content {
            color: #1e0b0b;
        }
    </style>
</head>

<table id="logsdetails" class="table table-striped table-bordered" style="border: 1px solid black;">

    <thead id="tablehead" name="tablehead">
        <tr style="color: #000">
            <th>Topic</th>
            <th>Email</th>
            <th>Jid</th>
            <th>Nickname</th>
            <th>GroupId</th>
            <th>Message</th>
            <th>Time</th>



        </tr>
    </thead>
    <tbody id="mytablebody"  name="tablebody" style="color: #000;background-color:  #9FAFD1";>

        <s:iterator value="">
            <tr>
                <td><s:property value="topic" /></td>
                <td><s:property value="email" /></td>
                <td><s:property value="Jid" /></td>
                <td><s:property value="NickName" /></td>
                <td><s:property value="groupId" /></td>
                <td><s:property value="Message" /></td>
                <td><s:property value="TimeDifference" /></td>



            </tr>

        </s:iterator>

    </tbody>     


</table>
<button onclick="add()"></button>

<%@ include file="/include/script.jsp" %>
<script src="asset/datatables/jquery.dataTables.min.js"></script>
<script src="asset/datatables/dataTables.bootstrap.min.js"></script>
<script>
    $('#logsdetails').dataTable({
        responsive: true
    });
    var dataTable = $('#logsdetails').dataTable({
    columnDefs: [
       {type: 'non-empty-string', targets: 0} // define 'name' column as non-empty-string type
    ]
    });
    function add(){
        
        dataTable.api().row.add(['John Smith', 'Intern', 'San Francisco', 19, 2011/05/25, 62000]).draw();
    }
    
</script>

<%@ include file="/include/script.jsp" %>

