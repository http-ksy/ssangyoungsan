<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- vue script  start-->


<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
 .container{ 
  margin-top: 50px; 
 } 
 .row{ 
  margin: 0px auto; 
  width: 900px; 
 } 
</style> 
<!-- vue script end -->
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
                          <b-button v-b-modal.modal-lg>login</b-button>
								  <b-modal id="modal-lg" title="로그인" hide-footer>
								    <table class="table">
								        <tr>
								          <th width=25% class="text-right">ID</th>
								          <td width=75%>
								            <input type=text ref="id" size=15 class="input-sm" v-model="id">
								          </td>
								        </tr>
								        <tr>
								          <th width=25% class="text-right">Password</th>
								          <td width=75%>
								            <input type=password ref="pwd" size=15 class="input-sm" v-model="pwd">
								          </td>
								        </tr>
								        <tr>
								          <td colspan="2" class="text-center">
								           <input type=button value="로그인" class="btn btn-sm" v-on:click="login()">
								           <a href="../member/join.do" class="btn btn-sm">회원가입</a>
								          </td>
								        </tr>
								      </table>
								  </b-modal>&nbsp;
								  <b-button class="btn btn-sm"><a href="../member/join.do"><span>join</span></a></b-button>
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
<script>
new Vue({
	el:'.header-area'
	
})
</script>
</body>
</html>