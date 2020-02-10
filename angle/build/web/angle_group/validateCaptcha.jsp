<%-- 
    Document   : validateCaptcha
    Created on : 8 Mar, 2011, 5:40:41 PM
    Author     : rkjangir
--%>
<%@page contentType="text/json" pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>
<%@ page import="nl.captcha.Captcha" %>

<% 
    System.out.println("hello i m here");
    Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
    String answer = request.getParameter("answer");
    String res="";
    if (captcha.isCorrect(answer)) { 
        res="true";
     } else {
        res="false";
    }
        
        System.out.println("result="+res);
      Gson gson = new Gson();
    gson.toJson(res);

    out.print(gson.toJson(res));
%>