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
<!-- 결제 정보 -->        
					   <div class="text-center">
                        <div class="blog_right_sidebar" style="border: 2px solid gray; border-radius: 30px; padding: 35px;width: 800px;margin-bottom: 50px">
                            <div>
                            
                              <div>
                                <h1>구매 완료</h1>
                                <table class="table" v-for="vo in product_buy">
                                  <tr>
                                    <td><img :src="vo.poster" style="width:40px;height:40px;"></td>
                                    <td width=65% calss="text-left"><a :href="'../product/product_detail.do?no='+vo.no+'&type='+vo.type" type="button" style="color:black;background-color:white">[{{vo.brand}}]{{vo.title}}</a></td>
                                    <th width=15%>수량</th>
									<td width=10%>{{vo.amount}}개</td>
                                  </tr>
                                </table>
                                </div>
                                <div>
                                <table class="table">
                                  <tr>
                                    <th width=30%>총결제금액</th>
									<td width=70%>{{final_pri | currency}}원</td><!-- (myCheckTotalPri() + del_pri) -->
                                  </tr>
                                  <tr>
                                    <th width=30%>주문고객</th>
                                    <td width=70%>${sessionScope.name}</td>
                                  </tr>
                                  </div>
                                </table>
                                <table>
                                  <tr class="text-center">
                                   <th>
                                    <button class="custom-btn btn-6"><a href="../member/user_purchase.do" style="color: black">주문내역확인</a></button>
                                   </th>
                                   <th>
                                    <button class="custom-btn btn-6"><a href="../main/main.do" style="color: black">메인화면으로 이동</a></button>
                                   </th>
                                  </tr>
                                </table>
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
  new Vue({
	  el:'.container',
	  data:{
		  product_buy:[],
		  id:'${id}',
		  sessionId:'${id}',
		  select_pri:${select_pri},
		  del_pri:3000,
		  final_pri:0
	  },
	  filters:{
          currency: function(value){
              let final_pri = new Number(value);
              return final_pri.toFixed(0).replace(/(\d)(?=(\d{3})+(?:\.\d+)?$)/g, "$1,")
          }
      }, 
	  mounted:function(){
		  this.final_pri=this.select_pri+this.del_pri;
		  axios.get('../product/buy_info_vue.do',{
			  params:{
				  id:this.id
			  }
		  }).then(response=>{
			  console.log(response.data)
			  this.product_buy=response.data
		  }).catch(error=>{
			  console.log(error.response)
		  })
	  },
	  method:{
	  }
  })
</script>
</body>
</html>