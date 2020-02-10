<%-- 
    Document   : toppersAnalysis
    Created on : 27 Jun, 2017, 11:41:03 AM
    Author     : manushi
--%>

<%@page import="bean.Person"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpServletRequest req = ServletActionContext.getRequest();
    String url = (req.getRequestURL()).toString();
    String parts[] = url.split("template");
    Person p = new Person();
    p = (Person) session.getAttribute("loggedInUser");
    int userId = p.getLoginId();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="/include/header.jsp" %>
        <title>Analytics</title>
    </head>
    <div align="center"><u> <h3>Toppers of Each Assignment</h3></u></div>
    <div class="table-responsive">
        <table id="gradeTable" class="table table-striped table-bordered">
            <thead id="tablehead" name="tablehead">
                <tr>

                    <th>Assignment</th>
                    <th>Given By</th>
                    <th>Highest Grade Obtained By</th>
                    <th>Highest Grade</th>
                </tr>
            </thead>
            <tbody id="mytablebody"  name="tablebody">
                <s:iterator value="listOfToppers" status="iteratorValue">
                    <tr>

                        <td><s:property value="name" /></td>
                        <td><s:property value="gradeBy" /></td>
                        <td><s:property value="username" /></td>
                        <td><s:property value="grade" /></td>
                    </tr>
                </s:iterator>
            </tbody>
        </table>
    </div>  






    <%@ include file="/include/script.jsp" %>





