/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* *
 * author rohit
 * 
 * 
 */ var api;
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
function stopVideo()
{
    document.getElementById("video").value = "0";
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
    document.getElementById("video").value = "1";
    var d = new Date();
    var month = ("0" + (d.getMonth() + 1)).slice(-2);
    var date1 = ("0" + d.getDate()).slice(-2);
    var hour = ("0" + d.getHours()).slice(-2);
    var minute = ("0" + d.getMinutes()).slice(-2);
    var second = ("0" + d.getSeconds()).slice(-2);
    startConferenceTime = d.getFullYear() + "-" + (month) + "-" + date1 + " " + hour + ":" + minute + ":" + second;

    var domain = "meet.jit.si";

    room = document.getElementById("topic").value.toString();
    room = room.replace(/(^[\s]+|[\s]+$)/g, '');
    url = "https://meet.jit.si/" + room;

    //alert(room);
    document.getElementById("topic").disabled = true;
    var width = window.innerHeight / 3;
    var height = window.innerHeight / 2;
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

// function joined(message)
//{
//   
////    //alert("joined");
////    alert(message['id']);
////     var email = '<%= session.getAttribute("userEmail").toString() %>';
////    alert(email);
////  
////    var d = new Date();
////    var month = ("0" + (d.getMonth() + 1)).slice(-2);
////    var date1 = ("0" + d.getDate()).slice(-2);
////    date = d.getFullYear() + "-" + (month) + "-" + date1 + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
////
////    jid = message["id"];
////
////    //alert(jid);
////    mes1["date"] = date;
////    api.executeCommand('displayName', name);
////    message['nick'] = name;
////    message['room'] = document.getElementById("topic").value;
////    //genlinks(message);
//}

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

function ifReset() {
//                                                        if(document.getElementById("video").value==="1"){
//                                                           
//                                                            stopVideo();
//                                                            
//                                                        }


    $("#meet").load("VideoAnalytics.html");
}
function ifResetCharts() {
//                                                  
//                                                         if(document.getElementById("video").value==="1"){
//                                                            stopVideo();
//                                                            
//                                                        }

    $("#meet").load("conferenceAnalytics.html");
}
function ifResetTopic() {

//                                                         if(document.getElementById("video").value==="1"){
//                                                            stopVideo();
//                                                            
//                                                        }

    $("#meet").load("showTopicChart.html");
}
                                               