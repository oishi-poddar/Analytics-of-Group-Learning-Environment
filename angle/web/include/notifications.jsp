<%-- 
    Document   : notifications
    Created on : 19 Jun, 2017, 4:47:04 PM
    Author     : pratik
--%>

<%@page import="bean.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Person person = (Person) session.getAttribute("loggedInUser");
    int userId = person.getLoginId();
%>
<body>
    <script>
        /*
         * Ajax Call to get all contents of notifications
         */
        function fetchUnreadNotifications()
        {
            var data = "userId=" + <%=userId%>;
            $.ajax({
                url: "angle_group/DAO_Fetch_Notification.jsp",
                type: "GET",
                data: data,
                dataType: "json",
                success: setUnreadNotifications
            });
        }

        /*
         * Displays the notification content
         */
        function setUnreadNotifications(data)
        {
            code = "";
            for (var i = data.length - 1; i >= 0; --i) {
                code += "<li><a><span><span>" + data[i].groupName + "</span><span class=\"time\">" + data[i].dateCustomFormat + "</span><br><span>" + data[i].title + "</span></span><span class=\"message\">" + data[i].content + "</span></a></li>"
            }
            code += "<li><div class=\"text-center\"><a><strong>See All Notifications &nbsp </strong><i class=\"fa fa-angle-right\"></i></a></div></li>";
            document.getElementById("Notifications").innerHTML = code;
        }

        /*
         * Checks for the notification count on page load
         */
        window.onload = function () {
            fetchUnreadNotificationCount();
        };

        /*
         * Checks for the notification count after every short interval
         */
        setInterval(function () {
            fetchUnreadNotificationCount();
        }, 5000);

        /*
         * Checks for the notification count
         */
        function fetchUnreadNotificationCount()
        {
            var data = "userId=" + <%=userId%>;
            $.ajax({
                url: "angle_group/DAO_Fetch_Notification_Count.jsp",
                type: "GET",
                data: data,
                dataType: "json",
                success: setNotificationCount
            });
        }

        /*
         * Displays the notification count
         */
        function setNotificationCount(data)
        {
            if (data > 0)
            {
                document.getElementById("NotificationCount").textContent = data;
            } else
            {
                document.getElementById("NotificationCount").textContent = "";
            }
        }

        /*
         * Marks the notification as read
         */
        function markUnreadNotificationRead()
        {
            var data = "userId=" + <%=userId%>;
            $.ajax({
                url: "angle_group/DAO_Mark_Notifications_Read.jsp",
                type: "GET",
                data: data,
                dataType: "json",
                success: setNotificationRead
            });
        }

        /*
         * Set notification count to 0 after the notifications are marked read
         */
        function setNotificationRead(data)
        {
            if (data > 0)
            {
                document.getElementById("NotificationCount").textContent = "";
            }
        }
    </script>
</body>