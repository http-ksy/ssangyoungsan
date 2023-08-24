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
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	<script type="text/javascript">
		let i=0
        $(function(){
            $('#reservebtn').click(function(){
                let cno=$(this).attr("data-no");
                $('#r_cno').val(cno);
                if(i===0){
                    $('#reserve_window').show();
                    $('.rrr').text('캔슬')
                    i=1;
                    $.ajax({
                        type:'post',
                        url:'diary.do',
                        data:{"cno":cno},
                        success:function(result)
                        {
                            $('#reserve_day').html(result);
                        }
                    })
                }
                else
                {
                    $('#reserve_window').hide();
                    $('.rrr').text('예약하기')
                    i=0;
                }
            })
        })
	</script>
    <!-- CSS here -->
    <style type="text/css">
	.blur {-webkit-filter: blur(20px);filter: blur(20px);}

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
                                <li class="breadcrumb-item"><a href="../clean/list.do">.zip청소하기</a></li> 
                                <li class="breadcrumb-item">.zip청소하기 상세</li> 
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- breadcrumb End-->
        <!--?  Details start -->
        <div class="container-fluid blur">
        	<img :src="clean_detail.poster" style="width: 100%" height="200px;">
        </div>
        <div class="directory-details pt-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="large-tittle mb-20">
                            <h1>{{clean_detail.title}}</h1>
                            <h2>{{clean_detail.category}}</h2>
                        </div>
                        <div class="directory-cap mb-40">
                            <p>가능지역 : <img src="https://png.pngtree.com/png-vector/20191003/ourmid/pngtree-gps-icon-png-image_1787000.jpg"style="width: 25px;height: 25px;">{{clean_detail.address}}</p>
                            <p>경력 : {{clean_detail.carrer}}</p>
                            <p>직원 수 : {{clean_detail.emplo}}명</p>
                            <p>연락 가능 시간대 : {{clean_detail.contanttime}}</p>
                        </div>
                        <div class="small-tittle mb-20">
                            <h2>{{clean_detail.introduce}}</h2>
                        </div>
                        <div class="gallery-img">
                            <div class="row1" style="white-space: pre-wrap;">
                                {{clean_detail.service}}
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="map">
                            <img :src="clean_detail.poster" alt="">
                        </div>
                        <div class="form-wrapper pt-80">
                            <div class="row1">
                                <div class="" v-if="sessionId!=''">
                                        <c:if test="${jjim_count == 0 }">
                                           <!-- <button class="btn btn-default" type="submit" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:25px; height:25px;" alt=""></button> -->
                                         <a href="../clean/jjim_insert.do?cno=${ cno}" class="btn btn-default" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:45px; height:45px;" alt=""></a>
                                         <!-- <a :href="'../inte/like_insert.do?ino='+ino" class="btn btn-default" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:25px; height:25px;" alt=""></a> -->
						                </c:if> 
						                 <c:if test="${jjim_count != 0 }">
                                          <!-- <button class="btn btn-default" type="submit" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/nlike.png" style="width:25px; height:25px;" alt=""></button> -->
                                         <a href="../clean/jjim_delete.do?cno=${ cno}" class="btn btn-default" style="width:85px;height: 61px;border-radius: 10px;"><img src="../assets/img/inte/like1.png" style="width:45px; height:45px;" alt=""></a>
						                </c:if>                  
                                      </div>
                               
							    <!--  <table class="table" v-if="sessionId!=''">
							         <tr>
							          <td>
							            <textarea rows="4" cols="60" ref="msg" v-model="msg" style="float: left;"></textarea>
							            <button style="float: left; background-color: blue; color: white; width: 100px; height: 87px;" @click="replyWrite()">댓글쓰기</button>
							          </td>
							         </tr>
							        </table> -->
                                
                                 <!-- <div class="row1" v-for="rvo in reply_list">
                                    <div class="col-lg-12">
                                        <div class="form-box user-icon mb-15">
                                            <input type="text" :placeholder="sessionId" readonly>
                                        </div>
                                    </div>
                                    <div class="form-box message-icon mb-15 updates" :id="'u'+rvo.no" style="display: none;">
                                            <textarea ref="msg" placeholder="Comment">{{rvo.msg}}</textarea>
                                            <button style="float: left; class="submit-btn2" type="submit" @click="replyUpdate(rvo.no)">후기 작성</button>
                                        </div>
                                    
                                </div> -->
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--  Details End -->
        <!-- listing-area Area End -->
        <!--? Popular Locations Start 01-->
        <div class="popular-product pt-50">
            <c:if test="${sessionScope.id == null }">
                <h3 class="text-center">예약을 원하시면 로그인을 해주세요</h3>
            </c:if>
            <div class="container-fluid" v-if="sessionId!=''">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="single-product mb-50">
                            <div class="location-img">
                                <img src="../assets/img/gallery/popular-imtes1.png" alt="">
                            </div>
                            <div class="location-details">
                                <p><a href="../product_details.html">Established fact that by the<br> readable content</a></p>
                                <a class="btn rrr" id="reservebtn" data-no="${vo.cno}">청소 예약하기</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="single-product mb-50">
                            <div class="location-img">
                                <img src="../assets/img/gallery/popular-imtes2.png" alt="">
                            </div>
                            <div class="location-details">
                                <p><a href="../product_details.html">Established fact that by the<br> readable content</a></p>
                                <a href="../product_details.html" class="btn">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
                <c:if test="${sessionScope.id != null }">
                    <div class="container" style="display:none" id="reserve_window">
                        <table class="table" height=700>
                            <tr>
                                <td width="65%" height="600" class="danger">
                                    <table class="table">
                                        <thead><h3>예약일 정보</h3></thead>
                                        <tr>
                                            <td id="reserve_day"></td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="35%" rowspan="1" class="info">
                                    <table class="table">
                                        <thead><h3>예약 정보</h3></thead>
                                        <tr>
                                            <td colspan="2" class="text-center">
                                                <img src="${vo.poster }" style="width: 200px; height: 220px" id="reserve_img">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <h4 id="reserve_name">${vo.title }</h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <span style="color:gray; display: none;" id="cd">예약일 : </span><span id="clean_day"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <span style="color:gray; display: none;" id="ct">예약시간 : </span><span id="clean_t"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <span style="color:gray; display: none;" id="ci">예약인원 : </span><span id="clean_i"></span>
                                            </td>
                                        </tr>
                                        <tr id="ok" style="display: none;">
                                            <td colspan="2" class="text-center">
                                                <form method="post" action="../clean/reserve_ok.do">
                                                    <input type="hidden" name="cno" id="r_cno">
                                                    <input type="hidden" name="rday" id="r_day">
                                                    <input type="hidden" name="rtime" id="r_time">
                                                    <input type="hidden" name="inwon" id="r_inwon">
                                                    <input type="submit" value="예약" class="btn">
                                                </form>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td width="25%" height="120" class="warning">
                                    <table class="table">
                                        <thead><h3>예약 시간정보</h3></thead>
                                        <tr>
                                            <td id="clean_time"></td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="25%" height="120" class="default">
                                    <table class="table">
                                        <thead><h3>인원 정보</h3></thead>
                                        <tr>
                                            <td id="clean_inwon"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    </div>
                </c:if>
            <div class="col-xl-12">
               <div class="small-tittle mb-30">
                   <h2>후기</h2>
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
							          <td colspan="2">
							          	<div class="form-box message-icon">
                                            <textarea rows="5" cols="200" :id="'msg'+rvo.no" placeholder="Comment">{{rvo.msg}}</textarea>
                                        </div>
                                        <div class="submit-info" style="width: 1720px;">
                                            <button class="submit-btn2" type="submit" @click="replyUpdate(rvo.no)">후기 수정</button>
                                        </div>
							            <!-- <textarea rows="4" cols="60" id="msg" style="float: left;">{{rvo.msg}}</textarea> -->
							            <!-- <button style="float: left; background-color: blue; color: white; width: 100px; height: 87px;" @click="replyUpdate(rvo.no)">수정하기</button> -->
							          </td>
							         </tr>
							        </table>
							       </td>
							      </tr>
							     </table>
							     <div class="col-lg-12" v-if="sessionId!=''">
							     <div class="col-lg-12">
                                        <div class="form-box user-icon mb-15">
                                            작성자 : <input type="text" :placeholder="name" readonly>
                                        </div>
                                    </div>
                                        <div class="form-box message-icon"> 
                                            <textarea rows="5" cols="200" ref="msg" v-model="msg" placeholder="작성할 후기를 적어주세요!"></textarea>
                                        </div>
                                        <div class="submit-info" style="width: 1720px;">
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
			cno:${cno}, // el 표현식
			clean_detail:{}, // VO
			poster:[],
            reply_list:[],
            sessionId:'${id}',
            msg:'',
            isShow:false,
            no:0,
            name:'${name}'
		},
		mounted:function(){
			axios.get('http://localhost/web/clean/detail_vue.do',{
				params:{
					cno:this.cno
				}
			}).then(response=>{
				console.log(response.data)
				this.clean_detail=response.data
			})
			this.replyRead();
		},
        methods:{
            replyRead:function (){
                axios.get('../reply/clean_reply_read_vue.do',{
                    params: {
                        cno:this.cno
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
                axios.post('../reply/clean_reply_insert_vue.do',null,{
                    params:{
                        cno:this.cno,
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
                axios.get('../reply/clean_reply_delete_vue.do',{
                    params:{
                        no:no,
                        cno:this.cno
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
            	 let msg=$('#msg'+no).val()
                axios.post('../reply/clean_reply_update_vue.do',null,{
                    params:{
                        no:no,
                        cno:this.cno,
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
            }
        }
	})
</script>
<%--    <script>
        new Vue({
            el: '#app',
            data: {
                isReserveWindowVisible: false,
                reserveButtonText: '예약하기',
                cno: '',
                reserveDay: ''
            },
            methods: {
                onReserveButtonClick() {
                    this.cno = this.$refs.reservebtn.dataset.no;
                    this.$refs.r_cno.value = this.cno;

                    if (!this.isReserveWindowVisible) {
                        this.isReserveWindowVisible = true;
                        this.reserveButtonText = '캔슬';

                        // Ajax 요청
                        axios.post('diary.do', { cno: this.cno })
                            .then((response) => {
                                // 성공적으로 데이터를 받으면 reserveDay 업데이트
                                this.reserveDay = response.data;
                            })
                            .catch((error) => {
                                console.error('Error:', error);
                            });

                    } else {
                        // Reserve Window 숨기기
                        this.isReserveWindowVisible = false;
                        // 버튼 텍스트 변경
                        this.reserveButtonText = '예약하기';
                    }
                }
            },
        });

    </script>--%>
<!-- Jquery, Popper, Bootstrap -->

</body>
</html>