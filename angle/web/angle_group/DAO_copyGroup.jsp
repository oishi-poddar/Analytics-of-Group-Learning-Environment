<%-- 
    Document   : DAO_copyGroup
    Created on : 27 Jun, 2017, 2:53:53 PM
    Author     : ubuntu
--%>

<%@page import="bean.Profile"%>
<%@page import="bean.Group"%>
<%@page import="angle_group.AngleUtility"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    try 
    {   int gid = 0;
        String data = "";
        int groupId = Integer.parseInt(request.getParameter("gid"));
        String groupName = request.getParameter("gname");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa "+groupName);
        Group oldGroup = null;
        Profile profile = null;
        AngleUtility angle = new AngleUtility();
        oldGroup = angle.getGroupById(groupId);
        String desc = oldGroup.getDescription();
        profile = angle.getGroupOwner();
        gid = angle.copyGroup(groupName,oldGroup,profile);
        data = gid+":"+desc;
        System.out.println("heyy"+gid);
        Gson gson = new Gson();
        out.print(gson.toJson(data));
       
    } catch (Exception c) {
        c.printStackTrace();
    }
     
%>