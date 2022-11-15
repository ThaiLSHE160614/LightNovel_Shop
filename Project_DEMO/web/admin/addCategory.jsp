<%-- 
    Document   : addCategory
    Created on : Jul 12, 2022, 1:42:47 PM
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
                    <span class="text-uppercase" style="font-weight: 600">Add New Category</span>
                </div>
                <div class="action-box">
                    <%
                      if(request.getAttribute("error")!=null){
                        String er= (String)request.getAttribute("error");
                    %>
                    <h5 style="color: red; font-weight: 600"><%= er %></h5>
                    <%
                        }  
                    %>
                    <form action="addCategory" class="login-form text-left" method="post">
                        <div>
                            <input required type="text" name="name" placeholder="Nhập tên danh mục"/>
                        </div>                       
                        <div>
                            <input class="btn" type="submit" value="Tạo mới"/>
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
