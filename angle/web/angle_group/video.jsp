<%-- 
    Document   : conferenceAnalytics
    Created on : 2 Jun, 2017, 3:19:05 AM
    Author     : apurv and Rohit
--%>
<%-- 
    Document   : verifyConferenceAction
    Created on : Jun 6, 2017, 10:59:01 AM
    Author     : rohit and apurv
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="bean.UserNameEmails"%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="https://meet.jit.si/external_api.js"></script>
        <script>
            var api;
            var copy;

            var info = "";
            var name = "";
            var email = "";
            var date = "";
            var noOfParticipants;
            var startConferenceTime;
            var stopConferenceTime;
            var room;
            var url;
            var gid;
            function stopVideo()
            {
                var d = new Date();
                var month = ("0" + (d.getMonth() + 1)).slice(-2);
                var date1 = ("0" + d.getDate()).slice(-2);
                var hour = ("0" + d.getHours()).slice(-2);
                var minute = ("0" + d.getMinutes()).slice(-2);
                var second = ("0" + d.getSeconds()).slice(-2);
                stopConferenceTime = d.getFullYear() + "-" + (month) + "-" + date1 + " " + hour + ":" + minute + ":" + second;
                //alert(stopConferenceTime);
                noOfParticipants = api.getNumberOfParticipants();
                //alert(noOfParticipants);
                api.executeCommand("hangup");
                api.dispose();
                document.getElementById("video").disabled = false;
                var data = {message: '404', nick: '404', from: '404'};
                document.getElementById("topic").disabled = false;
                document.getElementById("topic").value = room;
                document.getElementById("topic").placeholder = "Topic Name";
                genlinks2();
                // genlinks(data);
            }
          
        </script>
    </head>
    <body onload="">
        

        <div>
            <select id="topic">
                <s:iterator status="listOfTopics" value="listOfTopics">
                    <option value="<s:property value='name'/>"><s:property value='name'/></option>
                </s:iterator>

            </select>
            <button onclick="video()" id="video">
                <img src="https://maxcdn.icons8.com/Android/PNG/24/Photo_Video/video_call-24.png" title="Video Call" width="35" height="30"></button>
            <button onclick="stopVideo()" id="stop" value="0">
                <img src="https://maxcdn.icons8.com/iOS7/PNG/25/Mobile/no_video_filled-25.png" title="No Video Filled" width="35" height="30"></button>
            <a href="VideoAnalytics.html" target="go1">
                <button type="button" class="btn btn-info btn-lg" id="analytics" onclick="disable()" value="0">
                    <img src="https://maxcdn.icons8.com/iOS7/PNG/25/Data/bar_chart_filled-25.png" title="Bar Chart Filled" width="25" height="25">
                </button>
            </a>
            <a href="conferenceAnalytics.html" target="go1">
                <button type="button" class="btn btn-info btn-lg" id="analytics" onclick="disable()" value="0">
                    <img src="https://maxcdn.icons8.com/iOS7/PNG/25/Data/bar_chart_filled-25.png" title="Bar Chart Filled" width="25" height="25">
                </button>
            </a>
              <a href="showTopicChart.html" target="go1">
                <button type="button" class="btn btn-info btn-lg" id="analytics" onclick="disable()" value="0">
                    <img src="https://maxcdn.icons8.com/iOS7/PNG/25/Data/bar_chart_filled-25.png" title="Bar Chart Filled" width="25" height="25">
                </button>
            </a>
        </div>
       
        <iframe  id="frame" name="go1" style="width: 1550px; height: 850px;" src="" frameborder="0"></iframe>   
        <script>
            alert("hello");
            function disable() {

                var val = document.getElementById("analytics").value;
                if (val.match("0")) {
                    window.open('VideoAnalytics.html', 'go1');
                    document.getElementById("analytics").value = "1";
                } else {
                    window.location.reload();
                }



            }
            window.onload = stop;


            function video() {
                alert("likk");
                alert("<%= session.getAttribute("loggedInUser").toString()%>");
                var d = new Date();
                var month = ("0" + (d.getMonth() + 1)).slice(-2);
                var date1 = ("0" + d.getDate()).slice(-2);
                var hour = ("0" + d.getHours()).slice(-2);
                var minute = ("0" + d.getMinutes()).slice(-2);
                var second = ("0" + d.getSeconds()).slice(-2);
                startConferenceTime = d.getFullYear() + "-" + (month) + "-" + date1 + " " + hour + ":" + minute + ":" + second;

                var domain = "meet.jit.si";

                room = document.getElementById("topic").value;
                
                url="https://meet.jit.si/"+room;
               
                //alert(room);
                document.getElementById("topic").disabled = true;
                var width = window.innerHeight/3;
                var height = window.innerHeight/2;
                var htmlElement = document.querySelector('#meet');


                document.getElementById("video").disabled = true;
                api = new JitsiMeetExternalAPI(domain, room, width, height, htmlElement);

                //api.executeCommand('email',document.getElementById("email").value());
                //var numberOfParticipants = api.getNumberOfParticipants();
                api.addEventListeners({
                    incomingMessage: messageIncoming,
                    participantJoined: joined,
                    participantLeft: left});
//                api.addEventListener("participantJoined", joined);
//                api.addEventListener("incomingMessage", messageIncoming);
//                api.addEventListener("participantLeft", left);
//               

            }

            function joined(message)
            {   
                alert("joined");
                alert(message['id']);
               var email= "<%= session.getAttribute("userConf").toString()%>";
//                alert(email);
                    alert(email);
                var d = new Date();
                var month = ("0" + (d.getMonth() + 1)).slice(-2);
                var date1 = ("0" + d.getDate()).slice(-2);
                date = d.getFullYear() + "-" + (month) + "-" + date1 + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();

                jid = message["id"];

                //alert(jid);
                mes1["date"] = date;
                api.executeCommand('displayName', name);
                message['nick'] = name;
                message['room'] = document.getElementById("topic").value;
                //genlinks(message);
            }
            function left(message)
            {
                var d = new Date();
                var month = ("0" + (d.getMonth() + 1)).slice(-2);
                var date1 = ("0" + d.getDate()).slice(-2);
                var endtime = d.getFullYear() + "-" + (month) + "-" + date1 + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
                jid = message['id'];
                message["date"] = date;
                message['nick'] = name;
                message['room'] = document.getElementById("topic").value;
                //genlinks(message);
            }
            function messageIncoming(message) {
                message['room'] = document.getElementById("topic").value;
                genlinks(message);
            }

            function genlinks(mes) {
                info = mes['message'];
                email = mes['nick'] + "@gmail.com";

                var data = "mes=" + mes['message'] + "&nick=" + mes['nick'] + "&from=" + jid + "&topic=" + mes['room'] + "&starttime=" + date + "&username=" + name + "&email=" + email + "&url=<%=parts[0]%>";
                //alert(data);
                $.ajax({
                    url: "angle_group/videoUpload.jsp",
                    type: "GET",
                    data: data,
                    dataType: "json",
                    success: setGenerateLinksForTesting,
                    error: onError
                });
            }
            function setGenerateLinksForTesting(data) {
                //alert("success");
            }
            function onError() {
                //alert("error .. ");
            }
            function genlinks2() {


                var data = "start=" + startConferenceTime + "&stop=" + stopConferenceTime + "&email=" + email + "&topic=" + room + "&noOfParticipants=" + noOfParticipants + "&url=<%=parts[0]%>";
                //alert(data);
                $.ajax({
                    url: "angle_group/conferenceSave.jsp",
                    type: "GET",
                    data: data,
                    dataType: "json",
                    success: setGenerateLinksForTesting2,
                    error: onError2
                });
            }
            function setGenerateLinksForTesting2(data) {
                // alert("success");
            }
            function onError2() {
                //alert("error .. ");
            }



        </script>





        <script src="js/jquery.min.js"></script>


        <%
            Person p = (Person) session.getAttribute("loggedInUser");
            String name = p.getLoginName();
            String email = p.getEmail();
        %>
        <script>
            name = '<%= name%>';
            email = '<%= email%>';
        </script>
        <%
             email = request.getParameter("email");
             out.println("alert("+email+");");
        %>

        
    </body>
</html>


 