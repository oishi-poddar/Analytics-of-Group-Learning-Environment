<%-- 
    Document   : jforum
    Created on : 22 Jun, 2017, 10:45:56 AM
    Author     : chirag
--%>

<%@page import="bean.Group"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<html>
    <body style="background-color:#000000;">
          <s:property value="g.groupName"/>   
          <s:property value="g.description"/>
          <input type="hidden" value="<s:property value="g.groupId"/>" id="we"/>
    <script> var val = document.getElementById('we').value;</script>

        <%  String name = (String) request.getAttribute("g.groupName");
            String desc = (String) request.getAttribute("g.description");
        %> 

    
    <%@ include file="../include/script.jsp" %>
    
    <script>
        var name = '<%= name%>';
        var desc = '<%= desc%>';
        var abc = val;
        var link = 'http://localhost:8080/test/newcategory.jsp?category=' + name + '&desc=' + desc + '&id=' + abc;
        window.location = link;
    </script>
    </body>
</html>
