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
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    
</head>
<style>
.row {
 width:1200px;
}
</style>
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
                                <li class="breadcrumb-item"><a href="#">shop</a></li> 
                                <li class="breadcrumb-item"><a href="#">Product Details</a></li> 
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb End-->
        <!--?  Details start -->
        <div class="directory-details pt-padding">
            <div class="container">
                <div class="row">
                <div class="col-lg-3">
                        <div class="map">
                            <img :src="inte_detail.poster" alt="">
                        </div>
                        <div class="form-wrapper">
                            <div class="row1">
                                <div class="col-xl-12">
                                    <div class="small-tittle mb-30" style="margin-top:20px;">
                                        <h1>시공 정보</h1>
                                        <hr>
                                        <h3><img src="../assets/img/inte/gubun.png" style="width:20px;height:20px">&nbsp;<b>구분</b>&nbsp;&nbsp;{{inte_detail.gubun}}</h3>
                                        <h3><img src="../assets/img/inte/gum.png" style="width:20px;height:20px">&nbsp;<b>금액</b>&nbsp;&nbsp;{{inte_detail.price}}</h3>
                                        <h3><img src="../assets/img/inte/jiyoek.png" style="width:20px;height:20px">&nbsp;<b>지역</b>&nbsp;&nbsp;{{inte_detail.jiyoek}}</h3>
                                        <p>
                                        <br>
                                        <a href="#" style="color: black;" v-for="hashtag in hashtags">&#35;{{hashtag}}&nbsp;</a></p>
                                    </div>
                                </div>
                            </div>
                            <form id="contact-form" action="#" method="POST">
                                <div class="row1">
                                  <!-- <div class="col-lg-12">
                                        <div class="form-box user-icon mb-15">
                                            <input type="text" name="name" placeholder="Your name">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-box email-icon mb-15">
                                            <input type="text" name="email" placeholder="Email address">
                                        </div>
                                    </div> -->
                                    <div class="col-lg-12">
                                        <!-- <div class="form-box message-icon mb-15">
                                            <textarea name="message" id="message" placeholder="Comment"></textarea> 
                                        </div> -->
                                        <div class="submit-info">
                                            <button class="submit-btn2" type="submit">이 컨셉으로 신청</button>
                                        </div>
                                    </div>
                                </div>
                            </form> 
                        </div>
                    </div>
                    
                    
                    <div class="col-lg-8">
                       <div>
                        <img :src="inte_detail.poster" alt="" style="width: 770px; height: 430px;">
                       </div>
                        <div class="small-tittle mb-20">
                        <br>
                            <h1><b>{{inte_detail.title}}</b></h1>
                        </div>
                        <div>
                          <span>{{inte_detail.subject}}</span>
                        </div>
                        <div style="height: 20px;"></div>
                        <hr>
                        <h1 class="text-center"><b>시공사례</b></h1>
                        <div style="height: 20px;"></div>
                        <div class="text-center" v-for="poster2 in posters">
                          <img :src="poster2" alt="" style="width: 100%"><br>
                          <div style="text-align:center;margin:0 auto;padding:10px 0 20px 0;"></div>
                        </div> 
                    
                </div>
            </div>
        </div>
        <!--  Details End -->
        <!-- listing-area Area End -->
        <!--? Popular Locations Start 01-->
        <div class="popular-product pt-50">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="single-product mb-50">
                            <div class="location-img">
                                <img src="../assets/img/gallery/popular-imtes1.png" alt="">
                            </div>
                            <div class="location-details">
                                <p><a href="product_details.html">Established fact that by the<br> readable content</a></p>
                                <a href="product_details.html" class="btn">Read More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="single-product mb-50">
                            <div class="location-img">
                                <img src="../assets/img/gallery/popular-imtes2.png" alt="">
                            </div>
                            <div class="location-details">
                                <p><a href="product_details.html">Established fact that by the<br> readable content</a></p>
                                <a href="product_details.html" class="btn">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Popular Locations End -->

        
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
	  el:'.directory-details',
	  data: {
		  no: ${no},
		  inte_detail:{},
		  hashtags:[],
		  posters:[]
	  },
	  mounted:function() {
		  this.send()
	  },
	  methods: {
		  send:function() {
			  axios.get('../inte/inte_detail_vue.do', {
				  params: {
					  no:this.no
				  }
			  }).then(response=>{
				  console.log(response.data)
				  this.inte_detail=response.data
				  if(this.inte_detail.hashtag!=null) {
					  this.hashtags=this.inte_detail.hashtag.split("#").filter(hashtags=> hashtags !=='')
				  }
				  this.hashtags=this.inte_detail.hashtag.split("#")
				  this.posters=this.inte_detail.poster2.split("^")
				  //console.log(this.inte_detail.subject)
			  }).catch(error=>{
				console.log(error.response)  
			  })

			  
		  }
	  }
  })
</script>
</body>
</html>