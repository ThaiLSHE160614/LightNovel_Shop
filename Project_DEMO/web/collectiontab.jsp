<%-- 
    Document   : collection
    Created on : Jun 19, 2022, 8:44:29 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <strong>Giỏ hàng</strong>
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
                                <a href="/collections/sach-trinh-tham-kinh-di">Trinh thám - Kinh dị</a>
                            </li>
                            <li>
                                <a href="/collections/fantasy">Fantasy</a>
                            </li>
                            <li>
                                <a href="/collections/rom-com">Rom-com</a>
                            </li>
                            <li>
                                <a href="/collections/boxset">Boxset</a>
                            </li>                   
                            <li>
                                <a href="/collections/manga-comic">Manga-Comic</a>
                            </li>
                            <li>
                                <a href="/collections/truyen-nguyen-bo">Truyện nguyên bộ</a>
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
        <div>
            <div class="container">
                <h5>
                    <a href="home">Trang chủ</a>
                    / <a href="collection">Danh mục</a>
                    / Tất cả
                </h5>
                <div class="row">
                    <div class="col-md-3">
                        <h3 class="" style="text-transform: uppercase; border-bottom: 3px solid #e0e0e0; padding-bottom: 10px">Danh mục</h3>
                        <div class="category">
                            <ul>
                            <c:set var="cid" value="${requestScope.id}"/>
                            <c:forEach items="${requestScope.tab}" var="c">
                                <li><a class="${c.id==id?"active":""}" href="tab?id=${c.id}">${c.name}</a></li>
                            </c:forEach>
                            </ul>
                        </div>
                        <div>
                            <h3 class="" style="text-transform: uppercase; border-bottom: 3px solid #e0e0e0; padding-bottom: 10px">Bộ lọc</h3>
                            <form method="post">
                                <span>Giá từ</span>
                                <span style="display: inline-block; width: 20px;">
                                    <input type="number" name="from"/>
                                </span>
                                -
                                <span style="display: inline-block; width: 20px;">
                                    <input type="number" name="to"/>
                                </span>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="row">
                            <div class="col-md-6 text-left">
                                Danh sách sản phẩm
                            </div>
                            <div class="sort col-md-6 text-right">
                                <span>Sắp xếp theo</span>
                                <span>
                                    <select class="sort-by">
                                        <option value="new">Mới nhất</option>
                                        <option value="old">Cũ nhất</option>
                                        <option value="expensive">Giá từ cao đến thấp</option>
                                        <option value="cheap">Giá từ thấp đến cao</option>
                                    </select>
                                </span>
                            </div>
                        </div>
                        <div class="product collection">
                            <div class="items row">
                                <c:forEach items="${requestScope.data}" var="p">
                                    <div class="product-block col-md-3" >
                                        <a href="">
                                            <img style="margin: 10px 10px;" src="${p.image}" />
                                            <p class="product-name">${p.title}</p>
                                            <div class="text-center">
                                                <span style="color: #01a14b">${(p.discount)}đ</span>
                                                <span class="old">${(p.price)}đ</span>
                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="paging">
                                <c:set var="page" value="${requestScope.page}"/>
                                <div class="pagination">
                                    <c:forEach begin="${1}" end="${requestScope.num}" var="i">
                                        <a class="${i==page?"active":""}" href="tab?page=${i}&id=${id}">${i}</a> 
                                    </c:forEach>
                                </div>                                 
                            </div>
                        </div>
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
