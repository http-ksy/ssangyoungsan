<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <!-- CSS here -->

    <style type="text/css">

		
		.b-calendar-grid-weekdays{
			width:250px;
			margin-left: 2px; 
		}
	
		.b-calendar-grid-body > .row{
			width:250px;
			margin-left: 2px;
		}
		.row {
			    margin-right: -37px;
	   			margin-left: -1px;
		}
		.pt-50 {
		    margin-left: 150px;
		}
   		 .submit-btn2 {
		    width: 100%;
		    height: 106px;
		 }
    </style>
</head>
<body class="full-wrapper">
    <main class="main">
        <!-- breadcrumb Start-->
        <div class="page-notification">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                                <li class="breadcrumb-item"><a href="../main/main.do">Home</a></li>
                                <li class="breadcrumb-item"><a href="../move/list.do">.zip이사하기</a></li> 
                                <li class="breadcrumb-item">.zip이사하기 상세</li> 
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
                    <div class="col-lg-8">
                        <div class="small-tittle mb-20">
                            <h2>{{move_detail.title}}</h2>
                            <p>{{move_detail.category}}</p>
                        </div>
                        <div class="directory-cap mb-40">
                            <p>가능지역 : <img src="https://png.pngtree.com/png-vector/20191003/ourmid/pngtree-gps-icon-png-image_1787000.jpg"style="width: 25px;height: 25px;">{{move_detail.address}}</p>
                            <p>경력 : {{move_detail.carrer}}</p>
                            <p>직원 수 : {{move_detail.emplo}}명</p>
                            <p>연락 가능 시간대 : {{move_detail.contanttime}}</p>
                        </div>
                        <div class="small-tittle mb-20">
                            <h2>{{move_detail.introduce}}</h2>
                        </div>
                        <div class="gallery-img">
                            <div class="row1" style="white-space: pre-wrap;">
                                {{move_detail.service}}
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="map">
                            <img :src="move_detail.poster">
                        </div>
                        <div class="form-wrapper pt-80">
                            <div class="row1">
                            <div class="" v-if="sessionId!=''">
                                        <c:if test="${jjim_count == 0 }">
                                           <!-- <button class="btn btn-default" type="submit" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:25px; height:25px;" alt=""></button> -->
                                         <a href="../move/jjim_insert.do?mno=${ mno}" class="btn btn-default" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:45px; height:45px;" alt="">{{move_detail.suggest}}</a>
                                         <!-- <a :href="'../inte/like_insert.do?ino='+ino" class="btn btn-default" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:25px; height:25px;" alt=""></a> -->
						                </c:if> 
						                 <c:if test="${jjim_count != 0 }">
                                          <!-- <button class="btn btn-default" type="submit" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:25px; height:25px;" alt=""></button> -->
                                         <a href="../move/jjim_delete.do?mno=${ mno}" class="btn btn-default" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/like1.png" style="width:45px; height:45px;" alt="">{{move_detail.suggest}}</a>
						                </c:if>                  
                                      </div>
                        </div>
                        </div>
                        <template  v-if="sessionId!=''">
										  <div class="row">
										    <h1><label for="datepicker-full-width">예약날짜 선택</label></h1>
										    </div>
										    <br>
										    <b-form-datepicker
										      id="datepicker-full-width"
										      v-model="rday"
										      menu-class="w-110"
										      calendar-width="100%"
										      class="mb-2"
										      :date-disabled-fn="dateDisabled" 
										    ></b-form-datepicker>
										  
										  </div>
										</template>
										<div class="row" style="margin: 15px;"></div>
										<div class="row" v-if="rday!=''">
										    <template><h1>예약시간 선택</h1>
											  <b-row>
											    <b-col md="sm">
											      <b-time v-model="rtime"></b-time>
											    </b-col>
											   
											  </b-row>
											</div>
											</template>
											<div class="row" style="margin: 15px;"></div>
										<div class="select-job-items2" v-if="rday && rtime!=''"><h1>방갯수</h1>
		                                    <select name="select2" v-model="room">
		                                        <option value="">방갯수</option>
		                                        <option v-for="i in roomcount">{{i}}</option>
		                                    </select>
		                                </div>
		                                <div class="row" style="margin: 15px;"></div>
						<div class="row">
							<h1>예약정보</h1>
						</div>
						<div class="row">
						 <b-col>
							<b style="display: block;">날짜 : '{{ rday }}'</b>
							<b style="display: block;">시간 : '{{ rtime }}'</b>
							<b style="display: block;">방 갯수 : {{room}}</b>		     
						</b-col>
						</div>
						<div style="margin: 15px;"></div>
						<div v-if="rday && rtime && room!=''">
							<button class="btn" @click="reserveOk">예약하기</button>
						</div>
                    </div>
                </div>
            </div>
        </div>
        
						
        </div>
        <!--  Details End -->
        <!-- listing-area Area End -->
        <!--? Popular Locations Start 01-->
        <div class="popular-product pt-50 row1">
            <div class="row">
               <div class="small-tittle mb-30 row1">
                   <h1 style="display: inline;">후기</h1>&nbsp;
                    &nbsp;<span style="font-size:20pt;">{{move_detail.score}}점</span>
                   <div class="rating mb-10">
                       <i class="fas fa-star" v-for="index in Math.round(move_detail.score)" :key="index" style="color: yellow;font-size: xxx-large"></i>
                   </div> 
               </div>
            </div>
             <div style="height: 20px"></div>
							     <table class="table">
							      <tr>
							       <td>
							        <table class="table" v-for="rvo in reply_list">
							          <tr>
							           <td class="text-left">
							            ★{{rvo.name}}&nbsp;({{rvo.dbday}})
							           </td>
							           <td class="text-right">
							             <span v-if="sessionId==rvo.id">
							             <button class="btn btn-xs btn-primary ups" :id="'up'+rvo.no" @click="replyUpdateForm(rvo.no)">수정</button>
							             <button class="btn btn-xs btn-danger"@click="replyDelete(rvo.no)">삭제</button>
							             </span>
							           </td>
							          </tr>
							          <tr>
							            <td colspan="2"><pre style="white-space: pre-wrap; background-color: white; border: none;">{{rvo.msg}}</pre></td>
							          </tr>
							          <tr :id="'u'+rvo.no" class="updates" style="display: none;">
							          <td colspan="2" class="row1">
							          	<div class="form-box message-icon">
                                            <textarea rows="5" cols="103" :id="'msg'+rvo.no" placeholder="Comment">{{rvo.msg}}</textarea>
                                        </div>
                                        <div class="submit-info">
                                            <button class="submit-btn2" style="width: 785px; height: 70px;" type="submit" @click="replyUpdate(rvo.no)">후기 수정</button>
                                        </div>
							            <!-- <textarea rows="4" cols="60" id="msg" style="float: left;">{{rvo.msg}}</textarea> -->
							            <!-- <button style="float: left; background-color: blue; color: white; width: 100px; height: 87px;" @click="replyUpdate(rvo.no)">수정하기</button> -->
							          </td>
							         </tr>
							        </table>
							       </td>
							      </tr>
							     </table>
							     <div class="row" v-if="sessionId!=''">
							     <div class="col-lg-12">
                                        <div class="form-box user-icon  mb-15">
                                            작성자 : <input type="text" :placeholder="name" readonly>
                                        </div>
                                    </div>
                                        <div class="form-box message-icon">
                                            <textarea rows="5" cols="103" ref="msg" v-model="msg" placeholder="후기를 작성해 주세요!"></textarea>
                                        </div>
                                        <div class="submit-info">
                                            <button class="submit-btn2" type="submit" @click="replyWrite()">후기 작성</button>
                                        </div>
                                    </div>
                                </div>

        <!-- Popular Locations End -->
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
<script>	
	new Vue({
		el:'.main',
		data:{
			mno:${mno}, // el 표현식
			move_detail:{}, // VO
			poster:[],
			reply_list:[],
            sessionId:'${id}',
            msg:'',
            isShow:false,
            no:0,
            name:'${name}',
            today:'',
    		rday:'',
    		rtime:'',
    		roomcount:10,
    		room:0,
    		reserve_list:[]
		},
		mounted:function(){
			this.today = this.getToday();
			axios.get('../move/detail_vue.do',{
				params:{
					mno:this.mno
				}
			}).then(response=>{
				console.log(response.data)
				this.move_detail=response.data
			})
			this.replyRead();
		},
		methods:{
            replyRead:function (){
                axios.get('../reply/move_reply_read_vue.do',{
                    params: {
                        mno:this.mno
                    }
                }).then(response=>{
                    console.log(response.data)
                    this.reply_list=response.data
                }).catch(error=>{
                    console.log(error.response)
                })
            },
            replyWrite:function (){
                if(this.msg===""){
                    this.$refs.msg.focus()
                    return
                }
                axios.post('../reply/move_reply_insert_vue.do',null,{
                    params:{
                        mno:this.mno,
                        msg:this.msg
                    }
                }).then(response=>{
                    console.log(response.data)
                    this.reply_list=response.data
                    this.msg='';
                }).catch(error=>{
                    console.log(error.response)
                })
            },
            replyDelete:function (no){
                axios.get('../reply/move_reply_delete_vue.do',{
                    params:{
                        no:no,
                        mno:this.mno
                    }
                }).then(response=>{
                    console.log(response.data)
                    this.reply_list=response.data
                }).catch(error=>{
                    console.log(error.response)
                })
            },
            replyUpdateForm:function(no){
    			// Jquery => Vue,React
    			$('.updates').hide()
    			$('.ups').text('수정');
    			if(this.no==0){
    				$('#u'+no).show();
    				$('#up'+no).text('취소')
    				this.no=1;
    			}else{
    				$('#u'+no).hide();
    				$('#up'+no).text('수정')
    				this.no=0;
    			}
    		},
            replyUpdate:function(no){
            	let msg=$('#msg'+no).val();
                axios.post('../reply/move_reply_update_vue.do',null,{
                    params:{
                        no:no,
                        mno:this.mno,
                        msg:msg
                    }
                }).then(response=>{
                    console.log(response.data)
                    this.reply_list=response.data
                    $('#u'+no).hide();
                    $('#up'+no).text('수정')
                }).catch(error=>{
                    console.log(error.response)
                })
            },
            dateDisabled(ymd, date) {
    	          // Disable weekends (Sunday = `0`, Saturday = `6`) and
    	          // disable days that fall on the 13th of the month
    	          // Return `true` if the date should be disabled
    	          // yyyy-mm-dd
    	          return ymd< this.today
    	        },
    	        getToday:function(){
    	            var date = new Date();
    	            var year = date.getFullYear();
    	            var month = ("0" + (1 + date.getMonth())).slice(-2);
    	            var day = ("0" + date.getDate()).slice(-2);

    	            return year + "-" + month + "-" + day;
    	        },
    	        reserveOk(){
    	        	axios.post('../move/reserve_vue.do',null,{
    	        		params:{
    	        			mno:this.mno,
    	        			rday:this.rday,
    	        			rtime:this.rtime,
    	        			room:this.room
    	        		}
    	        	}).then(response=>{
      	        		console.log(response.data)
      	        		this.reserve_list=response.data
      	        		alert('예약성공')
      	        		return location.href="../member/inte_reserve.do";
      	        	})
    	        }
        }
	})
</script>
<!-- Jquery, Popper, Bootstrap -->

</body>
</html>