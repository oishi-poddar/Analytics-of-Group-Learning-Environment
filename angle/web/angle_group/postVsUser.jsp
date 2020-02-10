<%-- 
    Document   : postVsUser
    Created on : 27 Jun, 2017, 11:53:27 AM
    Author     : Chirag
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
    <script src="js/showPostsVsUsers.js"></script>
    <style>
        #exTab1 .tab-content {
            color: #1e0b0b;
        }
    </style>
</head>




<div id="barchart_material" style="width: 900px; height: 500px; margin-top: 70px;">
 <s:iterator value="userInfo">
    <script> User = "<s:property value="postedBy" />";</script>
    <script> Posts = "<s:property value="postCount" />";</script>
    <script>

        var key = User.toString();
        var value = Posts.toString();

        map[key] = value;
        length++;

    </script>


</s:iterator>
</div>    
    
    
<script>

    if (length > 0 ) {



        google.charts.setOnLoadCallback(drawChart);

    }
</script>


<%@ include file="/include/script.jsp" %>
