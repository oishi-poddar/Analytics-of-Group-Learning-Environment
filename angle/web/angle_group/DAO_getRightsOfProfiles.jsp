<%-- 
    Document   : DAO_getRightsOfProfiles
    Created on : 7 Jun, 2017, 3:59:09 PM
    Author     : ubuntu
--%>

<%@page import="bean.Profile"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="angle_group.AngleUtility"%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%
    
    int res=0 ;
    String profileId;
    System.out.println("hello");
    profileId=request.getParameter("pid");
    System.out.println(profileId);
    AngleUtility angle = new AngleUtility();
    Profile p = (Profile)angle.getRightsByProfileId(Integer.parseInt(profileId));
    String result = String.valueOf(p.getProfileId()) +":" + p.getProfileName() + ":";
    if(p.isAcceptInvite())
    {
        result += "Accept Invite1:";
    }
    else{
        result += "Accept Invite0:";
    }
    if(p.isAnswerAssignment())
    {
        result += "Answer Assignment1:";
    }
    else{
        result += "Answer Assignment0:";
    }
    if(p.isAnswerQuiz())
    {
        result += "Answer Quiz1:";
    }
   else{
        result += "Answer Quiz0:";
    }
    if(p.isCreateAssignment())
    {
        result += "Create Assignment1:";
    }
    else{
        result += "Create Assignment0:";
    }
    if(p.isCreatePoll())
    {
        result += "Create Poll1:";
    }
    else{
        result += "Create Poll0:";
    }
    if(p.isCreateQuiz())
    {
        result += "Create Quiz1:";
    }
    else{
        result += "Create Quiz0:";
    }
    if(p.isCreateTopic())
    {
        result += "Create Topic1:";
    }
    else{
        result += "Create Topic0:";
    }
    if(p.isGradeAssignment())
    {
        result += "Grade Assignment1:";
    }
    else{
        result += "Grade Assignment0:";
    }
    if(p.isGradeQuiz())
    {
        result += "Grade Quiz1:";
    }
    else{
        result += "Grade Quiz0:";
    }
    if(p.isHideNote())
    {
        result += "Hide Note1:";
    }
    else{
        result += "Hide Note0:";
    }
    if(p.isModifyGroup())
    {
        result += "Modify Group1:";
    }
    else{
        result += "Modify Group0:";
    }
    if(p.isModifyTopics())
    {
        result += "Modify Topics1:";
    }
    else{
        result += "Modify Topics0:";
    }
    if(p.isPostNote())
    {
        result += "Post Note1:";
    }
    else{
        result += "Post Note0:";
    }
    if(p.isSendInvite())
    {
        result += "Send Invite1:";
    }
    else{
        result += "Send Invite0:";
    }
    if(p.isStartDiscussionForum())
    {
        result += "Start Discussion Forum1:";
    }
    else{
        result += "Start Discussion Forum0:";
    }
    if(p.isStartVideoChat())
    {
        result += "Start Video Chat1:";
    }else{
        result += "Start Video Chat0:";
    }
    
    if(p.isViewAssignment())
    {
        result += "View Assignment1:";
    }
    else{
        result += "View Assignment0:";
    }
    if(p.isViewGrades())
    {
        result += "View Grades1:";
    }
    else{
        result += "View Grades0:";
    }
    if(p.isViewPoll())
    {
        result += "View Poll1:";
    }
    else{
        result += "View Poll0:";
    }
    if(p.isViewQuiz())
    {
        result += "View Quiz1";
    }
    else{
        result += "View Quiz0";
    }
    System.out.println(result);
    Gson gson = new Gson();
    gson.toJson(result);
    out.print(gson.toJson(result));
%>                      