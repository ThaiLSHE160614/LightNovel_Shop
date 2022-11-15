<%-- 
    Document   : updateCategory
    Created on : Jul 12, 2022, 1:45:25 PM
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
    <body class="admin-page text-center">
        <div class="login-div">
            <div class="container">
                <div class="text-login text-center">
                    <span class="text-uppercase" style="font-weight: 600">Update Category</span>
                </div>
                <div class="action-box">
                    <c:set var="c" value="${requestScope.category}"/>
                    <form action="updateCategory" class="login-form text-left" method="post">
                        <div>
                            <p style="font-weight: 600;">Id:</p>
                            <input type="number" readonly name="id" value="${c.id}"/>
                        </div>
                        <div>
                            <p style="font-weight: 600;">Tên truyện:</p>
                            <input required type="text" name="name" placeholder="Nhập tên danh mục" value="${c.name}"/>
                        </div>
                        
                        <div>
                            <input class="btn" type="submit" value="Sửa"/>
                        </div>
                    </form>
                    <a href="listCategory">
                        <div style="width: 100px; height: 30px; background-color: red; color: white; border-radius: 5px;">
                            <span>Quay về</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>

