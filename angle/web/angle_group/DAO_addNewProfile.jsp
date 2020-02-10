<%-- 
    Document   : DAO_addNewProfile
    Created on : 10 Jun, 2017, 2:08:39 AM
    Author     : ubuntu
--%>


<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="bean.Profile"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="angle_group.AngleUtility"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>

<%
    String profileName = request.getParameter("profileName");
    String rightsOfProfile = request.getParameter("rights");
    int i,res=0;
    String temp="";
    Profile profile = new Profile();
    StringBuilder sb = new StringBuilder();
    sb.append(rightsOfProfile);
    String s[] = rightsOfProfile.split(":");
    Map<String,String> rights_values=new HashMap();
    for(i=0;i<s.length;i++)
    {
        System.out.println(s[i]);
       rights_values.put(s[i], s[i]);
       
    }
    for(String key : rights_values.keySet())
    {
       String str = rights_values.get(key);
       String rht = str.substring(0, str.length() - 1);
        int val = Integer.parseInt(str.substring(str.length() - 1));
       System.out.println(rht);
        System.out.println(val);
     
      if(rht.equals("Accept Invite"))
      {
          profile.setAcceptInvite(val != 0);
      }
      else if(rht.equals("Answer Assignment"))
      {
          profile.setAnswerAssignment(val != 0);
      }
       else if(rht.equals("Answer Quiz"))
      {
          profile.setAnswerQuiz(val != 0);
      }
        else if(rht.equals("Create Assignment"))
      {
          profile.setCreateAssignment(val != 0);
      }
        else if(rht.equals("Create Poll"))
      {
          profile.setCreatePoll(val != 0);
      }
        else if(rht.equals("Create Quiz"))
      {
          profile.setCreateQuiz(val != 0);
      }
        else if(rht.equals("Create Topic"))
      {
          profile.setCreateTopic(val != 0);
      }
        else if(rht.equals("Grade Assigment"))
      {
          profile.setGradeAssignment(val != 0);
      }
       else if(rht.equals("Grade Quiz"))
      {
          profile.setGradeQuiz(val != 0);
      }
      else if(rht.equals("Hide Note"))
      {
          profile.setHideNote(val != 0);
      }
      else if(rht.equals("Modify Group"))
      {
          profile.setModifyGroup(val != 0);
      }
      else if(rht.equals("Modify Topics"))
      {
          profile.setModifyTopics(val != 0);
      }
    else if(rht.equals("Post Note"))
      {
          profile.setPostNote(val != 0);
      }
    else if(rht.equals("Send Invite"))
      {
          profile.setSendInvite(val != 0);
      }
    else if(rht.equals("Start Discussion Forum"))
      {
          profile.setStartDiscussionForum(val != 0);
      }
       else if(rht.equals("Start Video Chat"))
      {
          profile.setStartVideoChat(val != 0);
      }
     else if(rht.equals("View Assignment"))
      {
          profile.setViewAssignment(val != 0);
      }
      else if(rht.equals("View Grades"))
      {
          profile.setViewGrades(val != 0);
      }
      else if(rht.equals("View Polls"))
      {
          profile.setViewPoll(val != 0);
      }
      else if(rht.equals("View Quiz"))
      {
          profile.setViewQuiz(val != 0);
      }
      
    }  
    profile.setProfileName(profileName);
    System.out.println("invite:"+profile.isAcceptInvite());
    System.out.println(profile.isAnswerAssignment());
    System.out.println("quiz"+profile.isGradeQuiz());
     AngleUtility angle = new AngleUtility();
    try {
        temp = angle.addNewProfile(profile);
    } catch (Exception e) {
        System.out.println(e);
    }
    
    //System.out.println("return the cvalueaca ad asd " + temp);
    Gson gson = new Gson();
    gson.toJson(String.valueOf(temp));
    out.print(gson.toJson(String.valueOf(temp)));

%>