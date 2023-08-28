<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main>
	<div class="zipmain">
        <!--? Hero Area Start-->
<!--         <div class="container-fluid"> -->
<!--             <div class="slider-area"> -->
<!--                 Mobile Device Show Menu -->
<!--                 <div class="header-right2 d-flex align-items-center"> -->
<!--                     Social -->
<!--                     <div class="header-social  d-block d-md-none"> -->
<!--                         <a href="#"><i class="fab fa-twitter"></i></a> -->
<!--                         <a href="https://bit.ly/sai4ull"><i class="fab fa-facebook-f"></i></a> -->
<!--                         <a href="#"><i class="fab fa-pinterest-p"></i></a> -->
<!--                     </div> -->
<!--                     Search Box -->
<!--                     <div class="search d-block d-md-none" > -->
<!--                         <ul class="d-flex align-items-center"> -->
<!--                             <li class="mr-15"> -->
<!--                                 <div class="nav-search search-switch"> -->
<!--                                     <i class="ti-search"></i> -->
<!--                                 </div> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <div class="card-stor"> -->
<!--                                     <img src="../assets/img/gallery/card.svg" alt=""> -->
<!--                                     <span>0</span> -->
<!--                                 </div> -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 /End mobile  Menu -->

<!--                 <div class="slider-active dot-style"> -->
<!--                     Single -->
<!--                     <div class="single-slider slider-bg1 hero-overly slider-height d-flex align-items-center"> -->
<!--                         <div class="container"> -->
<!--                             <div class="row justify-content-center"> -->
<!--                                 <div class="col-xl-8 col-lg-9"> -->
<!--                                     Hero Caption -->
<!--                                     <div class="hero__caption"> -->
<!--                                         <h1>fashion<br>changing<br>always</h1> -->
<!--                                         <a href="shop.html" class="btn">Shop Now</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     Single -->
<!--                     <div class="single-slider slider-bg2 hero-overly slider-height d-flex align-items-center"> -->
<!--                         <div class="container"> -->
<!--                             <div class="row justify-content-center"> -->
<!--                                 <div class="col-xl-8 col-lg-9"> -->
<!--                                     Hero Caption -->
<!--                                     <div class="hero__caption"> -->
<!--                                         <h1>fashion<br>changing<br>always</h1> -->
<!--                                         <a href="shop.html" class="btn">Shop Now</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     Single -->
<!--                     <div class="single-slider slider-bg3 hero-overly slider-height d-flex align-items-center"> -->
<!--                         <div class="container"> -->
<!--                             <div class="row justify-content-center"> -->
<!--                                 <div class="col-xl-8 col-lg-9"> -->
<!--                                     Hero Caption -->
<!--                                     <div class="hero__caption"> -->
<!--                                         <h1>fashion<br>changing<br>always</h1> -->
<!--                                         <a href="shop.html" class="btn">Shop Now</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
        <!-- End Hero -->
        <!--? Popular Items Start -->
        <div class="popular-items pt-50" style="height:300px;">
            <div class="container-fluid" style="width:1000px;height:300px">
                <div class="row" style="width:1000px;height:300px;margin-right:60px;" >
                    <div class="" >
                        <div class="single-popular-items mb-50 text-center wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">
                            <div class="popular-img">
                                <img :src="estate_list[4].img" alt="" style="width:195px;height:195px;">
                                <div class="img-cap">
                                    <span style="font-size:1em">{{estate_list[4].name}}</span>
                                </div>
                                <div class="favorit-items">
                                 <a href="../zip/zip_list.do" class="genric-btn info-border">.zip사러가기</a>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="">
                    <div class="single-popular-items mb-50 text-center wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s">
                        <div class="popular-img">
                            <img :src="inte_list[4].poster" alt="" style="width:195px;height:195px;">
                            <div class="img-cap">
                                <span style="font-size:1em">{{inte_list[4].title}}</span>
                            </div>
                            <div class="favorit-items">
                             <a href="../inte/inte_list.do" class="genric-btn info-border">.zip인테리어</a>
                         </div>
                     </div>
                 </div>
             </div>
             <div class="">
                <div class="single-popular-items mb-50 text-center wow fadeInUp" data-wow-duration="1s" data-wow-delay=".4s">
                    <div class="popular-img">
                        <img :src="product_list[4].poster" alt="" style="width:195px;height:195px;">
                        <div class="img-cap">
                            <span style="font-size:1em">{{product_list[4].title}}</span>
                        </div>
                        <div class="favorit-items">
                         <a href="../product/product_list.do?type=1" class="genric-btn info-border">.zip스토어</a>
                     </div>
                 </div>
             </div>
         </div>
         <div class="">
            <div class="single-popular-items mb-50 text-center wow fadeInUp" data-wow-duration="1s" data-wow-delay=".6s">
                <div class="popular-img">
                    <img :src="clean_list[4].poster" alt="" style="width:195px;height:195px;">
                    <div class="img-cap">
                        <span style="font-size:1em">{{clean_list[4].title}}</span>
                    </div>
                    <div class="favorit-items">
                     <a :href="'../clean/list.do'" class="genric-btn info-border">.zip청소</a>
                 </div>
             </div>
         </div>
     </div>
     <div class="">
            <div class="single-popular-items mb-50 text-center wow fadeInUp" data-wow-duration="1s" data-wow-delay=".6s">
                <div class="popular-img">
                    <img :src="move_list[4].poster" alt="" style="width:195px;height:195px;">
                    <div class="img-cap">
                        <span style="font-size:1em">{{move_list[4].title}}</span>
                    </div>
                    <div class="favorit-items">
                     <a :href="'../move/list.do'" class="genric-btn info-border">.zip이사</a>
                 </div>
             </div>
         </div>
     </div>
 </div>
</div>
</div>
<!-- Popular Items End -->
<!--? New Arrival Start -->
<div class="new-arrival">
    <div class="container">
        <!-- Section tittle -->
        <div class="row justify-content-center">
            <div class="col-xl-7 col-lg-8 col-md-10" style="height:80px">
                <div class="section-tittle mb-60 text-center wow fadeInUp" style="width:900px;height:80px" data-wow-duration="2s" data-wow-delay=".2s">
                    <h2 style="width:535px;height:80px;float:left;font-size:3em;">.zip사기 추천</h2>
	                <div class="room-btn mb-60" style="width:150px;height:80px;float:left">
						<a href="../zip/zip_list.do" class="border-btn">더보기</a>
					</div>
                </div>

            </div>
        </div>
            <!-- ///////////////////////////////// -->
        <div class="row justify-content-center">
	            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6" v-for="vo,index in estate_list"  v-if="index<4">
	                <div class="single-new-arrival mb-50 text-center wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">
	                    <div class="popular-img">
	                        <a :href="'../zip/zip_detail.do?no='+vo.no"><img :src="vo.img" alt=""></a>
	                    </div>
	                    <div class="popular-caption">
	                        <h3><a :href="'../zip/zip_detail.do?no='+vo.no" style="color:black;">{{vo.name}}</a></h3>
	                        <div class="rating mb-10">{{vo.addr}}</div>
	                        <span>{{vo.dprice}}</span>
	                    </div>
	                </div>
	            </div>
	      </div>
            <!-- ///////////////////////////////// -->

<div style="height:50px;"></div>
<hr>
<!-- 인테리어 메인 시작 -->
            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-8 col-md-10" style="height:80px">
               	 	<div class="section-tittle mb-60 text-center wow fadeInUp" style="width:900px;height:80px" data-wow-duration="2s" data-wow-delay=".2s">
                    <h2 style="width:535px;height:80px;float:left;font-size:3em;">.zip인테리어 추천</h2>
	                	<div class="room-btn mb-60" style="width:150px;height:80px;float:left">
					        <a href="../inte/inte_list.do" class="border-btn">더보기</a>
					    </div>
					</div>
           		</div>
            </div> 
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6" v-for="vo,index in inte_list" v-if="index<4">
                <div class="single-new-arrival mb-10 text-center wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">
                    <div class="popular-img">
                        <a :href="'../inte/inte_detail.do?ino='+vo.ino"><img :src="vo.poster" style="width:210px;height:150px;"></a>
                    </div>
                    <div class="popular-caption">
                        <h3><a :href="'../inte/inte_detail.do?ino='+vo.ino" style="color:black;">{{vo.title}}</a></h3>
                        <div class="rating mb-10">{{vo.gubun}}</div>
                        <span>{{vo.price}}</span>
                    </div>
                </div>
            </div>
          </div>
          
<div style="height:50px;"></div>
<hr>
<!-- 스토어 메인 시작-->
          <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-8 col-md-10" style="height:80px">
               	 	<div class="section-tittle mb-60 text-center wow fadeInUp" style="width:900px;height:80px" data-wow-duration="2s" data-wow-delay=".2s">
                    <h2 style="width:535px;height:80px;float:left;font-size:3em;">.zip스토어 추천</h2>
	                	<div class="room-btn mb-60" style="width:150px;height:80px;float:left">
					        <a href="../product/product_list?type=1" class="border-btn">더보기</a>
					    </div>
					</div>
            </div>
          <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6" v-for="vo,index in product_list" v-if="index<4">
              <div class="single-new-arrival mb-50 text-center wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">
                <div class="popular-img">
                  <a :href="'../product/product_detail.do?no='+vo.no+'&type='+type"><img :src="vo.poster"></a>
                </div>
                <div class="popular-caption">
                  <h3><a href="'../product/product_detail.do?no='+vo.no+'&type=1'" style="color:black;">[{{vo.brand}}]</a></h3>
                  <div class="rating mb-10">{{vo.title}}</div>
                  <span>{{vo.original_pri}}원</span>
                </div>
              </div>
            </div>
            
<div style="height:50px;"></div>
<hr>
<!-- 스토어 메인 끝-->
             <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-8 col-md-10" style="height:80px">
               	 	<div class="section-tittle mb-60 text-center wow fadeInUp" style="width:900px;height:80px" data-wow-duration="2s" data-wow-delay=".2s">
                    <h2 style="width:535px;height:80px;float:left;font-size:3em;">.zip청소 추천</h2>
	                	<div class="room-btn mb-60" style="width:150px;height:80px;float:left">
					         <a :href="'../clean/list.do'" class="border-btn">더보기</a>
					    </div>
					</div>
                </div>
            </div>
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6" v-for="vo,index in clean_list" v-if="index<4">
                <div class="single-new-arrival mb-50 text-center wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">
                    <div class="popular-img">
                        <a :href="'../clean/detail.do?cno='+vo.cno"><img :src="vo.poster" style="width:195px;height:195px;"alt=""></a>
                    </div>
                    <div class="popular-caption">
                        <h3><a :href="'../clean/detail.do?cno='+vo.cno" style="color:black;">{{vo.title}}</a></h3>
                        <div class="rating mb-10">{{vo.address}}</div>
                        <span>경력 : {{vo.carrer}}</span>
                    </div>
                </div>
            </div>
            
<div style="height:50px;"></div>
<hr>
             <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-8 col-md-10" style="height:80px">
               	 	<div class="section-tittle mb-60 text-center wow fadeInUp" style="width:900px;height:80px" data-wow-duration="2s" data-wow-delay=".2s">
                    <h2 style="width:535px;height:80px;float:left;font-size:3em;">.zip이사 추천</h2>
	                	<div class="room-btn mb-60" style="width:150px;height:80px;float:left">
					        <a :href="'../move/list.do'" class="border-btn">더보기</a>
					    </div>
					</div>
                </div>
            </div>
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6" v-for="vo,index in move_list" v-if="index<4">
                <div class="single-new-arrival mb-50 text-center wow fadeInUp" data-wow-duration="1s" data-wow-delay=".1s">
                    <div class="popular-img">
                        <a :href="'../move/detail.do?mno='+vo.mno"><img :src="vo.poster" style="width:195px;height:195px;" alt=""></a>
                    </div>
                    <div class="popular-caption">
                        <h3><a :href="'../move/detail.do?mno='+vo.mno" style="color:black;">{{vo.title}}</a></h3>
                        <div class="rating mb-10">{{vo.address}}</div>
                        <span>경력 : {{vo.carrer}}</span> 
                    </div>
                </div>
            </div>
      </div>
</div>
<!-- Button -->

</div>
</div>
<!--? New Arrival End -->
<!--? collection -->
<!-- <section class="collection section-bg2 section-padding30 section-over1 ml-15 mr-15" data-background="../assets/img/gallery/section_bg01.png"> -->
<!--     <div class="container-fluid"></div> -->
<!--     <div class="row justify-content-center"> -->
<!--         <div class="col-xl-7 col-lg-9"> -->
<!--             <div class="single-question text-center"> -->
<!--                 <h2 class="wow fadeInUp" data-wow-duration="2s" data-wow-delay=".1s">collection houses our first-ever</h2> -->
<!--                 <a href="about.html" class="btn class="wow fadeInUp" data-wow-duration="2s" data-wow-delay=".4s">About Us</a> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!-- </div> -->
<!-- </section> -->
<!-- End collection -->
<!--? Popular Locations Start 01-->

<!-- Popular Locations End -->
<!--? Services Area Start -->
<!--? Services Area End -->
</div>
</div>
</div>
<script>
	new Vue({
		el:'.zipmain',
		data:{
			estate_list:[],
			clean_list:[],
			move_list:[],
			inte_list:[],
			product_list:[]
		},
		mounted:function(){
			this.estateListData();
			this.cleanListData();
			this.moveListData();
			this.inteListData();
			this.productListData();
		},
		methods:{
			estateListData:function(){
				 axios.get('../main/content_estate_vue.do').then(response=>{
					 console.log(response.data)
					 this.estate_list=response.data
				 }).catch(error=>{
					 console.log(error.response)
				 })
			},
			cleanListData:function(){
				axios.get('../main/content_clean_vue.do').then(response=>{
					console.log(response.data)
					this.clean_list=response.data
				}).catch(error=>{
					 console.log(error.response)
				 })
			},
			moveListData:function(){
				axios.get('../main/content_move_vue.do').then(response=>{
					console.log(response.data)
					this.move_list=response.data
				}).catch(error=>{
					 console.log(error.response)
				 })
			},
			inteListData:function() {
				axios.get('../main/content_inte_vue.do').then(response=>{
					console.log(response.data)
					this.inte_list = response.data
				}).catch(error=>{
						console.log(error.response)
				})
			},
			productListData:function(){
				axios.get('../main/content_product_vue.do').then(response=>{
					console.log(response.data)
					this.product_list = response.data
				}).catch(error=>{
						console.log(error.response)
				})
			}
		}
	})
</script>
</main>
</body>
</html>