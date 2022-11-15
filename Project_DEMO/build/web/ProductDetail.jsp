<%-- 
    Document   : ProductDetail
    Created on : Jul 13, 2022, 8:56:19 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tài khoản- Taku Shop</title>
        <link rel="stylesheet" href="css/home.css"/>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script>
            function increaseValue() {
                var value = parseInt(document.getElementById('number').value, 10);
                value = isNaN(value) ? 0 : value;
                value++;
                document.getElementById('number').value = value;
            }

            function decreaseValue() {
                var value = parseInt(document.getElementById('number').value, 10);
                value = isNaN(value) ? 0 : value;
                value < 1 ? value = 1 : '';
                value--;
                document.getElementById('number').value = value;
            }
        </script>

    </head>
    <body>
        <div class="topbar">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 slogan">Keep calm and love light novel</div>
                    <div class="col-md-4 account">
                        <%
                            User u= (User)session.getAttribute("account");
                            if(u!=null){
                        %>
                        <a href="/project/account" class="link" title="account">
                            <strong>Xin chào, ${sessionScope.holo}</strong>
                        </a>
                        <span class="sep">|</span>
                        <a href="/project/logout" class="link" title="logout">
                            <strong>Đăng xuất</strong>
                        </a>
                        <%
                            }else{
                        %>
                        <a href="/project/register" class="link" title="register">
                            <strong>Đăng ký</strong>
                        </a>
                        <span class="sep">|</span>
                        <a href="/project/login" class="link" title="login">
                            <strong>Đăng nhập</strong>
                        </a>
                        <%    
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <header class="header"> 
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <a href="/project/home" class="logo" title="taku shop">
                            <img style="width: 70px; height:70px " src="images/logo.jpg" alt="Taku shop" title="Taku shop">
                        </a>
                    </div>
                    <div class="col-md-6">
                        <form class="searchbox "action="search" method="get">
                            <input class="search-text" type="text" name="key" placeholder="Tìm kiếm..."/>
                            <button class="search-btn" onclick="this.form.submit()"><img src="images/search.png" width="25px" height="25px" alt="search"/></button>
                        </form>
                        <c:set var="k" value="${requestScope.key}"/>
                    </div>
                    <div class="col-md-3">
                        <a href="/project/cart" class="cart text-center">
                            <img src="images/cart.png" width="50px" height="50px" alt="cart"/><br/>
                            <strong>Giỏ hàng (${requestScope.size})</strong>
                        </a>
                    </div>
                </div>
            </div>
        </header>
        <nav>
            <div class="container">
                <div class="menu">
                    <li>
                        <a href="home">
                            <span>Trang chủ</span>
                        </a>
                    </li>
                    <li>
                        <a href="/project/collection">
                            <span>Sản phẩm</span>
                        </a>
                        <ul class="sub-menu">
                            <c:set var="cid" value="${requestScope.id}"/>
                            <c:forEach items="${requestScope.tab}" var="c">
                                <li><a class="${c.id==id?"active":""}" href="collection?id=${c.id}">${c.name}</a></li>
                                </c:forEach>
                        </ul>
                    </li>
                    <li>
                        <a href="/project/blogs/tintuc">
                            Tin tức
                        </a>
                    </li>
                    <li>
                        <a href="/project/blogs/huong-dan">
                            <span>Thanh toán</span>
                        </a>
                        <ul class="sub-menu">
                            <li>
                                <a href="/project/pages/dat-hang">Đặt hàng</a>
                            </li>
                            <li>
                                <a href="/project/pages/thanh-toan">Thanh toán</a>
                            </li>
                            <li>
                                <a href="/project/pages/phuong-thuc-van-chuyen">Phương thức vận chuyển</a>
                            </li>
                            <li>
                                <a href="/project/pages/chinh-sach-doi-tra">Chính sách đổi trả</a>
                            </li>                    
                        </ul>
                    </li>
                    <li>
                        <a href="/project/pages/lien-he">Liên hệ</a>
                    </li>                
                </div>
            </div>
        </nav>
        <div>
            <div class="container">
                <c:set var="d" value="${requestScope.data}"/>
                <h5>
                    <a href="home">Trang chủ</a>
                    > <a href="collection">Danh mục</a>
                    > ${d.title}
                </h5>
                <hr/>
                <div class="row">
                    <div class="col-md-6 text-center">
                        <div>
                            <img width="450px" height="600px" src="${d.getImage()}" alt="${d.title}"/>
                        </div>
                    </div>
                    <div class="col-md-6 text-left">
                        <div>
                            <p style="text-transform: uppercase; font-size: 20px;">${d.title}</p>
                        </div>
                        <div>
                            <p style="font-size: 13px;">Mã sản phẩm: ${d.id}</p>
                        </div>
                        <div>
                            <span style="color: red; font-size: 25px;">${d.price}đ</span>
                            <span style="color: #01a14b; font-size: 15px; text-decoration: line-through">${d.discount}đ</span>
                        </div>
                        <div>
                            <c:choose>
                                <c:when test = "${requestScope.data.getQuantity()<1}">
                                    <h3 style="color: #01a14b">OUT OF STOCK</h3>
                                </c:when>
                                <c:otherwise>
                                    <div>
                                        <form action="detail" method="post">
                                            <div class="quantbtn">
                                                <div class="value-button" id="decrease" onclick="decreaseValue()" value="Decrease Value" style="padding-bottom: 20px"><h5>-</h5></div>
                                                <input name="quant" type="number" id="number" value="1" />
                                                <input style="display: none" name="id" type="text" value="${requestScope.data.getId()}"/>
                                                <div class="value-button" id="increase" onclick="increaseValue()" value="Increase Value"><h5>+</h5></div>
                                            </div>
                                            
                                            <button class="btn btn-outline-dark flex-shrink-0" type="submit">
                                                <i class="bi-cart-fill me-1"></i>
                                                Add to cart
                                            </button>
                                        </form>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <div style="border: 1px solid #01a14b; padding: 10px; margin: 20px;">
                    <p>
                        <span style="font-weight: 600;">Tác giả:</span>
                        ${d.author}
                    </p>
                    <p>
                        <span style="font-weight: 600;">Nhà xuất bản:</span>
                        ${d.publisher}
                    </p>
                    <p>
                        <span style="font-weight: 600;">Hình thức:</span>
                        ${d.form}
                    </p>
                    <p>
                        <span style="font-weight: 600;">Kích thước:</span>
                        ${d.size}
                    </p>
                    <p>
                        <span style="font-weight: 600;">Ngày xuất bản:</span>
                        ${d.public_year}
                    </p>
                    <p style="font-weight: 600;">Nội dung:</p>
                    <p>${d.discribe}</p>
                </div>
            </div>
            <div class="product-list">
                <div class="container">
                    <h2>Sản phẩm liên quan</h2>
                    <div class="product">
                        <ul class="items row">
                            <c:forEach items="${relate}" var="p">
                                <li class="product-block col-md-3">
                                    <a href="detail?id=${p.id}">
                                        <img src="${p.image}" />
                                        <p class="product-name">${p.title}</p>
                                        <span style="color: #01a14b">${(p.discount)}đ</span>
                                        <span class="old">${(p.price)}đ</span>

                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 shop">
                        <a href="home.html" class="logo" title="taku shop">
                            <img style="width: 70px; height:70px " src="images/logo.jpg" alt="taku shop" title="taku shop">
                        </a><br/>
                        <p>Taku Shop</p>            
                    </div>
                    <div class="col-md-3">
                        <p>LIÊN HỆ</p>
                        <p><h5>Địa chỉ: An Khánh, Hoài Đức, Hà Nội</h5></p>
                        <p><h5>ĐT: 0397461220</h5></p>
                        <p><h5>Gmail: gamer.otaku.1710@gmail.com</h5></p>
                        <p>ĐĂNG KÝ NHẬN TIN</p>
                        <form action="send" method="get">
                            <input type="text" name="input" placeholder="Vui lòng nhập địa chỉ email..."/>
                            <button class="btn" type="submit">
                                <span>Gửi</span>
                            </button>
                        </form>
                    </div>
                    <div class="col-md-3">
                        <p>THÔNG TIN HỖ TRỢ</p>
                        <li><a href="">Yêu cầu hỗ trợ</a></li>
                        <li><a href="">Điều khoản sử dụng</a></li>
                        <li><a href="">Chính sách bảo mật</a></li>
                        <li><a href="">Phương thức vận chuyển</a></li>
                    </div>
                    <div class="col-md-3">
                        <p>FANPAGE</p>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
<script type="text/javascript">
    function buy(id) {
        var m = document.f.num.value;
        document.f.action = "buy?id=" + id + "&num=" + m;
        document.f.submit();
    }
</script>
