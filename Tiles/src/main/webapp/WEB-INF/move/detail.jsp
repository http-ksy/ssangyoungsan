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

    <!-- CSS here -->

    <style type="text/css">
		.blur {-webkit-filter: blur(4px);filter: blur(4px);}
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
                                <li class="breadcrumb-item">.zip이사하기</li> 
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid blur">
        	<img :src="move_detail.poster" style="width: 100%" height="200px;">
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
                                <!-- <div class="col-xl-12">
                                    <div class="small-tittle mb-30">
                                        <h2>댓글</h2>
                                    </div>
                                </div> -->
                            
                            <!-- <form id="contact-form" action="#" method="POST">
                                <div class="row1">
                                    <div class="col-lg-12">
                                        <div class="form-box user-icon mb-15">
                                            <input type="text" name="name" placeholder="Your name">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-box email-icon mb-15">
                                            <input type="text" name="email" placeholder="Email address">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-box message-icon mb-15">
                                            <textarea name="message" id="message" placeholder="Comment"></textarea>
                                        </div>
                                        <div class="submit-info">
                                            <button class="submit-btn2" type="submit">Send Message</button>
                                        </div>
                                    </div>
                                </div>
                            </form> -->
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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="single-product mb-50">
                            <div class="location-img">
                                <img src="../assets/img/gallery/popular-imtes1.png" alt="">
                            </div>
                            <div class="location-details">
                                <p><a href="../product_details.html">Established fact that by the<br> readable content</a></p>
                                <a href="../product_details.html" class="btn">Read More</a>
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
            </div>
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
                                        <div class="form-box user-icon  mb-15">
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
			mno:${mno}, // el 표현식
			move_detail:{}, // VO
			poster:[],
			reply_list:[],
            sessionId:'${id}',
            msg:'',
            isShow:false,
            no:0,
            name:'${name}'
		},
		mounted:function(){
			axios.get('http://localhost/web/move/detail_vue.do',{
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
            }
        }
	})
</script>
<!-- Jquery, Popper, Bootstrap -->

</body>
</html>