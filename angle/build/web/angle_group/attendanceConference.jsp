<%-- 
    Document   :
    Created on : 
    Author     :  Rohit
--%>



<%@page import="utilities.Utility"%>
<%@page import="bean.Person"%>
<%@page import="angle_group.ConferenceUtility"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.AttendanceConference"%>
<%@page import="angle_group.AngleUtility"%>
<%@page import="utilities.StoreMessageInDb"%>
<%@page import="com.google.gson.Gson"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
 
    int cid = Integer.parseInt(request.getParameter("cid").toString());
    int groupId=Integer.parseInt(request.getParameter("groupId").toString());
     Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
        String email = person.getEmail();
    ArrayList<AttendanceConference> list_bean = new ArrayList<AttendanceConference>();
    System.out.println("cid="+cid);
    list_bean=new ConferenceUtility().attendanceList(cid, groupId);
    for(int i=0;i<list_bean.size();i++){
        if(list_bean.get(i).getEmail().compareTo(email)==0){
            list_bean.remove(list_bean.get(i));
        }
    }
   
  
       
        Gson gson = new Gson();
        gson.toJson(list_bean);
        out.print(gson.toJson(list_bean));

%>

