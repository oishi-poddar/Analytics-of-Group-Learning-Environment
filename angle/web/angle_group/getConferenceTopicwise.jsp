<%-- 
    Document   :
    Created on : 
    Author     :  Rohit
--%>



<%@page import="bean.ConferenceDetails"%>
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
    
    String topic = request.getParameter("topic").toString();
    int groupId = Integer.parseInt(request.getParameter("groupId").toString());
    Person person = (Person) session.getAttribute(Utility.USER_HANDLE);
    String email = person.getEmail();
    ArrayList<ConferenceDetails> list_bean = new ArrayList<ConferenceDetails>();
    ArrayList<ConferenceDetails> tempList = new ArrayList<ConferenceDetails>();
    tempList = new ConferenceUtility().conferenceList(email, groupId);
    
    for(int i=0;i<tempList.size();i++){
        if(tempList.get(i).getTopic().compareTo(topic)==0){
            list_bean.add(tempList.get(i));
        }
    }
    
        
    Gson gson = new Gson();
    gson.toJson(list_bean);
    out.print(gson.toJson(list_bean));

%>

