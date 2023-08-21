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
                            <div class="row1">
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
                                <div class="col-xl-12">
                                    <div class="small-tittle mb-30">
                                        <h2>댓글</h2>
                                    </div>
                                </div>
                             <form id="contact-form" action="#" method="POST">
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
                            </form> 
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
            no:0
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
                $('.updates').hide()
                $('ups').text('수정');
                if(this.no==0){
                    $('#u+no').show();
                    $('#up'+no).text('취소')
                    this.no=1;
                }else {
                    $('#u'+no).hide();
                    $('#up'+no).text('수정')
                    this.no=0;
                }
            },
            replyUpdate:function(no){
                let msg=$('#msg').val();
                if(msg.trim()===""){
                    this.$refs.msg.focus()
                    return;
                }
                axios.post('../reply/reply_update_vue.do',null,{
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
<!-- Jquery, Popper, Bootstrap -->

</body>
</html>