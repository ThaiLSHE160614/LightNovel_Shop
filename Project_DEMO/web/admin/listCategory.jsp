<%-- 
    Document   : listCategory
    Created on : Jul 12, 2022, 1:39:39 PM
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
        <script type="text/javascript">
            function doDelete(id){
                if(confirm("Are you sure to isekai Category with id="+id)){
                    window.location="deleteCategory?id="+id;
                }
            }
        </script>
    </head>
    <body class="admin-page">
        <div class="text-center">
            <h1>List of Category</h1>
            <a href="addCategory">Add new Category</a>
        </div>
        <table class="table">
            <tr>
                <th>ID</th>
                <th>name</th>              
                <th>ACTION</th>
            </tr>
            <c:forEach items="${requestScope.categories}" var="c">
                <c:set var="id" value="${c.id}"/>
                <tr>
                    <td>${id}</td>
                    <td>${c.name}</td>
                    <td>
                        <a href="#" onclick="doDelete('${id}')">Delete</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="updateCategory?id=${id}" >Update</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>