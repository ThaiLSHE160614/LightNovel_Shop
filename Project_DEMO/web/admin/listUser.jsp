<%-- 
    Document   : listUser
    Created on : Jul 14, 2022, 9:12:54 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Taku Shop - Just be a WIBU</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/home.css"/>
        <link rel="stylesheet" href="../css/bootstrap.css"/>
        <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    </head>
    <body class="admin-page">
        <div class="text-center">
            <h1>List of User</h1>
        </div>
        <table class="table">
            <tr>
                <th>fname</th>
                <th>lname</th>              
                <th>email</th>
                <th>password</th>
                <th>address</th>
                <th>phone</th>
            </tr>
            <c:forEach items="${requestScope.users}" var="u">
                <c:set var="email" value="${u.email}"/>
                <tr>
                    <td>${u.fname}</td>
                    <td>${u.lname}</td>
                    <td>${email}</td>
                    <td>${u.password}</td>
                    <td>${u.address}</td>
                    <td>${u.phone}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>

