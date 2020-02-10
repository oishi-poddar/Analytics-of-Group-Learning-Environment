<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- side bar column starts here -->

<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="home.html" class="site_title"><i class="fa fa-paw"></i> <span>Survey!</span></a>
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
                <h3>General</h3>
                <ul class="nav side-menu">
                    <li><a href="home.html"><i class="fa fa-home"></i> Home </a>
                    </li>
                    <li><a><i class="fa fa-edit"></i> Manage Survey <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="createSurvey.html">Create Survey</a></li>
                            <li><a href="updateSurvey.html">Update Survey</a></li>
                            <li><a href="generateSurveyLinkForTesting.html">Generate Survey Links - testing only</a></li>
                        </ul>
                    </li>
                    <li><a href="surveyReports.html"><i class="fa fa-bar-chart-o"></i> Survey reports </a>                   
                    </li>
                    <li><a><i class="fa fa-desktop"></i> Send Bulk Mail <span class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="saveBulkMailTemplate.html">Existing users</a></li>
                            <li><a href="sendEmailToAnonymousUser.html">Anonymous set of emails</a></li>
                        </ul>
                    </li>
                    <li><a href="bulkMailLogs.html"><i class="fa fa-table"></i> Bulk Mail Logs </a>                    
                    </li>

                </ul>
            </div>
            <div class="menu_section">

            </div>

        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
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
                            <li><a href="javascript:;"> Profile</a></li>
                            <li>
                                <a href="javascript:;">
                                    <span class="badge bg-red pull-right">50%</span>
                                    <span>Settings</span>
                                </a>
                            </li>
                            <li><a href="javascript:;">Help</a></li>
                            <li><a href="logout.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                        </ul>
                    </li>
                </s:if>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->
