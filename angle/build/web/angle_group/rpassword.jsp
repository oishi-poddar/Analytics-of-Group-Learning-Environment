<%-- 
    Document   : rpassword
    Created on : 25 May, 2017, 8:59:55 AM
    Author     : chirag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<style>


    #password-error{
        float: left;
        margin: 0 0 10px 35px;
        padding: 3px 10px;
        color: #FFF;
        border-radius: 3px 4px 4px 3px;
        background-color: #CE5454;
        max-width: 450px;
        position: relative;
        left: -15px;
        opacity: 1;
        z-index: 1;
        transition: 0.15s ease-out; 
    }

    #password1-error{
        float: left;
        margin: 0 0 10px 35px;
        padding: 3px 10px;
        color: #FFF;
        border-radius: 3px 4px 4px 3px;
        background-color: #CE5454;
        max-width: 450px;
        position: relative;
        left: -15px;
        opacity: 1;
        z-index: 1;
        transition: 0.15s ease-out; 
    }

    #password-error::after, #password1-error::after {
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
</style>
<body class="login">
    <div>
        <a class="hiddenanchor" id="signup"></a>
        <a class="hiddenanchor" id="signin"></a>

        <div class="login_wrapper">
            <div class="animate form login_form">
                <section class="login_content">
                    <form action="pass.html" method="post" novalidate=""  id="login">
                        <h1>Reset Password</h1>
                        <s:if test="hasActionErrors()">
                            <div class="alert alert-danger alert-dismissable">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close" style="top: -10px;">×</a>
                                <s:actionerror/>
                            </div>
                        </s:if>


                        <div class="field">
                            <input name="person.password" id="password" type="password" class="form-control" placeholder="Password"/>
                            <label class="error-msg"><s:property value="fieldErrors.get('password').get(0)" /></label>
                        </div>
                        <div class="field">
                            <input name="person.password1" id="password1" type="password" class="form-control" placeholder="Re-enter Password" onblur="passwordMatch()" />
                            <%--<label class="error-msg"><s:property value="fieldErrors.get('userName').get(0)"/></label>--%>
                        </div>
                        <input type="hidden" name="person.email" value="<s:property value="person.email"/>">
                        <div id="match">
                        </div>
                        <div class="field">
                            <button type="submit" id="reset" class="btn btn-default">Reset</button>


                        </div>

                        <div class="clearfix"></div>

                        <div class="separator">

                        </div>
                    </form>
                </section>
            </div>


        </div>
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <script>
                                $().ready(function () {
                                    $("#login").validate();
                                    $("#password").rules("add", {
                                        required: true,
                                        minlength: 8,
                                        messages: {
                                            required: "Please provide a password",
                                            minlength: "Your password must be at least 8 characters long"
                                        }
                                    });
                                    $("#password1").rules("add", {
                                        required: true,
                                        minlength: 8,
                                        messages: {
                                            required: "Please provide a password",
                                            minlength: "Your password must be at least 8 characters long"
                                        }
                                    });
                                });
    </script>
    <script>
        function passwordMatch() {

            document.getElementById("reset").disabled = true;
            var pwd1 = document.getElementById("password").value;
            var pwd2 = document.getElementById("password1").value;
            if (pwd1.match(pwd2)) {
                document.getElementById("match").style.display = "none";
                document.getElementById("reset").disabled = false;
            } else {
                document.getElementById("match").innerHTML = "Password didn't match";

            }
        }

    </script>


</body>
