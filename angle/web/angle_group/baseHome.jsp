<%@ taglib prefix="s" uri="/struts-tags" %>
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

    #password-error{
        float: left;
        margin: 0 0 10px 35px;
        padding: 3px 10px;
        color: #FFF;
        border-radius: 3px 4px 4px 3px;
        background-color: #CE5454;
        max-width: 450px;
        /*white-space: pre;*/
        position: relative;
        left: -15px;
        opacity: 1;
        z-index: 1;
        transition: 0.15s ease-out; 
    }

    #username-error::after, #password-error::after {
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
                    <form action="LoggedInHome.html" method="post" novalidate=""  id="login">
                        <h1>Login Form</h1>
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
                            <input name="person.password" id="password" type="password" class="form-control" placeholder="Password"/>
                            <label class="error-msg"><s:property value="fieldErrors.get('password').get(0)" /></label>
                        </div>
                        <div class="field">
                            <button type="submit" class="btn btn-default">Log in</button>
                            <!--<button type="submit" class="btn btn-default submit">Log in</button>-->
                            <!--<a class="btn btn-default submit" href="index.html">Log in</a>-->
                            <a class="reset_pass" href="#">Lost your password?</a>
                        </div>

                        <div class="clearfix"></div>

                        <div class="separator">
                            <%--<p class="change_link">New to site?
                              <a href="#signup" class="to_register"> Create Account </a>
                            </p>

                <div class="clearfix"></div>
                <br />--%>


                        </div>
                    </form>
                </section>
            </div>

            <%-- <div id="register" class="animate form registration_form">
                 <section class="login_content">
                     <form>
                         <h1>Create Account</h1>
                         <div>
                             <input type="text" class="form-control" placeholder="Username" required="" />
                         </div>
                         <div>
                             <input type="email" class="form-control" placeholder="Email" required="" />
                         </div>
                         <div>
                             <input type="password" class="form-control" placeholder="Password" required="" />
                         </div>
                         <div>
                             <a class="btn btn-default submit" href="index.html">Submit</a>
                         </div>

                            <div class="clearfix"></div>

                            <div class="separator">
                                <p class="change_link">Already a member ?
                                    <a href="#signin" class="to_register"> Log in </a>
                                </p>

                                <div class="clearfix"></div>
                                <br />


                            </div>
                        </form>
                    </section>
                </div>--%>
        </div>
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        /* // Wait for the DOM to be ready
         $(function() {
         // Initialize form validation on the registration form.
         // It has the name attribute "registration"
         $("#login1").validate({
         // Specify validation rules
         rules: {
         // The key name on the left side is the name attribute
         // of an input field. Validation rules are defined
         // on the right side
         username: {
         required: true,
         // Specify that email should be validated
         // by the built-in "email" rule
         email: true
         },
         password: {
         required: true,
         minlength: 8
         }
         },
         // Specify validation error messages
         messages: {
         password: {
         required: "Please provide a password",
         minlength: "Your password must be at least 8 characters long"
         },
         username: { 
         required: "Please enter a valid email address",
         email: "Please enter a valid email address"
         }
         },
         
         // Make sure the form is submitted to the destination defined
         // in the "action" attribute of the form when valid
         submitHandler: function(form) {
         form.submit();
         }
         });
         });
         */
    </script>
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
            $("#password").rules("add", {
                required: true,
                minlength: 8,
                messages: {
                    required: "Please provide a password",
                    minlength: "Incorrect! Your password must be at least 8 characters long"
                }
            });
        });
    </script>
    <script>

    </script>
</body>