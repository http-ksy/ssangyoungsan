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
<!-- 상품 정보 -->                    
                    <div class="col-lg-8">
                      <div class="blog_right_sidebar">
                        <div class="text-right">
                          <button class="genric-btn info-border circle arrow" @click="cartAllDelete(id)">모두삭제</button>
                        </div>
                        <div v-for="vo in product_cart">
                          <table class="table">
                            <tr>
                              <td>
                                <div v-for="(option, index) in options" :key="index">
							      <label>
							        <input type="checkbox" :value="option.value" v-model="selected"> {{ option.text }}
							      </label>
							    </div>
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
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar" style="border: 2px solid gray; border-radius: 30px; padding: 35px;">
                            <div>
                              <div>
                                <table class="table">
                                  <tr>
                                    <th width=30%>상품금액</th>
                                    <td width=70%>{{select_pri|currency}}원</td>
                                  </tr>
                                  <tr>
                                    <th width=30%>배송비</th>
                                    <td width=70%>{{del_pri|currency}}원</td>
                                  </tr>
                                  <tr>
                                    <th width=30%>결제금액</th>
                                    <td width=70%>{{final_pri|currency}}원</td>
                                  </tr>
                                </table>
                                <table v-if="sessionId!=''">
                                
                                  <tr class="text-center">
                                   <th>
                                    <button class="custom-btn btn-6" @click="porder()"><a :href="'../product/product_order.do?id='+id" style="color: black">구매하기</a></button>
                                   </th>
                                  </tr>
                                </table>
                            </div>
                        </div>
                    </div>                    
                </div>
        <!-- Blog Area End -->
      </div>
     
    </main>
<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>
<script>
  export default {
    data() {
      return {
        selected: [], // Must be an array reference!
        options: [
          { text: 'Orange', value: 'orange' }
        ]
      }
    }
  }
</script>
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
		  cno:'${cno}'
	  },
 	  filters:{
          currency: function(value){
              let total_pri = new Number(value);
              return total_pri.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
              let select_pri = new Number(value);
              return select_pri.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
              let final_pri = new Number(value);
              return final_pri.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
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
		  porder:function(){
			  for(let i=0 ; i < this.product.length;i++){
				  /* 데이터 베이스 insert */
				  axios.post('../product/order_insert_vue.do',null,{
					  params:{	
						  id:this.id,
						//  no:this.no,
						 // type:this.type,
						  poster:this.product_cart[0].poster,
						  no:this.product_cart[i].no,
						  type:this.product_cart[i].type,
						  title:this.product_cart[i].title,
						  brand:this.product_cart[i].brand
					  }
				  }).then(response=>{
					  console.log(response.data)
				  }).catch(error=>{
					  console.log(error.response)
				  })
			  }
		  }
		/* ups:function(){
			  console.log('amount : '+this.amount)
	  		  if(this.product_cart.priced_sale==''){
				  this.total_price = Number(this.amount) * Number(this.product_cart.original_pri);
			  } 
	 		  else{
				  this.total_price = Number(this.amount) * Number(this.product_cart.priced_sale);
			  }  
			  console.log('totalprice:'+this.total_price)
			  console.log('oriprice:'+this.product_cart.original_pri)
			  console.log('saleprice:'+this.product_cart.priced_sale)
		  }*/
	  } 
  })
</script>
</body>
</html>