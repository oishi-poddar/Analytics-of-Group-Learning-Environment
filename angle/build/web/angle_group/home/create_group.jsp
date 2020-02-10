<%-- 
    Document   : create_group
    Created on : 21 May, 2017, 10:25:48 PM
    Author     : ubuntu
--%>

<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
     HttpServletRequest req = ServletActionContext.getRequest();
    String url = (req.getRequestURL()).toString();
    String parts[] = url.split("template");
    System.out.println((parts[0]));

%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ include file="/include/header.jsp" %>
    
    <title>ANGLE </title>
</head>
<body class="nav-md">
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <div class="navbar nav_title" style="border: 0;">
                        <a href="home.html" class="site_title"><i class="fa fa-paw"></i> <span>ANGLE!</span></a>
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
                        <s:if test="#session.loggedInUser.roleId == 2">
                            <div class="menu_section">
                                <h3>General</h3>
                                <ul class="nav side-menu">
                                    <li><a><i class="fa fa-home"></i> GROUPS <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <s:iterator value="group_list">
                                                <li><a> <label onclick="GoTo('<s:property value="id"/>','<s:property value="groupCode"/>'); clearModal();"> <s:property value="groupName"/> </label>  <label onclick="editGroup('<s:property value="groupName"/>', '<s:property value="id"/>')" data-toggle="modal" data-target="#updateModal" class="identifyingClass"> <i class="fa fa-edit"></i></label> </a></li>
                                                        </s:iterator>
                                        </ul>
                                    </li>

                                    <li><a><i class="fa fa-edit"></i> Manage Groups <span class="fa fa-chevron-down"></span></a>
                                        <ul class="nav child_menu">
                                            <li><a href="createSurvey.html">Delete Groups</a></li>
                                            <li><a href="updateSurvey.html">Update Groups</a></li>

                                        </ul>
                                    </li>
                                    <!--
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
                                    -->
                                </ul>
                            </div>
                        </s:if>
                        <%--<s:if test="#session.loggedInUser.roleId == 1">--%>
                            Student Account
                        <%--</s:if>--%>




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
                                <li class="" >
                                    <table>
                                        <tr>
                                            <td>
                                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                    <img src="images/img.jpg" alt="">Notification
                                                    <span class=" fa fa-angle-down"></span>
                                                </a>                                                
                                                <ul class="dropdown-menu dropdown-usermenu pull-right">
                                                    <s:iterator value="notificationList">
                                                        <li><a> <label> <s:property value="title"/> </label> <br> <label> <s:property value="content"/> </label> </a></li>
                                                    </s:iterator>
                                                </ul>
                                            </td>
                                            <td>
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

                                            </td>
                                        </tr>                                                                                
                                    </table>
                                </li>
                            </s:if>
                        </ul>
                    </nav>
                </div>
            </div> 

            <div class="right_col" role="main">
                <%--<s:if test="#session.loggedInUser.roleId == 2">--%>
                    <button type="button" onclick="clearModal();" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Create Groups</button>
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">   
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Create Groups</h4>
                                </div>
                                <div class="modal-body">
                                    <form id="createGroup" name="createGroup" data-parsley-validate  method="post" action="create_group.html">
                                        <input type="hidden" name="owner" id="hiddenUserId" value="<s:property value="#session.loggedInUser.loginId"/>">
                                        <label for="groupname">Group Name * :</label>
                                        <input type="text" id="groupname" class="form-control" name="g.groupName" onblur="checkExisting(this.value);" required/>
                                        <div id="link_div" class="form-group">
                                        </div>
                                        <span id="groupError" style="display:none;color:red"> </span>
                                        <label>Group Status *:</label>
                                        <p>
                                            Locked:
                                            <input type="radio" class="flat" name="g.status" id="genderM" value="1" checked="" required /> 
                                            Unlocked:
                                            <input type="radio" class="flat" name="g.status" id="genderF" value="0" />
                                        </p>

                                        <label for="heard">Subject Area *:</label>
                                        <select id="heard" class="form-control" required>
                                            <option value="">Choose..</option>
                                            <option value="maths">Mathematics</option>
                                            <option value="computer">Computer Technology</option>
                                            <option value="arts">Creative Arts</option>
                                            <option value="medical">Medical</option>
                                            <option value="health">Physical Health</option>
                                        </select>

                                        <label for="message">Description(20 chars min, 100 max) :</label>
                                        <textarea id="message" required="required" class="form-control" name="g.message" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                                                  data-parsley-validation-threshold="10"></textarea>

                                        <br/>
                                        <button type="submit" id="Button" class="btn btn-primary">Create Group</button>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div id="updateModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">&times;</button>
                                    <h3 class="modal-title">Edit Group Details</h3>
                                </div>
                                <div class="modal-body">
                                    <form id="demo-form" data-parsley-validate  method="post" action="edit_group.html">
                                        <input type="hidden" name="id" id="hiddenId" value="" />
                                        <input type="hidden" name="owner" id="hiddenUserId" value="<s:property value="#session.loggedInUser.loginId"/>">
                                        <label for="groupname">Group Name * :</label>
                                        <input type="text" id="groupname1" class="form-control" name="name" onblur="checkExisting(this.value);" required/>
                                        <div id="link_div1" class="form-group">
                                        </div>
                                        <span id="groupError" style="display:none;color:red"> </span>
                                        <p class="text-warning">
                                            <small>If you don't save, your changes will be lost.</small>
                                        </p>
                                        <button type="submit" id="Button1" class="btn btn-primary">Save Changes</button>

                                    </form>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                </div>
                            </div>
                        </div>
                    </div>   
                <%--</s:if>--%>
            </div>
            <%@ include file="/include/footer.jsp" %>
        </div>
    </div>     
    <%@ include file="/include/script.jsp" %>

    <script>
            
        function editGroup(gname, gid)
        {
            document.getElementById("groupname1").value = gname;
            document.getElementById("hiddenId").value = gid;
        }
        function GoTo(gid,gcode)
        {
            window.open('groupTopics.html?id=' + gid + "&groupCode=" + gcode, '_blank');
        }
        function set(value) {
            if (value == "Student")
                document.getElementById("type").value = 1;
            else
                document.getElementById("type").value = 2;


        }
</script>
<script>
       
       function clearModal()
       {
            document.createGroup.reset();
            document.getElementById("link_div").innerHTML = "";
            document.getElementById("link_div1").innerHTML = "";
       }
       0
        
        function checkExisting(gname) {
            document.getElementById("Button").disabled = false;
            //var gname = document.getElementById("groupname").value;
            var uid = document.getElementById("hiddenUserId").value;
           // document.getElementById("groupname").style.border = "";
            document.getElementById("groupError").style.display = "none";
            var reg =/^[a-zA-Z0-9\s]+$/;
            if (reg.test(gname))
            {
//                alert(gname)
                document.getElementById("groupError").style.display = "none";
                validateGroupName(gname, uid);
            } else {
                document.getElementById("groupError").style.display = "inline";
                document.getElementById("link_div").innerHTML = "";
                document.getElementById("link_div").innerHTML = "Invalid group name";
                document.getElementById("link_div").style.color="red";
                document.getElementById("Button").disabled = true;

            }

        }
        function validateGroupName(gname, uid) { 
            var data = "groupname=" + gname + "&uid=" + uid+"&url=<%=parts[0]%>"; 
//            alert("data : "+ data);
            $.ajax({
                url: "angle_group/DAO_checkGroupName.jsp",
                type: "GET",
                data: data,
                dataType: "json",
                success: validGroupName,
                error: onError
            });
        }
        function validGroupName(data) {
          //  alert(data)
            if (data > 0) {
                document.getElementById("link_div").innerHTML = "";
                document.getElementById("link_div").innerHTML = "group name approved";
                document.getElementById("link_div").style.color="green";
                document.getElementById("Button").disabled = false;
                document.getElementById("link_div1").innerHTML = "";
                document.getElementById("link_div1").innerHTML = "group name approved";
                document.getElementById("link_div1").style.color="green";
                document.getElementById("Button1").disabled = false;
            } else {
//                alert("Email already taken");
                document.getElementById("link_div").innerHTML = "";
                document.getElementById("link_div").innerHTML = "Group Name already taken";
                document.getElementById("link_div").style.color = "red";
                document.getElementById("Button").disabled = true;
                document.getElementById("link_div1").innerHTML = "";
                document.getElementById("link_div1").innerHTML = "Group Name already taken";
                document.getElementById("link_div1").style.color = "red";
                document.getElementById("Button1").disabled = true;
            }
        }
        function onError() {
            
            alert("Try Again");
        }

        
    </script>

</body> 

