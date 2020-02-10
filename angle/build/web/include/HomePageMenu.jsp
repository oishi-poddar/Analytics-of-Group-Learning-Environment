<%-- 
    Document   : HomePageMenu
    Created on : 15 Jun, 2017, 12:56:07 PM
    Author     : sakshi
--%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- side bar column starts here -->

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

        <br/>
        

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                    <li>
                        <a onclick="showForm();"><i class="fa fa-edit"></i>Create Group</a>
                    </li>
                    <li>
                        <a onclick="joinGroupModal();"><i class="fa fa-edit"></i>Join Group</a>
                    </li>
                        <li>
                        <a onclick="hideForm();"><i class="fa fa-edit"></i>View Personal Groups</a>
                    </li>
                    <li>
                        <a onclick="showAllGroups();"><i class="fa fa-edit"></i>View All Groups</a>
                    </li>
                    
                    
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
                            <li><a onclick="showUserProfile();"> Profile</a></li>
                            <li>
                                <a href="javascript:;">
                                    <span class="badge bg-red pull-right"></span>
                                    <span>Settings</span>
                                </a>
                            </li>
                            <li><a href="javascript:;">Help</a></li>
                            <li><a href="index.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                        </ul>
                    </li>
                    <br>
                    

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
                    
                    <!--Search Groups-->   
                    <table id="groupsListMenu"> 
                        <thead>
                        <input id="search" style="float: right;" onkeyup="searchGroup(this.value)" onblur="document.getElementById('groupstbody');" type="text" name="search" placeholder="Search..">
                     </thead> 
                     
                      <tbody id="groupstbody" style="float: right; z-index:10; position: absolute; right: 16%;top: 9%">
<!--                              <div id="groups_list" style="float: right; z-index:10; position: absolute; background-color: wheat; right: 14%;top: 10%;">     -->
                      </tbody>
                    </div>
                   </table>
                </s:if>
            </ul>
        </nav>
    </div>
</div> 



<!-- /top navigation -->



<script>

/*
 * function to show User Profile and Change User Name and Password
 * @author Kunal-
 */
function showUserProfile()
{
    document.getElementById('pagination').style.display = "none";
    document.getElementById('all_groups').style.display="none";
    document.getElementById('row1').style.display = "none";
    document.getElementById('row2').style.display = "none";
    document.getElementById("userProfile").style.display = "block";
}
</script>