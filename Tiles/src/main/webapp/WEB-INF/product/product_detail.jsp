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
.container{
	width: 960px;
}
</style>
<style type="text/css">

.frame {
  width: 100%;
  text-align: center;
}
button {
  margin: 8px;
}
.custom-btn {
  width: 150px;
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
        <div class="page-notification page-notification2">
            <div class="container">
                
            </div>
        </div>
        <!--? Blog Area Start-->
            <div class="container vue">
                <div class="row">
<!-- 상품 사진 -->                
                    <div class="col-lg-7 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
                                <div class="blog_item_img">
                                    <img :src="product_detail.poster" style="wdith: 500px;height: 500px" alt="">
                                </div>
                                <div class="blog_details text-right">
                                    <ul class="blog-info-link">
                                        <li><a href="#"><i class="fa fa-user"></i>{{product_detail.score}}</a></li>
                                        <li><a href="#"><i class="fa fa-comments"></i> {{product_detail.review_cnt}} Comments</a></li>
                                    </ul>
                                </div>
                        </div>
                    </div>
<!-- 상품 정보 -->                    
                    <div class="col-lg-5">
                        <div class="blog_right_sidebar">
                            <div>
                              <div>
                                <table class="table">
                                  <tr>
                                    <th width=20%>브랜드</th>
                                    <td width=80%>{{product_detail.brand}}</td>
                                  </tr>
                                  <tr>
                                    <th width=20%>제품명</th>
                                    <td width=80%>{{product_detail.title}}</td>
                                  </tr>
                                  <tr>
                                    <th width=20%>원가</th>
                                    <td width=80%>{{product_detail.original_pri}}</td>
                                  </tr>
                                  <tr>
                                    <th width=20%>할인율</th>
                                    <td width=80%>{{product_detail.sale}}</td>
                                  </tr>
                                  <tr>
                                    <th width=20%>할인가</th>
                                    <td width=80%>{{product_detail.priced_sale}}</td>
                                  </tr>
                                  <tr>
                                    <th width=20%>배송</th>
                                    <td width=80%>{{product_detail.delivery_pri}}</td>
                                  </tr>
                                  <tr>
                                    <th width=20%>수량</th>
                                    <td width=80%>
                                      <select name="account" class="input-sm" id="amount_select">
                                        <c:forEach var="i" begin="1" end="${vo.account }">
									      <option value="${i }">${i }개</option>
									    </c:forEach>
                                      </select>
                                    </td>
                                  </tr>
                                </table>
                                <table>
                                  <tr>
                                   <th>
                                    <button class="custom-btn btn-6"><a href="#">장바구니</a></button>
                                    <button class="custom-btn btn-6"><a href="#">구매하기</a></button>
                                   </th>
                                  </tr>
                                </table>
                            </div>
<!-- 검색바 -->
							<!-- <aside class="single_sidebar_widget search_widget">
                                <form action="#">
                                    <div class="form-group">
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" placeholder='Search Keyword'
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = 'Search Keyword'">
                                            <div class="input-group-append">
                                                <button class="btns" type="button"><i class="ti-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                    type="submit">Search</button>
                                </form>
                            </aside> -->
                            
                        </div>
                    </div>
                    
                </div>
<!-- 상품 상세 사진 -->
            <div class="blog_item_img">
              <img :src="product_detail.detailposters" style="width: 900px" alt="">
            </div>
<!-- 후기 -->
<table class="table">
  <tr>
    <td>
	  <table class="table" v-for="rvo in reply_list">
	    <tr>
		  <td class="text-left">
			{{rvo.id}}&nbsp;|&nbsp;({{rvo.dbday}})
		  </td>
		  <td class="text-right">
			<span >
			  <button class="genric-btn info-border circle arrow">수정</button>
			  <button class="genric-btn info-border circle arrow">삭제</button>
			</span>
		  </td>
		</tr>
		<tr>
		  <td colspan="2"><pre style="white-space: pre-wrap;background-color: white;border: none">{{rvo.msg}}</pre></td>
		</tr>
		<tr>
		  <td>
		    <textarea rows="4" cols="62" ref="msg" v-model="msg" style="float: right"></textarea>
		      <button style="float: right;background-color: gray;color: black;width: 100px;height: 85px" @click="replyWrite()">리뷰쓰기</button>
		    </td>
		  </tr>
	  </table>
  </tr>
</table>
        <!-- Blog Area End -->
      </div>
    </main>
<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>
<script>
  new Vue({
	  el:'.vue',
	  data:{
		  no:${no},
		  product_detail:{},
		  type:${type},
		  reply_list:[],
		  msg:'',
		  prno:0
	  },
	  mounted:function(){
		 /*  console.log('no='+this.no)
		  console.log('type='+this.type) */
		  axios.get('http://localhost/web/product/product_detail_vue.do',{
			  params:{
				  no:this.no,
				  type:this.type
			  }
		  }).then(response=>{
			  console.log(response.data);
			  this.product_detail=response.data;
		  }).catch(error=>{
			  console.log(error.response);
		  })
		  
		  this.replyRead()
	  },
	  methods:{
		  replyRead:function(){
			  axios.get('../product/reply_read_vue.do',{
				  params:{
					  no:this.no
				  }
			  }).then(reponse=>{
				  console.log(response.data)
				  this.reply_list=response.data
			  }).catch(error=>{
				  console.log(error.response)
			  })
		  },
		  replyWrite:function(){
			  if(this.msg==="")
			  {
				  this.$refs.msg.focus()
				  return
			  }
			  axios.post('../product/reply_insert_vue.do',null,{
				  params:{
					  no:this.no,
					  msg:this.msg
				  }
			  }).then(response=>{
				  console.log(response.data)
				  this.reply_list=response.data
				  this.msg='';
			  }).catch(error=>{
				  console.log(error.response)
			  })
		  }
	  }
  })
</script>
</body>
</html>