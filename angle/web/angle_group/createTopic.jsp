

<%-- 
    Document   : createTopic
    Created on : 25 May, 2017, 3:03:08 PM
    Author     : sakshi
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
    <title> AnGLE </title>
    <link href="asset/jquery_//alerts/jquery-confirm.min.css" rel="stylesheet">
    <style>

        body {
            padding : 10px ;

        }

        #exTab1 .tab-content {
            color : white;
            background-color: #D5DBE1;
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






    </style>
</head>
<body class="nav-md">
    <div class="container body">
        <div class="main_container">



            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <div class="navbar nav_title" style="border: 0;">
                        <a href="home.html" class="site_title"><i class="fa fa-paw"></i> <span>AnGLE</span></a>
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

                    <br>

                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section">
                            <h3>General</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-home"></i> TOPICS<span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <s:iterator value="listOfTopics">
                                            <li> 
                                                <a>
                                                    <s:property value="name"/>
                                                    <label type="button" data-toggle="modal" data-target="#updateTopic" onclick="updateTopic('<s:property value="name"/>', '<s:property  value="topicId"/>')"><i class="fa fa-edit"></i></label>
                                                        <%-- <s:hidden  value="%{topicId}" name="tid" /> --%>
                                                </a> 
                                            </li>   
                                        </s:iterator>   
                                    </ul>
                                </li>
            
                                
                                <li><a><i class="fa fa-edit"></i> Manage Groups <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="createSurvey.html">Create Groups</a></li>
                                        <li><a href="updateSurvey.html">Update Groups</a></li>
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
            <div class="right_col" role="main">

                <script>// function func(){//alert("hello");document.getElementById("webRTC").value=1;ifReset();}</script>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div id="exTab1" class="container">	
                                    <ul  class="nav nav-pills">
                                        <li class="active">
                                            <a  href="#1a" data-toggle="tab">Notes</a>
                                        </li>
                                        <li><a href="#2a" data-toggle="tab">Assignment</a>
                                        </li>
                                        
                                        <li><a href="#3a" data-toggle="tab">Quiz</a>
                                        </li>
                                        <li id="webRTC" value="0"><a href="#4a" onclick="ifReset()" data-toggle="tab">Video conference</a>
                                        </li>
                                    </ul>

                                    <div class="tab-content clearfix">
                                        <div class="tab-pane active" id="1a">
                                            <div class="container body">
                                                <div class="main_container">
                                                    <div class="right_col" role="main">
                                                        <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
                                                        <link rel="stylesheet" href="style.css">
                                                        <!-- <script src="js/autocomplete-0.3.0.js"></script>-->



                                                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                                                        <title>Note Page</title>
                                                        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



                                                        <div id="searchwrap" class="SearchBar">

                                                            <form id="search-form" name="search" action="products.html" method="post" enctype="multipart/form-data">
                                                                <div class="wrapper">
                                                                    <div class="left">
                                                                        <div class="main">
                                                                            <textarea name="n.note"   id="note" cols="" rows="" placeholder="Enter note"></textarea>
                                                                            <label class="error-msg"></label>


                                                                        </div>

                                                                        <div class="main">
                                                                            <input id="search" name="n.groupName" type="text" placeholder="send in a group,person" onblur="">
                                                                            <label class="error-msg"></label>
                                                                        </div>    
                                                                        <br>
                                                                        <br>
                                                                        <br>
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

                                                                                        </div></div>
                                                                                    <!-- <div class="col-md-12 col-sm-12 col-xs-12 modal-body">
                                                                                         <div class="input-group">
                                                                                             <input type="text" class="form-control" placeholder="link title"/>
                                            
                                                                                         </div>
                                                                                     </div>-->
                                                                                    <div class="modal-footer">
                                                                                        <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <br>
                                                                        <br>
                                                                        <label for="myFile">Upload your file</label>
                                                                        <input type="file" name="n.myFile" id="files" onclick="check()" onblur="validate1()" />
                                                                        <s:property value="myFileFileName"/>
                                                                        <!--<button value="Upload"> Upload </button>-->
                                                                        <br>
                                                                        <br>
                                                                        <button type="submit"  id="sub" class="btn btn-default">Post</button>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                    </div>
                                                </div> 
                                                </form>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="2a">
                                            <p> insert para here </p>
                                        </div>
                                        <div class="tab-pane" id="3a">

                                        </div>
                                        <div class="tab-pane" id="4a">


                                            <!-- 
                                        webRTc
                                            <!--                                            <button id="b1" value="0" type="button"onclick="ifReset()" class="btn btn-info btn-lg">VIDEO CONFERENCE</button>-->
                                            <iframe name="go" style="width:1500px" height="800px"  src="" frameborder="0"></iframe>
                                            <script>
                                                function ifReset() {

                                                    var val = document.getElementById("webRTC").value;
//                                                    alert(val);
//                                                    alert(typeof (val));
                                                    if (val === 0) {

                                                        window.open('video.html?id=<s:property value='gid'/>' + "&groupCode=<s:property value='groupCode'/>", 'go');
                                                        document.getElementById("webRTC").value = 1;
                                                    } else {

                                                        window.location = "#4a";
                                                    }

                                                }
                                            </script>
                                            <!--                                        
                                               webRTC Group 
                                                                                        
                                            -->
                                        </div>
                                    </div>
                                </div>


                                <hr></hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--  ADD TOPIC MODAL
       
                       
       <button onclick="setId('');" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#addTopic">Add New Topic</button>
       <div id="addTopic" class="modal fade" role="dialog">
       <div class="modal-dialog">
           <div class="modal-content">
               <div class="modal-header">
                   <button type="button" class="close" data-dismiss="modal">&times;</button>
                   <h4 class="modal-title">Add New Topic</h4>
               </div>
               <div class="modal-body">
                   <form id="demo-form" data-parsley-validate  method="post" action="addTopic.html">
                       <label for="fullname">Topic Name :</label>
                       <input type="hidden" id="gID" name="t.groupId" required/>
                       <input type="text" id="fullname" class="form-control" name="t.name" required/>
                       <button type="submit" class="btn btn-primary">Create Topic</button>
                   </form>
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               </div>
           </div>
       </div>
       </div>                
        -->
        <!--         NEW ADD TOPIC              -->

        <!--<button type="button" class="btn btn-info btn-lg" >NOTES</button>
         
        <eame src="Notes.html" width="600" height="400">
        </iframe>
        <a href="Notes.html"><button type="button" class="btn btn-info btn-lg" >NOTES</button></a>
         
        
        
        
        
        <button type="button" class="btn btn-info btn-lg" >ASSIGNMENTS</button>
         <button type="button" class="btn btn-info btn-lg" >QUIZZES</button>
         <button type="button" class="btn btn-info btn-lg" >GROUP DISCUSSION</button>
         <button type="button" class="btn btn-info btn-lg" >VIDEO CHAT</button>-->

        <button onclick="setId('<s:property value="gid"/>');" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#addTopic">Add New Topic</button>
        <div id="addTopic" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add New Topic</h4>
                    </div>
                    <div class="modal-body form-horizontal form-label-left">
                        <div class="form-group">
                            <form name="createTopic">
                                <input type="hidden" id="gID" name="t.groupId" required/>
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">Enter Topic Name:<span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text"  id="topic_name" class="form-control" onblur="checkExisting(this.value);">
                                </div>
                                <div id="link_div1" class="form-group">
                                </div>
                                <span id="topicError" style="display:none;color:red"> </span>
                                <div id="successMsgError" class="errorMsgalert" style="display: none;">
                                    please put something here
                                </div>
                            </form>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <button id="Button" class="btn btn-success" onclick="addTopic();">Create Topic</button>  
                            </div>
                        </div> 
                    </div>

                </div>

            </div>
        </div>
    </div>                

    <div id="updateTopic" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Update Topic Name</h4>
                </div>
                <div class="modal-body form-horizontal form-label-left">
                    <div class="form-group">

                        <input type="hidden" id="tID" name="t.topicId" required/>
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Enter Topic Name:<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text"  id="topic_Name" class="form-control">
                        </div>
                        <div id="successMsgError" class="errorMsgalert" style="display: none;">
                            please put something here
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <button id="snext" class="btn btn-success" onclick="changeTopicName();">Update Topic Name</button>  
                        </div>
                    </div>
                </div>                
            </div>
        </div>
    </div>
    <%@ include file="/include/footer.jsp" %>
</div>
</div>
<%@ include file="/include/script.jsp" %>

<script src="asset/jquery_alerts/jquery-confirm.min.js"></script>
<script>

                                function setId(gid)
                                {
                                    document.getElementById("gID").value = gid;
                                }
                                function updateTopic(tname, tid)
                                {

                                    document.getElementById("topic_Name").value = tname;
                                    document.getElementById("tID").value = tid;
                                }
                                function addTopic()
                                {
                                    var tname = document.getElementById("topic_name").value;
                                    var gid = document.getElementById("gID").value;
                                    document.getElementById("successMsgError").style.display = "none";
                                    if (tname.trim().length == 0)
                                    {
                                        document.getElementById("successMsgError").style.display = "inline";
                                    } else
                                    {
                                        var data = "topicName=" + tname + "&gid=" + gid;
                                        $.ajax({
                                            url: "angle_group/DAO_addTopic.jsp",
                                            type: "GET",
                                            data: data,
                                            dataType: "json",
                                            success: setTopicName,
                                            error: onError
                                        });
                                    }
                                }
                                function setTopicName(data) {

                                    var res = data.split("#");
                                    if (parseInt(res[1]) > 0) {

                                        if (!alert('Topic Added Successfully'))
                                            location.reload();
                                    } else
                                    {
                                        if (!alert('Try Again'))
                                            location.reload();
                                    }
                                }

                                function onError() {
                                    $.alert({
                                        title: 'Error',
                                        content: ''
                                    });
                                    //alert("Error : " + textStatus + " " + errorThrown);
                                }
                                function changeTopicName()
                                {
                                    var tname = document.getElementById("topic_Name").value;
                                    var tid = document.getElementById("tID").value;
                                    document.getElementById("successMsgError").style.display = "none";
                                    if (tname.trim().length == 0)
                                    {
                                        document.getElementById("successMsgError").style.display = "inline";
                                    } else
                                    {
                                        var data = "topicName=" + tname + "&tid=" + tid;
                                        $.ajax({
                                            url: "angle_group/DAO_updateTopicName.jsp",
                                            type: "GET",
                                            data: data,
                                            dataType: "json",
                                            success: updateTopicName,
                                            error: onError
                                        });
                                    }
                                }
                                function updateTopicName(data) {
                                    if (parseInt(data) > 0) {
                                        if (!alert('Topic Updated Successfully'))
                                            location.reload();
                                    } else
                                    {
                                        if (!alert('Try Again'))
                                            location.reload();
                                    }
                                }
</script>

<script>

    //       function clearModal()
    //       {
    //            document.createGroup.reset();
    //            document.getElementById("link_div").innerHTML = "";
    //            document.getElementById("link_div1").innerHTML = "";
    //       }
    //       

    function checkExisting(tname) {
        // alert('abc')
        //            alert(tname)
        document.getElementById("Button").disabled = false;
        //var gname = document.getElementById("groupname").value;
        var gid = document.getElementById("gID").value;
        // document.getElementById("groupname").style.border = "";
        document.getElementById("topicError").style.display = "none";
        var reg = /^[a-zA-Z0-9\s]+$/;
        if (reg.test(tname))
        {
            //                alert(tname)
            document.getElementById("topicError").style.display = "none";
            validateTopicName(tname, gid);
        } else {
            document.getElementById("topicError").style.display = "inline";
            document.getElementById("link_div1").innerHTML = "";
            document.getElementById("link_div1").innerHTML = "Invalid group name";
            document.getElementById("link_div1").style.color = "red";
            document.getElementById("Button").disabled = true;

        }

    }
    function validateTopicName(tname, gid) {
        //            var data = "groupname=" + gname + "&uid=" + uid+"&url=<%=parts[0]%>"; 
        var data = "topicname=" + tname + "&gid=" + gid + "&url=<%=parts[0]%>";
        alert("data : " + data);
        $.ajax({
            url: "angle_group/DAO_checkTopicName.jsp",
            type: "GET",
            data: data,
            dataType: "json",
            success: validTopicName,
            error: OnError
        });
    }
    function validTopicName(data) {
        //alert(data)
        if (data > 0) {
            //                document.getElementById("link_div").innerHTML = "";
            //                document.getElementById("link_div").innerHTML = "group name approved";
            //                document.getElementById("link_div").style.color="green";
            document.getElementById("Button").disabled = false;
            document.getElementById("link_div1").innerHTML = "";
            document.getElementById("link_div1").innerHTML = "group name approved";
            document.getElementById("link_div1").style.color = "green";
            //                document.getElementById("Button1").disabled = false;
        } else {
            //                alert("Email already taken");
            //                document.getElementById("link_div").innerHTML = "";
            //                document.getElementById("link_div").innerHTML = "Group Name already taken";
            //                document.getElementById("link_div").style.color = "red";
            document.getElementById("Button").disabled = true;
            document.getElementById("link_div1").innerHTML = "";
            document.getElementById("link_div1").innerHTML = "Group Name already taken";
            document.getElementById("link_div1").style.color = "red";
            //                document.getElementById("Button1").disabled = true;
        }
    }
    function OnError() {

        alert("Try Again");
    }


</script>

</body>