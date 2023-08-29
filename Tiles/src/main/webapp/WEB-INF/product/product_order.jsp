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
                    <div class="col-lg-7">
                      <div class="blog_right_sidebar">
                        <div>
                          <table class="table">
                            <tr>
                              <h2>주문|결제</h2>
                            </tr>
                            <tr>
                              <td>
                                <h3>배송지</h3>
                                
                                <p>주소 | </p>
                                <p>{{product_order.addr1}}</p>
                                <p>{{product_order.addr2}}</p>
                                <p>배송 요청사항 | </p>
                                <p>부재시 경비실에 맡겨주세요</p>
                              </td>
                            </tr>
                          </table>
                        </div>
                      </div>
                      <div class="blog_right_sidebar">
                        <div>
                          <table class="table">
                            <tr>
                              <h2>주문고객 정보</h2>
                            </tr>
                            <tr>
                              <td>
                                <p>이름 | </p>
                                <p>{{product_order.name}}</p>
                                <p>이메일 | </p>
                                <p>{{product_order.email}}</p>
                                <p>휴대전화 | </p>
                                <p>{{product_order.phone}}</p>
                              </td>
                            </tr>
                          </table>
                        </div>
                      </div>                                
                    </div>
                    <div class="col-lg-5">
                        <div class="blog_right_sidebar" style="border: 2px solid gray; border-radius: 30px; padding: 35px;">
                            <div>
                              <div>
                                <table class="table">
                                  <tr>
                                    <th width=30%>상품금액</th>
                                    <td width=70%>{{select_pri | currency }}원</td>
                                  </tr>
                                  <tr>
                                    <th width=30%>배송비</th>
                                    <td width=70%>{{del_pri | currency }}원</td>
                                  </tr>
                                  <tr>
                                    <th width=30%>결제금액</th>
                                    <td width=70%>{{final_pri | currency }}원</td>
                                  </tr>
                                </table>
                                <table>
                                  <tr class="text-center">
                                   <th>
                                    <button class="custom-btn btn-6"><a :href="'../product/product_buy.do?select_pri='+select_pri+'&id='+id">구매하기</a></button>
                                   </th>
                                  </tr>
                                </table>
                            </div>
                        </div>
                    </div>                    
                </div>
                <template>myCheck : {{myCheck}}</template>
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
		  product_order:{},
		  id:'${id}',
		  total_pri:0,
		  select_pri:${select_pri},
		  del_pri:3000,
		  final_pri:0,
		  myCheck:[]
	  },
	  filters:{
          currency: function(value){
              let select_pri = new Number(value);
              return select_pri.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
              let del_pri = new Number(value);
              return del_pri.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
              let final_pri = new Number(value);
              return final_pri.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
          }
      }, 
	  mounted:function(){
		  this.final_pri=this.select_pri+this.del_pri;
		  axios.post('../product/user_info_vue.do',null,{
			  params:{
				  id:this.id
			  }
		  }).then(response=>{
			  console.log(response.data)
			  this.product_order=response.data
		  }).catch(error=>{
			  console.log(error.response)
		  })
	  },
	  
	  methods:{
		  
	  } 
  })
</script>
</body>
</html>