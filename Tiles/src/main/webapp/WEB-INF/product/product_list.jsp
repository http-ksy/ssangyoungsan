<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">

.frame {
  width: 100%;
  text-align: center;
}
button {
  margin: 20px;
}
.custom-btn {
  width: 180px;
  height: 60px;
  color: #000000;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: bold;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}
/* 6 */
.btn-6 {
  background: rgb(245, 203, 221);
background: radial-gradient(circle, rgba(245, 203, 221,1) 0%, rgba(204, 226, 252,1) 100%);
  line-height: 42px;
  padding: 0;
  border: none;
}
.btn-6 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-6:before,
.btn-6:after {
  position: absolute;
  content: "";
  height: 0%;
  width: 1px;
 box-shadow:
   -1px -1px 20px 0px rgba(255,255,255,1),
   -4px -4px 5px 0px rgba(255,255,255,1),
   7px 7px 20px 0px rgba(0,0,0,.4),
   4px 4px 5px 0px rgba(0,0,0,.3);
}
.btn-6:before {
  right: 0;
  top: 0;
  transition: all 500ms ease;
}
.btn-6:after {
  left: 0;
  bottom: 0;
  transition: all 500ms ease;
}
.btn-6:hover{
  background: transparent;
  color: #76aef1;
  box-shadow: none;
}
.btn-6:hover:before {
  transition: all 500ms ease;
  height: 100%;
}
.btn-6:hover:after {
  transition: all 500ms ease;
  height: 100%;
}
.btn-6 span:before,
.btn-6 span:after {
  position: absolute;
  content: "";
  box-shadow:
   -1px -1px 20px 0px rgba(255,255,255,1),
   -4px -4px 5px 0px rgba(255,255,255,1),
   7px 7px 20px 0px rgba(0,0,0,.4),
   4px 4px 5px 0px rgba(0,0,0,.3);
}
.btn-6 span:before {
  left: 0;
  top: 0;
  width: 0%;
  height: .5px;
  transition: all 500ms ease;
}
.btn-6 span:after {
  right: 0;
  bottom: 0;
  width: 0%;
  height: .5px;
  transition: all 500ms ease;
}
.btn-6 span:hover:before {
  width: 100%;
}
.btn-6 span:hover:after {
  width: 100%;
}

</style>
</head>
<body class="full-wrapper">
    <main>
        <!-- breadcrumb Start-->
        <div class="page-notification">
            <div class="container">
                
            </div>
        </div>
        <!-- listing Area Start -->
        <div class="category-area">
            <div class="container">
                <div class="row">
                    <div class="col-xl-7 col-lg-8 col-md-10">
                        <div class="section-tittle mb-50">
                            <h2>{{title}}</h2>                            
                        </div>
                    </div>
                </div>
                <!-- 검색 시작 -->
				<div class="text-right" style="margin-bottom:15px">
				  <input type=text placeholder="검색어를 입력하세요" size=30 ref="fd" class="input-sm" v-model="fd" style="height:40px">
				  <input type=button value="검색" class="custom-btn btn-6" @click="find()" style="width:100px;height:40px">
				</div>
				<!-- 검색 끝 -->
                <div class="row">
                
                    <!--? Left content -->
                    <div class="col-xl-3 col-lg-3 col-md-4 ">
                    
                        <!-- Job Category Listing start -->
                        <div class="category-listing mb-50">
                            <!-- single one -->
                            <div class="single-listing">
                                <!-- Select City items start -->
                                  <div class="login-box">
                                	
                               	  </div>  
                                		<div class="frame">
                                		  <button class="custom-btn btn-6"><a href="../product/product_list.do?type=1">가구</a></button>
                                		  <button class="custom-btn btn-6"><a href="../product/product_list.do?type=2">패브릭</a></button>
                                		  <button class="custom-btn btn-6"><a href="../product/product_list.do?type=3">조명</a></button>
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
                            
	<!-- 사진 -->
                                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6" v-for="vo in product_list">
                                    <div class="single-new-arrival mb-50 text-center">
                                        <div class="popular-img">
                                            <a :href="'../product/product_detail.do?no='+vo.no+'&type='+type"><img :src="vo.poster"></a>                                            <div class="favorit-items">
                                                <!-- <span class="flaticon-heart"></span> -->
                                                <img src="../assets/img/gallery/favorit-card.png" alt="">
                                            </div>
                                        </div>
                                        <div class="popular-caption text-left">
                                           <h4>[ <a href="#">{{vo.brand}}</a> ]</h4>
                                           <h3><a href="#">{{vo.title}}</a></h3>
                                           <div class="rating mb-10">
                                              <i class="fas fa-star"></i>
                                              <i class="fas fa-star"></i>
                                              <i class="fas fa-star"></i>
                                              <i class="fas fa-star"></i>
                                              <i class="fas fa-star"></i>
                                            
                                           </div>
                                           <div class="text-right">
	                                        <span>{{vo.original_pri}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{vo.sale}}</span>
	                                        <span>{{vo.priced_sale}}</span>
                                          </div>
                                        </div>
                                </div>
                            </div>
</div>
</div>

<!-- page나누기 -->
<div class="row justify-content-center">
        <ul class="pagination">
          <li v-if="startPage>1"><a href="#" @click="prev()">&laquo; Previous</a></li>
          <li v-for="i in range(startPage,endPage)" :class="i==curpage?'current':''"><a href="#" @click="pageChange(i)">{{i}}</a></li>
          <li v-if="endPage<totalpage"><a href="#" @click="next()">Next &raquo;</a></li>
        </ul>
</div>

</div>
<!--? New Arrival End -->
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

<!-- Vue Start -->
<script>
  new Vue({
	  el:'.category-area',
	  data:{
		  type:${type},
		  title:'${title}',
		  product_list:[],
		  page_info:{},
		  curpage:1,
		  totalpage:0,
		  startPage:0,
		  endPage:0,
		  fd:'',
		  count:0
	  },
	  mounted:function(){
		  this.dataRecv()
	  },
	  methods:{
		  dataRecv:function(){
			  axios.get('http://localhost/web/product/product_list_vue.do',{
				  params:{
					  page:this.curpage,
					  type:this.type,
					  fd:this.fd
				  }
			  }).then(response=>{
				  console.log(response.data)
				  this.product_list=response.data
			  }).catch(error=>{
				  console.log(error.response);
			  })
			  
			  axios.get('http://localhost/web/product/product_page_info_vue.do',{
				  params:{
					  page:this.curpage,
					  type:this.type,
					  fd:this.fd
				  }
			  }).then(res=>{
				  console.log(res.data)
				  this.page_info=res.data
				  this.curpage=this.page_info.curpage
				  this.totalpage=this.page_info.totalpage
				  this.startPage=this.page_info.startPage
				  this.endPage=this.page_info.endPage
			  }).catch(error=>{
				  console.log(error.response)
			  })
			  
			  axios.get('http://localhost/web/product/product_find_vue.do',{
				  params:{
					  fd:this.fd,
					  type:this.type,
					  page:this.curpage
				  }
			  }).then(response=>{
				  console.log(response.data)
				  this.product_list=response.data
			  }).catch(error=>{
				  console.log(error.response)
			  })
			  
			  axios.get('http://localhost/web/product/page_info_vue.do',{
				   params:{
					   page:this.curpage,
					   fd:this.fd,
					   type:this.type
				   }
			   }).then(response=>{
				   console.log(response.data)
				   this.page_info=response.data
				   this.curpage=this.page_info.curpage;
				   this.totalpage=this.page_info.totalpage
				   this.startPage=this.page_info.startPage
				   this.endPage=this.page_info.endPage;
				   this.count=Number(this.page_info.count)
			   }).catch(error=>{
				   console.log(error.response)
			   })
		  },
		  range:function(start,end){
			  let arr=[];
			  let leng=end-start;
			  for(let i=0;i<=leng;i++)
			  {
				  arr[i]=start;
				  start++;
			  }
			  return arr;
		  },
		  find:function(){
			  this.curpage=1;
			  this.dataRecv()
		  },
		  pageChange:function(page){
			  this.curpage=page;
			  this.dataRecv()
		  },
		  prev:function(){
			  this.curpage=this.startPage-1
			  this.dataRecv()
		  },
		  next:function(){
			  this.curpage=this.endPage+1
			  this.dataRecv()
		  }
	  }
  })
</script>
</body>
</html>