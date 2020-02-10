<%-- 
    Document   : menu3.jsp
    Created on : 23 Jun, 2017, 10:41:12 AM
    Author     : manushi
--%>

<%@page import="bean.Person"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- side bar column starts here -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%
    String groupId = request.getParameter("groupId");
%>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="home.html" class="site_title"><i class="fa fa-paw"></i> <span>AnGLE!</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <s:if test="#session.loggedInUser != null">
            <div class="profile clearfix">
                <div class="profile_pic">
                    <img src="images/user.jpg" alt="..." class="img-circle profile_img">
                </div>
                <div class="profile_info">
                    <span>Welcome,</span>
                    <h2><s:property value="#session.loggedInUser.loginName"/></h2>
                </div>
            </div>
        </s:if>

        <!-- /menu profile quick info -->

        <br />

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">

                <ul class="nav side-menu">


                   


                    <!--    Inviting users feature  -->
                                     
                </ul>
            </div>
           

        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="fa fa-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="fa fa-arrows-alt" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="fa fa-lock" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout">
                <span class="fa fa-sign-out" aria-hidden="true"></span>
            </a>
        </div>
        <!-- /menu footer buttons -->
    </div>
</div>

<!-- side bar column ends here -->
<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <s:if test="#session.loggedInUser != null">
                    <li class="">
                        <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <img src="images/img.jpg" alt=""><s:property value="#session.loggedInUser.loginName"/>
                            <span class=" fa fa-angle-down"></span>
                        </a>
                        <ul class="dropdown-menu dropdown-usermenu pull-right">
                            <li><a onclick="changeUserProfile();"> Profile</a></li>
                            <li>
                                <a href="javascript:;">
                                    <%--<span class="badge bg-red pull-right">50%</span>--%>
                                    <span>Settings</span>
                                </a>
                            </li>
                            <li><a href="javascript:;">Help</a></li>
                            <li><a href="index.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                        </ul>
                    </li>

                    <!--notifications-->

                    <li role="presentation" class="dropdown" onclick="fetchUnreadNotifications(); markUnreadNotificationRead();">
                        <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-envelope-o"></i>
                            <span class="badge bg-green" id="NotificationCount"></span>
                        </a>
                        <ul class="dropdown-menu list-unstyled msg_list" id="Notifications" role="menu">

                            <!--list of notifications-->

                            <li>
                                <div class="text-center">
                                    <a>
                                        <strong>See All Notifications &nbsp;</strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </s:if>
            </ul>
        </nav>
    </div>
</div> 


<!-- /top navigation -->

