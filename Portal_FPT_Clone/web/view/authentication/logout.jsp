<%-- 
    Document   : logout
    Created on : 14-Oct-2023, 20:01:30
    Author     : MINH TUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Account</title>
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <script>
            alert("You have logout successful!");
            window.location.href = 'login';
        </script>
    </body>
</html>
