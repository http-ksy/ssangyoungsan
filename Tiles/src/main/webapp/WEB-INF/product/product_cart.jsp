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
	width: 1200px;
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
        <!--? Blog Area Start-->
            <div class="container">
<!-- 상품 정보 --><div class="col-lg-8" >                   
				<div v-if="product_cart.length===0" class="text-center">
				  <h1>장바구니가 비어있습니다</h1> 
				</div>
				<div v-else>
                    
                      <div class="blog_right_sidebar">
                        <div class="text-right">
                          <button class="genric-btn info-border circle arrow" @click="cartAllDelete(id)">모두삭제</button>
                        </div>
                        <div v-for="vo in product_cart">
                          <table class="table">
                            <tr>
                              <td> 
                                <label>
							      <input type="checkbox" v-model="myCheck" :value="vo.cno">
							    </label>
                              </td>
                              <td width=5%>
                            	<img :src="vo.poster" style="wdith: 100px;height: 100px" alt="">
                              </td>
                              <td class="text-left" width=90%>
                                <h4>[{{vo.brand}}]&nbsp;&nbsp;&nbsp;{{vo.title}}</h4>
                                <p>배송정보 | </p>
                                <p>{{vo.delivery_pri}}</p>
<!--                            <h4 class="text-right">수량&nbsp;&nbsp;<b-form-spinbutton style="height: 4rem;font-size: 13px" v-model="amount" inline max="10" @change="ups()"></b-form-spinbutton>
                                </h4> -->
                                <p class="text-right">수량 | {{vo.amount}}개</p>
                                <h4 class="text-right">{{vo.total_pri|currency}}원</h4>
                              </td>
                              <td width=5%>
                                <img src="../assets/img/product/delete.png" style="width:30px;height:30px" @click="cartDelete(vo.cno)">
							  </td>
                            </tr>
                          </table>
                        </div>
                      </div>                    
                    </div>
                    </div>
                    <div class="col-lg-4" >
                        <div class="blog_right_sidebar" style="border: 2px solid gray; border-radius: 30px; padding: 28px;">
                            <div>
                              <div>
                              <!-- <form method="post" action="../product/product_order.do" @submit="buy()"> -->
                                <table class="table text-right">
                                  <tr>
                                    <th width=30%>상품금액</th>
                                    <td width=70% >{{ myCheckTotalPri() | currency }}원</td>
                                  </tr>
                                  <tr>
                                    <th width=30%>배송비</th>
                                    <td width=70%>{{del_pri|currency}}원</td>
                                  </tr>
                                  <tr>
                                    <th width=30%>결제금액</th>
                                    <td width=70% >{{ (myCheckTotalPri() + del_pri) | currency }}원</td>
                                  </tr>
                                </table>
                                <table style="margin: 0px auto;">
                                  <tr v-if="sessionId!=''">
                                   <th v-if="product_cart.length!==0">
                                    <a :href="'../product/product_order.do?select_pri='+select_pri+'&mycheck='+myCheck"><button class="custom-btn btn-6" >구매하기</button></a>
                                   </th>
                                  </tr>
                                </table>
                            </div>
                        </div>
                    </div>                    
                </div>
                <!-- <template>myCheck : {{myCheck}}</template> -->
        <!-- Blog Area End -->
      </div>
     
    </main>
<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>
<script>
  new Vue({
	  el:'.container',
	  data:{
		  product_cart:[],
		  id:'${id}',
		  total_pri:'',
		  sessionId:'${id}',
		  select_pri:0,
		  del_pri:3000,
		  final_pri:0,
		  cno:'${cno}',
		  myCheck:[],
		  myCheckTotalPri(cno){
			  const selectedProducts = this.product_cart.filter(item => this.myCheck.includes(item.cno));
			  const totalPri = selectedProducts.reduce((sum, item) => sum + item.total_pri, 0);
			  this.select_pri=totalPri;
			  this.final_pri=totalPri+3000;
			  console.log(this.select_pri)
			  console.log(this.final_pri)
			  return totalPri;
		  }
	  },
 	  filters:{
          currency: function(value){
              let total_pri = new Number(value);
              return total_pri.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
              let myCheckTotalPri = new Number(value);
              return myCheckTotalPri.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
              let (myCheckTotalPri() + del_pri) = new Number(value);
              return (myCheckTotalPri() + del_pri).toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
              let del_pri = new Number(value);
              return del_pri.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
          }
      }, 
	  mounted:function(){
		  this.cartRead()
	  },
	  methods:{
		  cartRead:function(){
			  axios.get('../product/cart_read_vue.do',{
				  params:{
					  id:this.id
				  }
			  }).then(response=>{
				  console.log(response.data);
				  this.product_cart=response.data;
				  for(let i=0;i<this.product_cart.length;i++)
				  {
					 this.select_pri+=this.product_cart[i].total_pri;  
				  }
				  this.final_pri=this.select_pri+this.del_pri;
				  
			  }).catch(error=>{
				  console.log(error.response);
			  })
		  },
		  cartDelete:function(cno){
			  axios.get('../product/cart_delete_vue.do',{
				  params:{
					  id:this.id,
					  cno:cno
				  }
			  }).then(response=>{
				  console.log(response.data)
				  alert("삭제완료")
				  this.cartRead(); 
			  }).catch(error=>{
				  console.log(error.response)
			  })
		  },
		  cartAllDelete:function(id){
			  axios.get('../product/cart_alldelete_vue.do',{
				  params:{
					  id:this.id
				  }
			  }).then(response=>{
				  console.log(response.data)
				  alert("삭제완료")
				  this.cartRead();
			  }).catch(error=>{
				  console.log(error.response)
			  })
		  },
		  addToCart(){
			  for (let i = 0; i < this.product_cart.length; i++) {
				    if (this.myCheck.includes(this.product_cart[i].cno)) {
				      this.select_pri += this.product_cart[i].total_pri;
				    }
				  }
		      this.final_pri = this.select_pri + this.del_pri; // 최종 가격을 업데이트합니다.
		  },
		  buy:function(e){
			  console.log("sele :"+this.select_pri)
			  console.log("sele :"+this.final_pri)
			  e.preventDefault()
		  }
	  }
  })
</script>
</body>
</html>