<%-- 
    Document   : fpassword
    Created on : 25 May, 2017, 8:59:55 AM
    Author     : chirag
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" import="captchas.CaptchasDotNet" %>
<style>
    #username-error{
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
    #captcha-error{
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


    #username-error::after,  #captcha-error::after{
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
<%
// Construct the captchas object (Default Values)
CaptchasDotNet captchas = new captchas.CaptchasDotNet(
  request.getSession(true),     // Ensure session
  "demo",                       // client
  "secret"                      // secret
  );

%>
<body class="login">
    <div>
        <a class="hiddenanchor" id="signup"></a>
        <a class="hiddenanchor" id="signin"></a>

        <div class="login_wrapper">
            <div class="animate form login_form">
                <section class="login_content">
                    <form action="resetlink.html" method="post" novalidate=""  id="login">
                        <h1>Let's find your account</h1>
                        <s:if test="hasActionErrors()">
                            <div class="alert alert-danger alert-dismissable">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close" style="top: -10px;">×</a>
                                <s:actionerror/>
                            </div>
                        </s:if>
                        <div class="field">
                            <input name="person.loginName" id="username" type="text" class="form-control" placeholder="Email" />
                            <%--<label class="error-msg"><s:property value="fieldErrors.get('userName').get(0)"/></label>--%>
                        </div>
                        <div class="field">



                            <input type="text" name="person.captcha" id="captcha" size="16" class="form-control" placeholder = "Enter The Captcha shown in the below image"/>
                            <br>
                            <br>

                            <%-- 
                             % it's possible to set a random in captchas.image("xyz"),
                             % captchas.imageUrl("xyz") and captchas.audioUrl("xyz").
                             % This is only needed at the first request
                            --%>
                            <%= captchas.image() %><br>
                            <a href="<%= captchas.audioUrl() %>">Phonetic spelling (mp3)</a>


                        </div>
                        <div class="field">
                            <button type="submit" class="btn btn-default">Submit</button>
                            <!--<button type="submit" class="btn btn-default submit">Log in</button>-->
                            <!--<a class="btn btn-default submit" href="index.html">Log in</a>-->
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
            $("#username").rules("add", {
                required: true,
                email: true,
                messages: {
                    required: "Please enter a valid email address",
                    email: "Please enter a valid email address"
                }
            });
            $("#captcha").rules("add", {
                required: true,

                messages: {
                    required: "Please enter a valid captcha"
                }
            });
        });
    </script>


</body>
