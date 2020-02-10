<%-- 
    Document   : Sign Up Using Invitation
    Created on : Jun 8, 2017, 3:08:02 PM
    Author     : Kunal
--%>

<%@page import="org.apache.struts2.ServletActionContext"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpServletRequest req = ServletActionContext.getRequest();
    String url = (req.getRequestURL()).toString();
    String parts[] = url.split("template");
    String email = (String) session.getAttribute("emailId");
    String groupCode = (String) session.getAttribute("code");
%>
<html lang="en">
    <head>
        <title>Group Learning Environment | Home :: AnGLE</title>
        <!-- Meta tag Keywords -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Educational Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free web designs for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--// Meta tag Keywords -->
        <!-- css files -->
        <link href="css/css1/style.css" rel="stylesheet" type="text/css" media="all">
        <link href="css/css1/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
        <link href="https://fonts.googleapis.com/css?family=Arima+Madurai|Kranky|Mogra" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Ribeye" rel="stylesheet">
        <script src="js/captcha.js" >
            </script>
        <!-- //css files -->
        <!-- online-fonts -->
        <!--<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&subset=latin-ext" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Covered+By+Your+Grace" rel="stylesheet">-->
        <!-- //online-fonts -->
        <style>
            .header {
    min-height: 447px;
}
            .button {
    background-color:#4CAF50;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
.team_back img {
   height: 100%;
   width: 100%;
}
            h4 {

                color:  #c65353 ;
                margin: 0 0 10px;
            }
            .glyphicon fa fa-home{
                margin-top: 5px !important;
                font-weight: 900;
            }
            .col-md-3 {
                width: 16%;
            }
            .team_gd1 p {
                text-align: center;
                font-size: 0.89em;
                color: #333;
                letter-spacing: 0.01em;
            }
            p { color:   #17202a  ;
                margin: 0 0 10px;
                font-family: 'Sarala';
                font-size: 16px;
            }
            .team_gd1 h4 {
                text-align: center;
                font-size: 0.9em;
                color: #6a67ce;
                margin: 5px 0 5px;
                text-transform: uppercase;
                letter-spacing: 1px;
                font-weight: bold;
            }

            .login-main input[type="text"], .newsletter input[type="email"], .login-main input[type="email"] {
                font-size: 1em;
                color: #000;
                padding: initial;
                margin-bottom: 1em;
                display: contents;
                outline: none;
                border: none;
                border-bottom: 2px solid #000;
                font-family: 'Lato', sans-serif;
                background: Transparent;
                width: 100%;
            }
            .footer {
                background: #110226;
            }

            .angleLogo {
                margin-top: 0.5em !important;
                padding: 0.5em 0em !important;
                width: 24% !important;
            }
            .abc {
                margin-top: 0.5em !important;
            }
            .fa1 {
                display: inline-block;
                font: normal normal normal 14px/1 FontAwesome;
                font-size: xx-large;
                text-rendering: auto;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }

            .abc {
                margin-top: 0.7em !important;
            }

            .fa2 {
                color: #FFFFFF;
                display: inline-block;
                font: normal normal normal 14px/1 FontAwesome;
                font-size: xx-large;
                text-rendering: auto;
                -webkit-font-smoothing: antialiased;
                -moz-osx-font-smoothing: grayscale;
            }
            .error-msg{

                color: red;
            }
            .alert.alert-danger.alert-dismissable.fade.in {
                position: absolute;
                top: 6%;
                z-index: 10000;
                padding: 4%;
                padding-top: 7%;
            }

            .alert.alert-success.alert-dismissable.fade.in {
                position: absolute;
                top: 6%;
                z-index: 10000;
                padding: 4%;
                padding-top: 7%;
            }
            .alert-dismissable .close, .alert-dismissible .close {
                position: relative;
                top: -75px;
                right: -41px;
                color: inherit;
            }

            .service-box .icon {
                width: 111px;
                height: 106px;
                border-radius: 151%;
                background: #dfdfdf;
                margin: 0 auto;
                text-align: center;
                position: relative;
            }
            .modal-header img {
    width: 79% !important;
}
        </style>

        <script>
                        
                        
               
        </script>
    </head>
    <body>

        <div class="main-w3layouts" id="home">
            <!--top-bar-->

            <div class="top-search-bar" style="color:ghostwhite;font-size:20dp">

                <div  class="header-top-nav" style="float: left !important; padding-left:20px;color: #FFF;font-family: 'Ribeye', cursive;font-size: 20px"><b><span style="font-family: 'Kranky', cursive;font-size: 20px">An</span>GLE</b></div>
                <div class="header-top-nav">

                    <ul>
                        <li><a href="#" onclick="resetModal()" data-toggle="modal" data-target="#myModal4"><i class="fa fa-lock" aria-hidden="true"></i>REGISTER</a></li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"></div>



            

            <!-- //Modal3 -->
            <div class="clearfix"></div>
            <!-- //Modal3 -->

            <!-- Modal4 -->
            <div class="modal fade" id="myModal4" tabindex="-1" role="dialog" >
                <div class="modal-dialog" role="document">
                    <!-- Modal content-->
                    <div class="modal-content news-w3l">
                        <div class="modal-header">
                            <button type="button" class="close w3l" data-dismiss="modal">&times;</button>
                            <h4>Register Now</h4>
                            <!--newsletter-->
                            <div class="login-main wthree">



                               <form  action="doSignUpInvitation.html" onSubmit="return validation();" name="register" id="register_form" method="post" >

                                    <s:if test = "hasActionErrors()">
                                        <div class="alert alert-danger alert-dismissable">
                                            <a href="#" class="close" data-dismiss="alert" aria-label="close" style="top: -10px;">×</a>
                                            <s:actionerror/>
                                        </div>
                                    </s:if>

                                    <input type="text" name="name" placeholder="Name" id="name" pattern="^[A-z][\sA-z]*$" title="name must not start with space and should contain only alphabet" required>
                                    <br><span id="nameError" style="display:none;color:red">Please Enter Name</span>
                                    <input type="hidden" name="groupCode" id="groupCode"  value="<%=groupCode%>" >
                                    <input type="email" name="email" placeholder="Email" id="email" required="required"  readonly="readonly" value="<%=email%>">
                                    <span id="emailError" style="display:none;color:red"> </span> 
                                    <label class="error-msg" style="color: red;"><s:property value="fieldErrors.get('email').get(0)" /></label>
                                    <div id="div">
                                    </div>

                                    <div id="link_div" >
                                    </div>
                                    <input type="password" required="required" pattern="^((?!.*[\s])(?=.*[A-Z])(?=.*\d).{8,15})" title="Password must be at least 8 characters, no more than 15 characters, and must include at least one upper case letter and one numeric digit. " name="password" placeholder="Password" id="password" required="required">
                                    <input type="password" placeholder="Confirm Password"  id="confirm_password" required>
                <br><br><span id="passwordError" style="display:none;color:red">Please Enter Password</span>
                                    <input type="hidden" name="gender" value="Male" id="gender">
                                    <!--                                                                        <input type="radio" name="gender" value="female" id="gender"> Female<br>-->
                                <input type="submit"  id="button" value="Register Now">

                                </form>



              <script>
                function validation()
                {
                    var nm=document.getElementById("name");
                    var name=nm.value.trim();
                    var passwd1=document.getElementById("password");
                    var passwd2=document.getElementById("confirm_password");
                    document.getElementById("passwordError").style.display = "none";
                    document.getElementById("nameError").style.display = "none";
                    var count = 0;
                    if (name.length == 0)
                    {
                        count++;
                        document.getElementById("nameError").style = "inline";
                        document.getElementById("nameError").style.fontWeight="bold";
                        document.getElementById("nameError").style.color = "red";
                        document.getElementById("nameError").innerHTML = "Please enter a valid name"
                    }
                    if (passwd1.value != passwd2.value)
                    {
                        count++;
                        document.getElementById("passwordError").style.fontWeight="bold";
                        document.getElementById("passwordError").style = "inline";
                        document.getElementById("passwordError").style.color = "red";
                        document.getElementById("passwordError").innerHTML = "Passwords do not match"
                    }
                    if (passwd1.value.length==0 || passwd2.value.length == 0 || passwd1.value.length < 8 || passwd2.value.length < 8)
                    {
                        count++;
                        document.getElementById("passwordError").style.fontWeight="bold";
                        document.getElementById("passwordError").style = "inline";
                        document.getElementById("passwordError").style.color = "red";
                        document.getElementById("passwordError").innerHTML = "Please enter atleast 8 characters"
                    }
                    if(count>0)
                        return false;
                    else
                    {
                        document.getElementById("name").value=name;
                        return true;
                    }
                }
             </script>

                            </div>
                            <!--//newsletter-->	
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <!--	<div class="search">
                                                            <form action="#" method="post">
                                                                    <input type="search" placeholder="Search Here..." required="" />
                                                                    <input type="submit" value=" ">
                                                            </form>
                                            </div>
                                                    <div class="clearfix"></div>-->
            <!--//top-bar-->
            <!-- navigation -->
            <div class ="top-nav">
                <nav class="navbar navbar-default">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                    </div>
                    <!-- navbar-header -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="index.html" class="hvr-underline-from-center active">Home</a></li>
                            <li><a href="#about" class="hvr-underline-from-center scroll">Features</a></li>
                            <li><a href="#services" class="hvr-underline-from-center scroll">Tools</a></li>
                            <li><a href="#for" class="hvr-underline-from-center scroll">our users</a></li>
                            <li><a href="#team" class="hvr-underline-from-center scroll"> Team</a></li>
                            <!--	<li><a href="#contact" class="hvr-underline-from-center scroll">Contact Us</a></li>-->
                        </ul>
                    </div>
                    <div class="clearfix"> </div>	
                </nav>
            </div>
            <!-- //navigation -->

            <div class="header">
                <!-- Slider -->
                <div class="slider">
                    <div class="callbacks_container">
                        <ul class="rslides" id="slider">
                            <li>

                                <div class="slider-info">
                                    <p>Analytics For Group Learning Environment.</p>
                                    <h3 style="color:#ffe6e6">Form effective Collaborative Learning Groups</h3>
                                    <button class="button" data-toggle="modal" data-target="#myModal4">Sign up for FREE!</button>
                                </div>
                            </li>
                            <li>

                                <div class="slider-info">
                                    <p>Enhance your digital Learning Experience</p>
                                    <h3 style="color : #ffe6e6">Form effective Collaborative Learning Groups </h3>
                                    <button class="button" data-toggle="modal" data-target="#myModal4">Sign up for FREE!</button>
                                </div>
                            </li>
                            <li>

                                <div class="slider-info">
                                    <p>Analytics For Group Learning Environment.</p>
                                    <h3 style="color:#ffe6e6">Form effective Collaborative Learning Groups</h3>
                                    <button class="button"  data-toggle="modal" data-target="#myModal4">Sign up for FREE!</button>
                                </div>
                            </li>
                            <li>

                                <div class="slider-info">
                                    <p>Learning never exhausts the mind.</p>
                                    <h3 style="color:#ffe6e6">Form effective Collaborative Learning Groups</h3>
                                    <button  class="button" data-toggle="modal" data-target="#myModal4">Sign up for FREE!</button>
                                </div>
                            </li>

                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!-- //Slider -->
            </div>
        </div>
        <!--main-content-->

        <!--about-->
        <div id="about" class="about">
            <div class="container">


                <div class="row middle-xs feature-type">
                    <div style="float: left;" class="col-lg-5 col-xs-12 first-xs">

                        <img  style="margin-left:100px;" class="features-image left" width="180px" src="data:image/png;base64,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" alt="collaborating in groups" title="group-image-01"/>

                    </div>
                    <div class="col-xs-12 col-lg-7">
                        <h3  style="color: #6c3483 ">

                            <font face="WildWest">Create Your Own Group	</font>	
                        </h3>
                        <h4>
                            <i>Put into existence groups of your choice that fits your learning goals.</i>
                        </h4>
                        <p>
                        <p>You have the opportunity of creating your own group in a matter of minutes, if you do not find a group matching your choice or interest. Once you do, you can make your groups either public or private, thus limiting the audience your content is shared with. Then you can invite your peers or students or other people of similar interest to join your group. 
                        </p>
                        <p>Groups can be tailor made with powerful learning tools for effective learning and sharing.
                        </p>

                        </p>
                        
                    </div>
                </div>
                <div style="margin-left:10px; margin-top: 20px" class="row middle-xs feature-type">

                    <div  class="col-xs-12 col-lg-7">
                        <h3 style="color:#6c3483 ">
                            <font face="WildWest">Discover Study Groups</font>	</h3>
                        <h4>
                            <i>Find study groups you like.</i>
                        </h4>
                        <p>
                            AnGLE's  Discover Groups lets you view all
                            the public Groups that are available for you to join, so you have the freedom to be part of 
                            learning communities that are creating and sharing 
                            resources. There are thousands of public Groups on 
                            AnGLE that bring members together to collaborate on
                            a host of different topics and interests. Simply select the group that interests you and request to join. Joining a group gives you full access to the resources shared with that group.
                        </p>
                    </div>
                    <div class="col-md-5 col-xs-12 first-xs last-md right">

                        <img class="features-image right" width="320px" src="http://www.freeiconspng.com/uploads/3d-group-session-png-2.png" alt="online study groups" title="group-image-02"/>

                    </div>
                </div>
                <div style="margin-top:30px" class="row middle-xs feature-type">
                    <div class="col-lg-5 col-xs-12 first-xs">

                        <img width="200px" style="margin-left:100px;"style="margin-top:10px;" class="features-image left" src="https://cdn3.iconfinder.com/data/icons/rise/Graphite/256/group.png" alt="collaborating in groups" title="group-image-01"/>

                    </div>
                    <div  class="col-xs-12 col-lg-7">
                        <h3  style="color:  #6c3483 ">
                            <font face="WildWest">Customize Your Groups</font>	
                        </h3>
                        <h4>
                            <i> Groups can be personalized according to need.</i>	
                        </h4>
                        <p>
                        <p>Groups are easy to set up, personalize and manage. Set up default or customized profiles with separate access rights.
                        Join countless members for learning at all levels in public learning groups. Share learning content with full control over privacy.
                        Interact more, learn more, start or join a <strong>discussion, set up polls, quizzes, assignments.</strong> Share <strong>notes</strong> with your learning group.
                         Start or join <strong>video conferences</strong> for discussion and enhanced learning.                          
                        </p>

                        <br>
                        <br><br>
                        <br>	
                    </div>

                </div>
                       <div style="margin-left:10px;" class="row middle-xs feature-type">

                    <div  class="col-xs-12 col-lg-7">
                        <h3 style="color:#6c3483 ">
                            <font face="WildWest">Peer to Peer Learning</font>	</h3>
                        <h4>
                            <i>Form or join a peer to peer group and turn solo work into teamwork.</i>
                        </h4>
                        <p>
                           Create your own study group with friends or classmates to share ideas,advice or resources.   Join like minded members from around the world to discover,create and join virtual online spaces for collaborative
                           learning.
                          
                        </p>
                    </div>
                    <div class="col-md-5 col-xs-12 first-xs last-md right">

                        <img class="features-image right" width="220px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvyhgp8keQCdOT8DngELonyO_C3uwTrusnO97a1Gv7NgRvsWe-">
                    </div>
                </div>
                
                
                
                
                
                
                
                
        
                <div  style="margin-top:40px" class="row middle-xs feature-type">
                    <div class="col-lg-5 col-xs-12 first-xs">

                        <img width="200px" style="margin-left:100px;"style="margin-top:10px;" class="features-image left" src="data:image/png;base64,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" alt="collaborating in groups" title="group-image-01"/>

                    </div>
                    <div class="col-xs-12 col-lg-7">
                        <h3  style="color:  #6c3483 ">
                            <font face="WildWest">Mentor to Student Learning</font>	
                        </h3>
                        <h4>
                            <i>Impart or gain knowledge with ease. </i>	
                                    </h4>
                                    <p>
                                       Collaborate with educators with the same goals and areas of interest as you.
                                       Or keep things simple by setting up a private Group to share lesson plans and online resources with those you know. 
                                       Our online tools for educators offer endless possibilities for those who want to encourage their students to take an active part in their lessons.
                                       Unlock your students’ potential with a more immersive learning experience.
                                    </p>

                                    <br>
                                    <br><br>
                                    <br>	
                                    </div>

                                    </div>
                                           <div style="margin-left:10px;" class="row middle-xs feature-type">

                    <div  class="col-xs-12 col-lg-7">
                        <h3 style="color:#6c3483 ">
                            <font face="WildWest">Blended Learning</font>	</h3>
                        <h4>
                            <i>All learning tools on one integrated platform.</i>
                        </h4>
                        <p>
                             Create a collaborative environment for your students. Empower them to produce knowledge and content. Create unlimited learning resources. 
                             Monitor one-to-one engagement and performance. 
                             Administer groups and engage in discussions on relevant topics.
                             Video conference with your colleagues or start private chats.

                        </p>
                    </div>
                    <div class="col-md-5 col-xs-12 first-xs last-md right">

                        <img class="features-image right" width="220px" src="data:image/png;base64,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" alt="online study groups" title="group-image-02"/>

                    </div>
                </div>
                
                                    <div  style="margin-top:30px" class="row middle-xs feature-type">
                                        <div class="col-lg-5 col-xs-12 first-xs">

                                            <img width="200px" style="margin-left:100px;"style="margin-top:10px;" class="features-image left" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAY1BMVEUAAAD////m5uaGhoY/Pz8ZGRlRUVGxsbH6+vp1dXWysrJxcXF3d3eYmJhUVFRNTU1bW1tHR0eXl5dsbGyLi4ujo6M3Nzfu7u4oKCjDw8O8vLzX19cPDw/JyckgICDg4OAyMjKy995NAAAEaUlEQVR4nO3ca0PaMBiG4TIcB88oqFM3/f+/ckMstKRJnjen5u2e+zPGXCZpNphrGsYYY4wxxhhjjDHGGGOMMcYYY4wxlqeX3c2p97Fnk6OLWaefY88mRxTqj0L9Uag/CvVHof4qEl4s4C4kw9YifP89E/T2Bx64GuFSApzNXuGBqxF+yIQreOBqhG8y4QweuBrh4+SFzXbywmY+eaGMCI9ak1BEhAetSig5i/CYdQkFqwgPWZkQJ8Ij1iaEifCA1QnRswiPV58QJMLDVSjENio8Wo3CZjd14WLqa3i/mrgQAyoWLjCgXuEt5tMrvEeBWoXgGdQrFAB1CuEzqFUIXfSahZItqlIoBOoTohe9WqHoIaNRiF/0SoXSM6hOGAJUJZSfQWVC6KJfGu/dwOOPLoS26KX5Dhz8DVILP4Wvh4DL/SvPVhH+DmmFj8+z1VzyBdBFf3l4bZ8If4ukwvXXKDf4F0APmWX76h4R/h4phVffw8BE6KJfnl7fPYvwrBIKr4/jgET8DLZ1iPC00gnXnYEgohzY3ajwvJIJ172JAUTZGWw7EuGJpRKuz6bmJWIXvfl1LRGeWSLhOdBLRC96s8NZ/ICnlkZ4PTA9JzHkDLZ9reItPLckwqvBCTqIkovebLPcfeKTSyE0t6iHGPaQCSyBcHgFHUTpRR9XvHDoDDqJMWcwoGihbYtaiYWB0UI3cIBY9AzuixT6gAYx9KIPL07oB54Rwy/64KKErofMILH0GdwXI7RfExZi3EVfXohs0R6x+EMmUoiu4JFY9qKPF2JnsEMc4wzGCPEteujhbiRgqFAKxMoBDBQqAoYJ8wBTXxMRQtlDBi3PCgYJJdcEXqYVDBFqOoNBwjwrmA8oFuo6gwFCbVtULFQIlAk1AkVCVRd9iBB6yFxKgZlXUCKErokb6e9k515BgRDaog+N8NfOs68gLoRW8AH/WRQDokLoDLbvOMHEEkBQCM359K4huFGLADEhfAbbIGIZICQUA6FjWwiICAOAwBflvya+8wtFD5lTnlUstYKAELzozZxnsdgK+oVBW/SQg1huBb1CwUVvZv3plAR6hIFnsM1CLAp0C4UXvdngRi0LdAojzmDbALEw0CVMABw4yKWBDmESoDFMwWviO6sw8iFzqreKxVfQLgy+6M06Z7H8ClqFibbooSNxhBW0CaMuerP1iECLEPmXS4JfqzgQxwHadunG+6m7BPhvvNdf69RTB7M9aXxEfIuOnfW2cBP1AB03vouoCOj6U5udKDuDI+f6k/dmCkD3356GV1HTFm18fwMeIioD+t7FMDeqri3a+N+JOl9FdUD/u4l9orYt2iDvCHeJCoHIu/onokYg9MlMS9R3BvdBn65tFAPBT0j3q6hyizbwp9yblVYg/C8VnspNKXGj/98m2aNQfxTqj0L99YRjTyZLPeF2rrLtCyzU2mLywjsK1Ueh/ijUH4X6+8+FT88/1Pe8cQkZY4wxxhhjjDHGGGOMMcYYY4wxxhhz9RfstUGhjrqZogAAAABJRU5ErkJggg==">
                                            
                                        </div>
                                        <div class="col-xs-12 col-lg-7">
                                            <h3  style="color:  #6c3483 ">
                                                <font face="WildWest">Performance and Participation Tracking</font>	
                                            </h3>
                                            <h4>
                                                <i> Measure Progress and Results</i>
                                            </h4>
                                            <p>
 The best way to meet the needs of your group members is to understand them. AnGLE offers a number of additional solutions for more in-depth reporting and analytics.
 So come use our online tools which come with evaluation techniques and improve your group member engagement and productivity today! 
                                            </p>

                                            <br>
                                            <br><br>
                                            <br>	
                                        </div>

                                    </div>



                                    <!--	<div class="buttons">
                                                                    <div class="button">
                                                                            <h5><a href="#contact" class="scroll" id="Contact">Contact with us</a></h5>
                                                                    </div>
                                                                    <div class="button2">
                                                                            <h5><a href="#" data-toggle="modal" data-target="#myModal2">Admission Now</a></h5>
                                                                    </div>
                                                            </div>-->

                                    <div class="clearfix"></div>
                                    </div>
                                    </div>
                                    <!--	<div class="about-info">
                                                    <img src="images/images1/ab.jpg" alt="about-image">
                                                    <div class="right-agile">
                                                            <h5>Educational</h5>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                                            <h5>Educational</h5>
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam. </p>
                                                    </div>
                                            </div>
                                            <div class="clearfix"></div>-->
                                    <!--//about-->

                                    <!-- services -->
                                    <div class="services" id="services">
                                        <b> <h3 style="color:#9966ff">Tools</h3> </b>
                                        <div class="col-md-2 services-gd text-center" data-wow-delay=".5s">
                                            <div class="hi-icon-wrap hi-icon-effect-9 hi-icon-effect-9a">
                                                <a href="#" class="hi-icon"><img src="images/images1/uni.png" alt=" " /></a>
                                            </div>
                                            <h4 style="color:#33adff">Video Conference & Chat</h4>
                                            <p style="color:#ffffb3"><i>Face to Face</i></p>
                                            <p>Group video conference with chats,hand raise,screen sharing,file sharing,youtube live video stream etc</p>
                                        </div>
                                        <div class="col-md-2 services-gd text-center" data-wow-delay=".5s">
                                            <div class="hi-icon-wrap hi-icon-effect-9 hi-icon-effect-9a">
                                                <a href="#" class="hi-icon"><img src="images/images1/edu.png" alt=" " /></a>
                                            </div>
                                            <h4 style="color:#33adff">Group Discussion </h4>
                                            <p style="color:#ffffb3"><i> Discuss and consult</i><p>
                                            <p>Start a discussion or consult with your peers or mentors within your group! With a wide range of emoticons to choose from discussion just became more fun!</p>
                                        </div>
                                        <div class="col-md-2 services-gd text-center" data-wow-delay=".5s">
                                            <div class="hi-icon-wrap hi-icon-effect-9 hi-icon-effect-9a">
                                                <a href="#" class="hi-icon"><img src="images/images1/book.png" alt=" " /></a>
                                            </div>
                                            <h4 style="color:#33adff">Assignment & Quiz</h4>
                                            <p style="color:#ffffb3"><i>Test what you know</i></p>
                                            <p> Create online quizzes or take part in them. Upload assignments and set a due date and time within which they have to be turned in.
                                        </div>
                                        <div class="col-md-2 services-gd text-center" data-wow-delay=".5s">
                                            <div class="hi-icon-wrap hi-icon-effect-9 hi-icon-effect-9a">
                                                <a href="#" class="hi-icon"><img src="images/images1/hourglass.png" alt=" " /></a>
                                            </div>
                                            <h4 style="color:#33adff">Poll</h4>
                                            <p  style="color:#ffffb3; margin-top: 35px"><i>Collect results via polls </i></p>
                                            <p> Take a survey among your group members by creating a fun,easy to create poll.
                                            Vote for your answer and see which result wins using AnGLE's polling tool.</p>
                                        </div>
                                        <div class="col-md-2 services-gd text-center" data-wow-delay=".5s">
                                            <div class="hi-icon-wrap hi-icon-effect-9 hi-icon-effect-9a">
                                                <a href="#" class="hi-icon"><img src="images/images1/book2.png" alt=" " /></a>
                                            </div>
                                            <h4 style="color:#33adff">Notes</h4>
                                            <p style="color:#ffffb3; margin-top: 30px"><i>Share anything!</i> </p>
                                            <p>Create and post notes topic wise on a group of your choice. From attaching a file or a necessary reference link, you can share it all!
                                            </p>
                                        </div>

                                        <div class="clearfix"> </div>
                                    </div>


                                    <!--Who for-->
                                     <div class="for" id="for">
                                         <center>
                                         <div class="container">
                                             <h1 style="color:#660066" class="title"><b><span>OUR USERS</span></b></h1>
                                      </div>                                                
                                            </center>
                                    <div  style="margin: 40px; " class='row users' data-no-turbolink='true'>
                                      
<div class='col-lg-3 col-md-6 col-sm-6'>
                                            <a class='users_link' >
                                                <div class='user_icon'>
                                                    <img alt="Learners" class="user_icon_img_1" src="https://cdn.goconqr.com/assets/goconqr/icon_students_001-1e0d8bfd810d50753e684acf19d40de4.jpg" />
                                                </div>
                                                <h3>
                                                    Learners
                                                </h3>
                                            </a>
                                        </div>
                                        <div class='col-lg-3 col-md-6 col-sm-6'>
                                            <a class='users_link'>
                                                <div class='user_icon'>
                                                    <img alt="Educators" class="user_icon_img_2" src="https://cdn.goconqr.com/assets/goconqr/icon_teachers_001-d780c147ee411528142c25ef45b85e90.jpg" />
                                                </div>
                                                <h3>
                                                    Teachers
                                                </h3>
                                            </a>
                                        </div>
                                        <div class='col-lg-3 col-md-6 col-sm-6'>
                                            <a class='users_link'>
                                                <div class='user_icon'>
                                                    <img alt="Institutions" class="user_icon_img_3" src="https://cdn.goconqr.com/assets/goconqr/icon_campus_001-0f654306677767f9ac20cc84888a1efc.jpg" />
                                                </div>
                                                <h3>
                                                    Institutions
                                                </h3>
                                            </a>
                                        </div>
                                        <div class='col-lg-3 col-md-6 col-sm-6'>
                                            <a class='users_link'>
                                                <div class='user_icon'>
                                                    <img alt="Companies" class="user_icon_img_4" src="https://cdn.goconqr.com/assets/goconqr/icon_business_001-0345c345b6c37e4263d01fc4c78d3fc2.jpg" />
                                                </div>
                                                <h3>
                                                    Business
                                                </h3>
                                            </a>
                                        </div>
                                    </div>
                                     </div>

                                    <!-- //services -->

                                    <!-- team -->
                                    <div class="team" id="team">
                                        <div class="container">
                                            <h3  style="color:#660066">  Team</h3>
                                            <div class="team_gds">
                                                <div class="col-md-3 team_gd1 wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
                                                    <div class="team_pos">
                                                        <div class="team_back"></div>
                                                        <img class="img-responsive" src="images/images1/t1.jpg"  alt=" ">
                                                        <div class="team_info">
                                                            <a href="https://www.facebook.com/rohitsingh2997"  class="face_one"><i class=" so1 fa fa-linkedin fc1" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so2 fa fa-twitter fc2" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so3 fa fa-google fc3" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <h4>Avinash Awate</h4>
                                                    <p>Visionary and Chief Mentor</p>
                                                </div>


                                                <div class="col-md-3 team_gd1 wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
                                                    <div class="team_pos">
                                                        <div class="team_back"></div>
                                                        <img class="img-responsive" src="images/images1/t2.jpg"  alt=" ">
                                                        <div class="team_info">
                                                            <a href="#"  class="face_one"><i class=" so1 fa fa-linkedin fc1" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so2 fa fa-twitter fc2" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so3 fa fa-google fc3" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <h4>Aruna Adil</h4>
                                                    <p>Mentor</p>
                                                </div>
                                                <div class="col-md-3 team_gd1 wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
                                                    <div class="team_pos">
                                                        <div class="team_back"></div>
                                                        <img class="img-responsive" src="images/user.jpg"  alt=" ">
                                                        <div class="team_info">
                                                            <a href="#"  class="face_one"><i class=" so1 fa fa-linkedin fc1" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so2 fa fa-twitter fc2" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so3 fa fa-google fc3" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <h4>Abinaya V</h4>
                                                    <p>Mentor</p>
                                                </div>
                                                <div class="col-md-3 team_gd1 wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
                                                    <div class="team_pos">
                                                        <div class="team_back"></div>
                                                        <img class="img-responsive" src="images/images1/t4.jpg"  alt=" ">
                                                        <div class="team_info">
                                                            <a href="#"  class="face_one"><i class=" so1 fa fa-linkedin fc1" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so2 fa fa-twitter fc2" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so3 fa fa-google fc3" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <h4>Dipesh pawar</h4>
                                                    <p>Mentor</p>
                                                </div>
                                                <div class="col-md-3 team_gd1 wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
                                                    <div class="team_pos">
                                                        <div class="team_back"></div>
                                                        <img class="img-responsive" src="images/images1/t5.jpg"  alt=" ">
                                                        <div class="team_info">
                                                            <a href="https://www.facebook.com/rohitsingh2997"  class="face_one"><i class=" so1 fa fa-linkedin fc1" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so2 fa fa-twitter fc2" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so3 fa fa-google fc3" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <h4>Rohit Singh</h4>
                                                    <p>Nit Patna</p>
                                                </div>
                                                <div class="col-md-3 team_gd1 wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
                                                    <div class="team_pos">
                                                        <div class="team_back"></div>
                                                        <img class="img-responsive" src="https://scontent.fbom3-1.fna.fbcdn.net/v/t1.0-1/p160x160/10632618_10203193605464285_2065356828967465925_n.jpg?oh=8f0472083cafc8826f29fbc189b10e6c&oe=59C56314"  alt=" ">
                                                        <div class="team_info">
                                                            <a href="#"  class="face_one"><i class=" so1 fa fa-linkedin fc1" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so2 fa fa-twitter fc2" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so3 fa fa-google fc3" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <h4>Apurv Tandon</h4>
                                                    <p>Jiit Noida</p>
                                                </div>
                                                <div class="col-md-3 team_gd1 wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
                                                    <div class="team_pos">
                                                        <div class="team_back"></div>
                                                        <img class="img-responsive" src="https://scontent.fbom3-1.fna.fbcdn.net/v/t1.0-1/c0.0.160.160/p160x160/14681874_1151611984876564_2323351283197637063_n.jpg?oh=228643668cd292dfb5756ea0493baf18&oe=59E09D7E"  alt=" ">
                                                        <div class="team_info">
                                                            <a href="#"  class="face_one"><i class="so1 fa fa-linkedin fc1" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so2 fa fa-twitter fc2" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so3 fa fa-google fc3" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <h4>Pratik padalia </h4>
                                                    <p>Ahmedabad University</p>
                                                </div>
                                                </span>
                                                <div class="col-md-3 team_gd1 wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
                                                    <div class="team_pos">
                                                        <div class="team_back"></div>
                                                        <img class="img-responsive" src="https://scontent.fbom3-1.fna.fbcdn.net/v/t1.0-1/c0.19.160.160/p160x160/18198696_289443074801620_3393423305964291090_n.jpg?oh=0e5242b7f86c9728aaa428eb2ee074c8&oe=59D1D6F4"  alt=" ">
                                                        <div class="team_info">
                                                            <a href="#"  class="face_one"><i class=" so1 fa fa-linkedin fc1" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so2 fa fa-twitter fc2" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so3 fa fa-google fc3" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <h4>Sakshi Sachar</h4>
                                                    <p>LNMIIT Jaipur</p>
                                                </div>
                                                <div class="col-md-3 team_gd1 wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
                                                    <div class="team_pos">
                                                        <div class="team_back"></div>
                                                        <img class="img-responsive" style=" height:152px"src="images/images1/oish1i.jpg"  alt=" ">
                                                        <div class="team_info">
                                                            <a href="https://www.linkedin.com/in/oishi-poddar/"  target="blank" class="face_one"><i class=" so1 fa fa-linkedin fc1" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so2 fa fa-twitter fc2" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so3 fa fa-google fc3" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <h4>Oishi Poddar</h4>
                                                    <p>KIIT Orissa</p>
                                                </div>
                                                <div class="col-md-3 team_gd1 wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
                                                    <div class="team_pos">
                                                        <div class="team_back"></div>
                                                        <img class="img-responsive" src="images/images1/t10.jpg"  alt=" ">
                                                        <div class="team_info">
                                                            <a href="#"  class="face_one"><i class=" so1 fa fa-linkedin fc1" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so2 fa fa-twitter fc2" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so3 fa fa-google fc3" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <h4>Chirag Khandelwal</h4>
                                                    <p>Jaipur</p>
                                                </div>
                                                <div class="col-md-3 team_gd1 wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
                                                    <div class="team_pos">
                                                        <div class="team_back"></div>
                                                        <img class="img-responsive" src="https://scontent.fbom3-1.fna.fbcdn.net/v/t1.0-1/p160x160/19106027_909079519231150_3271285237670398899_n.jpg?oh=9400cebecdff20789b112f271d295226&oe=59C79CBD"  alt=" ">
                                                        <div class="team_info">
                                                            <a href="#"  class="face_one"><i class=" so1 fa fa-linkedin fc1" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so2 fa fa-twitter fc2" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so3 fa fa-google fc3" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <h4>Manushi Barnwal</h4>
                                                    <p>KIIT Orissa</p>
                                                </div>
                                                <div class="col-md-3 team_gd1 wow zoomIn" data-wow-duration="1.5s" data-wow-delay="0.1s">
                                                    <div class="team_pos">
                                                        <div class="team_back"></div>
                                                        <img class="img-responsive" src="images/user.jpg"  alt=" ">
                                                        <div class="team_info">
                                                            <a href="#"  class="face_one"><i class=" so1 fa fa-linkedin fc1" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so2 fa fa-twitter fc2" aria-hidden="true"></i></a>
                                                            <a href="#"  class="face_one"><i class=" so3 fa fa-google fc3" aria-hidden="true"></i></a>
                                                        </div>
                                                    </div>
                                                    <h4>Kunal Agrawal</h4>
                                                    <p>Sikkim Manipal </p>
                                                </div>

                                                <div class="clearfix"></div>	
                                            </div>
                                        </div>
                                    </div>
                                    <!-- //team -->
                                    <!--	<div class="contact-agile" id="contact">
                                                    <h3>Contact <span>Us</span></h3>
                                                            <div class="container">
                                                                                    
                                                                    <form action="#" method="post" class="wow fadeInLeft animated" data-wow-delay=".5s">
                                                                            <div class="contact-grids1 agileinfo">
                                                                                    <div class="contact-me ">
                                                                                            <h4>Message</h4>
                                                                                            <textarea name="Message" placeholder="" required=""> </textarea>
                                                                                    </div>
                                                                                    <div class="col-md-5 contact-form1">
                                                                                            <h4>Name</h4>
                                                                                            <input type="text" name="Name" placeholder="" required="">
                                                                                    </div>
                                                                                    <div class="col-md-5 contact-form1">
                                                                                            <h4>Email</h4>
                                                                                            <input type="email" name="Email" placeholder="" required="">
                                                                                    </div>
                                                                                    <div class="col-md-2 contact-form">
                                                                                            <input type="submit" value="Submit">
                                                                                    </div>
                                                                                    <div class="clearfix"> </div>
                                                                            
                                                                            </div>
                                                                    </form>
                                                                                    
                                                            </div>
                                            </div>
                                    //contac
                                    -->
                                    <!-- footer -->
                                    <div class="footer" id="footer">
                                        <div style="position:relative" class="container">
                                            <div class="col-md-4 agileinfo_footer_grid">
                                                <h4 style="color:#b3b3ff;">About Us</h4>
                                                <p>   AnGLE is  an online platform which provides a
                                                    learning environment that supports diverse opportunities
                                                    for growth. AnGLE promotes collaborative learning by focusing on
                                                    customizable groups with tailor made features according to one's
                                                    requirements and the best part is that it's absolutely FREE. It
                                                    wants to create a community of learners who eagerly engage with
                                                    content and each other, make sense of teaching, and are motivated
                                                    to learn. AnGLE comes with tools
                                                    such as notes, assignments,quizzes,video chats and discussion 
                                                    forums which can be created dynamically thus enhancing the virtual
                                                    classroom experience. It thus creates an easy to use environment that supports different types of learning.</span></p>
                                            </div>
                                             <div class="col-md-4 agileinfo_footer_grid">
                                                 
                                             <h4 style="color:#b3b3ff; padding-left:100px"> Spread the Word! Visit our page! </h4>
                                             <center>
                                                 <!-- <button style="margin-left:10px" type="button" class="btn btn-lg btn-fb" onclick="https://www.facebook.com/Try-119930988606906/"><i class="fa fa-facebook left"></i> Facebook</button></a>-->
                                                 <a href="https://www.facebook.com/Try-119930988606906/" target="blank">  <button type="button" class="btn btn-fb"><i class="fa fa-facebook left"></i> Facebook</button></a>
                                                 <br>
                                                 <br>
                                                 
                                             <button type="button" class="btn btn-tw"><i class="fa fa-twitter left"></i> Twitter</button>
                                             <br>
                                             <br>
<!--Google +-->
<button type="button" class="btn btn-gplus"><i class="fa fa-google-plus left"></i> Google +</button>

                                             </center>
                                             </div>
                                            <div class="col-md-4 agileinfo_footer_grid mid-w3l nav2">
                                                <h4 style="color:#b3b3ff;">Options</h4>
                                                <ul>
                                                    <li><a href="#home" class="scroll">Home</a></li>
                                                    <li><a href="#about" class="scroll">Features</a></li>
                                                    <li><a href="#services" class="scroll">Tools</a></li>
                                                     <li><a href="#for" class="scroll">Our Users</a></li>
                                                    <li><a href="#team" class="scroll">Team</a></li>


                                                </ul>
                                            </div>
                                            <div  style="position:absolute;right:16px;bottom:300px;"  class="col-md-4 agileinfo_footer_grid">
                                                <h4 style="color:#b3b3ff;">Address</h4>
                                                <ul>
                                                    <li><span class="glyphicon glyphicon-home" aria-hidden="true"></span> NMEICT GROUP,IIT Bombay,Mumbai</li>
                                                    <li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:info@example.com">info@example.com</a></li>
                                                    <li><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> (0123) 0111 111 222</li>
                                                </ul>
                                            </div>

                                            <div class="clearfix"> </div>
                                            <div class="w3agile_footer_copy">
                                                <%
                                                    Integer hitsCount = (Integer) application.getAttribute("hitCounter");
                                                    if (hitsCount == null || hitsCount == 0) {
                                                        /* First visit */

                                                        hitsCount = 1;
                                                    } else {
                                                        /* return visit */

                                                        hitsCount += 1;
                                                    }
                                                    application.setAttribute("hitCounter", hitsCount);
                                                %>
                                                <center>
                                                    <p>You are visitor no: <%= hitsCount%></p>
                                                </center>
                                                <p>© 2017 Educational. All rights reserved | Design by NMEICT Team</a></p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- //footer -->

                                    <!-- js -->
                                    <script type="text/javascript" src="js/js1/jquery-2.1.4.min.js"></script>


                                    <script src="js/js1/jquery.chocolat.js"></script>
                                    <link rel="stylesheet" href="css/css1/chocolat.css" type="text/css" media="screen">
                                    <!--light-box-files -->
                                    <script>
                                                                                                $(function () {
                                                                                                    $('.gallery-grid a').Chocolat();
                                                                                                });
                                    </script>
                                    <!-- required-js-files-->

                                    <link href="css/css1/owl.carousel.css" rel="stylesheet">
                                    <script src="js/js1/owl.carousel.js"></script>
                                    <script>
                                                $(document).ready(function () {
                                                    $("#owl-demo").owlCarousel({
                                                        items: 1,
                                                        lazyLoad: true,
                                                        autoPlay: true,
                                                        navigation: false,
                                                        navigationText: false,
                                                        pagination: true,
                                                    });
                                                });
                                    </script>
                                    <!--//required-js-files-->

                                    <script src="js/js1/responsiveslides.min.js"></script>
                                    <script>
                                                                                                $(function () {
                                                                                                    $("#slider").responsiveSlides({
                                                                                                        auto: true,
                                                                                                        pager: false,
                                                                                                        nav: true,
                                                                                                        speed: 1000,
                                                                                                        namespace: "callbacks",
                                                                                                        before: function () {
                                                                                                            $('.events').append("<li>before event fired.</li>");
                                                                                                        },
                                                                                                        after: function () {
                                                                                                            $('.events').append("<li>after event fired.</li>");
                                                                                                        }
                                                                                                    });
                                                                                                });
                                    </script>


                                    <!-- start-smoth-scrolling -->
                                    <script type="text/javascript" src="js/js1/move-top.js"></script>
                                    <script type="text/javascript" src="js/js1/easing.js"></script>
                                    <script type="text/javascript">
                                                                                                                jQuery(document).ready(function ($) {
                                                                                                                    $(".scroll").click(function (event) {
                                                                                                                        event.preventDefault();
                                                                                                                        $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                                                                                                                    });
                                                                                                                });
                                    </script>
                                    <!-- start-smoth-scrolling -->

                                    <!-- bottom-top -->
                                    <!-- smooth scrolling -->
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            /*
                                             var defaults = {
                                             containerID: 'toTop', // fading element id
                                             containerHoverID: 'toTopHover', // fading element hover id
                                             scrollSpeed: 1200,
                                             easingType: 'linear' 
                                             };
                                             */
                                            $().UItoTop({easingType: 'easeOutQuart'});
                                        });
                                    </script>

                                    <script src="js/jquery.validate.min.js"></script>
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
                                                        minlength: 3,
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
                                        window.onload = genlinks;
                                        function genlinks() {


                                            var data = "&url=<%=parts[0]%>";
                                            //alert(data);
                                            $.ajax({
                                                url: "angle_group/statistics.jsp",
                                                type: "GET",
                                                data: data,
                                                dataType: "json",
                                                success: setGenerateLinksForTesting,
                                                error: onError
                                            });
                                        }
                                        function setGenerateLinksForTesting(data) {
                                            var word = data.split(":");
                                            document.getElementById("groupSpan").innerHTML = word[1] + " Groups";
                                            document.getElementById("userSpan").innerHTML = word[0] + " Users";
                                        }
                                        function onError() {
                                            //alert("error .. ");
                                        }





                                    </script>

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
                                                document.getElementById("gender1").style.display = "inline";
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

                                    <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
                                    <!-- //smooth scrolling -->
                                    <!--// bottom-top -->
                                    <script type="text/javascript" src="js/js1/bootstrap-3.1.1.min.js"></script>

                                    </body>
                                    </html>
