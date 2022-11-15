<%-- 
    Document   : account
    Created on : Jul 8, 2022, 10:11:58 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Taku Shop - Just be a WIBU</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/home.css"/>
        <link rel="stylesheet" href="css/bootstrap.css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="fontawesome-free-6.1.1-web/css/all.css">
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
                            <strong>Giỏ hàng (${sessionScope.size})</strong>
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
        <div class="acc-infor">
            <div class="container">
                <c:if test="${sessionScope.account.role_id==true}">
                    <div class="text-center">
                        <h2>Welcome back, Onii-chan</h2>
                        <a href="admin">Let do something new, UwU</a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.account.role_id==false}">
                </c:if>
                <div  class="info-line">
                    <h2>${sessionScope.account.lname} ${sessionScope.account.fname}</h2>
                </div>
                <div class="info-line">
                    <h5>${sessionScope.account.email}</h5>
                </div>
                <div class="info-line">
                    <h5>${sessionScope.account.address}</h5>
                </div>
                <div class="info-line">
                    <h5>${sessionScope.account.phone}</h5>
                </div>
                <div class="info-line">
                    <div>
                        <a href="changeaddress"> Thay đổi địa chỉ</a>
                    </div>
                </div>
                <div class="info-line">
                    <div>
                        <a href="changeinfor"> Thay đổi thông tin người dùng</a>
                    </div>
                </div>
            </div>
        </div>            
        <footer class="footer">
            <div class="row">
                <div class="col-md-3 shop">
                    <a href="home" class="logo" title="taku shop">
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
                        <input required type="email" name="input" placeholder="Vui lòng nhập địa chỉ email..."/>
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
        </footer>
    </body>
</html>

