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
    <script src="js/NotesAnalysis.js"></script>
    <style>
        #exTab1 .tab-content {
            color: #1e0b0b;
        }
    </style>
</head>




<h2>Total number of notes:  <s:property value="listanalytics.size"/></h2> 
<center> 
<div id="barchart_material" style="width: 900px; height: 500px; margin-top: 70px;"></div>
   
</center>
   <s:iterator value="listanalytics">
    <script> name = "<s:property value="name" />";</script>
   
    <script> count = "<s:property value="count" />";</script>
    <script>

        var key = name.toString();
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