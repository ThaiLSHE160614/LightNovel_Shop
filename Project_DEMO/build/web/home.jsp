<%-- 
    Document   : home
    Created on : Jul 7, 2022, 2:23:01 PM
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
        <section id="Slider">
            <div class="slide-show">
                <img src="images/slideshow_1.jpg">
                <img src="images/slideshow_2.jpg">
                <img src="images/slideshow_3.jpg">
            </div>
            <div class="dot-container">
                <div class="dot active"></div>
                <div class="dot"></div>
                <div class="dot"></div>    
            </div>
        </section>
        <div class="product-list">
            <div class="container">
                <h2>SẮP PHÁT HÀNH</h2>
                <h5 style="color: #848383; font-style: italic;">Cùng tìm hiểu những sách mới nhất</h5>
                <div class="product">
                    <ul class="items row">
                        <c:forEach items="${new_raw}" var="p">
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
        <div style="background-color: #F7F7F9" class="product-list">
            <div class="container">
                <h2>MỚI NHẤT TRONG TUẦN</h2>
                <h5 style="color: #848383; font-style: italic;">Cập nhật tự động trong 24h</h5>
                <div class="product">
                    <ul class="items row">
                        <c:forEach items="${new_raw}" var="p">
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
        <div class="product-list">
            <div class="container">
                <h2>HOT DEALS</h2>
                <h5 style="color: #848383; font-style: italic;">Nhanh tay lựa chọn những sản phẩm đang giảm giá</h5>
                <div class="product">
                    <ul class="items row">
                        <c:forEach items="${low}" var="p">
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
        <div class="information">
            <h2 class="text-center">TIN TỨC MỚI</h2>
            <div class="container">
                <div class="infor-bar text-center">
                    <div class="infor-block">
                        <div class="infor-img">
                            <img src="images/new1.jpg" alt="alt"/>
                        </div>
                        <div>
                            <div class="infor-name">[REVIEW ĐỘC GIẢ] 5 CENTIMET TRÊN GIÂY – BI KỊCH TUỔI TRẺ VÀ CUỘC HÀNH TRÌNH TÌM LẠI LẼ SỐNG</div>
                            <div class="review">5 Centimet Trên Giây của Shinkai Makoto không chỉ là chút vị đắng của tách cà phê mà ai cũng phải một lần nhâm nhi trong đời, mà còn là tác phẩm có dấu ấn đậm nét của văn học N...</div>
                        </div>
                    </div>
                    <div class="infor-block">
                        <div class="infor-img">
                            <img src="images/new2.jpg" alt="alt"/>
                        </div>
                        <div>
                            <div class="infor-name">[ĐIỂM SÁCH] KHI TẾ BÀO LÀM VIỆC - CUỘC CHIẾN KHÔNG HỒI KẾT TRONG CƠ THỂ CON NGƯỜI</div>
                            <div class="review">Bất cứ khi nào bạn cảm thấy cô đơn hay buồn bã, hãy nhớ rằng, trong cơ thể bạn có đến hàng chục nghìn tỉ tế bào đang âm thầm đồng hành và hiến dâng trọn đời vì bạn, từng giây từ...</div>
                        </div>
                    </div>
                    <div class="infor-block">
                        <div class="infor-img">
                            <img src="images/new3.jpg" alt="alt"/>
                        </div>
                        <div>
                            <div class="infor-name">[ĐIỂM SÁCH] BAKEMONOGATARI - THANH XUÂN "THÚ VỊ" BÊN MUÔN VÀN ĐIỀU "QUÁI GỞ"</div>
                            <div class="review">Giữa thời hiện đại, trong bối cảnh đô thị hết sức bình thường, vậy mà cậu nam sinh Araragi Koyomi lại bắt gặp 1001 câu chuyện "quái dị" - ma - thần - quỷ - quái - hay là những t...</div>
                        </div>

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
    <script>
        const imgPosition = document.querySelectorAll(".slide-show img");
        const imgContainer = document.querySelector('.slide-show');
        const dotItem = document.querySelectorAll(".dot");
        let imgNumber = imgPosition.length;
        let index = 0;
        imgPosition.forEach(function (image, index) {
            image.style.left = index * 100 + "%";
            dotItem[index].addEventListener("click", function () {
                slider(index);
            });
        });
        function imgSlide() {
            index++;
            if (index >= imgNumber) {
                index = 0;
            }
            slider(index);
        }
        function slider(index) {
            imgContainer.style.left = "-" + index * 100 + "%";
            const dotActive = document.querySelector('.active');
            dotActive.classList.remove("active");
            dotItem[index].classList.add("active");
        }
        setInterval(imgSlide, 5000);
    </script>
</html>
