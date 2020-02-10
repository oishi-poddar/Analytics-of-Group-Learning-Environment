<%-- 
    Document   : verifyConferenceAction
    Created on : Jun 6, 2017, 10:59:01 AM
    Author     : rohit and apurv
--%>

<%@page import="bean.Person"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    HttpServletRequest req = ServletActionContext.getRequest();
    String url = (req.getRequestURL()).toString();
    String parts[] = url.split("template");


%>
<!DOCTYPE html>
<html>
    <head>
            <%@ include file="../include/script.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%  String email = request.getParameter("email");
            String password = request.getParameter("password");
            String nickName = request.getParameter("nick");
            Person p = (Person) session.getAttribute("loggedInUser");
            String emailSession = p.getEmail();
           // String passwordSession=p.getPassword();
        %>
          <script>
           var email = "<%= email %>";
           var nickName = "<%=nickName%>";
           
            function sendInfo() {
         
                var data = "email=" + email + "&nickName=" + nickName ;
                //alert(data);
                $.ajax({
                    url: "angle_group/userJoinInfo.jsp",
                    type: "GET",
                    data: data,
                    dataType: "json",
                    success: setGenerateLinksForTesting3,
                    error: onError3
                });
            }
            function setGenerateLinksForTesting3(data) {
                //alert("success");
            }
            function onError3() {
                //alert("error .. ");
            }

        </script>
    </head>
    <body>
        <%
            //String passwordSession = p.getPassword().toString();

          //  out.println(emailSession);

            String topic = request.getParameter("topic");

            if (email.compareTo(emailSession)==0) {
        %>
        <script>    sendInfo();</script>
        <%
                //response.sendRedirect("https://meet.jit.si/" + topic.trim());
                 out.println("<script> window.location='https://meet.jit.si/" + topic.trim() + "'</script>");
            } else {
                out.println("<script> alert('Not Authorize to join Conference'); </script>");
                out.println("<script> window.location='verifyConference.html?topic=" + topic.trim() + "'</script>");
                   //out.println("<script> alert('hello'); </script>");
                //response.sendRedirect("verifyConference.html?topic="+topic.trim());
            }
        %>
       
    </body>

       
</html>
