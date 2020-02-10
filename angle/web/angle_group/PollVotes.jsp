<%-- 
    Document   : PollVotes
    Created on : 26 Jun, 2017, 1:18:35 PM
    Author     : Kunal & Pratik

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="s" uri="/struts-tags"%>
<head>

    <link href="asset/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
<!--    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>-->
    <script type="text/javascript"></script>
    <script src="js/pollVotes.js"></script>
    <style>
        #exTab1 .tab-content {
            color: #1e0b0b;
        }
    </style>
</head> 


<div id="barchart_material" style="width: 1000px; height: 500px; margin-top: 70px"></div>
<s:iterator value="poll">
    <script> question = "<s:property value="question" />";</script>
    <script> voters = "<s:property value="votersCount" />";</script>
    <script> nonVoters = "<s:property value="nonVotersCount" />";</script>
    <script>
        var key = question.toString();
        var value = voters;
        map[key] = value;
        var value1 = nonVoters;
        map1[key] = value1;
        length++;
    </script>
</s:iterator>
    
<script>

        google.charts.setOnLoadCallback(drawChart);

    
</script>

<%@ include file="/include/script.jsp" %>
