<%-- 
    Document   : gradesAnalysis
    Created on : 27 Jun, 2017, 3:26:13 PM
    Author     : manushi
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
    <script src="js/gradeAnalytics.js"></script>
    <style>
        #exTab1 .tab-content {
            color: #1e0b0b;
        }
    </style>
</head>





<div id="barchart_material1" style="width: 900px; height: 500px; margin-top: 70px;"></div>
<div id="barchart_material" style="width: 900px; height: 500px; margin-top: 70px;"></div>
<s:iterator value="listOfAllGrades">
   
    <script> name = "<s:property value="name" />";</script>
    <script> count1 = "<s:property value="count1" />";</script>
    <script> count2 = "<s:property value="count2" />";</script>
    <script> count3 = "<s:property value="count3" />";</script>
    <script>
        
        var key = name.toString();
        var temp = count1.toString();
        var temp1 = count2.toString();
        var value = temp + ":" +temp1 + ":" + count3;

        map[key] = value;
        length++;

    </script>


</s:iterator>
<s:iterator value="listOfTopicGrades">
    
    <script> name = "<s:property value="topicName" />";</script>
    <script> count3 = "<s:property value="count3" />";</script>
    <script>
        var key = name.toString();
        var value = count3.toString();

       map1[key] = value;
        length1++;

    </script>


</s:iterator>   
<script>

    if (length > 0) {



        google.charts.setOnLoadCallback(drawChart);

    }
    if(length1 > 0){
         google.charts.setOnLoadCallback(drawChart1);

    }
</script>


<%@ include file="/include/script.jsp" %>

