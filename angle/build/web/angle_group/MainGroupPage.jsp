<%@page import="bean.Person"%>
<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    HttpServletRequest req = ServletActionContext.getRequest();
    String url = (req.getRequestURL()).toString();
    String parts[] = url.split("template");
    Person p = (Person) session.getAttribute("loggedInUser");
    String email = p.getEmail();
    int uid = p.getLoginId();

%>
<html>
    <head>
        <script src="https://meet.jit.si/external_api.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="../include/header.jsp"%>
        <%@ include file="../include/editProfile.jsp"%>
        <link href="asset/jquery_alerts/jquery-confirm.min.css" rel="stylesheet">
        <link href="/angle/css/css1/W3css.css" rel="stylesheet" type="text/css">
        <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"rel = "stylesheet">
        <!-- iCheck -->
        <link href="asset/iCheck/skins/flat/green.css" rel="stylesheet">
        <!-- Switchery -->
        <link href="asset/switchery/dist/switchery.min.css" rel="stylesheet">
        <link href="css/daterangepicker.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <title> AnGLE </title>
        <style>

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
            #username_change
            {
                cursor:pointer;
            }
            .inlineDiv{
                display:inline-block;
                float:left;
            }

            #holder {
                width:100%;
            }

            #exTab1 .tab-content {
                padding : 5px 15px;
            }

            #exTab2 h3 {
                color : white;
                background-color: #428bca;
                padding : 5px 15px;
            }

            /* remove border radius for the tab */

            #exTab1 .nav-pills > li > a {
                border-radius: 0;
            }

            /* change border radius for the tab , apply corners on top*/

            #exTab3 .nav-pills > li > a {
                border-radius: 4px 4px 0 0 ;
            }

            #exTab3 .tab-content {
                color : white;
                background-color: #428bca;
                padding : 5px 15px;
            }


            .div_form_group{
                margin-top: 15px;
                margin-bottom: 5px;
            }    
            .inlineDiv{
                display:inline-block;
                float:left;
            }

            #holder {
                width:100%;
            }
            #note-error{
                float: left;
                margin: 0 0 10px 35px;
                padding: 3px 10px;
                color: #FFF;
                border-radius: 3px 4px 4px 3px;
                background-color: #CE5454;
                max-width: 250px;
                /*white-space: pre;*/
                position: relative;
                left: -15px;
                opacity: 1;
                z-index: 1;
                transition: 0.15s ease-out;
            }
            #note-error::after {
                content: '';
                display: block;
                height: 0;
                width: 0;
                border-color: transparent #CE5454 transparent transparent;
                border-style: solid;
                border-width: 11px 7px;
                position: absolute;
                left: -13px;
                top: 1px; 
            }
            input.error-msg{
                border: 1px solid #CE5454!important;
            }
            body {
                padding : 10px ;

            }

            #Assignment_Name-error{
                float: left;
                margin: 0 0 10px 35px;
                padding: 3px 10px;
                color: #FFF;
                border-radius: 3px 4px 4px 3px;
                background-color: #CE5454;
                max-width: 250px;
                /*white-space: pre;*/
                position: relative;
                left: -15px;
                opacity: 1;
                z-index: 1;
                transition: 0.15s ease-out;
            }


            #Assignment_Name-error::after {
                content: '';
                display: block;
                height: 0;
                width: 0;
                border-color: transparent #CE5454 transparent transparent;
                border-style: solid;
                border-width: 11px 7px;
                position: absolute;
                left: -13px;
                top: 1px;
            }

            #description-error{
                float: left;
                margin: 0 0 10px 35px;
                padding: 3px 10px;
                color: #FFF;
                border-radius: 3px 4px 4px 3px;
                background-color: #CE5454;
                max-width: 250px;
                /*white-space: pre;*/
                position: relative;
                left: -15px;
                opacity: 1;
                z-index: 1;
                transition: 0.15s ease-out;
            }


            #description-error::after {
                content: '';
                display: block;
                height: 0;
                width: 0;
                border-color: transparent #CE5454 transparent transparent;
                border-style: solid;
                border-width: 11px 7px;
                position: absolute;
                left: -13px;
                top: 1px;
            }


            #datepicker-error{
                float: left;
                margin: 0 0 10px 35px;
                padding: 3px 10px;
                color: #FFF;
                border-radius: 3px 4px 4px 3px;
                background-color: #CE5454;
                max-width: 250px;
                /*white-space: pre;*/
                position: relative;
                left: -15px;
                opacity: 1;
                z-index: 1;
                transition: 0.15s ease-out;
            }


            #datepicker-error::after {
                content: '';
                display: block;
                height: 0;
                width: 0;
                border-color: transparent #CE5454 transparent transparent;
                border-style: solid;
                border-width: 11px 7px;
                position: absolute;
                left: -13px;
                top: 1px;
            }


            input.error-msg{
                border: 1px solid #CE5454!important;
            }
            .modal-backdrop.in 
            {
                z-index: 0;
            }
            .view-topbar-container {
                margin-bottom: 15px;
                border-top: none;
                position: relative;
            } 
            .topbar-container {
                background-color: #e86830;
                box-sizing: border-box;
                -webkit-box-sizing: border-box;
                padding: 25px 0;
                border-top-left-radius: 2px;
                border-top-right-radius: 2px;
                transition: background .2s;
            }


        </style>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <div id="menu">
                    <%@ include file="../include/menu2.jsp" %>
                </div>
                <div class="right_col" role="main">

                    <div class="col-md-12 col-sm-12 col-xs-12" id="Vanish">


                        <!--
                                    Open The DIV
                                    User Profile
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


                        <!--
                                  Closed The User Profile DIV                     
                                    User Profile
                                To change user name and password 
                        -->        



                        <!--      
                                   DIV START
                                   To show all the members of the group               
                        -->
                        <div class="x_panel" id="membersList" style="display:none;" >
                            <div class="x_title">
                                <h1><s:property value="currGroup.groupName"/> </h1>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                            </div>
                            <div class="x-content">
                                <h2 style="text-align:center"> Members</h2>
                                <div id="allMembers">
                                    <s:set var="cnt" value="-1" />
                                    <s:if test="members.size !=0">
                                        <s:iterator value="members" status="incrementer" begin="0" end="((members.size)/2)">
                                            <s:set var="cnt" value="#cnt+1" />
                                            <div class="row">
                                                <br>
                                                <s:if test="#attr.members.get(#cnt).userName != null">
                                                    <div class="w3-container col-sm-6">
                                                        <div class="w3-card-4">
                                                            <header class="w3-container">
                                                                <h1><s:property value="#attr.members.get(#cnt).userName"/></h1>
                                                            </header>

                                                            <div class="w3-container">
                                                                <h4> <b> Role : </b> <span id="roleOfMember" style="color:blue;"><s:property value="#attr.members.get(#cnt).profileName"/>&nbsp;&nbsp;</span><a onclick="showProfiles('<s:property value="profilesList"/>', '<s:property value="gid"/>', '<s:property value="#attr.members.get(#cnt).userId"/>');"><i class="fa fa-edit"></i></a></h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </s:if>
                                                <s:set var="cnt" value="#cnt+1" />
                                                <s:if test="#attr.members.get(#cnt).userName != null">
                                                    <div class="w3-container col-sm-6">
                                                        <div class="w3-card-4">
                                                            <header class="w3-container">
                                                                <h1><s:property value="#attr.members.get(#cnt).userName"/></h1>
                                                            </header>
                                                            <div class="w3-container">

                                                                <h4> <b> Role : </b> <span id="roleOfMember" style="color:blue;"><s:property value="#attr.members.get(#cnt).profileName"/>&nbsp;&nbsp;</span><a onclick="showProfiles('<s:property value="profilesList"/>', '<s:property value="gid"/>', '<s:property value="#attr.members.get(#cnt).userId"/>');"><i class="fa fa-edit"></i></a></h4>
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

                        <!--      
                                   DIV CLOSED
                                   To show all the members of the group               
                        -->





                        <!--   
                                START        
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
                                            <input type="text"  name="newProfile" id="newProfile" onkeypress="checkExistingProfile();"><br>
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
                                 CLOSED        
                                 MODAL TO DISPLAY ACCESS RIGHTS OF A PROFILE
                        -->



                        <!--
                            START
                            MODAL TO EDIT ROLE OF A USER
                        -->

                        <div id="editModal" class="modal fade">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true" onclick="resetModal();">&times;</button>
                                        <h3 class="modal-title">EDIT ROLE</h3>
                                    </div>
                                    <div class="modal-body" id="profileTable">
                                        <div>
                                            <label for="selectProfile">Select new Profile Name:</label>
                                            <div id="lele">
                                            </div>
                                            <button type="button" id="editModalButton" class="btn btn-primary" onclick="editRole('<s:property value ="gid"/>');" >Save Changes</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <!--
                            END
                            MODAL TO EDIT ROLE OF A USER
                        -->





                        <!--
                            START
                            TOP View The LIST Displayed Assignment Poll VideoChat DiscussionForum
                        -->
                        <div class="x_panel" id="groupPage">

                            <div class="x_title"  id="Vanish">
                                <h2><s:property value="currGroup.groupName"/> </h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>

                            <div class="x_content"  id="Vanish">
                                <div id="exTab1" class="container">
                                    <div class="row">
                                        <ul class="nav nav-tabs">
                                            <li class="active">
                                                <a href="#ToDoList" data-toggle="tab">To Do List</a>
                                            </li>
                                            <s:iterator var="features" value="hashmap" status="incrementer">
                                                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" data-toggle="tab"><s:property value="key" />
                                                        <span class="caret"></span></a>
                                                    <ul class="dropdown-menu">
                                                        <s:iterator value="value">
                                                            <li>
                                                                <a href="#<s:iterator><s:property value='value'/></s:iterator>" data-toggle="tab"><s:iterator><s:property value="key"/></s:iterator></a>
                                                                </li>
                                                        </s:iterator>
                                                    </ul>
                                                </li>
                                            </s:iterator>
                                            <li> <a href="http://localhost:8080/test/login.jsp?user_email=<%=email%>" target="_blank">Discussion Forum </a> </li>
                                        </ul>
                                    </div>
                                    <div class="tab-content">

                                        <div class="tab-pane" id="Post_Note">

                                            <form id="note-form"  name="search" method="post" class="form-horizontal form-label-left" enctype="multipart/form-data">
                                                <input type="hidden" name="n.groupId" id="groupId" value="<s:property value="currGroup.groupId"/>">

                                                <input type="hidden" name="n.createdById" id="createdById" value="<s:property value="#session.loggedInUser.loginId"/>">
                                                <div class="form-group div_form_group" style="">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle">Enter note <span class="required">*</span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <input type="text"  id="note" name="n.note"  onblur="NoteValidation();" class="form-control col-md-7 col-xs-12" >


                                                    </div>
                                                    <label class="error-msg"></label>

                                                </div>
                                                <div class="col-md-12 col-sm-6 col-xs-12">
                                                    <div class="row">
                                                        <div class="col-md-3 col-sm-6 col-xs-12"></div>
                                                        <div class="col-md-9 col-sm-6 col-xs-12">
                                                            <div id="notes_div" class="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle">Send in group<span class="required"></span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <label class="control-label col-md-1 col-sm-3 col-xs-12" for="stitle"><s:property value="currGroup.groupName"/>
                                                        </label>
                                                    </div>
                                                    <label class="error-msg"></label>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle">Reference Link<span class="required"></span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">


                                                        <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal1">
                                                            <span class="fa fa-paperclip fa-lg"></span> </button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="myModal1" role="dialog">
                                                            <div class="modal-dialog">

                                                                <!-- Modal content-->
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                        <h2 class="modal-title">ADD LINKS</h2>
                                                                    </div>

                                                                    <div class="col-md-12 col-sm-12 col-xs-12 modal-body">
                                                                        <div class="input-group">
                                                                            <input type="text" name="n.referenceLink" id="referenceLink" class="form-control" placeholder="http:"/>
                                                                            <s:property value="referenceLink" />
                                                                        </div></div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" onclick="validateURL()" class="btn btn-default" data-dismiss="modal">OK</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <label class="error-msg"></label>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle">Upload file <span class="required"></span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <label for="myFile"></label>
                                                        <input type="file" name="n.myFile" id="files" onclick="check()" onblur="validate1()" />
                                                        <s:property value="myFileFileName"/>
                                                        <span id="upload-error" class="error">${uploadError}</span>
                                                        <input type="hidden" id="location" value="<s:property value="n.location"/>">
                                                    </div>
                                                    <label class="error-msg"></label>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle"> <span class="required"></span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                        <button type="submit"  onclick=" return createNote()"  id="sub" class="btn btn-success">POST</button>
                                                        <input type="button" class="btn btn-primary" name="reset_form" value="Reset" onclick="this.form.reset();">     
                                                    </div>
                                                    <label class="error-msg"></label>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="stitle"> <span class="required"></span>
                                                    </label>
                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                    </div>
                                                    <label class="error-msg"></label>
                                                </div>
                                            </form>

                                        </div>
                                        <div class="tab-pane" id="View_Note">

                                            <!---View Notes-->
                                            <div>
                                                
                                                <strong style="padding-top:100px"><h2>Total number of notes:  <s:property value="listOfNotes.size"/></h2> </strong>

                                                <s:iterator value="listOfNotes">

                                                    <div class="row">
                                                        <br>

                                                        <div class="w3-container col-sm-12">
                                                            <div class="w3-card-4">
                                                                <header class="w3-container  w3-teal">
                                                                    <h4>Note Details</h4>
                                                                </header>
                                                                <br>
                                                                <div class="w3-container">
                                                                    <div class="col-md-12 col-sm-12 col-xs-12">

                                                                        Note is : <b><s:property value="note"/></b> 
                                                                        <div class="panel-title pull-right">
                                                                            <s:property value="date_time"/>
                                                                        </div>

                                                                        <br><br>

                                                                        <a href="<s:property value="referenceLink" />" target="_blank"><s:property value="referenceLink" /></a>
                                                                        <br> <br>
                                                                        <a href="<s:url value='/uploadedfiles/'/><s:property value="myFileFileName"/><s:property value="NoteId"/>" target="_blank"><s:property value="myFileFileName"/>
                                                                        </a>
                                                                    </div>
                                                                </div>

                                                                <footer class="w3-container ">

                                                                </footer>
                                                            </div>
                                                        </div>


                                                    </div>            
                                                </s:iterator>
                                            </div><!--view notes ends-->


                                        </div>


                                        <div class="tab-pane active" id="ToDoList">
                                            <!--Create Assignment--> 
                                            <div class="row">
                                                <br>
                                                <div id="toDoListShow" class="col-md-6 col-sm-6 col-xs-12">

                                                </div>
                                            </div>

                                        </div>



                                        <div class="tab-pane" id="Create_Assignment">
                                            <!--Create Assignment--> 
                                            <div class="row">
                                                <br>
                                                <form id="assignment_home" style="" data-parsley-validate class="form-horizontal form-label-left"  method="post" enctype="multipart/form-data">

                                                    <input type="hidden" name="a.groupid" id="groupid" value="<s:property value="gid"/>" >
                                                    <div class="form-group">
                                                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="stitle"> <span class="required">Assignment Title*</span>
                                                        </label>
                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                            <input name="a.name" id="Assignment_Name" type="text" onblur="checkSpace()" class="form-control col-md-7 col-xs-12" value="">
                                                        </div>
                                                        <label class="error-msg"><s:property value="fieldErrors.get('name').get(0)" /></label>
                                                        <div class="col-md-12 col-sm-6 col-xs-12">
                                                            <div class="row">
                                                                <div class="col-md-3 col-sm-6 col-xs-12"></div>
                                                                <div class="col-md-9 col-sm-6 col-xs-12">
                                                                    <div id="errordiv" class="">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="stitle"> <span class="required">Assignment Description</span>
                                                        </label>
                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                            <input name="a.description" id="description"  class="form-control col-md-7 col-xs-12" value="">

                                                        </div>

                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="stitle"> <span class="required">Topic</span>
                                                        </label>

                                                        <div class="col-md-6 col-sm-6 col-xs-12">

                                                            <select id="topicName" name="a.topicName">
                                                                <s:iterator value="listOfTopics">
                                                                    <option value="<s:property value="name"/>"><s:property value="name"/></option>
                                                                </s:iterator>
                                                            </select>
                                                        </div>

                                                    </div>   



                                                    <div class="form-group">
                                                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="stitle"> <span class="required">Due Date*</span>
                                                        </label>
                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                            <input type="text" class="form-control has-feedback-left col-md-7 col-xs-12" name="a.datepicker" id="datepicker" onchange="datepickerValidation()" aria-describedby="inputSuccessStatus">
                                                            <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                                            <span id="inputSuccessStatus" class="sr-only">(success)</span>

                                                        </div>

                                                    </div>


                                                    <div class="form-group">
                                                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="stitle"> <span class="required">Due Time</span>
                                                        </label>
                                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                                            <select class="form-control" name="a.hour" id="hour" type="text">
                                                                <option value="00">00</option>
                                                                <option value="01">01</option>
                                                                <option value="02">02</option>
                                                                <option value="03">03</option>
                                                                <option value="04">04</option>
                                                                <option value="05">05</option>
                                                                <option value="06">06</option>
                                                                <option value="07">07</option>
                                                                <option value="08">08</option>
                                                                <option value="09">09</option>
                                                                <option value="10">10</option>
                                                                <option value="11">11</option>
                                                                <option value="12">12</option>
                                                                <option value="13">13</option>
                                                                <option value="14">14</option>
                                                                <option value="15">15</option>
                                                                <option value="16">16</option>
                                                                <option value="17">17</option>
                                                                <option value="18">18</option>
                                                                <option value="19">19</option>
                                                                <option value="20">20</option>
                                                                <option value="21">21</option>
                                                                <option value="22">22</option>
                                                                <option value="23">23</option>

                                                            </select>
                                                        </div>

                                                        <div class="col-md-2 col-sm-6 col-xs-12">
                                                            <select class="form-control" id="min" name="a.min" type="text">
                                                                <option value="00">00</option>
                                                                <option value="15">15</option>
                                                                <option value="30">30</option>
                                                                <option value="45">45</option>

                                                            </select>
                                                        </div>

                                                    </div>


                                                    <div class="form-group">
                                                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="stitle"> <span class="required">Add Link</span>
                                                        </label>
                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                            <input type="text" name="a.referenceLink" id="referenceLink"  onblur="validateURL1(referenceLink)" class="form-control" placeholder="http:"/>

                                                        </div>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-md-4 col-sm-3 col-xs-12" for="stitle"> <span class="required">Upload File</span>
                                                        </label>
                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal2" title="Upload File">
                                                                <span class="fa fa-file-text fa-lg"></span> </button>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="myModal2" role="dialog">
                                                                <div class="modal-dialog">

                                                                    <!-- Modal content-->
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                                            <h2 class="modal-title">UPLOAD FILES</h2>
                                                                        </div>

                                                                        <div class="col-md-12 col-sm-12 col-xs-12 modal-body">
                                                                            <div class="input-group ">
                                                                                <input type="file" name="a.myFile" id="myFile" value="" onchange ="fileValidation()" placeholder="browse"/>
                                                                                <s:property value="myFileFileName"/>
                                                                               <!-- <a href="<s:url value="/uploadedfiles/myFileFileName"/>" target="_blank">path</a>-->



                                                                            </div></div>


                                                                        <div class="modal-footer">

                                                                            <button type="button" id="sub1" class="btn btn-default" data-dismiss="modal">OK</button>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>


                                                        </div>
                                                    </div>

                                                    <br><br>
                                                    <div class="ln_solid"></div>
                                                    <div class="form-group">
                                                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" align="center">
                                                            <button class="btn btn-primary" type="button" onclick="resetForm()">RESET</button>
                                                            <%-- <button class="btn btn-primary" type="reset">SEND</button>--%>
                                                            <button type="submit" onclick="createAssignment()" id="upload" name="sub" class="btn btn-success">CREATE</button>
                                                        </div>
                                                    </div>

                                                    <!--  <%             //out.println("<a href='/home/manushi/NetBeansProjects/angle/web/uploadedfiles'"+"<s:property value='myFileFileName'/> >ad</a>");
                                                    %>-->
                                                </form>
                                            </div>
                                                
                                                
                                            <!--Create assignment-->
                                        </div>

                                        <div class="tab-pane" id="View_Assignment">
                                            <!---View Assignment-->
                                            <div>



                                                <s:iterator value="listOfAssignments">

                                                    <div class="row">
                                                        <br>

                                                        <div class="w3-container col-sm-12">
                                                            <div class="w3-card-4">
                                                                <header class="w3-container  w3-teal">
                                                                    <h4>Assignment Details</h4>
                                                                </header>
                                                                <br>
                                                                <div class="w3-container">
                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                        <div>Title:  <s:property value="name"/></div>
                                                                        <div>Given By:  <s:property value="createdBy"/></div>
                                                                        <div>Topic:  <s:property value="topicName"/></div>
                                                                        <div>Description:  <s:property value="description"/></div>
                                                                        <div>Due Date:  <s:property value="datepicker"/></div>
                                                                        <div>Due Time:  <s:property value="hour"/>:<s:property value="min"/></div>
                                                                        <div>Attachment:   <s:property value="attachment"/>
                                                                            <a href="<s:url value='/uploadedfiles/'/><s:property value="gid"/><s:property value="id"/><s:property value="attachment"/>" target="_blank"><i class="fa fa-file"></i> </a></div>
                                                                    </div>
                                                                </div>

                                                                <footer class="w3-container ">

                                                                </footer>
                                                            </div>
                                                        </div>


                                                    </div>           
                                                </s:iterator>
                                            </div><!--view assignment ends-->


                                        </div>

                                        <div class="tab-pane" id="Submit_Assignment">
                                            <!---submit Assignment-->
                                            <div>



                                                <s:iterator value="listOfAssignmentForSubmission">

                                                    <div class="row">
                                                        <br>

                                                        <div class="w3-container col-sm-12">
                                                            <div class="w3-card-4">
                                                                <header class="w3-container  w3-teal">
                                                                    <h4>Assignment Details<s:property value="grade"/></h4>
                                                                </header>
                                                                <br>
                                                                <div class="w3-container">
                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                        <div>Title:  <s:property value="name"/></div>
                                                                        <div>Given By:  <s:property value="createdBy"/></div>
                                                                        <div>Topic:  <s:property value="topicName"/></div>
                                                                        <div>Description:  <s:property value="description"/></div>
                                                                        <div>Due Date:  <s:property value="datepicker"/></div>
                                                                        <div>Due Time:  <s:property value="hour"/>:<s:property value="min"/></div>
                                                                        <div>Attachment:   <s:property value="attachment"/>
                                                                            <a href="<s:url value='/uploadedfiles/'/><s:property value="gid"/><s:property value="id"/><s:property value="attachment"/>" target="_blank"><i class="fa fa-file"></i> </a></div>

                                                                    </div>
                                                                    <div class="col-md-4 col-sm-6 col-xs-12 col-md-offset-3" align="center">
                                                                        <s:if test="submittedFile==NULL">
                                                                            <a>
                                                                                <label onclick="GoToAssignment('<s:property value="id"/>', '<s:property value="name"/>');">
                                                                                    <button class="btn btn-primary" type="button">Submit Assignment</button>
                                                                                </label>

                                                                            </a>
                                                                        </s:if>
                                                                        <s:else>
                                                                            <a>
                                                                                <label onclick="GoToUpdateAssignment('<s:property value="id"/>', '<s:property value="name"/>');">
                                                                                    <button class="btn btn-primary" type="button">Update Assignment</button>
                                                                                </label>

                                                                            </a>

                                                                        </s:else>
                                                                    </div>

                                                                </div>

                                                            </div>
                                                        </div>


                                                    </div>           
                                                </s:iterator>
                                            </div><!--submit assignment ends-->


                                        </div>

                                        <div class="tab-pane" id="Grade_Assignment">
                                            <!---grade Assignment-->
                                            <div>



                                                <s:iterator value="listOfAssignmentForGrading">

                                                    <div class="row">
                                                        <br>

                                                        <div class="w3-container col-sm-12">
                                                            <div class="w3-card-4">
                                                                <header class="w3-container  w3-teal">
                                                                    <h4>Assignment Details</h4>
                                                                </header>
                                                                <br>
                                                                <div class="w3-container">
                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                        <div>Title:  <s:property value="name"/></div>
                                                                        <div>Given By:  <s:property value="createdBy"/></div>
                                                                        <div>Topic:  <s:property value="topicName"/></div>
                                                                        <div>Description:  <s:property value="description"/></div>
                                                                        <div>Due Date and Time:  <s:property value="datepicker"/> <s:property value="hour"/>:<s:property value="min"/></div>
                                                                        <div>Attachment:   <s:property value="attachment"/>
                                                                            <a href="<s:url value='/uploadedfiles/'/><s:property value="gid"/><s:property value="id"/><s:property value="attachment"/>" target="_blank">
                                                                                <i class="fa fa-file"></i>
                                                                            </a>
                                                                        </div>
                                                                        <div>Number of submissions:  <s:property value="count1"/></div>       
                                                                    </div>



                                                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" align="center">

                                                                        <a>
                                                                            <label onclick="GradeAssignment('<s:property value="id"/>', '<s:property value="name"/>');"><button class="btn btn-primary" type="button">Grade Assignment</button></label>

                                                                        </a>

                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </div>


                                                    </div>           
                                                </s:iterator>
                                            </div>


                                            <!--grade assignment ends-->


                                        </div>

                                        <div class="tab-pane" id="View_Grades">
                                            <!---View assignment grade-->
                                            <div>



                                                <s:iterator value="listOfGrade">

                                                    <div class="row">
                                                        <br>

                                                        <div class="w3-container col-sm-12">
                                                            <div class="w3-card-4">
                                                                <header class="w3-container  w3-teal">
                                                                    <h4>Assignment Details</h4>
                                                                </header>
                                                                <br>
                                                                <div class="w3-container">
                                                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                                                        <div>Title:  <s:property value="name"/></div>
                                                                       <!-- <div>Topic:  <s:property value="topicName"/></div>-->
                                                                        <div>Submitted on:  <s:property value="tempDate"/></div>
                                                                        <div>Submitted File:   <s:property value="submittedFile"/>
                                                                            <s:if test="submittedFile!=NULL">
                                                                                <a href="<s:url value='/uploadedfiles/'/><s:property value="id"/><s:property value="uid"/><s:property value="submittedFile"/>" target="_blank">
                                                                                    <i class="fa fa-file"></i>
                                                                                </a>
                                                                            </s:if> 

                                                                        </div>
                                                                        <div>Graded By:  <s:property value="gradeBy"/></div>    
                                                                        <s:if test="grade!=NULL">   
                                                                            <div>Your Grade:  <s:property value="grade"/></div>
                                                                        </s:if>
                                                                        <s:else>
                                                                            <div>Your Grade: NOT GRADED</div>

                                                                        </s:else>


                                                                    </div>





                                                                </div>
                                                            </div>
                                                        </div>


                                                    </div>           
                                                </s:iterator>
                                            </div><!--view assignment grade ends-->

                                        </div>

                                        <div class="tab-pane" id="quizNew">

                                        </div>

                                        <div class="tab-pane" id="quizView">

                                        </div>

                                        <div class="tab-pane" id="quizSubmit">

                                        </div>

                                        <div class="tab-pane" id="quizGrade">

                                        </div>

                                        <div class="tab-pane" id="quizResults">

                                        </div>

                                        <div class="tab-pane" id="videoStart">

                                            <!--WebRTC-->


                                            <div>
                                                <!-- <select  class="btn btn-primary">
                                                <s:iterator status="listOfTopics" value="listOfTopics">
                                                    <option value="<s:property value='name'/>"><s:property value='name'/></option>
                                                </s:iterator>

                                            </select>-->
                                                <input type="text" id="topic" placeholder="Enter conference topic" >
                                                <button onclick="video()" class="btn btn-primary" id="video" value="1">
                                                    start</button>
                                                <button onclick="stopVideo()" class="btn btn-primary" id="stop" value="0">
                                                    Stop</button>


                                            </div>

                                            <div id="meet"></div>
                                            <%
                                                String name = p.getLoginName();
                                                String email1 = p.getEmail();
                                                // email = request.getParameter("email");
                                                int gid = Integer.parseInt(request.getParameter("groupId").toString());
                                            %>
                                            <script>
                                                name = '<%= name%>';
                                                email1 = '<%= email1%>';
                                                gid = '<%= gid%>';
                                            </script>
                                            <script>
                                                window.onload = stop;
                                                window.onbeforeunload = function () {
                                                    stopVideo();
                                                }
                                                var api;
                                                var copy;

                                                var info = "";
                                                var name = "";
                                                var email = "";
                                                var date = "";
                                                var noOfParticipants;
                                                var startConferenceTime;
                                                var stopConferenceTime;
                                                var room;
                                                var url;
                                                var gid;
                                                function stopVideo()
                                                {
                                                    document.getElementById("video").value = "0";
                                                    var d = new Date();
                                                    var month = ("0" + (d.getMonth() + 1)).slice(-2);
                                                    var date1 = ("0" + d.getDate()).slice(-2);
                                                    var hour = ("0" + d.getHours()).slice(-2);
                                                    var minute = ("0" + d.getMinutes()).slice(-2);
                                                    var second = ("0" + d.getSeconds()).slice(-2);
                                                    stopConferenceTime = d.getFullYear() + "-" + (month) + "-" + date1 + " " + hour + ":" + minute + ":" + second;
                                                    //alert(stopConferenceTime);
                                                    noOfParticipants = api.getNumberOfParticipants();
                                                    //alert(noOfParticipants);
                                                    api.executeCommand("hangup");
                                                    api.dispose();
                                                    document.getElementById("video").disabled = false;

                                                    document.getElementById("topic").disabled = false;
                                                    document.getElementById("topic").value = room;
                                                    document.getElementById("topic").placeholder = "Topic Name";
                                                    genlinks2();
                                                    // genlinks(data);
                                                }




                                                function disable() {

                                                    var val = document.getElementById("analytics").value;
                                                    if (val.match("0")) {
                                                        window.open('VideoAnalytics.html', 'go1');
                                                        document.getElementById("analytics").value = "1";
                                                    } else {
                                                        window.location.reload();
                                                    }



                                                }



                                                function video() {

                                                    document.getElementById("video").value = "1";
                                                    var d = new Date();
                                                    var month = ("0" + (d.getMonth() + 1)).slice(-2);
                                                    var date1 = ("0" + d.getDate()).slice(-2);
                                                    var hour = ("0" + d.getHours()).slice(-2);
                                                    var minute = ("0" + d.getMinutes()).slice(-2);
                                                    var second = ("0" + d.getSeconds()).slice(-2);
                                                    startConferenceTime = d.getFullYear() + "-" + (month) + "-" + date1 + " " + hour + ":" + minute + ":" + second;

                                                    var domain = "meet.jit.si";

                                                    room = document.getElementById("topic").value;

                                                    url = "https://meet.jit.si/" + room;

                                                    //alert(room);
                                                    document.getElementById("topic").disabled = true;
                                                    var width = window.innerHeight / 3;
                                                    var height = window.innerHeight / 2;
                                                    var htmlElement = document.querySelector('#meet');


                                                    document.getElementById("video").disabled = true;
                                                    api = new JitsiMeetExternalAPI(domain, room, width, height, htmlElement);

                                                    //api.executeCommand('email',document.getElementById("email").value());
                                                    //var numberOfParticipants = api.getNumberOfParticipants();
                                                    api.addEventListeners({
                                                        incomingMessage: messageIncoming,
                                                        participantJoined: joined,
                                                        participantLeft: left});

                                                }
                                                function joined(message)
                                                {


                                                    // alert(document.getElementById("hdnSession").value);

                                                    var d = new Date();
                                                    var month = ("0" + (d.getMonth() + 1)).slice(-2);
                                                    var date1 = ("0" + d.getDate()).slice(-2);
                                                    var hour = ("0" + d.getHours()).slice(-2);
                                                    var minute = ("0" + d.getMinutes()).slice(-2);
                                                    var second = ("0" + d.getSeconds()).slice(-2);
                                                    var time = d.getFullYear() + "-" + (month) + "-" + date1 + " " + hour + ":" + minute + ":" + second;
                                                    message['time'] = time;
                                                    message['room'] = document.getElementById("topic").value;
                                                    message['gid'] = gid;
                                                    message['status'] = "joined";
                                                    message['message'] = "";
                                                    genlinks4(message);
                                                }
                                                function left(message)
                                                {
                                                    var d = new Date();
                                                    var month = ("0" + (d.getMonth() + 1)).slice(-2);
                                                    var date1 = ("0" + d.getDate()).slice(-2);
                                                    var hour = ("0" + d.getHours()).slice(-2);
                                                    var minute = ("0" + d.getMinutes()).slice(-2);
                                                    var second = ("0" + d.getSeconds()).slice(-2);
                                                    var time = d.getFullYear() + "-" + (month) + "-" + date1 + " " + hour + ":" + minute + ":" + second;
                                                    message['time'] = time;
                                                    message['room'] = document.getElementById("topic").value;
                                                    message['gid'] = gid;
                                                    message['status'] = "left";
                                                    message['message'] = "";

                                                    genlinks4(message);
                                                }
                                                function messageIncoming(message) {
                                                    // alert(message['message']);
                                                    var d = new Date();
                                                    var month = ("0" + (d.getMonth() + 1)).slice(-2);
                                                    var date1 = ("0" + d.getDate()).slice(-2);
                                                    var hour = ("0" + d.getHours()).slice(-2);
                                                    var minute = ("0" + d.getMinutes()).slice(-2);
                                                    var second = ("0" + d.getSeconds()).slice(-2);
                                                    var time = d.getFullYear() + "-" + (month) + "-" + date1 + " " + hour + ":" + minute + ":" + second;
                                                    message['time'] = time;
                                                    message['room'] = document.getElementById("topic").value;
                                                    message['gid'] = gid;
                                                    message['id'] = message['from'];
                                                    message['status'] = "message";

                                                    genlinks4(message);
                                                }



                                                function genlinks4(mes) {

//                                                
//
                                                    var data = "status=" + mes['status'] + "&message=" + mes['message'] + "&from=" + mes['id'] + "&topic=" + mes['room'] + "&starttime=" + mes['time'] + "&gid=" + mes['gid'] + "&url=<%=parts[0]%>";
                                                    //alert(data);
                                                    $.ajax({
                                                        url: "angle_group/userJoinedConference.jsp",
                                                        type: "GET",
                                                        data: data,
                                                        dataType: "json",
                                                        success: setGenerateLinksForTesting4,
                                                        error: onError4
                                                    });
                                                }
                                                function setGenerateLinksForTesting4(data) {
                                                    //  alert("success");
                                                }
                                                function onError4() {
                                                    //alert("error .. ");
                                                }





                                                function genlinks(mes) {
                                                    info = mes['message'];
                                                    email = mes['nick'] + "@gmail.com";

                                                    var data = "mes=" + mes['message'] + "&nick=" + mes['nick'] + "&from=" + jid + "&topic=" + mes['room'] + "&starttime=" + date + "&username=" + name + "&email=" + email + "&url=<%=parts[0]%>";
                                                    //alert(data);
                                                    $.ajax({
                                                        url: "angle_group/videoUpload.jsp",
                                                        type: "GET",
                                                        data: data,
                                                        dataType: "json",
                                                        success: setGenerateLinksForTesting,
                                                        error: onError
                                                    });
                                                }
                                                function setGenerateLinksForTesting(data) {
                                                    //alert("success");
                                                }
                                                function onError() {
                                                    //alert("error .. ");
                                                }
                                                function genlinks2() {


                                                    var data = "start=" + startConferenceTime + "&groupId=" + gid + "&stop=" + stopConferenceTime + "&email=" + email1 + "&topic=" + room + "&noOfParticipants=" + noOfParticipants + "&url=<%=parts[0]%>";
                                                    // alert(data);
                                                    $.ajax({
                                                        url: "angle_group/conferenceSave.jsp",
                                                        type: "GET",
                                                        data: data,
                                                        dataType: "json",
                                                        success: setGenerateLinksForTesting2,
                                                        error: onError2
                                                    });
                                                }
                                                function setGenerateLinksForTesting2(data) {
                                                    // alert("success");
                                                }
                                                function onError2() {
                                                    //alert("error .. ");
                                                }


                                                function linkShare() {

                                                    var link = document.getElementById("topic").value.toString();

                                                    link = link.trim();

                                                    var data = "link=" + link + "&gid=" + gid + "&url=<%=parts[0]%>";

                                                    $.ajax({
                                                        url: "angle_group/conferenceLinkShare.jsp",
                                                        type: "GET",
                                                        data: data,
                                                        dataType: "json",
                                                        success: setGenerateLinksForTesting3,
                                                        error: onError3
                                                    });
                                                }
                                                function setGenerateLinksForTesting3(data) {
                                                    //alert(data);
                                                }
                                                function onError3() {
                                                    //alert("error .. ");
                                                }

                                                function analytics(url) {
                                                    //alert(url);
                                                    // window.location = url + '?gid=' + gid;
                                                    $("#Vanish").load(url + '?gid=' + gid);
                                                }

                                            </script>





                                            <script src="js/jquery.min.js"></script>



                                            <%
                                                email1 = request.getParameter("email");

                                            %>


                                            <!--WebRTC-->


                                        </div>

                                        <div class="tab-pane" id="discussion">

                                        </div>

                                        <!--        Polls Section
                                                Section starts Here
                                        -->

                                        <%@ include file="Poll.jsp" %>

                                        <!--        Polls Section
                                                    Section ends Here
                                        -->


                                    </div>
                                </div> 
                            </div>
                        </div>

                        <!--
                            END
                            TOP View The LIST Displayed Assignment Poll VideoChat DiscussionForum
                        -->




                        <!-- 
                            START
                            Post The Notes For The Group
                        -->
                        <!--Group Posts-->
                        <div id="posts">  
                            <b>GROUP  POSTS </b>
                            Total posts:  <s:property value="GroupPost.size()"/>
                            <s:set var="counter" value="0"/>
                            <s:iterator value="GroupPost">

                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="x_panel">
                                            <div class="x_content">
                                                <s:property value="username"/> To Group: <s:property value="groupName"/>
                                                <hr>
                                                <s:if test="#attr.GroupPost.get(#counter).type==1">
                                                    Note is : <b><s:property value="note"/></b>
                                                    <div class="panel-title pull-right">
                                                        <s:property value="date_time"/>
                                                    </div>

                                                    <br><br>

                                                    <a href="<s:property value="referenceLink" />" target="_blank"><s:property value="referenceLink" /></a>
                                                    <br><br>
                                                    <a href="<s:url value='/uploadedfiles/'/><s:property value="NoteId"/><s:property value="myFileFileName"/>" target="_blank"><s:property value="myFileFileName"/>
                                                    </a>

                                                </s:if>
                                                <s:if test="#attr.GroupPost.get(#counter).type==2">
                                                    Assignment is: <b><s:property value="name"/></b>
                                                    <div class="panel-title pull-right">
                                                        <s:property value="postDate"/>
                                                    </div>
                                                    <div>Title:  <s:property value="name"/></div>

                                                    <div>Description:  <s:property value="description"/></div>
                                                    <div>Due Date:  <s:property value="datepicker"/></div>
                                                    <div>Due Time:  <s:property value="hour"/>:<s:property value="min"/></div>
                                                    <div>Attachment:   <s:property value="attachment"/>
                                                        <s:if test="attachment!=null">
                                                            <a href="<s:url value='/uploadedfiles/'/><s:property value="attachment"/><s:property value="gid"/><s:property value="id"/>" target="_blank"><i class="fa fa-file"></i></a>
                                                            </s:if>
                                                    </div>
                                                </s:if>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <s:set var="counter" value="#counter+1"/>
                            </s:iterator>
                        </div>


                        <!-- 
                           START
                           Post The Notes For The Group
                        -->    


                        <!--      
                                   DIV START
                                   To show all the members of the group               
                        -->
                        <div class="x_panel" id="membersList" style="display:none;" >
                            <div class="x_title">
                                <h1><s:property value="currGroup.groupName"/> </h1>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                            </div>
                            <div class="x-content">
                                <h2 style="text-align:center"> Members</h2>
                                <div id="allMembers">
                                    <s:set var="cnt" value="-1" />
                                    <s:if test="members.size !=0">
                                        <s:iterator value="members" status="incrementer" begin="0" end="((members.size)/2)">

                                            <s:set var="cnt" value="#cnt+1" />
                                            <div class="row">
                                                <br>
                                                <s:if test="#attr.members.get(#cnt).userName != null">
                                                    <div class="w3-container col-sm-6">
                                                        <div class="w3-card-4">
                                                            <header class="w3-container">
                                                                <h1><s:property value="#attr.members.get(#cnt).userName"/></h1>
                                                            </header>

                                                            <div class="w3-container">
                                                                <h4> <b> Role : </b> <span id="roleOfMember" style="color:blue;"><s:property value="#attr.members.get(#cnt).profileName"/>&nbsp;&nbsp;</span><a onclick="showProfiles('<s:property value="profilesList"/>', '<s:property value="gid"/>', '<s:property value="#attr.members.get(#cnt).userId"/>');"><i class="fa fa-edit"></i></a></h4>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </s:if>
                                                <s:set var="cnt" value="#cnt+1" />
                                                <s:if test="#attr.members.get(#cnt).userName != null">
                                                    <div class="w3-container col-sm-6">
                                                        <div class="w3-card-4">
                                                            <header class="w3-container">
                                                                <h1><s:property value="#attr.members.get(#cnt).userName"/></h1>
                                                            </header>
                                                            <div class="w3-container">

                                                                <h4> <b> Role : </b> <span id="roleOfMember" style="color:blue;"><s:property value="#attr.members.get(#cnt).profileName"/>&nbsp;&nbsp;</span><a onclick="showProfiles('<s:property value="profilesList"/>', '<s:property value="gid"/>', '<s:property value="#attr.members.get(#cnt).userId"/>');"><i class="fa fa-edit"></i></a></h4>
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
                    

                        <!--      
                                   DIV CLOSED
                                   To show all the members of the group               
                        -->

                        <!--                    	DIV START
                                                               TOPIC MODAL
                        -->
                        <div id="addTopic" class="modal fade" role="dialog">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Add New Topic</h4>
                                    </div>
                                    <div class="modal-body form-horizontal form-label-left">
                                        <div class="form-group">
                                            <form name="createTopic" id="topicForm">
                                                Add Topic
                                                <input type="hidden" id="userID" name="userId" value="<%=uid%>">
                                                <input type="hidden" id="groupID" name="groupId" value="<s:property value="gid"/>">
                                                <br>
                                                <input type="text" placeholder="Enter New Topic" name="topic_name"  id="topic_name" class="form-control" onkeyup="checkExisting(this.value);">
                                                <div id="link_div1" class="form-group"></div>
                                                <span id="topicError" style="display:none;color:red"> </span>
                                                <div id="successMsgError" class="errorMsgalert" style="display:none;">

                                                </div>
                                            </form>
                                        </div>
                                        <div class="form-group">
                                            <div>
                                                <button id="Button1" align="center" class="btn btn-success" onclick="addTopic();">Create Topic</button>  
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!--                    	DIV CLOSE
                                                TOPIC MODAL
                        -->   	 

                    </div>
                </div>


                <%@ include file="../include/footer.jsp" %>
            </div>
        </div>

        <%@ include file="../include/script.jsp" %>
        <%@ include file="../include/notifications.jsp" %>
        <script src="asset/iCheck/icheck.min.js"></script>
        <script src="asset/switchery/dist/switchery.min.js"></script>
        <script src="../include/functioning.js" type="text/javascript"></script>
        <script>
                                                    displayTheToDoList(<%=request.getParameter("groupId")%>,<s:property value="#session.loggedInUser.loginId"/>);

        </script>
        <!--Created by Oishi -->
        <script src="include/notes.js" type="text/javascript"></script>
        <script src="include/assignment.js" type="text/javascript"></script>
        <script src="js/daterangepicker.js"></script> 
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/video.js"></script>
        <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"rel = "stylesheet">
        <script src="asset/jquery_alerts/jquery-confirm.min.js"></script>




        <script>
                                                    /*
                                                     * 
                                                     */
                                                    function check()
                                                    {
                                                        var btn = document.getElementById("sub");
                                                        btn.disabled = false;
                                                    }


                                                    $(function () {
                                                        $("#datepicker").datepicker({minDate: 0});
                                                        $("#datepicker1").datepicker();
                                                        $("#enddatepicker").datepicker({minDate: 0});

                                                    });




                                                    $().ready(function () {
                                                        $("#assignment_home").validate();
                                                        $("#Assignment_Name").rules("add", {
                                                            required: true,
                                                            maxlength: 45,
                                                            messages: {
                                                                required: "Please enter title",
                                                                maxlength: "maximum length of title should be 45"
                                                            }
                                                        });

                                                        $("#description").rules("add", {
                                                            required: true,
                                                            messages: {
                                                                required: "Please enter description"

                                                            }
                                                        });

                                                        $("#datepicker").rules("add", {
                                                            required: true,
                                                            messages: {
                                                                required: "Please enter due date"

                                                            }
                                                        });
                                                    });


                                                    function checkSpace() {

                                                        var name = document.getElementById("Assignment_Name").value;
                                                        document.getElementById("Assignment_Name-error").style.display = "none";
                                                        document.getElementById("Assignment_Name-error").innerHTML = "";
                                                        if (name.trim() === "")
                                                        {
                                                            document.getElementById("Assignment_Name-error").style.display = "inline";
                                                            document.getElementById("Assignment_Name-error").innerHTML = "Please enter title correctly";
                                                        }
                                                    }

                                                    $().ready(function () {
                                                        $("#note-form").validate();
                                                        $("#note").rules("add", {
                                                            required: true,
                                                            maxlength: 200,
                                                            messages: {
                                                                required: "Please enter your note",
                                                                maxlength: "maxlength is 200"
                                                            }
                                                        });

                                                    });


        </script>

    </body>
</html>
