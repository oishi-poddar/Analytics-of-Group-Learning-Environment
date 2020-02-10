<%-- 
    Document   : pollUsers
    Created on : 26 Jun, 2017, 1:18:35 PM
    Author     : Kunal & Pratik
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="s" uri="/struts-tags"%>
<head>


    <link href="asset/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <!--<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>-->
    <script type="text/javascript"></script>
    <script src="js/pollUsers.js"></script>
    <style>
        #exTab1 .tab-content {
            color: #1e0b0b;
        }
    </style>
</head>
<input type="hidden" id="pollCount" value='<s:property value="totalPolls"/>' >
<div id="barchart_material" style="width: 1000px; height: 500px; margin-top: 70px"></div>
<s:iterator value="userVsVotes">
    <script> userId = "<s:property value="key" />";</script>
    <s:iterator value="value">
        <script> userName = "<s:property value="key" />";</script>
        <script> userVote = "<s:property value="value" />";</script>
    </s:iterator>
    <script>
        var key = userId;
        var value1 = userName.toString();
        var value = userVote;
        map[key] = value;
        map1[key] = value1;
        length++;
    </script>
</s:iterator>
    
<script>

        google.charts.setOnLoadCallback(drawChart);

    
</script>

<%@ include file="/include/script.jsp" %>
