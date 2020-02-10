<%-- 
    Document   : SearchGroup
    Created on : 6 Jun, 2017, 3:52:00 PM
    Author : Kunal
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="angle_group.AngleUtility"%>
        <%
            String groupname = request.getParameter("group");
            ArrayList<String> groups=new ArrayList<String> ();
            try
            {
                   AngleUtility utility=new AngleUtility();
                   groups=utility.searchGroup(groupname);
                   Gson gson=new Gson();
                   
                   out.println(gson.toJson(groups));                
            }
            catch(Exception c)
            {
                c.printStackTrace();
            }
            %>
   