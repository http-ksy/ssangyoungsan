<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	    <header>
        <!-- Header Start -->
        <div class="header-area ">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="menu-wrapper d-flex align-items-center justify-content-between">
                        <div class="header-left d-flex align-items-center">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="../main/main.do"><img src="../assets/img/logo/logo.png" alt=""></a>
                            </div>
                            <!-- Main-menu -->
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a href="../main/main.do">home</a></li> 
                                        <li><a href="../shionhouse-master/shop.html">.zip 사러가기</a></li>
                                        <li><a href="../shionhouse-master/about.html">.zip 인테리어하기 </a></li>
                                        <li><a href="../shionhouse-master/blog.html">.zip 가구 사기</a>
                                            <ul class="submenu">
                                                <li><a href="../shionhouse-master/blog.html">내용1</a></li>
                                                <li><a href="../shionhouse-master/blog_details.html">내용2</a></li>
                                                <li><a href="../shionhouse-master/elements.html">내용3</a></li>
                                                <li><a href="../shionhouse-master/product_details.html">내용4</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="../shionhouse-master/contact.html">zip 청소하기</a></li>
                                        <li><a href="../shionhouse-master/contact.html">zip 이사하기</a></li>
                                    </ul>
                                </nav>
                            </div>   
                        </div>
                        <div class="header-right1 d-flex align-items-center">
                            <!-- Social -->
                            <div class="header-social d-none d-md-block">
                                <!-- <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="https://bit.ly/sai4ull"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-pinterest-p"></i></a> -->
                                <a href="#"><span>login</span></a> / 
                                <a href="#"><span>join</span></a>
                            </div>
                            <!-- Search Box -->
                            <div class="search d-none d-md-block">
                                <ul class="d-flex align-items-center">
                                    <li class="mr-15">
                                        <div class="nav-search search-switch">
                                            <i class="ti-search"></i>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="card-stor">
                                            <img src="../assets/img/gallery/card.svg" alt="">
                                            <span>0</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
    <!-- header end -->
    <!--? Search model Begin -->
<div class="search-model-box">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-btn">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Searching key.....">
        </form>
    </div>
</div>
</body>
</html>