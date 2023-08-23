<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">   <!--  -->
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    
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
                                        
                                        <div class="submit-info" style="display: inline-block" > 
                                            <button type="button"  class="submit-btn2" style="border-radius: 10px;" @click="foodDetail(true)">이 컨셉으로 신청</button>
                                        </div>
                                        <div class="" style="display: inline-block" v-if="sessionId!=''">
                                          <c:if test="${like_count == 0 }">
                                            <!-- <button class="btn btn-default" type="submit" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:25px; height:25px;" alt=""></button> -->
                                           <a href="../inte/like_insert.do?ino=${ ino}" class="btn btn-default" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:45px; height:45px;" alt=""></a>
                                           <!-- <a :href="'../inte/like_insert.do?ino='+ino" class="btn btn-default" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:25px; height:25px;" alt=""></a> -->
						                  </c:if> 
						                   <c:if test="${like_count != 0 }">
                                            <!-- <button class="btn btn-default" type="submit" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:25px; height:25px;" alt=""></button> -->
                                           <a href="../inte/like_delete.do?ino=${ ino}" class="btn btn-default" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/like1.png" style="width:45px; height:45px;" alt=""></a>
						                  </c:if>                  
                                        </div>
                                    </div>
                                     <div id="dialog" v-if="isShow">
                                     ddddd
                                     </div>
                                    
                                </div>
                            </form> 
                        </div>
                    </div>
                    
                    
                 <div class="col-lg-8">
                      <ul class="nav nav-tabs">
					    <li class="active"><a data-toggle="tab" href="#home">상세보기</a></li>
					    <li><a data-toggle="tab" href="#review">시공리뷰</a></li>
					    <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
					  </ul>
				   <div class="tab-content">
				    <div id="home" class="tab-pane fade in active">
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
                    <div id="review" class="tab-pane fade">
                      <h6 class="mt-5 mb-3 text-center"><a href="#" class="text-dark">Write Your Comment</a></h6>
                        <hr>  
                        <div v-if="sessionId!=''">             
                         <textarea rows="5" cols="60" ref="msg" v-model="msg" class="form-control" placeholder="댓글을 작성해주세요."></textarea>                                             
                         <button class="submit-btn2" style="border-radius: 10px;" @click="inteReplyWrite()">댓글쓰기</button> 
                        </div> 
                      <h6 class="mt-5 mb-3 text-center"><a href="#" class="text-dark">댓글</a></h6>
                       <div class="media">
                         <table class="table">
                         <tbody>                     
                           <tr>
                            <td>                     
                                <table class="table" v-for="ivo in inteReply_list">
                                 <tr>
                                  <td class="text-left" style="border-top:none;">
                                   ★{{ivo.name}}&nbsp;({{ivo.dbday}})
                                   </td>
                                   <td class="text-right" style="border-top:none;">
               				        <span v-if="sessionId==ivo.id">
               				         <button class="btn btn-sm btn-default ups" :id="'up'+ivo.no" @click="replyUpdateForm(ivo.no)" >수정</button>
			                         <button class="btn btn-sm btn-danger" @click="replyDelete(ivo.no)">삭제</button>
			                        </span>             				        
                                   </td>
                                 </tr>
                                 <tr>
                                  <td style="border-top:none;">
                                   <pre style="white-space:pre-wrap; background-color:white; width:480px;">{{ivo.msg}}</pre>                           
                                  </td>
                                 </tr> 
                                 
                                 <tr :id="'u'+ivo.no" class="updates" style="display:none;">
                                  <td>
                                   <textarea rows="5" cols="60" :id="'msg'+ivo.no" class="form-control">{{ivo.msg}}</textarea>                                             
                                   <button class="submit-btn2" style="border-radius: 10px;" @click="inteReplyUpdate(ivo.no)">수정하기</button>  
                                  </td>
                                 </tr>                                   
                            </table>                                                                                                                                                                                                                                                                                      
                          </tr>
                          </tbody>
                         </table>
                    </div>
                  </div> <!-- tab-content -->
                </div>
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
		  ino:${ino},
		  inte_detail:{},
		  hashtags:[],
		  posters:[],
		  inteReply_list:[],
		  msg:'',
		  sessionId:'${id}',
		  no:0,
		  isShow:false,
		  like_count:0
		  
	  },
	  mounted:function() {
		 
			  axios.get('../inte/inte_detail_vue.do', {
				  params: {
					  ino:this.ino
					  
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
		  /this.replyRead()
	  },
	  methods:{
		   replyRead:function(){
			   axios.get('../inte/reply_read_vue.do',{
				   params:{
					   ino:this.ino
				   }
			   }).then(response=>{
				   console.log(response.data)
				   this.inteReply_list=response.data
			   }).catch(error=>{
				   console.log(error.response)
			   })
			}, 
			inteReplyWrite:function(){
                if(this.msg===""){
                    this.$refs.msg.focus()
                    return
                }
                axios.post('../inte/reply_insert_vue.do',null,{
    				params:{
    					ino:this.ino,
    					msg:this.msg
    				}
    			}).then(response=>{
    				console.log(response.data)
    				this.inteReply_list=response.data
    				this.msg=''; //댓글 insert가 되면 공백으로 처리
    			}).catch(error=>{
    				console.log(error.response)
    			})
            },
            replyDelete:function(no){
            	axios.get('../inte/reply_delete_vue.do',{
            		params:{
            			no:no,
            			ino:this.ino
            		}
            	}).then(response=>{
            		console.log(response.data)
            		this.inteReply_list=response.data
            	}).catch(error=>{
            		console.log(error.response)
            	})
            },
            replyUpdateForm:function(no){
            	$('.updates').hide()
            	$('.ups').text('수정')
            	if(this.no==0) {
            		$('#u'+no).show();
            		$('#up'+no).text('취소')
            		this.no=1
            	} else {
            		$('#u'+no).hide();
            		$('#up'+no).text('수정')
            		this.no=0
            	}
            },
            inteReplyUpdate:function(no){
            	let msg = $('#msg'+no).val()
            	axios.post('../inte/reply_update_vue.do',null,{
            		params:{
            			no:no,
            			ino:this.ino,
            			msg:msg
            		}
            	}).then(response=>{
            		console.log(response.data)
            		this.inteReply_list=response.data
            		$('#u'+no).hide()
            		$('#up'+no).text('수정')
            	}).catch(error=>{
            		console.log(error.response)
            	})
            },
            foodDetail:function(bool) {
            	 this.isShow=bool;
            	 $('#dialog').dialog({
 					autoOpen:false,
 					modal:true,
 					width:700,
 					height:600
 				}).dialog("open");
            	 
            }
	  }
  })
</script>
</body>
</html>