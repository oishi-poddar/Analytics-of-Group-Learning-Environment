<%-- 
    Document   : invalidUser
    Created on : 14 Mar, 2017, 10:58:10 AM
    Author     : dipesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="/include/header.jsp" %>
        <title>Survey| Invalid User List </title>
        <link href="asset/datatables/dataTables.bootstrap.min.css" rel="stylesheet">
        
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="/include/menu.jsp" %>
                <div class="right_col" role="main">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Invalid User List</h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <table id="datatable" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Email</th>
                                    <th>Reasons</th>
                                </tr>
                                </thead>
                                <tbody>
                                <s:iterator value="invalidList" var="invalidList">
                                    <tr>
                                        <td><s:property value="email"/></td>
                                        <td><s:property value="per_errormessage"/></td>
                                    </tr>                    
                                </s:iterator> 
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <%@ include file="/include/footer.jsp" %>
            </div>
        </div>     
        <%@ include file="/include/script.jsp" %>
        <script src="asset/datatables/jquery.dataTables.min.js"></script>
        <script src="asset/datatables/dataTables.bootstrap.min.js"></script>
        <script>
            $('#datatable').dataTable();
        </script>
    </body>
</html>

