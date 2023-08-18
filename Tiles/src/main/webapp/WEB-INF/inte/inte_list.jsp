<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Fashion | Teamplate</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.ico">

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
                    <div class="col-xl-7 col-lg-8 col-md-12">
                        <div class="section-tittle mb-20">
                            <h2>인테리어</h2>
                            <p>종합 리모델링</p>
                        </div>
                    </div>
                 <!-- 검색 -->   
                    <div class="navbar-form navbar-left" style="width:100%;margin-top:10px; margin-bottom:20px;">
                     <div class="select-job-items2">
                      <select name="select2" ref="column">
                       <option value="all">전체</option>
                       <option value="title">제목</option>
                       <option value="gubun">구분</option>
                      </select>
                     </div>
                     <input type="text" ref="fd" v-model="fd" class="form-control" placeholder="Search" style="width:300px;height: 42px;">
      				 <input type="button" class="btn btn-default" value="Search" @click="find()" style="height: 42px;">
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
                                        <option value="">Category</option>
                                        <option value="">Shat</option>
                                        <option value="">T-shart</option>
                                        <option value="">Pent</option>
                                        <option value="">Dress</option>
                                    </select>
                                </div>
                                <!--  Select City items End-->
                                <!-- Select State items start -->
                                <div class="select-job-items2">
                                    <select name="select3">
                                        <option value="">Type</option>
                                        <option value="">SM</option>
                                        <option value="">LG</option>
                                        <option value="">XL</option>
                                        <option value="">XXL</option>
                                    </select>
                                </div>
                                <!--  Select State items End-->
                                <!-- Select km items start -->
                                <div class="select-job-items2">
                                    <select name="select4">
                                        <option value="">Size</option>
                                        <option value="">1.2ft</option>
                                        <option value="">2.5ft</option>
                                        <option value="">5.2ft</option>
                                        <option value="">3.2ft</option>
                                    </select>
                                </div>
                                <!--  Select km items End-->
                                <!-- Select km items start -->
                                <div class="select-job-items2">
                                    <select name="select5">
                                        <option value="">Color</option>
                                        <option value="">Whit</option>
                                        <option value="">Green</option>
                                        <option value="">Blue</option>
                                        <option value="">Sky Blue</option>
                                        <option value="">Gray</option>
                                    </select>
                                </div>
                                <!--  Select km items End-->
                                <!-- Select km items start -->
                                <div class="select-job-items2">
                                    <select name="select6">
                                        <option value="">Price range</option>
                                        <option value="">$10 to $20</option>
                                        <option value="">$20 to $30</option>
                                        <option value="">$50 to $80</option>
                                        <option value="">$100 to $120</option>
                                        <option value="">$200 to $300</option>
                                        <option value="">$500 to $600</option>
                                    </select>
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
                                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-5" v-for="vo in inte_list">
                                    <div class="single-new-arrival mb-50 text-center" >
                                        <div class="popular-img">
                                           <a :href="'../inte/inte_detail.do?no='+vo.no"><img :src="vo.poster" alt="" style="width:270px;height:180px"></a>
                                            <div class="favorit-items">
                                                <!-- <span class="flaticon-heart"></span> -->
                                                <img src="../assets/img/gallery/favorit-card.png" alt="">
                                            </div>
                                        </div>
                                        <div class="popular-caption">
                                         <h3><a :href="'../inte/inte_detail.do?no='+vo.no">{{vo.title}}</a></h3>
                                         <div class="rating mb-10">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>
                                        <span><img src="../assets/img/inte/won.png" style="width:20px;height:20px">&nbsp;{{vo.price}}</span>
                                        <span><img src="../assets/img/inte/zip.png" style="width:20px;height:20px">&nbsp;{{vo.gubun}}</span>
                                       </div>
                                   </div>
                                </div>                          
							</div>
							
		<div class="justify-content-center">
         <ul class="pagination" style="margin-left:400px;">
		   <li v-if="startPage>1"><a href="#" v-on:click="prev()">&laquo; Previous</a></li>
		   <li v-for="i in range(startPage,endPage)" :class="i==curpage?'active':''"><a href="#" v-on:click="pageChange(i)">{{i}}</a></li>
		   <li v-if="endPage<totalpage"><a href="#" @click="next()">Next &raquo;</a></li>
		 </ul>
        </div>
       </div>
       
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

<script>
   new Vue({
	 el:'.category-area',
	 data: {
		 column:'all',
		 fd:'',
		 inte_list:[],
		 page_list:{},
		 curpage:1,
		 totalpage:0,
		 startPage:0,
		 endPage:0
	 },
	 mounted: function() {
		 this.send();
	 },
	 methods: {
		 send:function() {
			 axios.post('http://localhost/web/inte/list_vue.do',null,{
				 params: {
					 //보내는 데이터
					 column:this.column,
					 fd:this.fd,
					 page:this.curpage
				 }
			 }).then(response=>{
				 console.log(response.data)
				this.inte_list=response.data
				
			 }).catch(error=>{
				 console.log(error.response)
			 })
			 
			 //페이지
			 axios.get('http://localhost/web/inte/inte_page_vue.do',{
				 params: {
					 column:this.column,
					 fd:this.fd,
					 page:this.curpage
				 }
			 }).then(response=>{
				 console.log(response.data)
				 this.page_list=response.data
				 this.curpage = this.page_list.curpage
				 this.totalpage = this.page_list.totalpage
				 this.startPage = this.page_list.startPage
				 this.endPage = this.page_list.endPage
			 }).catch(error=>{
				 console.log(error.response)
			 })
		 },
		 find:function() {
			 console.log(this.fd)
			 this.column=this.$refs.column.value
			this.curpage=1;
			this.send()
		 },
		 range:function(start,end) {
			 let arr=[]
			 let length=end-start
			 for(let i=0; i<=length; i++) {
				 arr[i]=start;
				 start++;
			 }
			 return arr;
		 },
		 pageChange:function(page) {
			 this.curpage = page
			 this.send()
		 },
		 prev:function() {
			 //조건안줬으면
			 this.curpage = this.startPage>1?this.startPage-1:this.startPage
			 //this.curpage=this.startPage-1;
			 this.send()
		 },
		 next:function() {
			 this.curpage=this.endPage<this.totalpage?this.endPage+1:this.endPage
			 this.send()
		 }
	 }
   })
</script>

</body>
</html>
        