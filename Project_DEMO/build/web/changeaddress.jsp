<%-- 
    Document   : changeaddress
    Created on : Jul 12, 2022, 8:56:15 AM
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
                            <li>
                                <a href="/project/collection/sach-trinh-tham-kinh-di">Trinh thám - Kinh dị</a>
                            </li>
                            <li>
                                <a href="/project/collection/manga-comic">Manga-Comic</a>
                            </li>
                            <li>
                                <a href="/project/collection/truyen-nguyen-bo">Truyện nguyên bộ</a>
                            </li>
                            <li>
                                <a href="/project/collection/fantasy">Fantasy</a>
                            </li>
                            <li>
                                <a href="/project/collection/rom-com">Rom-com</a>
                            </li>
                            <li>
                                <a href="/project/collection/boxset">Boxset</a>
                            </li>                    
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
                <div class="text-center">
                    <h2 style="font-weight: 600">Thay đổi thông tin tài khoản</h2>
                </div>
                <hr/>
                <div class="action-box">
                    <c:set var="u" value="${sessionScope.account}"/>
                    <form action="changeaddress" class="login-form text-left" method="post">
                        <%
                  if(request.getAttribute("error")!=null){
                    String er= (String)request.getAttribute("error");
                        %>
                        <h5 style="color: red; font-weight: 600"><%= er %></h5>
                        <%
                            }  
                        %>
                        <div>
                            <p style="font-weight: 600;">Email:</p>
                            <input type="email" readonly name="email" value="${u.email}"/>
                        </div>
                        <div>
                            <p style="font-weight: 600;">Tên:</p>
                            <input required type="text" readonly name="fname" value="${u.fname}"/>
                        </div>
                        <div>
                            <p style="font-weight: 600;">Họ:</p>
                            <input required type="text" readonly name="lname" value="${u.lname}"/>
                        </div>
                        
                        <div>
                            <p style="font-weight: 600;">Địa chỉ:</p>
                            <input required type="text" name="address" value="${u.address}"/>
                        </div>
                        <div>
                            <p style="font-weight: 600;">Số điện thoại:</p>
                            <input required type="text" name="phone" value="${u.phone}"/>
                        </div>
                        <div>
                            <input class="btn" type="submit" value="Sửa"/>
                        </div>
                        <div>
                            <a href="account">Quay về trang tài khoản</a>
                        </div>
                    </form>
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


