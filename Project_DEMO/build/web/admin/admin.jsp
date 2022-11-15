<%-- 
    Document   : admin
    Created on : Jul 8, 2022, 10:58:30 AM
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
        <link rel="stylesheet" href="./css/home.css"/>
        <link rel="stylesheet" href="./css/bootstrap.css"/>
        <link rel="stylesheet" href="./css/bootstrap.min.css"/>
    </head>
    <body class="admin-page">
        <div>
            <div class="container">
                <h2 class="text-center">Welcome back, Onii-chan</h2>
                <h4>Số lượng lượt đã truy cập vào web: ${sessionScope.counter}</h4>
                <h2 class="category">
                    <ul>
                        <li>
                            <a href="/project/admin/listProduct">List Product</a>
                        </li>
                        <li>
                            <a href="/project/admin/listCategory">List Category</a>
                        </li>
                        <li>
                            <a href="/project/admin/listUser">List User</a>
                        </li>
                        <li>
                            <a href="/project/admin/listOrder">List Order</a>
                        </li>
                    </ul>
                </h2>
            </div>
        </div>
    </body>
</html>
