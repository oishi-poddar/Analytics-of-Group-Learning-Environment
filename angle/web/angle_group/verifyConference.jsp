<%-- 
    Document   : conferenceAnalytics
    Created on : 2 Jun, 2017, 3:19:05 AM
    Author     : apurv and Rohit
--%>

<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Verify</title>

       
    </head>
    <body>
        <div class="container">
            <h2>Video Conference</h2>
            
            <form action="verifyConferenceAction.html?topic=+<%=request.getParameter("topic")%>" method="post">
                <div class="form-group">
                    <label for="nick">NickName:</label>
                    <input type="nick" class="form-control" id="nick" placeholder="Nick Name" name="nick">
                </div>
                 <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                </div>
<!--                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                </div>-->
               
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>

    </body>
</html>
