<%-- 
    Document   : UpdateProduct
    Created on : Jul 8, 2022, 8:41:54 PM
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
                    <span class="text-uppercase" style="font-weight: 600">Update Product</span>
                </div>
                <div class="action-box">
                    <c:set var="p" value="${requestScope.product}"/>
                    <form action="updateProduct" class="login-form text-left" method="post">
                        <div>
                            <p style="font-weight: 600;">Id:</p>
                            <input type="number" readonly name="id" value="${p.id}"/>
                        </div>
                        <div>
                            <p style="font-weight: 600;">Tên truyện:</p>
                            <input required type="text" name="title" placeholder="Nhập tên sản phẩm" value="${p.title}"/>
                        </div>
                        <div>
                            <p style="font-weight: 600;">Giá gốc:</p>
                            <input required type="text" name="price" placeholder="Nhập giá gốc" value="${p.price}"/>
                        </div>
                        <div>
                            <p style="font-weight: 600;">Giá sale:</p>
                            <input required type="text" name="discount" placeholder="Nhập giá sale" value="${p.discount}"/>
                        </div>
                        <div class="rem" >
                            <p style="font-weight: 600;">Thể loại:</p>
                            <c:forEach items="${requestScope.cate}" var="c">
                                        <input type="checkbox" name="category" value="${c.id}"/>${c.name}<br/>
                            </c:forEach>
                        </div>
                        <div>
                            <p style="font-weight: 600;">Tác giả:</p>
                            <input required type="text" name="author" placeholder="Nhập tên tác giả" value="${p.author}"/>
                        </div>
                        <div>
                            <p style="font-weight: 600;">Đơn vị phát hành:</p>
                            <input required type="text" name="publisher" placeholder="Nhập tên nhà xuất bản" value="${p.publisher}"/>
                        </div>
                        <div>
                            <p style="font-weight: 600;">Ngày phát hành:</p>
                            <input required type="date" name="public_year" value="${p.public_year}"/>
                        </div>
                        <p style="font-weight: 600;">Loại bìa:</p>
                        <select name="form">
                            <option value="Bìa mềm">Bìa mềm</option>
                            <option value="Bìa cứng">Bìa cứng</option>
                            <option value="Boxset">Boxset</option>
                        </select><br/>
                        <p style="font-weight: 600;">Kích thước:</p>
                        <select name="size">
                            <option value="18 x 13 cm">18 x 13 cm</option>
                            <option value="19 x 13 cm">19 x 13 cm</option>
                            <option value="18 x 23 cm">18 x 23 cm</option>
                            <option value="17.6 x 11.3 cm">17.6 x 11.3 cm</option>
                            <option value="box">Box</option>
                            <option value="combo">Combo</option>
                        </select>                        
                        <div>
                            <p style="font-weight: 600;">Nhập miêu tả:</p>
                            <input type="text" name="discribe" placeholder="Nhập miêu tả" value="${p.discribe}"/>
                            <p style="font-weight: 600;">Nhập địa chỉ:</p>
                            <input required type="text" name="img" placeholder="Nhập địa chỉ ảnh" value="${p.image}"/>
                        </div>

                        <div>
                            <input class="btn" type="submit" value="Sửa"/>
                        </div>
                    </form>
                    <a href="listProduct">
                        <div style="width: 100px; height: 30px; background-color: red; color: white; border-radius: 5px;">
                            <span>Quay về</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
