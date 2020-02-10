<%-- 
    Document   : new_layout
    Created on : 24 Jan, 2017, 5:48:30 PM
    Author     : abinaya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
    <tiles:insertAttribute name="head" flush="false"/>
    <tiles:insertAttribute name="header"/>	
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <tiles:insertAttribute name="sidebar" />
                <div class="right_col" role="main">                   	 
                    <tiles:insertAttribute name="body"/>	
                </div>
            </div> 
        </div>
        <tiles:insertAttribute name="common_script" />
    </body>
</html>