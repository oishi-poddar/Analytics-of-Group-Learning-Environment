<!--    Document   : HomePage
    Created on : 5 June 17, 10:25:48 PM
    Author     : Sakshi
-->

<%@page import="angle_group.AngleUtility"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Person"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    HttpServletRequest req = ServletActionContext.getRequest();
    String url = (req.getRequestURL()).toString();
    String parts[] = url.split("template");
    Person p = new Person();
    p = (Person) session.getAttribute("loggedInUser");
    String email = p.getEmail();
    session.setAttribute("email", email);
    session.setAttribute("current", "1");
%>
<html>
    <head>
        <script>
            var res;
            var mp = {};
        </script>
        <style>
            table{
                border-collapse: separate;
                border-spacing: 50% 0;
            }

            td {
                padding: 10% 0;
            }
        </style>

        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <%@ include file="/include/header.jsp" %>
        <!-- iCheck -->
        <link href="asset/iCheck/skins/flat/green.css" rel="stylesheet">
        <link href="asset/switchery/dist/switchery.min.css" rel="stylesheet">
        <link href="/angle/css/css1/groupDisplayCard.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
        <style>

            #username_change
            {
                cursor:pointer;
            }

            #button_savename, #button_savepassword
            {
                border: none;
                color: white;
                padding: 8px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                border-radius: 6px;
                margin: 4px 2px;
                cursor: pointer;
                background-color: #008CBA;
            }
            .modal-backdrop.in 
            {
                z-index: 0;
            }
            #left,#right{
                display: inline;
            }
            #groupstbody {
                float: right;
                z-index: 10;
                position: absolute;
                right: 11.5%;
                top: 11%;
                text-align: center;
                background-color: white;
                color: black;
                font-size: 22px;
            }


        </style>


        <title>ANGLE </title>
    </head>

    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="/include/HomePageMenu.jsp" %>
                <div class="right_col" role="main">

                    <!-- for joining a group using group code        -->

                    <%    if (session.getAttribute("groupjoin") == "success") {
                            session.setAttribute("groupjoin", null);    %>

                    <div class="alert alert-success alert-dismissable fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> You have joined the group.
                    </div>                    
                    <%       }
                        if (session.getAttribute("groupjoin") == "failure") {
                            session.setAttribute("groupjoin", null); %>

                    <div class="alert alert-danger alert-dismissable fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> Wrong group code.
                    </div>
                    <%     }

                        if (session.getAttribute("invited_user") == "already_exists") {
                            session.setAttribute("invited_user", null); %>

                    <div class="alert alert-danger alert-dismissable fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> This user is already a part of the group.
                    </div>
                    <%      }

                        if (session.getAttribute("invited_user") == "invite_sent") {
                            session.setAttribute("invited_user", null); %>

                    <div class="alert alert-success alert-dismissable fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Invite sent!</strong> Email invitation has been sent to the entered email.
                    </div>

                    <%     }

                        if (session.getAttribute("groupjoin") == "already_exists") {
                             session.setAttribute("groupjoin", null); %>

                    <div class="alert alert-danger alert-dismissable fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> You are already in the group.
                    </div>

                    <%     }%>

                    <!--    To display all the groups
                  
                    -->

                    <div class="row" id="all_groups" style="display:none;">
                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Groups</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>

                                <div id="allGroupCard">
                                    <s:set var="cnt" value="-1" />
                                    <s:if test="allGroups.size !=0">
                                        <s:iterator value="allGroups" status="incrementer" begin="0" end="((allGroups.size)/2)">
                                            <s:set var="cnt" value="#cnt+1" />
                                            <div class="row">
                                                <br>
                                                <s:if test="#attr.allGroups.get(#cnt).groupName != null">
                                                    <div class="w3-container col-sm-6">
                                                        <div class="w3-card-4">
                                                            <header class="w3-container">
                                                                <h1><s:property value="#attr.allGroups.get(#cnt).groupName"/></h1>
                                                            </header>

                                                            <div class="w3-container">
                                                                <p style="word-wrap: break-word;"><s:property value="#attr.allGroups.get(#cnt).description"/></p>
                                                                <p><h4> No Of Members : <s:property value="#attr.allGroups.get(#cnt).noOfMembers"/></h4></p>
                                                                <p><h4><s:property value="#attr.allGroups.get(#cnt).lockedState"/> Group </h4></p>


                                                                <s:if test="#attr.allGroups.get(#cnt).lockedState == 'Public'">
                                                                    <a href="#" onclick="joinGroupModal1('<s:property value="#attr.allGroups.get(#cnt).groupCode"/>');" class="btn btn-success">Join</a>       
                                                                </s:if>


                                                                <s:if test="#attr.allGroups.get(#cnt).lockedState == 'Private'">

                                                                </s:if>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </s:if>
                                                <s:set var="cnt" value="#cnt+1" />
                                                <s:if test="#attr.allGroups.get(#cnt).groupName != null">
                                                    <div class="w3-container col-sm-6">
                                                        <div class="w3-card-4">
                                                            <header class="w3-container">
                                                                <h1><s:property value="#attr.allGroups.get(#cnt).groupName"/></h1>
                                                            </header>
                                                            <div class="w3-container">
                                                                <p style="word-wrap: break-word;"><s:property value="#attr.allGroups.get(#cnt).description"/></p>
                                                                <p><h4> No Of Members : <s:property value="#attr.allGroups.get(#cnt).noOfMembers"/></h4></p>
                                                                <p><h4><s:property value="#attr.allGroups.get(#cnt).lockedState"/> Group </h4></p>


                                                                <s:if test="#attr.allGroups.get(#cnt).lockedState == 'Public'">
                                                                    <a href="#" onclick="joinGroupModal1('<s:property value="#attr.allGroups.get(#cnt).groupCode"/>');" class="btn btn-success">Join</a>       
                                                                </s:if>


                                                                <s:if test="#attr.allGroups.get(#cnt).lockedState == 'Private'">

                                                                </s:if>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </s:if>
                                            </div>
                                        </s:iterator>
                                    </s:if>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!--    To display all the groups
                    
                    -->

                    <div id="pagination" style="display:none;">
                        <%-- <s:set var="count" value="0" /> -->
                        <ul class="pagination pagination-lg">
                            <%--<s:iterator value="allGroups" begin="0" end="(allGroups.size-1)/10">
                                <s:set var="count" value="#count+1"/> 
                                <li style="display:inline;" onclick="do_sm('<s:property value="#count"/>')"> <a href="#"><s:property value="#count"/></a></li>
                                </s:iterator> --%>
                        </ul>
                    </div>

                    <!--    User Profile
                                To change user name and password 
                    -->
                    <div id="userProfile" style="display:none">
                        <s:if test="#session.loggedInUser != null">
                            <div class="x_panel">
                                <div class="x_title">
                                    <h4>User Profile</h4>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                        </li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                                        <div class="profile_img">
                                            <div id="crop-avatar">
                                                <!-- Current avatar -->
                                                <img class="img-responsive avatar-view" src="images/user_img.jpg" alt="Avatar" title="Change the avatar">
                                            </div>
                                        </div>
                                        <a id="username_change" onclick="toggle(name_change)" >
                                            <h5 id="Name"><s:property value="#session.loggedInUser.loginName"/></h5>
                                        </a>
                                        <div id="name_change" class="collapse" style="display:none">
                                            <div class="input-group" id="input1">
                                                <input id="name" type="text" class="form-control" name="name" value="<s:property value="#session.loggedInUser.loginName"/>">
                                                <br>
                                                <span id="name_error" style="display:none;"></span>
                                                <br>
                                                <button id="button_savename" onclick="save_name()">
                                                    Save
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                        <div class="profile_title">
                                            <h5>Password & sign-in method</h5>
                                        </div>
                                        <div class="x_content">
                                            Your password protects your account. 
                                            <br/><br/>
                                            <label style="text-decoration: underline; cursor: pointer; color:cadetblue" onclick="showChangePass()">Change Password</label>
                                            <div id="passDetails" style="display: none;" class="form-horizontal form-label-left input_mask">
                                                <input type="hidden" id="emailId" value="<s:property value="#session.loggedInUser.email"/>"/>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="old_password">Old Password <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="password" id="old_password" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="ln_solid"></div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="new_password1">New Password <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="password" id="new_password1" required="required" class="form-control col-md-7 col-xs-12">
                                                    </div>
                                                </div>
                                                <div class="ln_solid"></div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="new_password2">Confirm Password <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <input type="password" id="new_password2" required="required" class="form-control col-md-7 col-xs-12">
                                                        <label id="mismatch" style="display: none;"></label>
                                                    </div>
                                                </div>
                                                <div class="ln_solid"></div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                                    </label>
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <button type="submit" class="btn btn-success" onclick="save_password()">Submit</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>                                                                              
                        </s:if>
                    </div>

                    <!--    User Profile
                            To change user name and password 
                    -->        


                    <!--        START
                               To display Groups Of A User
                    -->
                    <div class="row" id="row2">
                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Groups</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>

                                <div id="GroupCard">
                                    <s:set var="cnt" value="-1" />
                                    <s:if test="group_list.size !=0">
                                        <s:iterator value="group_list" status="incrementer" begin="0" end="((group_list.size)/2)">
                                            <s:set var="cnt" value="#cnt+1" />
                                            <div class="row">
                                                <br>
                                                <s:if test="#attr.group_list.get(#cnt).groupName != null">
                                                    <div class="w3-container col-sm-6">
                                                        <div class="w3-card-4">
                                                            <header class="w3-container">
                                                                <h1><s:property value="#attr.group_list.get(#cnt).groupName"/></h1>
                                                            </header>

                                                            <div class="w3-container">
                                                                <p style="word-wrap: break-word;"><s:property value="#attr.group_list.get(#cnt).description"/></p>
                                                                <p><h4>No Of Members : <s:property value="#attr.group_list.get(#cnt).noOfMembers"/></h4></p>

                                                                <p><h4> Your Profile : <s:property value="#attr.group_list.get(#cnt).profileName"/></h4></p>
                                                                <a href="MainGroupPage.html?groupId=<s:property value='#attr.group_list.get(#cnt).groupId'/>" class="btn btn-success">VIEW</a>
                                                                <a onclick="copyGroup(<s:property value='#attr.group_list.get(#cnt).groupId'/>);" class="btn btn-success">COPY</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </s:if>
                                                <s:set var="cnt" value="#cnt+1" />
                                                <s:if test="#attr.group_list.get(#cnt).groupName != null">
                                                    <div class="w3-container col-sm-6">
                                                        <div class="w3-card-4">
                                                            <header class="w3-container">
                                                                <h1><s:property value="#attr.group_list.get(#cnt).groupName"/></h1>
                                                            </header>
                                                            <div class="w3-container">
                                                                <p style="word-wrap: break-word;"><s:property value="#attr.group_list.get(#cnt).description"/></p>
                                                                <p><h4> No Of Members : <s:property value="#attr.group_list.get(#cnt).noOfMembers"/></h4></p>

                                                                <p><h4> Your Profile : <s:property value="#attr.group_list.get(#cnt).profileName"/></h4></p>
                                                                <a href="MainGroupPage.html?groupId=<s:property value='#attr.group_list.get(#cnt).groupId'/>" class="btn btn-success" style="align-items: center">VIEW</a>
                                                                <a onclick="copyGroup(<s:property value='#attr.group_list.get(#cnt).groupId'/>);" class="btn btn-success">COPY</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </s:if>
                                            </div>
                                        </s:iterator>
                                    </s:if>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!--       END
                               To display Groups Of A User
                    -->


                    <!--            
                             MODAL TO DISPLAY ACCESS RIGHTS OF A PROFILE
                    -->

                    <div id="rightsModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true" onclick="resetModal();">&times;</button>
                                    <h3 class="modal-title">DEFAULT ACCESS RIGHTS</h3>
                                </div>
                                <div class="modal-body" id="profileTable">
                                    <div>
                                        <label id="newProfileLabel" for="newProfile">Enter new Profile Name:</label>
                                        <input type="text"  name="newProfile" id="newProfile" onkeyup="checkExistingProfile();"><br>
                                        <div id="error_div"></div><br>
                                        <div id="replace"><div id="rights_modal"></div></div>
                                        <p id="text" class="text-warning">
                                            If you don't want to make any changes to default settings , close the modal.
                                            <br>  
                                            To customize the rights , create a new profile.
                                            If you don't save, your changes will be lost.

                                        </p>
                                        <button type="submit" id="Button2" class="btn btn-primary" onclick="convertMapToString();" >Save Changes</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--            
                        MODAL TO DISPLAY ACCESS RIGHTS OF A PROFILE    
                    -->



                    <!--
                        Start The Copy Modal
                    -->
                    <!--                    <div id="copyModal" class="modal fade">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-hidden="true" onclick="">&times;</button>
                                                        <h3 class="modal-title">DEFAULT ACCESS RIGHTS</h3>
                                                    </div>
                                                    <div class="modal-body" id="profileTable">
                                                        <div>
                                                            
                                                            <table>
                                                                <tr>
                                                                    <td><label id="grouptype" for="groupType">Group Type</label></td>
                                                                    <td><span id="groupType"> 
                                                                
                                                                        </span></td>
                                                            </tr>
                                                            <tr>
                                                                <td><label id="groupstatus" for="groupStatus">Group Status</label></td>
                                                            <td><span id="groupStatus"> 
                                                                
                                                            </span>
                                                        </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label id="description" for="Description">Description</label></td>
                                                                <td><span id="Description"> 
                                                                
                                                            </span></td>
                                                            </tr>
                                                            <tr>
                                                                <td><label id="features" for="Features">Features</label></td>
                                                                <td><span id="Features"> 
                                                                
                                                                    </span></td>
                                                            </tr>
                                                            <tr>
                                                                <td><label id="profile" for="Profile">Profile</label></td>
                                                                <td><span id="Profile"> 
                                                                
                                                            </span></td>
                                                            </tr>
                                                            <tr>
                                                                <td><label id="defaultprofile" for="defaultProfile">Default Profile</label></td>
                                                                <td><span id="defaultProfile"> 
                                                                
                                                                    </span></td>
                                                            </tr>
                                                            </table>
                                                            <div id="error_div"></div><br>
                                                            
                                                            <p id="text" class="text-warning">
                                                                If you don't want to make any changes to default settings , close the modal.
                                                                <br>  
                                                                To customize the rights , create a new profile.
                                                                If you don't save, your changes will be lost.
                    
                                                            </p>
                                                            <button type="submit" id="Button2" class="btn btn-primary" onclick="convertMapToString();" >Save Changes</button>
                    
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>-->

                    <!--
                        End Of the Copy Modal
                    -->

                    <!--
                        Start The Copy Modal
                    -->
                    <div id="copyModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true" onclick="">&times;</button>
                                    <h3 class="modal-title">DEFAULT ACCESS RIGHTS</h3>
                                </div>
                                <div class="modal-body" id="profileTable">
                                    <label  for="newGroupName">Enter New Group Name:</label>
                                    <input type="text" id="newGroupName" name="newGroup">
                                    <div>
                                        <label id="grouptype" for="groupType">Group Type</label>
                                        <span id="groupType"> 

                                        </span>
                                        <br>
                                        <label id="groupstatus" for="groupStatus">Group Status</label>
                                        <span id="groupStatus"> 

                                        </span>
                                        <br>
                                        <label id="description" for="Description">Description</label>
                                        <span id="Description"> 

                                        </span>
                                        <br>
                                        <label id="features" for="Features">Features</label>
                                        <span id="Features"> 

                                        </span>
                                        <br>
                                        <label id="profile" for="Profile">Profile</label>
                                        <span id="Profile"> 

                                        </span>
                                        <br>
                                        <label id="defaultprofile" for="defaultProfile">Default Profile</label>
                                        <span id="defaultProfile"> 

                                        </span>
                                        <br>
                                        <div id="error_div"></div><br>

                                        <p id="text" class="text-warning">
                                            You can create a new group with similar settings.
                                        </p>
                                        <button type="submit" id="copyGroupButton" class="btn btn-primary" onclick="newGroup();" >Copy Group</button>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--
                        End Of the Copy Modal
                    -->



                    <!--             Create Group   Form
                    -->

                    <div class="row" id="row1"  style="display:none;">
                        <div class="col-md-12 col-sm-12 col-xs-12">

                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Create Group</h2>
                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>

                                <div class="x_content">
                                    <div id="demo-form2" data-parsley-validate class="form-horizontal form-label-left">


                                        <div id="createGroupForm">
                                            <form id="createGroup" name="createGroup"  onsubmit="return FormValidation();" method="post" action="create_group.html">
                                                <input type="hidden" name="owner" id="hiddenUserId" value="<s:property value="#session.loggedInUser.loginId"/>">

                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle">Group Name <span class="required">*</span></label>

                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text" id="groupName" class="form-control" name="g.groupName" onblur="groupNameValidation();"/>
                                                    </div>
                                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                                        <div id="groupName_div" class=""></div>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <br> <label class="control-label col-md-3 col-sm-6 col-xs-12" > Group Status *:<br></label>
                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-12 ">
                                                            <div class="radio" id="radioButton">
                                                                <label>
                                                                    <input type="radio" checked="" value="0" id="PeerToPeer" name="g.lockState" class="flat" name="iCheck"> Public
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-12">
                                                            <div class="radio">
                                                                <label>
                                                                    <input type="radio" value="1" id="MentorAndStudent" name="g.lockState" class="flat" name="iCheck"> Private
                                                                </label>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                                <br/>

                                                <div class="form-group">
                                                    <br> <label class="control-label col-md-3 col-sm-6 col-xs-12" > Group Type *:<br></label>
                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-12 ">
                                                            <div class="radio" id="radioButton">
                                                                <label>
                                                                    <input type="radio"  value="1" id="PeerToPeer" name="g.groupType" class="flat" name="iCheck"> Peer To Peer
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3 col-sm-6 col-xs-12">
                                                            <div class="radio">
                                                                <label>
                                                                    <input type="radio" value="2" checked="" id="MentorAndStudent" name="g.groupType" class="flat" name="iCheck">Mentor And Student
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label for="message" class="control-label col-md-3 col-sm-3 col-xs-12">Description*</label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <textarea id="message"  class="form-control" name="g.description"  onblur="validateDescription();"></textarea>
                                                    </div>         
                                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                                        <div class="" id="desc_error"></div>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" >Features you want To Include
                                                    </label> 
                                                    <div class="col-md-9 col-sm-9 col-xs-12">
                                                        <div class="row">
                                                            <div class="col-md-2 col-sm-9 col-xs-12 ">

                                                                <label class="">
                                                                    <input id="Notes" type="checkbox" class="flat" onclick="getFeaturesList(this);" value="Notes" name="Notes" > NOTES
                                                                </label>
                                                            </div>

                                                            <div class="col-md-2 col-sm-9 col-xs-12">
                                                                <label class="">
                                                                    <input id="Assignment" type="checkbox" class="flat" onclick="getFeaturesList(this);" value="Assignment" name="Assignment" /> ASSIGNMENT</label>
                                                            </div>

                                                            <div class="col-md-2 col-sm-9 col-xs-12 ">
                                                                <label class="">
                                                                    <input id="Quiz" type="checkbox"  class="flat" value="Quiz" name="Quiz" onclick="getFeaturesList(this);"/> QUIZ
                                                                </label>
                                                            </div>

                                                            <div class="col-md-2 col-sm-9 col-xs-12">

                                                                <label class="">
                                                                    <input id="VideoChat" type="checkbox" class="flat" value="Video" name="VideoChat" onclick="getFeaturesList(this);"/> VIDEO CHAT
                                                                </label>
                                                            </div>

                                                            <div class="col-md-3 col-sm-9 col-xs-12">

                                                                <label class="">
                                                                    <input id="Poll" type="checkbox" class="flat" value="poll" name="Poll" onclick="getFeaturesList(this);"/> POLL
                                                                </label>
                                                            </div>

                                                        </div>
                                                    </div>

                                                </div>
                                                </br>

                                                <div class="form-group">

                                                    <label class="control-label col-md-3 col-sm-6 col-xs-12" > Profiles You Want To Include*
                                                    </label> 
                                                    <div class="col-md-9 col-sm-6 col-xs-12">
                                                        <div class="row" style="margin-bottom: 5px;">
                                                            <div class="col-md-3">
                                                                <select id="sbOne"  multiple="multiple" onclick="rights(this.value);" data-toggle="modal"  data-target="#rightsModal">
                                                                    <option value = "-1" id="profile" selected="">Select Profiles</option>
                                                                    <s:iterator value="profile_list">

                                                                        <option value="<s:property value='profileId' />" id="profile"><s:property value="profileName"/></option>
                                                                    </s:iterator>
                                                                </select>

                                                            </div>
                                                            <div class="col-md-3">

                                                                <input type="button" id="left" value="<" />
                                                                <input type="button" id="right" value=">" />
                                                                <br/>  

                                                            </div>
                                                            <div class="col-md-3">
                                                                <select id="sbTwo" class="" name="profileList1" multiple="multiple">
                                                                    <option value = "-1" id="profile">Selected Profiles</option>                                       
                                                                </select>  
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <div class="col-md-12" id="message_div" style="color:green;"> Please click on the option to see its rights</div>
                                                            </div>
                                                        </div>
                                                        <div id="select_error"> </div>
                                                    </div>

                                                </div>

                                                <br/>

                                                <div class="form-group">
                                                    <label  class="control-label col-md-3 col-sm-3 col-xs-12">Default Profile For Group Joining*</label>
                                                    <div class="col-md-9 col-sm-6 col-xs-12">
                                                        <div class="row">


                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <%--<s:property value="profile_list.size"/>--%>
                                                                <select id="selectBox2" class="form-control" name="defaultProfile">
                                                                    <%--<s:property value="profile_list.size"/>--%>
                                                                    <option value = "-1"  selected="" >Select default</option>

                                                                    <s:iterator value="profile_list">
                                                                            <option value="<s:property value='profileId' />" id="defaultProfileOption"><s:property value="profileName"/></option>
                                                                       
                                                                    </s:iterator>

                                                                </select>


                                                                <select id="newSelectBox" class="form-control" name="defaultProfile"  style="display:none;" >
                                                                    <%--<s:property value="profile_list.size"/>--%>
                                                                    <option value = "-1" selected="">Select default</option>
                                                                    <option value="1" >Admin </option>
                                                                </select> 
                                                            </div>          

                                                        </div>
                                                        <div class="row">
                                                            <div class="col-md-6 col-sm-6 col-xs-12">
                                                                <div id="select_error2"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <div class="col-md-12 col-sm-12 col-xs-12 form-group">
                                                        <div class="col-md-3"></div>
                                                        <div class="col-md-9">
                                                            <button type="submit"  id="submitButtonNew" class="btn btn-success" >Create Group</button>
                                                            <button type="reset" class="btn btn-primary">Reset</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!--             Create Group   Form
                    -->

                    <div id="joingroupModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">   
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" onclick="resetModal();">&times;</button>
                                    <h4 class="modal-title">Join Group</h4>
                                </div>

                                <div class="modal-body">
                                    <form id="createGroup" action="joinGroup.html" name="createGroup" data-parsley-validate  method="post" >
                                        <input type="text" name="code" placeholder="Group Code" maxlength="8" required id="code" class="form-control" />
                                        <div id="link_div2" class="form-group">
                                        </div>
                                        <br/>
                                        <button type="submit" id="Button" class="btn btn-primary">Join</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <%@ include file="/include/footer.jsp" %>
            </div>
        </div>
        <%@ include file="/include/script.jsp" %>
        <%@ include file="../include/notifications.jsp" %>
        <%@ include file="../include/editProfile.jsp" %>
        <script src="js/moment.min.js"></script>   
        <script src="js/daterangepicker.js"></script>
        <script src="asset/iCheck/icheck.min.js"></script>
        <script src="asset/switchery/dist/switchery.min.js"></script>
        <script src="asset/jquery_alerts/jquery-confirm.min.js"></script>
        <script src="include/functioning.js" type="text/javascript"></script>

        <script>
                                        $("input[name='Notes']").on('ifToggled', function () {
                                            //alert("hello");
                                            var Notes = document.createElement("input");
                                            Notes.name = document.getElementById("Notes").name + "1";
                                            Notes.value = "Notes";
                                            Notes.type = "hidden";
                                            Notes.id = "Notes";

                                            //alert(Notes.name);
                                            document.getElementById("createGroup").appendChild(Notes);
                                            getFeaturesList(this);
                                        });
                                        $("input[name='Assignment']").on('ifToggled', function () {
                                            //alert("hello");

                                            var Notes = document.createElement("input");
                                            Notes.name = document.getElementById("Assignment").name + "1";
                                            Notes.value = "Assignment";
                                            Notes.type = "hidden";
                                            Notes.id = "Assignment";
                                            //alert(Notes.name);
                                            document.getElementById("createGroup").appendChild(Notes);
                                            getFeaturesList(this);
                                        });
                                        $("input[name='VideoChat']").on('ifToggled', function () {
                                            //alert("hello");

                                            var Notes = document.createElement("input");
                                            Notes.name = document.getElementById("VideoChat").name + "1";
                                            Notes.value = "Video Chat";
                                            Notes.type = "hidden";
                                            Notes.id = "VideoChat";
                                            document.getElementById("createGroup").appendChild(Notes);
                                            getFeaturesList(this);
                                        });
                                        $("input[name='Quiz']").on('ifToggled', function () {
                                            //alert("hello");
                                            var Notes = document.createElement("input");
                                            Notes.name = document.getElementById("Quiz").name + "1";
                                            Notes.value = "Quiz";
                                            Notes.type = "hidden";
                                            Notes.id = "Quiz";
                                            document.getElementById("createGroup").appendChild(Notes);
                                            getFeaturesList(this);
                                        });
                                        $("input[name='Poll']").on('ifToggled', function () {
                                            //alert("hello");
                                            var Notes = document.createElement("input");
                                            Notes.type = "hidden";
                                            Notes.name = document.getElementById("Poll").name + "1";
                                            Notes.value = "Poll";
                                            Notes.id = "Poll";
                                            document.getElementById("createGroup").appendChild(Notes);
                                            getFeaturesList(this);
                                        });


                                        $("input:radio[name='g.groupType']").on('ifChecked', function ()
                                        {

                                            var value = $(this).val();

                                            if (value == "1")
                                            {
                                                document.getElementById("newSelectBox").style.display = "inline";
                                                document.getElementById("selectBox2").style.display = "none";
//                                          var val2 = document.getElementById("selectBox2").value;
//                                          val2 = "0";
//                                          alert(val2);

                                            } else
                                            {
                                                document.getElementById("newSelectBox").style.display = "none";
                                                document.getElementById("selectBox2").style.display = "inline";
//                                          document.getElementById("newSelectBox").value="0";

                                            }


                                        }
                                        );

        </script>
    </body> 
</html>