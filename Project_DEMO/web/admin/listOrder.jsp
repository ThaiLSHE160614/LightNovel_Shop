<%-- 
    Document   : listOrder
    Created on : Jul 14, 2022, 9:06:17 AM
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
            <h1>List of Order</h1>
        </div>
        <table class="table">
            <tr>
                <th>ID</th>
                <th>date</th>              
                <th>User email</th>
                <th>Total Money</th>
            </tr>
            <c:forEach items="${requestScope.orders}" var="o">
                <c:set var="id" value="${o.id}"/>
                <tr>
                    <td>${id}</td>
                    <td>${o.date}</td>
                    <td>${o.ue}</td>
                    <td>${o.totalmoney}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
