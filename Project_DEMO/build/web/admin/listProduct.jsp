<%-- 
    Document   : listProduct
    Created on : Jul 9, 2022, 9:17:17 AM
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
                if(confirm("Are you sure to isekai product with id="+id)){
                    window.location="deleteProduct?id="+id;
                }
            }
        </script>
    </head>
    <body class="admin-page">
        <div class="text-center">
            <h1>List of product</h1>
            <a href="addProduct">Add new Product</a>
        </div>
        <table class="table">
            <tr>
                <th>ID</th>
                <th>title</th>
                <th>price</th>
                <th>discount</th>
                <th>author</th>
                <th>public_year</th>
                <th>publisher</th>
                <th>form</th>
                <th>size</th>
                <th>discribe</th>
                <th>quantity</th>
                <th>image</th>
                <th>ACTION</th>
            </tr>
            <c:forEach items="${requestScope.products}" var="p">
                <c:set var="id" value="${p.id}"/>
                <tr>
                    <td>${id}</td>
                    <td>${p.title}</td>
                    <td>${p.price}</td>
                    <td>${p.discount}</td>
                    <td>${p.author}</td>
                    <td>${p.publisher}</td>
                    <td>${p.public_year}</td>
                    <td>${p.form}</td>
                    <td>${p.size}</td>
                    <td class="product-name">${p.discribe}</td>
                    <td>${p.quantity}</td>
                    <td>${p.image}</td>
                    <td>
                        <a href="#" onclick="doDelete('${id}')">Delete</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="updateProduct?id=${id}" >Update</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
