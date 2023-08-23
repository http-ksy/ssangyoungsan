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
                            <h2>부동산</h2>
                            <p>${total } 개의 정보</p>
<!--                             <div class="select-job-items2"> -->
<!--   	                            <select name="select2" ref="column"> -->
<!-- 	                            	<option value="all">전체</option> -->
<!-- 	                            	<option value="title">업체명</option> -->
<!-- 	                            	<option value="address">지역</option> -->
<!-- 	                            	<option value="category">분류(에어컨,하수구 등)</option> -->
<!-- 	                            </select> -->
<!-- 	                        <input type="text" ref="fd" class="input-sm" size="25" style="height: 41px;" v-model="fd"> -->
<!--           					<input type="button" class="btn btn-sm btn-default" style="height: 43px;" value="검색" @click="find()"> -->
<!-- 	                        </div> -->
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
                                    		<input type=button class="genric-btn info-border circle" style="width:150px" value="아파트" @click="ListData(1)">
                                    	</td>
                                    </tr>
                                    <tr><td style="height:5px;"></td></tr>
                                    <tr>
                                		<td>
		                                    <input type=button class="genric-btn info-border circle" style="width:150px" value="오피스텔" @click="ListData(2)">
		                            	</td>
                                    </tr>
                                    <tr><td style="height:5px;"></td></tr>
                                    <tr>
                                		<td>
		                                    <input type=button class="genric-btn info-border circle" style="width:150px" value="분양권" @click="ListData(3)">
		                            	</td>
                                    </tr>
                                    <tr><td style="height:5px;"></td></tr>
                                    <tr>
                                		<td>
		                                    <input type=button class="genric-btn info-border circle" style="width:150px" value="주택" @click="ListData(4)">
		                            	</td>
                                    </tr>
                                    <tr><td style="height:5px;"></td></tr>
                                    <tr>
                                		<td>
		                                    <input type=button class="genric-btn info-border circle" style="width:150px" value="원룸" @click="ListData(5)">   
		                            	</td>
                                    </tr>   
                                    <tr><td style="height:5px;"></td></tr>
                                    <tr>
                                		<td>
		                                    <input type=button class="genric-btn info-border circle" style="width:150px" value="상가" @click="ListData(6)">   
		                            	</td>
                                    </tr>   
                                    <tr><td style="height:5px;"></td></tr>
                                    <tr>
                                		<td>
		                                    <input type=button class="genric-btn info-border circle" style="width:150px" value="사무실" @click="ListData(7)">   
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
                                        <a :href="'../zip/zip_detail.do?no='+vo.no"><img :src="vo.img" style="width:225px;height:200px;"></a>
                                         <h3><a :href="'../zip/zip_detail.do?no='+vo.no" style="color:black;">{{vo.name}}</a></h3>
                                        <span>{{vo.addr}}</span>
                                        
                                        <span>{{vo.dprice}}/{{vo.type}}</span>
                                        
                                    </div>
                                </div>
                            </div>
       					</div>
					</div>
<!--? New Arrival End -->
 				<div>
					<div class="text-center">
					<ul class="pagination">
					  <li v-if="startPage>1"><a href="#" @click="prev()">&lt;</a></li>
					  <li v-for="i in range(startPage,endPage)"	:class="i==curpage?'active':''"><a href="#" @click="selectPage(i)">{{i}}</a></li>
					  <li v-if="endPage<totalpage"><a href="#" @click="next()">&gt;</a></li>
					</ul>
					</div>
				</div>
				</div>
			</div>
		</div>
</div>
<!-- listing-area Area End -->
<!--? Popular Items Start -->

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
			page_list:{},
			etype:1,
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0
		}, 	
		mounted:function(){
			this.ListData(1)
		 },
		 methods:{
			 ListData:function(etype){
				 this.etype=etype
				 axios.get('http://localhost/web/zip/zip_list_vue.do',{
					 params:{
						 etype:etype,
						 page:1
					 }
				 })
				 .then(response=>{
					 console.log(response.data)
					 this.list_data=response.data
				 }).catch(error=>{
					 console.log(error.response)
				 })
				 axios.get('http://localhost/web/zip/zip_page_vue.do',{
						params:{
							page:1,
							etype:this.etype
//	 						fd:this.fd,
							
						}
					}).then(response=>{
//	 					console.log('검색결과2:'+this.fd)
						console.log(response.data)
						this.page_list=response.data;
						this.curpage=this.page_list.curpage;
						this.totalpage=this.page_list.totalpage;
						this.startPage=this.page_list.startPage;
						this.endPage=this.page_list.endPage;
					})
			 },
			 pageData:function(etype){
				 this.etype=etype
				 axios.get('http://localhost/web/zip/zip_list_vue.do',{
					 params:{
						 etype:etype,
						 page:this.curpage
					 }
				 })
				 .then(response=>{
					 console.log(response.data)
					 this.list_data=response.data
				 }).catch(error=>{
					 console.log(error.response)
				 })
				axios.get('http://localhost/web/zip/zip_page_vue.do',{
					params:{
						page:this.curpage,
						etype:this.etype
// 						fd:this.fd,
						
					}
				}).then(response=>{
// 					console.log('검색결과2:'+this.fd)
					console.log(response.data)
					this.page_list=response.data;
					this.curpage=this.page_list.curpage;
					this.totalpage=this.page_list.totalpage;
					this.startPage=this.page_list.startPage;
					this.endPage=this.page_list.endPage;
				})
/* 				axios.get('http://localhost/web/clean/list_find_vue.do',{
					params:{
						column:this.column,
						fd:this.fd,
						page:this.curpage
					}
				}).then(response=>{
					console.log(response.data)
					this.clean_list_find=response.data;
				}) */
				this.curpage=1
			},
			range:function(start,end){
				let arr=[];
				let length=end-start;
				for(let i=0;i<=length;i++){
					arr[i]=start;
					start++;
				}
				return arr;
			},
			selectPage:function(page){
				etype=this.etype
				this.curpage=page;
				this.pageData(etype);
			},
			prev:function(){
				etype=this.etype
				this.curpage=this.startPage-1;
				this.pageData(etype)
				
			},
			next:function(){
				etype=this.etype
				this.curpage=this.endPage+1;
				this.pageData(etype)
			},
// 			find:function(){
// 				this.etype=this.$refs.column.value
// 				console.log('fd : '+this.fd)
// 				this.curpage=1;
// 				this.send();
// 			}
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