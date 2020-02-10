<%-- 
    Document   : reset_successful
    Created on : 25 May, 2017, 8:59:55 AM
    Author     : chirag
--%>

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
                    Please Check Your Email And Click The Secure Link
                    </br>
                    </br>
                    <a href="SignIn.html">Click Here To Login</a>
                </section>
            </div>
        </div>
    </div>

</body>
