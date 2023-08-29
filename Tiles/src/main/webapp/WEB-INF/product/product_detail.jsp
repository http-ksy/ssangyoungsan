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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<style type="text/css">
.container{
	width: 960px;
}
.row{
	width: 100%;
}
.aa{
	width: 100%;
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
        
            <div class="container vue">
                <div class="row">
<!-- 상품 사진 -->              
                    <div class="col-lg-7 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
                                <div class="blog_item_img">
                                    <img :src="product_detail.poster" style="width: 500px;height: 500px" alt="">
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
                        <div class="aa">
                            <div>
                              <div>
                                <table class="table">
                                  <tr>
                                    <th width=40%>브랜드</th>
                                    <td width=60%>{{product_detail.brand}}</td>
                                  </tr>
                                  <tr>
                                    <th width=40%>제품명</th>
                                    <td width=60%>{{product_detail.title}}</td>
                                  </tr>
                                  <tr>
                                    <th width=40%>원가</th>
                                    <td width=60%>{{product_detail.original_pri|currency}}원</td>
                                  </tr>
                                  <tr v-if="product_detail.sale!==null">
                                    <th width=40%>할인율</th>
                                    <td width=60%>{{product_detail.sale}}</td>
                                  </tr>
                                  <tr v-if="product_detail.priced_sale!==''">
                                    <th width=40%>할인가</th>
                                    <td width=60%>{{product_detail.priced_sale|currency}}원</td>
                                    
                                  </tr>
                                  <tr>
                                    <th width=40%>배송</th>
                                    <td width=60%>{{product_detail.delivery_pri}}</td>
                                  </tr>
                                  <tr>
                                    <th width=40%><label for="sb-inline">수량</label></th>
                                    <td width=60% class="text-right">
                                      <!-- <select ref="amount" @change="update_pri()">
                                        <option v-for="i in maxAmount" :value="i">{{i}}개<*/option>
                                      </select> -->
									    <b-form-spinbutton style="height: 4rem;font-size: 13px" v-model="amount" inline max="10" @change="ups()"></b-form-spinbutton>
                                    </td>
                                  </tr>
                                  <tr>
                                    <th width=width=40%>결제금액</th>
                                    <td class="text-right" width=60%>
                                      {{ total_price|currency }}원
                                    </td>
                                  </tr>
                                </table>
                                <table>
                                  <tr>
                                   <th>
                                    <a :href="'../product/product_cart.do?id='+id" style="color: black"><button class="custom-btn btn-6" @click="plusCart()">장바구니</button></a>
                                    <a :href="'../product/product_order.do?id='+id" style="color: black"><button class="custom-btn btn-6">구매하기</button></a>
                                   </th>
                                  </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
<!-- 상품 상세 사진 -->
            <div class="blog_item_img">
              <img :src="product_detail.detailposters" style="width: 900px" alt="">
            </div>
<!-- 후기 -->

<table class="table" v-for="rvo in reply_list">
  <tr>
    <td>
	  <table class="table">
	    <tr>
		  <td class="text-left" width=" 50%">
			{{rvo.name}}&nbsp;|&nbsp;({{rvo.dbday}})
		  </td>
		  <td class="text-right" width=" 50%">
			<span v-if="sessionId==rvo.id">
			  <button class="genric-btn info-border circle arrow ups" :id="'up'+rvo.pno" @click="replyUpdateForm(rvo.pno)">수정</button>
			  <button class="genric-btn info-border circle arrow" @click="replyDelete(rvo.pno)">삭제</button>
			</span>
		  </td>
		</tr>
	  </table>
	  <table class="table">
		<tr>
		  <td><pre style="white-space: pre-wrap;background-color: white;border: none">{{rvo.msg}}</pre></td>
		</tr>
		<tr :id="'u'+rvo.pno" class="updates" style="display:none">
	      <td colspan="2">
	        <textarea rows="4" cols="62"  :id="'msg'+rvo.pno" style="float: left">{{rvo.msg}}</textarea>
	        <button class="custom-btn btn-6" style="float: left;width: 100px;height: 85px" @click="replyUpdate(rvo.pno)">댓글수정</button>
	      </td>
	    </tr>
	  </table>
	</td>
  </tr>
</table>
	  <!-- <table class="table" v-for="rvo in reply_list">
		<tr :id="'u'+rvo.pno" class="updates" style="display:none">
	      <td colspan="2">
	        <textarea rows="4" cols="62"  :id="'msg'+rvo.pno" style="float: left">{{rvo.msg}}</textarea>
	        <button class="custom-btn btn-6" style="float: left;width: 100px;height: 85px" @click="replyUpdate(rvo.pno)">댓글수정</button>
	      </td>
	    </tr>
	  </table> -->
	  <table class="table" v-if="sessionId!=''">
		<tr>
		  <td>
		    <textarea rows="4" cols="62" ref="msg" v-model="msg" style="float: left;"></textarea>
		    <button class="custom-btn btn-6" style="color: black;width: 100px;height: 85px" @click="replyWrite()">리뷰쓰기</button>
		  </td>
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
		  sessionId:'${id}',
		  id:'${id}',
		  msg:'',
		  isShow:false,
		  pno:0,
		  amount:1,
		  total_price:0
	  },
	  filters:{
          currency: function(value){
              let total_price = new Number(value);
              return total_price.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
              let original_pri = new Number(value);
              return original_pri.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
              let priced_sale = new Number(value);
              return priced_sale.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
          }
      },
	  mounted:function(){
		 /*  console.log('no='+this.no)
		  console.log('type='+this.type) */
		  axios.get('../product/product_detail_vue.do',{
			  params:{
				  no:this.no,
				  type:this.type
			  }
		  }).then(response=>{
			  console.log(response.data);
			  this.product_detail=response.data;
			  this.total_price=response.data.original_pri;
			  this.total_price=response.data.priced_sale
		  }).catch(error=>{
			  console.log(error.response);
		  })
		  
		  this.replyRead()
	  },
	  methods:{
		  replyRead:function(){
			  axios.get('../product/reply_read_vue.do',{
				  params:{
					  no:this.no,
					  type:this.type
				  }
			  }).then(response=>{
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
					  msg:this.msg,
					  type:this.type
				  }
			  }).then(response=>{
				  console.log(response.data) // 자바 컨트롤러 리턴값 yes/no
				  /* this.reply_list=response.data
				  this.msg='';
				  this.type=''; */
				  if(response.data==='yes')
				  {
				  	this.msg='';  
				  	this.replyRead(); 
				  }
				  else
					 {
					    alert("다시");
					 }
			  }).catch(error=>{
				  console.log(error.response)
			  })
		  },
		  replyDelete:function(pno){
			  axios.get('../product/reply_delete_vue.do',{
				  params:{
					  pno:pno,
					  no:this.no
				  }
			  }).then(response=>{
				  console.log(response.data)
				  this.replyRead();
			  }).catch(error=>{
				  console.log(error.response)
			  })
		  },
		  replyUpdateForm:function(pno){
			  // Jquery => Vue,React
			  $('.updates').hide()
			  $('.ups').text('수정');
			  if(this.pno==0)
			  {
				  $('#u'+pno).show();
				  $('#up'+pno).text('취소')
				  this.pno=1;
			  }
			  else
			  {
				  $('#u'+pno).hide();
				  $('#up'+pno).text('수정')
				  this.pno=0;
			  }
		  },
		  replyUpdate:function(pno){
			  
			  let msg=$('#msg'+pno).val()
			  axios.post('../product/reply_update_vue.do',null,{
				  params:{
					  pno:pno,
					  no:this.no,
					  msg:msg
				  }
			  }).then(response=>{
				  console.log(response.data)
				  this.replyRead(); 
				  $('#u'+pno).hide();
				  $('#up'+pno).text('수정')
			  }).catch(error=>{
				  console.log(error.response)
			  })
		  },
		  ups:function(){
			  
			  console.log('amount : '+this.amount)
	  		  if(this.product_detail.priced_sale==''){
				  this.total_price = Number(this.amount) * Number(this.product_detail.original_pri);
			  } 
	 		  else{
				  this.total_price = Number(this.amount) * Number(this.product_detail.priced_sale);
			  }  
			  console.log('totalprice:'+this.total_price)
			  console.log('oriprice:'+this.product_detail.original_pri)
			  console.log('saleprice:'+this.product_detail.priced_sale)
		  },
		  plusCart:function(pno){
				  if(this.product_detail.priced_sale=="")
					  {
					  this.product_detail.priced_sale=0
					  }
				  axios.post('../product/cart_insert_vue.do',null,{
					  params:{
						  id:this.id,
						  no:this.no,
						  type:this.type,
						  amount:this.amount,
						  total_pri:this.total_price,
						  poster:this.product_detail.poster,
						  title:this.product_detail.title,
						  brand:this.product_detail.brand,
						  delivery_pri:this.product_detail.delivery_pri,
						  original_pri:this.product_detail.original_pri,
						  priced_sale:this.product_detail.priced_sale
					  }
				  }).then(response=>{
					  console.log(response.data)
				  }).catch(error=>{
					  console.log(error.response)
				  })
		  }
		  
	  }
  })
</script>
</body>
</html>