<%-- 
    Document   : editProfile
    Created on : 20 Jun, 2017, 11:49:17 AM
    Author     : Kunal
--%>
<%@page import="bean.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Person person2 = (Person) session.getAttribute("loggedInUser");
    String emailId=person2.getEmail();
%>
<script>

//  if user name changed successfully
    function nameChanged(status)
    {
        if (status == true)
        {
            alert("User Name changed successfully.");
            location.reload();
        } else
            alert("Please provide a valid username!");
    }
    function nameError()
    {
        alert("Please try again later")
    }
// if password changed successfully
    function passwordChanged(status)
    {
        document.getElementById("new_password1").innerHTML = "";
        document.getElementById("new_password2").innerHTML = "";
        if (status == true)
        {
            alert("Password changed successfully.")
            location.reload();
        }
        else
            alert("Wrong credentials!!");
    }
    function passwordError()
    {
        document.getElementById("old_password").innerHTML = "";
        document.getElementById("new_password1").innerHTML = "";
        document.getElementById("new_password2").innerHTML = "";
        alert("Please try again later")
    }

//  to validate and then save the new password
    function save_password()
    {
        document.getElementById("mismatch").style = "none";
        document.getElementById("mismatch").innerHTML = ""
        var new_passwd1 = document.getElementById("new_password1");
        var new_passwd2 = document.getElementById("new_password2");
        var old_password = document.getElementById("old_password");
        if(old_password.value.length == 0)
        {
            document.getElementById("mismatch").style = "inline";
            document.getElementById("mismatch").style.color = "red";
            document.getElementById("mismatch").innerHTML = "Please enter all the fields";
        }
        if(new_passwd1.value == old_password.value)
        {
            document.getElementById("mismatch").style = "inline";
            document.getElementById("mismatch").style.color = "red";
            document.getElementById("mismatch").innerHTML = "Old and new Password should differ"; 
        }
        else if (new_passwd1.value != new_passwd2.value)
        {
            document.getElementById("mismatch").style = "inline";
            document.getElementById("mismatch").style.color = "red";
            document.getElementById("mismatch").innerHTML = "Passwords do not match";
        } else if (new_passwd1.value.length == 0 || new_passwd2.value.length == 0 )
        {
            document.getElementById("mismatch").style = "inline";
            document.getElementById("mismatch").style.color = "red";
            document.getElementById("mismatch").innerHTML = "Please enter all the fields"
        } 
        else if (new_passwd1.value.length < 8)
        {
            document.getElementById("mismatch").style = "inline";
            document.getElementById("mismatch").style.color = "red";
            document.getElementById("mismatch").innerHTML = "Password length should atleast be 8."
        } else
        {
            var email = '<%=emailId%>';
            // changeType = 2 to change Password
            var data = "changeType=2&email=" + email + "&new_password=" + new_passwd1.value + "&old_password=" + old_password.value;
            $.ajax({
                url: "angle_group/ChangeUserProfile.jsp",
                type: "GET",
                data: data,
                dataType: "json",
                success: passwordChanged,
                error: passwordError
            });
        }
    }
    function showChangePass()
    {
         document.getElementById("passDetails").style.display="inline";
    }
    function toggle(x)
    {
        if (x.style.display === 'none') {
            x.style.display = 'block';
        } else {
            x.style.display = 'none';
        }
    }

//  to validate and save the new user name
    function save_name()
    {
        var username = document.getElementById("name");
        if (username.value.length == 0 || username.value.trim().length == 0)
        {
            document.getElementById("name_error").style = "inline";
            document.getElementById("name_error").style.color = "red";
            document.getElementById("name_error").innerHTML = "Please enter a valid name"
        } else
        {
            username = username.value.trim();
            var email = '<%=emailId%>';
            var data = "changeType=1&email=" + email + "&name=" + username;
            $.ajax({
                url: "angle_group/ChangeUserProfile.jsp",
                type: "GET",
                //changeType = 1 for changing userName
                data: data,
                dataType: "json",
                success: nameChanged,
                error: nameError
            });
        }
    }
</script>
