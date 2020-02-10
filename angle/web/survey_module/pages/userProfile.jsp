<%-- 
    Document   : userProfile
    Created on : 5 Apr, 2017, 10:39:23 AM
    Author     : dipesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ include file="/include/header.jsp" %>
        <title>Survey| User Profile </title>
        <link href="asset/jquery_alerts/jquery-confirm.min.css" rel="stylesheet">
        <style>
            .cpassword-error, .npassword-error{
                float: left;
                margin: 0 0 10px 35px;
                padding: 3px 10px;
                color: #FFF;
                border-radius: 3px 4px 4px 3px;
                background-color: #CE5454;
                max-width: 350px;
                /*white-space: pre;*/
                position: relative;
                left: -15px;
                opacity: 1;
                z-index: 1;
                transition: 0.15s ease-out;
            } 
            
            .npassword-error::after, .cpassword-error::after {
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
        </style>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="/include/menu.jsp" %>
                <div class="right_col" role="main">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>User Profile</h2>
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
                                <h3><s:if test="#session.loggedInUser != null"><s:property value="#session.loggedInUser.loginName"/></s:if></h3>

                                <ul class="list-unstyled user_data" style="display: none;">
                                    <li><i class="fa fa-map-marker user-profile-icon"></i> San Francisco, California, USA
                                    </li>

                                    <li>
                                        <i class="fa fa-briefcase user-profile-icon"></i> Software Engineer
                                    </li>

                                    <li class="m-top-xs">
                                        <i class="fa fa-external-link user-profile-icon"></i>
                                        <a href="http://www.kimlabs.com/profile/" target="_blank">www.kimlabs.com</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="profile_title">
                                <div class="col-md-6">
                                    <h2>Password & sign-in method</h2>
                                </div>
                                </div>
                                <div class="x_content">
                                    Your password protects your account. 
                                    <br/><br/>
                                    <label>Last Updated on : </label>&nbsp;&nbsp; <span><s:property value="per.passwordUpdate"/></span><br>
                                    <label style="text-decoration: underline; cursor: pointer;" onclick="showChangePass()">Change Password</label>
                                    <div id="passDetails" style="display: none;" class="form-horizontal form-label-left input_mask">
                                        <input type="hidden" id="personid" value="<s:property value="#session.loggedInUser.loginId"/>"/>
                                        <input type="hidden" id="ipAddress" value="<s:property value="per.ipAddress"/>"/>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="new_password">New Password <span class="required">*</span>
                                            </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="password" maxlength="15" id="new_password" required="required" class="form-control col-md-7 col-xs-12" title="It should be 8 to 15 characters, accept only alphabet and numeric." onkeyup="checkPassword('new',this.value)">
                                            <label id="newPassError" class="npassword-error" style="display: none;">please enter new password. It should be 8 to 15 characters, accept only alphabet and numeric.</label>
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="confirm_password">Confirm Password <span class="required">*</span>
                                            </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <input type="password" maxlength="15" id="confirm_password" required="required" class="form-control col-md-7 col-xs-12" onPaste='return false' title="It should be same as new password" onkeyup="checkPassword('confirm',this.value)">
                                            <label id="confirmPassError" class="cpassword-error" style="display: none;">please enter confirm password. It should be same as new password.</label>
                                            </div>
                                        </div>
                                        <div class="ln_solid"></div>
                                        <div class="form-group">
                                            <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                            </label>
                                            <div class="col-md-9 col-sm-9 col-xs-12">
                                                <button type="submit" class="btn btn-success" onclick="changePassword()">Submit</button>
                                            </div>
                                        </div>
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
            function isPasswordValid(str) {
                var result = false;
                var alphaExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,15}$/;
                if (str.match(alphaExp)) {
                    result = true;
                }
                return result;
            }
        </script>
        <script>
            function showChangePass(){
                document.getElementById("passDetails").style.display="inline";
            }
            
            function changePassword(){
                var npassword,cpassword,val=0,userid,ipAddress="";
                npassword=document.getElementById("new_password").value;
                cpassword=document.getElementById("confirm_password").value;
                userid=document.getElementById("personid").value;
                ipAddress=document.getElementById("ipAddress").value;
                document.getElementById("newPassError").style.display="none";
                document.getElementById("confirmPassError").style.display="none";
                document.getElementById("new_password").style.border="";
                document.getElementById("confirm_password").style.border="";
                if(npassword.trim().length > 0){
                    if(!isPasswordValid(npassword.trim())){
                         document.getElementById("newPassError").style.display="inline";
                         document.getElementById("new_password").style.border="1px solid #CE5454";
                         val++;
                    }
                }else{
                    document.getElementById("newPassError").style.display="inline";
                    document.getElementById("new_password").style.border="1px solid #CE5454";
                    val++;
                }
                
                if(cpassword.trim().length > 0){
                    if(!isPasswordValid(cpassword.trim())){
                         document.getElementById("confirmPassError").style.display="inline";
                         document.getElementById("confirm_password").style.border="1px solid #CE5454";
                         val++;
                    }else{
                        if (!((npassword) == (cpassword))) {
                             document.getElementById("confirmPassError").style.display="inline";
                             document.getElementById("confirm_password").style.border="1px solid #CE5454";
                             val++;
                        }
                    }
                }else{
                    document.getElementById("confirmPassError").style.display="inline";
                    document.getElementById("confirm_password").style.border="1px solid #CE5454";
                    val++;
                }
                
                if(val == 0){
                    saveUserPassword(npassword,userid,ipAddress);
                }
                
            }
            
            function checkPassword(id,val){
                document.getElementById(id+"PassError").style.display="none";
                document.getElementById(id+"_password").style.border="";
                if(!isPasswordValid(val)){
                    document.getElementById(id+"PassError").style.display="inline";
                    document.getElementById(id+"_password").style.border="1px solid #CE5454";
                }
            }
            
            function onError(jqXHR, textStatus, errorThrown) {
                $.alert({
                        title: 'Error',
                        content: textStatus+' '+errorThrown
                    });
                //alert("Error : " + textStatus + " " + errorThrown);
            }
            
            function saveUserPassword(newpass,pid,ipAddress) {
                var data = "userid=" + pid + "&newpass=" + newpass+"&ipAddress="+ipAddress;
                $.ajax({
                    url: "survey_module/pages/DAO_changePassword.jsp",
                    type: "GET",
                    data: data,
                    dataType: "json",
                    success: set_changePassword,
                    error: onError
                });
            }

            function set_changePassword(data) {
                if (data > 0) {
                    document.getElementById("new_password").value="";
                    document.getElementById("confirm_password").value="";
                    document.getElementById("passDetails").style.display="none";
                    $.alert({
                        title: 'password updated.',
                        content: ''
                    });
                    //alert("data save successfully");
                } else {
                    $.alert({
                        title: 'Error',
                        content: ''
                    });
                    //alert("error");
                }
            }
        </script>
    </body>
</html>
