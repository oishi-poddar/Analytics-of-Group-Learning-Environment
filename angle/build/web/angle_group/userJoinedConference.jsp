<%-- 
    Document   : 
    Created on : 
    Author     : Rohit
--%>



<%@page import="utilities.StoreMessageInDb"%>


<%@page import="angle_group.AngleUtility"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    StoreMessageInDb test = new StoreMessageInDb();
    String jid = request.getParameter("from");
    String status = request.getParameter("status").toString().trim();
    String message = request.getParameter("message");
    String topic = request.getParameter("topic");
    String starttime = request.getParameter("starttime");
    int groupId = Integer.parseInt(request.getParameter("gid"));
    String res = " from ajax ";
    
    if (status.compareTo("joined") == 0) {
        AngleUtility angleUtility = new AngleUtility();
        String info[] = angleUtility.getJoinInfo().split(":");
        String nick = info[0];
        String email = info[1];
        System.out.println(test.checkJoin(jid, email, nick, starttime, topic, message, groupId));
    } else if(status.compareTo("left") == 0){
        test.checkLeft(jid,starttime,topic);
     }
    else if(status.compareTo("message")==0){
        test.setMessage(jid, message, topic, groupId);
    }

    Gson gson = new Gson();
    gson.toJson(res);

    out.print(gson.toJson(res));
%>

