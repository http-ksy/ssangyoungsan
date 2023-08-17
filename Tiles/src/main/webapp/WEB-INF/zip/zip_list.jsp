<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Fashion | Teamplate</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico">
	<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/>
	<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
	<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
	<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
	<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- CSS here -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../assets/css/slicknav.css">
    <link rel="stylesheet" href="../assets/css/flaticon.css">
    <link rel="stylesheet" href="../assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="../assets/css/gijgo.css">
    <link rel="stylesheet" href="../assets/css/animate.min.css">
    <link rel="stylesheet" href="../assets/css/animated-headline.css">
    <link rel="stylesheet" href="../assets/css/magnific-popup.css">
    <link rel="stylesheet" href="../assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="../assets/css/themify-icons.css">
    <link rel="stylesheet" href="../assets/css/slick.css">
    <link rel="stylesheet" href="../assets/css/nice-select.css">
    <link rel="stylesheet" href="../assets/css/style.css">
    
</head>
<body class="full-wrapper">
    <main>
        <!-- breadcrumb Start-->
        <div class="page-notification">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Shop</a></li> 
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- listing Area Start -->
        <div class="category-area">
            <div class="container">
                <div class="row">
                    <div class="col-xl-7 col-lg-8 col-md-10">
                        <div class="section-tittle mb-50">
                            <h2>아파트</h2>
                            <p>${total } 개의 정보</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!--? Left content -->
                    <div class="col-xl-3 col-lg-3 col-md-4 ">
                        <!-- Job Category Listing start -->
                        <div class="category-listing mb-50">
                            <!-- single one -->
                            <div class="single-listing">
                                <!-- Select City items start -->
                                <div class="select-job-items2">
                                	<table>
                                	<tr>
                                		<td>
                                    		<input type=button class="btn btn-sm btn-danger" style="width:150px" value="아파트" @click="ListData(1)">
                                    	</td>
                                    </tr>
                                    <tr><td style="height:5px;"></td></tr>
                                    <tr>
                                		<td>
		                                    <input type=button class="btn btn-sm btn-danger" style="width:150px" value="오피스텔" @click="ListData(2)">
		                            	</td>
                                    </tr>
                                    <tr><td style="height:5px;"></td></tr>
                                    <tr>
                                		<td>
		                                    <input type=button class="btn btn-sm btn-danger" style="width:150px" value="분양권" @click="ListData(3)">
		                            	</td>
                                    </tr>
                                    <tr><td style="height:5px;"></td></tr>
                                    <tr>
                                		<td>
		                                    <input type=button class="btn btn-sm btn-danger" style="width:150px" value="주택" @click="ListData(4)">
		                            	</td>
                                    </tr>
                                    <tr><td style="height:5px;"></td></tr>
                                    <tr>
                                		<td>
		                                    <input type=button class="btn btn-sm btn-danger" style="width:150px" value="원룸" @click="ListData(5)">   
		                            	</td>
                                    </tr>   
<!--                                     <option value="2">오피스텔</option>                                 -->
<!--                                     <option value="3">분양권</option> -->
<!--                                     <option value="4">주택</option> -->
<!--                                     <option value="5">원룸</option> -->
                                	</table>
                                </div>
                                <!--  Select km items End-->
                            </div>
                        </div>
                        <!-- Job Category Listing End -->
                    </div>
                    <!--?  Right content -->
                    <div class="col-xl-9 col-lg-9 col-md-8 ">
                        <!--? New Arrival Start -->
                        <div class="new-arrival new-arrival2">
                            <div class="row">

                                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6" v-for="vo in list_data">
                                    <div class="single-new-arrival mb-50 text-center">
                                        <div class="popular-img">
<!--                                             <img src="../assets/img/gallery/arrival2.png" alt=""> -->
                                            <div class="favorit-items">
<!--                                    name,type,addr1,payment,compony,img             <span class="flaticon-heart"></span> -->
												<h3>사진</h3>
                                                <img :src="vo.img">
                                            </div>
                                        </div>
                                        <div class="popular-caption" >
                                        <img :src="vo.img" style="width:260px;height:200px;">
                                         <h3><a :href="'../zip/zip_detail.do?no='+vo.no">{{vo.no}}/{{vo.name}}</a></h3>
                                         <input type="hidden" ref="no" v-model="no" name="no" value="vo.no">
                                        <span>{{addr1}}</span>
                                        
                                        <span v-if="num!=3">{{vo.payment}}/{{vo.type}}</span>
                                        <span v-if="num==3">{{vo.saletype}}/{{vo.type}}</span>
                                    </div>
                                </div>
                            </div>
       					</div>
					</div>
<!--? New Arrival End -->
<!-- 					 <nav class="pagination"> -->
<!-- 				        <ul> -->
<%-- 				          <c:if test="${startPage>1 }"> --%>
<%-- 				          	<li><a href="../seoul/list.do?page=${startPage-1 }&no=${no}">&laquo; Previous</a></li> --%>
<%-- 				          </c:if> --%>
<%-- 				          <c:forEach var="i" begin="${startPage }" end="${endPage }"> --%>
<%-- 				          <li ${i==curpage?"class=current":"" }><a href="../seoul/list.do?page=${i }&no=${no}">${i }</a></li> --%>
<%-- 				          </c:forEach> --%>
<%-- 				          <c:if test="${endPage<totalpage }"> --%>
<%-- 				          	<li><a href="../seoul/list.do?page=${endPage+1 }&no=${no}">Next &raquo;</a></li> --%>
<%-- 				          </c:if> --%>
<!-- 				        </ul> -->
<!-- 			         </nav> -->
				</div>
			</div>
		</div>
</div>
<!-- listing-area Area End -->
<!--? Popular Items Start -->
<div class="popular-items">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-popular-items mb-50 text-center">
                    <div class="popular-img">
                        <img src="../assets/img/gallery/popular1.png" alt="">
                        <div class="img-cap">
                            <span>Glasses</span>
                        </div>
                        <div class="favorit-items">
                            <a href="shop.html" class="btn">Shop Now</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="single-popular-items mb-50 text-center">
                    <div class="popular-img">
                        <img src="../assets/img/gallery/popular2.png" alt="">
                        <div class="img-cap">
                            <span>Watches</span>
                        </div>
                        <div class="favorit-items">
                         <a href="shop.html" class="btn">Shop Now</a>
                     </div>
                 </div>
             </div>
         </div>
         <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="single-popular-items mb-50 text-center">
                <div class="popular-img">
                    <img src="../assets/img/gallery/popular3.png" alt="">
                    <div class="img-cap">
                        <span>Jackets</span>
                    </div>
                    <div class="favorit-items">
                     <a href="shop.html" class="btn">Shop Now</a>
                 </div>
             </div>
         </div>
     </div>
     <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="single-popular-items mb-50 text-center">
            <div class="popular-img">
                <img src="../assets/img/gallery/popular4.png" alt="">
                <div class="img-cap">
                    <span>Clothes</span>
                </div>
                <div class="favorit-items">
                 <a href="shop.html" class="btn">Shop Now</a>
             </div>
         </div>
     </div>
 </div>
</div>
</div>
</div>
<!-- Popular Items End -->

<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>
<script>

	new Vue({
		el:'.category-area',
		data:{
			list_data:[],
			page_data:{},
			num:1
		}, 	
		mounted:function(){
			 this.ListData(1)
		 },
		 methods:{
			 ListData:function(num){
				 axios.get('http://localhost/web/zip/zip_list_vue.do',{
					 params:{
						 num:num
					 }
				 })
				 .then(response=>{
					 console.log(response.data)
					 this.list_data=response.data
				 }).catch(error=>{
					 console.log(error.response)
				 })
			 }
// 			 pageData:function(page){
// 				 axios.get('http://localhost/web/zip/zip_page_vue.do',{
// 					 paprams::{
// 						 page:page
// 					 }
// 				 })
// 				 .then(response=>{
// 					 console.log(response.data)
// 					 this.page_data=response.data
// 				 }).catch(error=>{
// 					 console.log(error.response)
// 				 })
// 			 }
		 }
	})
</script>
<!-- JS here -->
<!-- Jquery, Popper, Bootstrap -->
<script src="../assets/js/vendor/modernizr-3.5.0.min.js"></script>
<script src="../assets/js/vendor/jquery-1.12.4.min.js"></script>
<script src="../assets/js/popper.min.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>

<!-- Slick-slider , Owl-Carousel ,slick-nav -->
<script src="../assets/js/owl.carousel.min.js"></script>
<script src="../assets/js/slick.min.js"></script>
<script src="../assets/js/jquery.slicknav.min.js"></script>

<!-- One Page, Animated-HeadLin, Date Picker -->
<script src="../assets/js/wow.min.js"></script>
<script src="../assets/js/animated.headline.js"></script>
<script src="../assets/js/jquery.magnific-popup.js"></script>
<script src="../assets/js/gijgo.min.js"></script>

<!-- Nice-select, sticky,Progress -->
<script src="../assets/js/jquery.nice-select.min.js"></script>
<script src="../assets/js/jquery.sticky.js"></script>
<script src="../assets/js/jquery.barfiller.js"></script>

<!-- counter , waypoint,Hover Direction -->
<script src="../assets/js/jquery.counterup.min.js"></script>
<script src="../assets/js/waypoints.min.js"></script>
<script src="../assets/js/jquery.countdown.min.js"></script>
<script src="../assets/js/hover-direction-snake.min.js"></script>

<!-- contact js -->
<script src="../assets/js/contact.js"></script>
<script src="../assets/js/jquery.form.js"></script>
<script src="../assets/js/jquery.validate.min.js"></script>
<script src="../assets/js/mail-script.js"></script>
<script src="../assets/js/jquery.ajaxchimp.min.js"></script>

<!-- Jquery Plugins, main Jquery -->	
<script src="../assets/js/plugins.js"></script>
<script src="../assets/js/main.js"></script>
</main>
</body>
</html>