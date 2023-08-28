<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
    
</head>
<style>
.row {
 width:1200px;
}
.b-calendar-grid-weekdays{

		width:405px;
	/* 	margin-left:5px; */
	}

	.b-calendar-grid-body > .row{

		width:405px;
/* margin-left:px; */
	}
.myrow {
	width: 800px;
	height: 400px;
	margin: : 0px auto;
}
#chatArea {
	height: 250px;
	overflow-y:auto;
	border: 1px solid black 
}
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
</style>

<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.3.0/sockjs.min.js"></script>
<script type="text/javascript">
let websocket;
function connection() {	//서버 연결
	websocket=new WebSocket("ws://localhost/web/chat/chat-ws")
	websocket.onopen = onOpen;
	websocket.onclose = onClose;
	websocket.onmessage = onMessage;
}
// on => Callback (자동 호출)
function onOpen(event) {  //연결되었을때 처리
	alert("채팅서버와 연결되었습니다!!")
}
function onClose(event) {  //퇴장시에 처리
	alert("채팅서버와 연결 종료되었습니다!!")
}
function onMessage(event) {   //채팅 메세지 전송시
	// msg:데이터전송 , 구분자 => roomin:
	let data=event.data;
	if(data.substring(0,4)==="msg:") {	//전체적으로 메세지 뿌려줌
		appendMessage(data.substring(4));
	}
}
function disconnection() {    //퇴장시 처리
	websocket.close();
}
function send() {    //서버에 채팅 요청 => 값 전송
	let name=$('#name').val();
	if(name.trim()==="") {
		$('#name').focus();
		return;
	}
	let msg=$('#sendMsg').val();
	if(msg.trim()==="") {
		$('#sendMsg').focus();
		return;
	}
	websocket.send("msg:["+name+"]"+msg);
	$('#sendMsg').val("")
	$('#sendMsg').focus()
}
function appendMessage(msg) {	//div에 문자열 결합
	$('#recvMsg').append(msg+"<br>");
	let ch = $('#chatArea').height();
	let m = $('#recvMsg').height()-ch;
	$('#chatArea').scrollTop(m);	//스크롤 위치 아래로 고정
}

$(function() {
	$('#startBtn').click(function(){
		connection()
	})
	$('#endBtn').click(function() {
		disconnection()
	})
	$('#sendBtn').click(function() {	//전송버튼
		send();
	})
	$('#sendMsg').keydown(function(key) {
		if(key.keyCode==13) {  //엔터쳤을때
			send();
		}
	}) 

})

</script> -->

<body class="full-wrapper">

    
    <main>
        <!-- breadcrumb Start-->
        <div class="page-notification">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                                <li class="breadcrumb-item"><a href="../inte/inte_list.do">목록으로</a></li>
                                <li class="breadcrumb-item"><a href="#">상세보기</a></li> 
                                
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
                                            <!-- <button type="button"  class="submit-btn2" style="border-radius: 10px;" @click="inteChatOpen(true)">이 컨셉으로 신청</button> -->
                                         <a href="../chat/chat.do"><button type="button"  class="submit-btn2" style="border-radius: 10px;">이 컨셉으로 신청</button></a>
                                        </div>
                                        <div class="" style="display: inline-block" v-if="sessionId==''">
                                         <a href="#" class="btn btn-default" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/like1.png" style="width:45px; height:45px;" alt="">{{inte_detail.suggest}}</a>
                                        </div>
                                        <div class="" style="display: inline-block" v-if="sessionId!=''">
                                          <c:if test="${like_count == 0 }">
                                            <!-- <button class="btn btn-default" type="submit" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:25px; height:25px;" alt=""></button> -->
                                           <a href="../inte/like_insert.do?ino=${ ino}" class="btn btn-default" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:45px; height:45px;" alt="">{{inte_detail.suggest}}</a>
                                           <!-- <a :href="'../inte/like_insert.do?ino='+ino" class="btn btn-default" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:25px; height:25px;" alt=""></a> -->
						                  </c:if> 
						                   <c:if test="${like_count != 0 }">
                                            <!-- <button class="btn btn-default" type="submit" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:25px; height:25px;" alt=""></button> -->
                                           <a href="../inte/like_delete.do?ino=${ ino}" class="btn btn-default" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/like1.png" style="width:45px; height:45px;" alt="">{{inte_detail.suggest}}</a>
						                  </c:if> 
                                        </div>
                                    </div>
                                     <div id="dialog" v-if="isShow">
                                        <div class="wrapper row3">
									   
									   
									  </div>
                                     </div>
                                    
                                </div>
                            </form> 
                        </div>
                    </div>
                    
                    
                 <div class="col-lg-8">
                      <ul class="nav nav-tabs">
					    <li class="active"><a data-toggle="tab" href="#home">상세보기</a></li>
					    <li><a data-toggle="tab" href="#review">시공리뷰</a></li>
					    <li><a data-toggle="tab" href="#reserve">예약</a></li>
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
                          <div class="star-rating space-x-4 mx-auto">
							<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
							<label for="5-stars" class="star pr-4">★</label>
							<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
							<label for="4-stars" class="star">★</label>
							<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
							<label for="3-stars" class="star">★</label>
							<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
							<label for="2-stars" class="star">★</label>
							<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
							<label for="1-star" class="star">★</label>
						</div>
                         <textarea rows="5" cols="60" ref="msg" v-model="msg" class="form-control" placeholder="댓글을 작성해주세요."></textarea>                                             
                         <button class="submit-btn2" style="border-radius: 10px;" @click="inteReplyWrite()">댓글쓰기</button> 
                        </div> 
                      <h6 class="mt-5 mb-3 text-center"><a href="#" class="text-dark">💬&nbsp;댓글</a></h6>
                       <div class="media">
                         <table class="table">
                         <tbody>                     
                           <tr>
                            <td>                     
                                <table class="table" v-for="ivo in inteReply_list">
                                 <tr>
                                  <td class="text-left" style="border-top:none;">
                                   😎{{ivo.name}}&nbsp;({{ivo.dbday}})
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
                  </div> <!-- 리뷰 -->
                  
                  <!-- 예약 -->
                  <div id="reserve" class="tab-pane fade">
                   <div v-if="sessionId==''">
                    <h3><b>예약을 원하시면 로그인을 해주세용.</b></h3>
                    <a href="../member/join.do"><button class="submit-btn2">회원가입 하러가기</button></a>
                   </div>
                   
                  <div v-if="sessionId!=''">
    			    <table class="table" height=700>
      				  <tr>
					    <td width="65%" height="600"  style="color:gray;">
						<table class="table">
						 <thead><h2>예약일 정보</h2></thead>
						  <h3>달력을 눌러서 예약일을 선택해주세요.</h3>
						 <div class="col-lg-8">
						  <template>
  <div>
    <label for="datepicker-full-width"></label>
    <b-form-datepicker
      id="datepicker-full-width"
      v-model="reserve_date"
      calendar-width="100%"
      class="mb-10"
      :date-disabled-fn="dateDisabled" 
    ></b-form-datepicker>
   
    <div v-if="reserve_date!=''">
    <hr>
       <thead><h3><b>예약 시간</b></h3></thead>
        <h3>화살표를 눌러서 예약시간을 선택해주세요.</h3>
	   <b-time  v-model="reserve_time" show-seconds locale="en">
	    <div class="d-flex" dir="ltr">
	      <b-button
	        size="sm"
	        variant="outline-danger"
	        v-if="reserve_time"
	        @click="clearTime"
	      >
	        새로고침
	      </b-button>
	      <b-button
	        size="sm"
	        variant="outline-primary"
	        class="ml-auto"
	        @click="setNow"
	      >
	        현재 시간
	      </b-button>
	    </div>
	  </b-time>
	  	
	  <div v-if="reserve_time!=''">
	  <hr>
	  <thead><h3><b>선택하신 정보가 맞습니까?</b></h3></thead>
	  
	   <h3>예약일: {{ reserve_date }}</h3>
	   <h3>시간: {{ reserve_time }}</h3>
	   <b-button @click="reserveOk(true)">예약하기</b-button>
	  </div>
    </div>
  </div>
</template>
						 </div>
						 <div class="col-lg-4" v-show="reShow">
						   <h3><b>{{sessionName}}</b>님</h3>
						   <h3>예약 완료 되었습니다.</h3>
						   <h4><b>예약 번호:</b>&nbsp;{{reserve_list.no}}</h4>
						   <h4><b>예약 날짜:</b>&nbsp;{{reserve_date}}</h4>
						   <h4><b>예약 시간:</b>&nbsp;{{reserve_time}}</h4>
						   <div>
		                     <a href="../member/inte_reserve.do">
		                       <button class="btn"><span>마이페이지 이동</span></button>
		                     </a>
	                       </div>
						 </div>
					    </table>
                        </td>
						
					</tr>
						 
    			    </table> 			 
    			 </div> <!-- 예약 -->
    			 </div>
                </div> <!-- tab-content --> 
            </div>
        </div>
        </div>
        </div>
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
		  sessionName:'${name}',
		  no:0,
		  isShow:false,
		  today:'',
		  reserve_date:'',
		  reserve_time:'',
		  reserve_list:{},
		  reShow:false
	  },
	  mounted:function() {
		    this.today = this.getToday();
			console.log("today :"+this.today)

			
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
		  this.replyRead()
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
            inteChatOpen:function(bool) {
            	 this.isShow=bool;
            	 $('#dialog').dialog({
 					autoOpen:false,
 					modal:true,
 					width:700,
 					height:600
 				}).dialog("open");
            	 
            },
  	        dateDisabled(ymd, date) {
  	          // Disable weekends (Sunday = `0`, Saturday = `6`) and
  	          // disable days that fall on the 13th of the month
  	          // Return `true` if the date should be disabled
  	          // yyyy-mm-dd
  	          return ymd<= this.today
  	        },
	        getToday:function(){
	            var date = new Date();
	            var year = date.getFullYear();
	            var month = ("0" + (1 + date.getMonth())).slice(-2);
	            var day = ("0" + date.getDate()).slice(-2);

	            return year + "-" + month + "-" + day;
	        },
			setNow() {
		        const now = new Date()
		        // Grab the HH:mm:ss part of the time string
		        this.reserve_time = now.toTimeString().slice(0, 8)
		    },
		    clearTime() {
		        this.reserve_time = ''
		    }, 
		    reserveOk(bool) {
		    	
		    	axios.post('../inte/reserve_vue.do',null,{
		    		params:{
		    			ino:this.ino,
		    			reserve_date:this.reserve_date,
		    			reserve_time:this.reserve_time
		    			
		    		}
		    	}).then(response=>{
		    		 console.log(response.data)
		    		 this.reserve_list = response.data
		    		 alert('예약완료')
		    		 this.reShow=bool
		    		 console.log(reserve_list.no)
		    		 
		    	}).catch(error=>{
		    		console.log(error.response)
		    	})
		    } 
	  }
  })
</script>
</body>
</html>