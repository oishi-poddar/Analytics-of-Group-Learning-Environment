<%-- 
    Document   : ChangeUserProfile
    Created on : 19 Jun, 2017, 10:43:15 PM
    Author     : Kunal
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="bean.Person"%>
<%@page import="angle_group.AngleUtility"%>
<%
    try {
        Integer query_type = Integer.parseInt(request.getParameter("changeType"));
        String email=request.getParameter("email");
        AngleUtility utility = new AngleUtility();
        Boolean status=false;
        if(query_type==1)       //change username
        {
            String username=request.getParameter("name");
            status=utility.changeUserName(email, username);
            if(status)
            {
                //  name changed successfully
                //  changing the Person's bean class
                Person person=new Person();
                person = (Person) session.getAttribute("loggedInUser");
                person.setLoginName(username);
            }
        }
        else if(query_type==2)      //change password
        {
            String old_password=request.getParameter("old_password");
            String new_password=request.getParameter("new_password");
            status=utility.changePassword(email, old_password, new_password);
        }
        Gson gson = new Gson();
        out.println(gson.toJson(status));
    } catch (Exception c) {
        c.printStackTrace();
    }

%>
