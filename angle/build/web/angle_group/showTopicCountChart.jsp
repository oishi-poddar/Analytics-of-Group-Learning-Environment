<%-- 
    Document   : testHome
    Created on : 1 Feb, 2017, 10:31:57 AM
    Author     : dipesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="s" uri="/struts-tags"%>

<head>


    <%@ include file="/include/script.jsp" %>
    <title>Survey| Home </title>
    <link href="asset/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript"></script>
    <script src="js/showTopicChart.js"></script>
    <style>
        #exTab1 .tab-content {
            color: #1e0b0b;
        }
    </style>
</head>




<div id="barchart_material" style="width: 900px; height: 500px; margin-top: 70px;"></div>
<s:iterator value="chartAnalysis">
    <script> topic = "<s:property value="topic" />";</script>
    <script> count = "<s:property value="count" />";</script>
    <script>

        var key = topic.toString();
        var value = count.toString();

        map[key] = value;
        length++;

    </script>


</s:iterator>
<script>

    if (length > 0) {



        google.charts.setOnLoadCallback(drawChart);

    }
</script>


<%@ include file="/include/script.jsp" %>

