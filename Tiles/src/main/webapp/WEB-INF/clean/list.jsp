<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible">
    <title>Fashion | Teamplate</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico">
    <!-- CSS here -->
<!--     <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/>
	<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>	 -->
    <!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> -->
<!-- 	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
	<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
	<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script> -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
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
                                <li class="breadcrumb-item"><a href="../main/main.do">Home</a></li>
                                <li class="breadcrumb-item">.zip청소하기</li> 
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- listing Area Start -->
        <div class="category-area" id="app">
            <div class="container">
                <div class="row">
                    <div class="col-xl-7 col-lg-8 col-md-10">
                        <div class="section-tittle mb-50">
                            <h2>.zip 청소하기</h2>
                            <div class="select-job-items2">
  	                            <select name="select2" ref="column">
	                            	<option value="all">전체</option>
	                            	<option value="title">업체명</option>
	                            	<option value="address">지역</option>
	                            	<option value="category">분류(에어컨,하수구 등)</option>
	                            </select>
	                        <input type="text" ref="fd" class="input-sm" size="25" style="height: 41px;" v-model="fd">
          					<input type="button" class="btn btn-sm btn-default" style="height: 43px;" value="검색" @click="find()">
	                        </div>
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
                                    <select name="select2">
                                        <option value="">전체</option>
                                        <option value="">업체명</option>
                                        <option value="">지역</option>
                                        <option value="">분류(에어컨,하수구 등)</option>
                                    </select>
                                </div>
                                <!--  Select City items End-->
                                <!-- Select State items start -->
                                <div class="select-job-items2">
                                    <select name="select3">
                                        <option value="">서울</option>
                                        <option value="">경기</option>
                                        <option value="">인천</option>
                                        <option value="">강원도</option>
                                        <option value="">충청도</option>
                                    </select>
                                </div>
                                <!--  Select State items End-->
                                <!-- Select km items start -->
                                <div class="select-job-items2">
                                    <select name="select4">
                                        <option value="">에어컨</option>
                                        <option value="">하수구</option>
                                        <option value="">해충</option>
                                        <option value="">누수</option>
                                        <option value="">입주청소</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <!-- Job Category Listing End -->
                    </div>
                    <!--?  Right content -->
                    <div class="col-xl-9 col-lg-9 col-md-8 ">
                        <!--? New Arrival Start -->
                        <div class="new-arrival new-arrival2">
                            <div class="row">
                                <div v-for="vo in clean_list" class="col-xl-4 col-lg-4 col-md-6 col-sm-5" >
                                    <div class="single-new-arrival mb-50 text-center">
                                        <div class="popular-img">
                                            <a :href="'../clean/detail.do?cno='+vo.cno"><img :src="vo.poster" alt=""></a>
                                            <div class="favorit-items">
                                                <!-- <span class="flaticon-heart"></span> -->
                                                <img src="../assets/img/gallery/favorit-card.png" alt="">
                                            </div>
                                        </div>
                                        <div class="popular-caption">
                                         <h3><a :href="'../clean/detail.do?cno='+vo.cno">{{vo.title}}</a></h3>
                                         <div class="rating mb-10">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div> 
                                        <span>{{vo.score}}점</span>
                                    </div>
                                </div>
                            </div>
                            </div>
<!-- Button -->
			
				<div>
					<div class="text-center">
					<ul class="pagination" style="background-color: black;">
					  <li v-if="startPage>1"><a href="#" v-on:click="prev()">&lt;</a></li>
					  <li v-for="i in range(startPage,endPage)"	:class="i==curpage?'active':''"><a href="#" v-on:click="selectPage(i)">{{i}}</a></li>
					  <li v-if="endPage<totalpage"><a href="#" v-on:click="next()">&gt;</a></li>
					</ul>
					</div>
					<%-- <li class="active"><a href="#">2</a></li> --%>
				</div>
			</div>
	</div>
</div>
<!--? New Arrival End -->
</div>
</div>
</div>
</div>
<!--? Services Area End -->
</main>
<!--? Search model Begin -->
<div class="search-model-box">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-btn">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Searching key.....">
        </form>
    </div>
</div>
<!-- Search model end -->
<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>

<!-- JS here -->
<!-- Jquery, Popper, Bootstrap -->
<script>
	new Vue({
		el:'#app',
		data:{
			column:'all',
			fd:'',
			clean_list:[],
//			clean_list_find:[],
			page_list:{},
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0
		},
		mounted:function(){
			console.log('mounted : '+this.column)
			this.send();
		},
		methods:{
			send:function(){
				axios.get("http://localhost/web/clean/list_vue.do",{
					params:{
						column:this.column,
						fd:this.fd,
						page:this.curpage
					}
				}).then(response=>{
					console.log('검색결과1 :'+this.fd)
					console.log(response.data)
					this.clean_list=response.data;
					/* this.curpage=response.data[0].curpage;
					this.totalpage=response.data[0].totalpage;
					this.startPage=response.data[0].startPage;
					this.endPage=response.data[0].endPage; */
				}).catch(error=>{
					console.log(error.response)
				})
				axios.get('http://localhost/web/clean/page_vue.do',{
					params:{
						column:this.column,
						fd:this.fd,
						page:this.curpage
					}
				}).then(response=>{
					console.log('검색결과2:'+this.fd)
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
				this.curpage=page;
				this.send();
			},
			prev:function(){
				this.curpage=this.startPage-1;
				this.send()
			},
			next:function(){
				this.curpage=this.endPage+1;
				this.send()
			},
			find:function(){
				this.column=this.$refs.column.value
				console.log('fd : '+this.fd)
				this.curpage=1;
				this.send();
			}
		}
	})
</script>

</body>
</html>