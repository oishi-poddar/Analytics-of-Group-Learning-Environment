<!--
Document   : Welcome
    Created on : 25 May, 2017, 10:33:59 AM
    Author     : Kunal
-->


<%@page import="org.apache.struts2.ServletActionContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    HttpServletRequest req = ServletActionContext.getRequest();
    String url = (req.getRequestURL()).toString();
    String parts[] = url.split("template");
    session.setAttribute("name1", "name11");
%>
<!DOCTYPE html>
<title>NMEICT Group</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    html
    {
        height: 100%
    }
    h3
    {
        color:black;
        font-size: 28px;
        font-family: Helvetica,Arial;
    }
    h1
    {
        font-size: 40px;
        font-family: Helvetica,Arial;
        color:black;
    }
    p
    {
        font-size: 25px;
        font-family: Helvetica,Arial;
        color:black;
    }
    body
    {
        background-image: url("angle/images/background.jpg");

        background-size: 100% 100%;
    }
    #login
    {
        left: 90%;
    }
    hr
    {
        display: block;
        margin-top: 0.5em;
        margin-bottom: 0.5em;
        margin-left: auto;
        width: 40%;
        background: #a6aab9;
        margin-right: auto;
        border-style: inset;
        border-width: 1px;
    }
</style>
<body>
    <script>
        function validate() {
            var username = document.register.name.value;
            var password = document.register.password.value;
            var gender = document.register.gender.value;
            var email = document.register.email.value;
            var checkemail = validateCaseSensitiveEmail(email);

            // reset errors here
            document.getElementById("userNameError").style.display = "none";
            document.getElementById("passwordError").style.display = "none";
            document.getElementById("genderError").style.display = "none";
            document.getElementById("emailError").style.display = "none";
            var result = 0;

            if (username === "")
            {
                document.getElementById("userNameError").style.display = "inline";
                result++;
            }
            if (password === "")
            {
                document.getElementById("passwordError").style.display = "inline";
                result++;
            }
            if (gender === "")
            {
                document.getElementById("genderError").style.display = "inline";
                result++;
            }
            if (email === "")
            {
                document.getElementById("emailError").style.display = "inline";
                result++;
            }

            if (checkemail == false) {
                document.getElementById("emailError").style.display = "inline";
                result++;
            }

            if (result > 0) {
                return false;
            }
        }

        function validateCaseSensitiveEmail(email)
        {
            var reg = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/;
            if (reg.test(email))
            {
                document.getElementById("emailError").style.display = "none";
            } else {
                document.getElementById("emailError").style.display = "inline";
            }
        }

        function lettersOnlyUserName(username)
        {
            var alphaExp = /^[a-zA-Z]+$/;
            if (username.match(alphaExp))
            {
                document.getElementById("invalidUserNameError").style.display = "none";
            } else {
                document.getElementById("invalidUserNameError").style.display = "inline";
            }
        }

    </script>

    <script>
        function checkExisting() {
            var email = document.getElementById("email").value;
            document.getElementById("email").style.border = "";
            document.getElementById("emailError").style.display = "none";
            var reg = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/;
            if (reg.test(email))
            {
                document.getElementById("emailError").style.display = "none";
                genlinks(email)
            } else {
                document.getElementById("emailError").style.display = "inline";
                document.getElementById("link_div").innerHTML = "";
                document.getElementById("link_div").innerHTML = "";

            }

        }

        function genlinks(email) {
            var data = "emailId=" + email + "&url=<%=parts[0]%>";
            //alert("data : "+ data);
            $.ajax({
                url: "angle_group/DAO_CheckEmail.jsp",
                type: "GET",
                data: data,
                dataType: "json",
                success: validEmail,
                error: onError
            });
        }

        function validEmail(data) {
            if (data > 0) {
                document.getElementById("link_div").innerHTML = "";
                document.getElementById("link_div").innerHTML = "Email approved";
                document.getElementById("link_div").style.color = "green";
                document.getElementById("Button").disabled = false;
            } else {
//                alert("Email already taken");
                document.getElementById("link_div").innerHTML = "";
                document.getElementById("link_div").style.color = "red";
                document.getElementById("link_div").innerHTML = "Email already taken";
                document.getElementById("Button").disabled = true;
            }
        }
        function onError() {
            alert("Try Again");
        }

    </script>

    <div class="container-fluid">
        <div>
            <a href="SignIn.html"> <button type="button" id="login" class="glyphicon glyphicon-user btn btn-info"> Login</button>

                <div>
                    <%    if (session.getAttribute("name") == "success") {
                            session.setAttribute("name", null);    %>

                    <div class="alert alert-success alert-dismissable fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> You are registered successfully.
                    </div>                    
                    <%       }
                        if (session.getAttribute("name") == "failure") {
                            session.setAttribute("name", null); %>

                    <div class="alert alert-danger alert-dismissable fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error</strong> Unable to register
                    </div>
                    <%     }%>

                </div>
            </a>
            <br><br><br><br><br>
            <div class="text-center">
                <h1>Group Learning Environment</h1>
            </div>
        </div>
    </div>
    <div class="container-fluid full">
        <div class="text-center">
            <br>
            <p>The safest and easiest way for educators to connect and <br> collaborate with students, mentors, and each other.</p>
        </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br><hr>
    <div class="text-center head-main container-fluid">
        <h3>Create your free account</h3>
        <div>

            <!--<button id="mentor" onclick="genlinks(this.value)" value="Mentor" class=" btn-lg btn-primary"> Mentor</button>
            -->


            <button  id="mentor"  class="glyphicon glyphicon-user btn-lg btn-danger" value="Mentor" class="btn-default" data-toggle="modal" data-target="#myModal"> Register</button>

            <!-- Modal  -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h2 class="modal-title">Sign Up</h2>
                        </div>
                        <form class="form-horizontal form-label-left" action="doSignup.html" name="register" method="post" novalidate="" id="register">

                            <s:if test = "hasActionErrors()">
                                <div class="alert alert-danger alert-dismissable">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close" style="top: -10px;">×</a>
                                    <s:actionerror/>
                                </div>
                            </s:if>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="name" id="name" title="Enter between 6 to 45" class="form-control" required="required" class="form-control col-md-7 col-xs-12" value="">
                                    <span id="nameError" style="display:none;color:red">Please Enter Name</span>
                                    <label class="error-msg"><s:property value="fieldErrors.get('name').get(0)" /></label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="email" name="email" id="email" required="required" class="form-control col-md-7 col-xs-12" value="" onblur="checkExisting();">
                                    <span id="emailError" style="display:none;color:red"> </span>  
                                    <label class="error-msg"><s:property value="fieldErrors.get('email').get(0)" /></label>
                                    <div id="div">
                                    </div>
                                </div>
                            </div>
                            <div id="link_div" class="form-group">
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">Password <span class="required">*</span>
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="password" name="password" id="password" required="required" class="form-control col-md-7 col-xs-12" value="">
                                    <span id="passwordError" style="display:none;color:red">Please Enter Password</span>
                                    <label class="error-msg"><s:property value="fieldErrors.get('password').get(0)" /></label>
                                </div>

                            </div>

                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gender">Gender*
                                </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="radio" name="gender" value="male" id="gender"> Male &nbsp; &nbsp; &nbsp; &nbsp;
                                    <input type="radio" name="gender" value="female" id="gender"> Female<br>
                                </div>

                            </div>
                            <button type="submit" value="submit" id="Button" class="glyphicon  btn-lg btn-danger">SignUp</button>

                        </form>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            &nbsp;&nbsp;



        </div>
        <%@ include file="/include/script.jsp" %>
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>

                                        $().ready(function () {

                                            $("#register").validate();

                                            $.validator.addMethod("alpha", function (value, element) {
                                                return this.optional(element) || value == value.match(/^[a-zA-Z\s]+$/);
                                            });
                                            $("#name").rules("add", {
                                                required: true,
                                                alpha: true,
                                                maxlength: 45,
                                                minlength: 6,
                                                messages: {
                                                    required: "Please enter your name",
                                                    alpha: "Enter a valid name"
                                                }
                                            });
                                            $("#email").rules("add", {
                                                required: true,
                                                email: true,
                                                messages: {
                                                    required: "Please enter an email address",
                                                    email: "Invalid email address"
                                                }
                                            });
                                            $("#password").rules("add", {
                                                required: true,
                                                minlength: 8,
                                                messages: {
                                                    required: "Please provide a password",
                                                    minlength: "Your password must be at least 8 characters long including uppercase, lowercase letters and numbers"
                                                }
                                            });
                                            $("#gender").rules("add", {
                                                required: true,
                                                messages: {
                                                    required: "Please select your gender",
                                                }
                                            });
                                        });


        </script>
        <script>

            $().ready(function () {

                $("#register1").validate();

                $.validator.addMethod("alpha", function (value, element) {
                    return this.optional(element) || value == value.match(/^[a-zA-Z\s]+$/);
                });
                $("#name").rules("add", {
                    required: true,
                    alpha: true,
                    maxlength: 45,
                    minlength: 6,
                    messages: {
                        required: "Please enter your name",
                        alpha: "Enter a valid name"
                    }
                });
                $("#email").rules("add", {
                    required: true,
                    email: true,
                    messages: {
                        required: "Please enter an email address",
                        email: "Invalid email address"
                    }
                });
                $("#password").rules("add", {
                    required: true,
                    minlength: 8,
                    messages: {
                        required: "Please provide a password",
                        minlength: "Your password must be at least 8 characters long"
                    }
                });
                $("#gender").rules("add", {
                    required: true,
                    messages: {
                        required: "Please select your gender",
                    }
                });
            });
        </script>

    </div>
</body>
