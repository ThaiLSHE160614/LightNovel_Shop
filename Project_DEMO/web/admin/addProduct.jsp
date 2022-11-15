<%-- 
    Document   : addProduct
    Created on : Jul 8, 2022, 8:41:16 PM
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
                    <span class="text-uppercase" style="font-weight: 600">Add New Product</span>
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
                    <form action="addProduct" class="login-form text-left" method="post">
                        <div>
                            <input required type="int" name="id" placeholder="Nhập id"/>
                        </div>
                        <div>
                            <input required type="text" name="title" placeholder="Nhập tên sản phẩm"/>
                        </div>
                        <div>
                            <input required type="text" name="price" placeholder="Nhập giá gốc"/>
                        </div>
                        <div>
                            <input required type="text" name="discount" placeholder="Nhập giá sale"/>
                        </div>
                        <div class="rem" >
                            <p style="font-weight: 600;">Thể loại:</p>
                            <c:forEach items="${requestScope.cate}" var="c">
                                <input type="checkbox" name="category" value="${c.id}"/>
                                ${c.name}<br/>
                            </c:forEach>
                        </div>
                        <div>
                            <input required type="text" name="author" placeholder="Nhập tên tác giả"/>
                        </div>
                        <div>
                            <input required type="text" name="publisher" placeholder="Nhập tên nhà xuất bản"/>
                        </div>
                        <div>
                            <input required type="date" name="public_year" />
                        </div>
                        <label for="form">Loại bìa:</label>
                        <select id="form" name="form">
                            <option value="Bìa mềm">Bìa mềm</option>
                            <option value="Bìa cứng">Bìa cứng</option>
                            <option value="Boxset">Boxset</option>
                        </select><br/>
                        <label for="size">Kích cỡ:</label>
                        <select id="size" name="size">
                            <option value="18 x 13 cm">18 x 13 cm</option>
                            <option value="19 x 13 cm">19 x 13 cm</option>
                            <option value="18 x 23 cm">18 x 23 cm</option>
                            <option value="17.6 x 11.3 cm">17.6 x 11.3 cm</option>
                            <option value="box">Box</option>
                            <option value="combo">Combo</option>
                        </select>                        
                        <div>
                            <input type="text" name="discribe" placeholder="Nhập miêu tả"/>
                        </div>
                        <div>
                            <input required type="number" name="quantity" placeholder="Nhập số lượng"/>
                        </div>
                        <div>
                            <input required type="text" name="img" placeholder="Nhập địa chỉ ảnh"/>
                        </div>

                        <div>
                            <input class="btn" type="submit" value="Tạo mới"/>
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
