<%-- 
    Document   : DAO_editRoleOfMember
    Created on : 24 Jun, 2017, 2:13:19 PM
    Author     : sakshi
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="angle_group.AngleUtility"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
int userId = Integer.parseInt(request.getParameter("uid"));
int profileId = Integer.parseInt(request.getParameter("pid"));
int groupId = Integer.parseInt(request.getParameter("gid"));
AngleUtility util = new AngleUtility();
String res ="";
try{
  res = util.updateRoleOfMember(groupId,userId,profileId);  
}
catch(Exception e)
{
    System.out.println(e);
}
Gson gson = new Gson();
 gson.toJson(String.valueOf(res));
 out.print(gson.toJson(String.valueOf(res)));
  

%>