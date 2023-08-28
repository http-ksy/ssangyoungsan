<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>


  <div class="container">
<div class="row">
 <template>
  <div>
    <b-button v-b-toggle.sidebar-border class="genric-btn primary-border small">Mypage</b-button>
    <b-sidebar id="sidebar-border" title="MYPAGE!!" sidebar-class="border-right border-danger" width="250px">
      <div class="px-3 py-2">
      <table>
      <tr style="height:30px;">
      </tr>
      <tr style="height:30px;">
      </tr>
      <tr style="height:30px;">
      </tr>
      <tr style="height:30px;">
      </tr>
<!--       <tr style="height:30px;"> -->
<!--         <td> -->
<!--         <input type="button" class="genric-btn success circle btn" value="예약현황"> -->
<!--         </td> -->
<!--       </tr>   -->
       <tr style="height:30px;">
        <td>
           <a href="../member/customer_buy.do" class="genric-btn success circle btn" >매매현황</a>
        </td>
      </tr>  
<!--        <tr style="height:30px;"> -->
<!--         <td> -->
<!--            <input type="button" class="genric-btn success circle btn" value="찜 목록"> -->
<!--         </td> -->
<!--       </tr>  -->
<!--       <tr style="height:30px;"> -->
<!--         <td> -->
<!--            <input type="button" class="genric-btn success circle btn" value="장바구니"> -->
<!--         </td> -->
<!--       </tr>  -->
		<tr style="height:30px;">
		        <td>
		          <a href="../member/customer.do" class="genric-btn success circle btn" >사장님페이지</a>
		        </td>
		      </tr> 
       <tr style="height:30px;">
        <td>
          <a href="../member/qna.do" class="genric-btn success circle btn" >답변하기</a>
        </td>
      </tr> 
        </table>
        <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Ftwitter.com%2FSpongebob_UIB%2Fstatus%2F990890566706544642&psig=AOvVaw1omWyfKchCYw-55p5W7WlE&ust=1692613764838000&source=images&cd=vfe&opi=89978449&ved=0CA4QjRxqFwoTCPD08-SD64ADFQAAAAAdAAAAABAD" fluid thumbnail>
      </div>
    </b-sidebar>
  </div>
</template>
  </div>
      <br>
      <div class="container">
      <div class="row">
     <h1 class="text-left"><b>성사 매물</b></h1>
     </div>
      <br>
      
      <table class="table">
       <tr>
       
        <th>이름</th>
        <th>분류</th>
        <th>주소</th>
        <th>가격</th>
        <th>진행현황</th>
        <th>매물</th>
       </tr>
       <tr  v-for="vo in ziplist" >
<!--         <td><a :href="'../zip/zip_detail.do?no='+vo.no" type="button" class="genric-btn success circle btn" style="color:black;background-color:white">{{vo.name}}</a></td> -->
         <td><a :href="'../zip/zip_detail.do?no='+vo.no" type="button" class="genric-btn success circle btn" style="color:black;background-color:white">{{vo.name}}</a></td>
        <td>{{vo.type}}</td>
        <td>{{vo.addr}}</td>
        <td>{{vo.dprice}}</td>
        <td>{{vo.state}}</td>
        <td>
     <a :href="'../zip/zip_detail.do?no='+vo.no" type="button" class="genric-btn success circle btn" style="background-color:white" >🤝</a>  
		</td>
<!--             <b-button  v-b-modal.modal-lg2 variant="primary" class="genric-btn info-border circle arrow btn" >정지</b-button> -->
<!-- 			<b-modal  id="modal-lg2" size="lg" title="회원 탈퇴"  hide-footer> -->
<!-- 			<div> -->
<!-- 			<input type="password" size=20 > -->
<!-- 			<a href="#" @click="memberDelete()" class="genric-btn info-border circle" >확인</a> -->
<!-- 			</div>  -->
<!-- 			</b-modal> -->
       </tr>
      </table>
      </div>
  </div>
  </div>
  <script>
  new Vue({
	  el:'.container',
	  data:{
		  ziplist:[],
		  name:'${sessionScope.name}',
		 
		  
	  },mounted:function(){
		this.zipzip()
	  },
	  methods:{
		  zipzip:function(){
			  axios.get('../member/customer_buy.do',{
				  params:{
					  name:this.name,
					  
				  }
			  }).then(response=>{
				  console.log(response.data)
				this.ziplist=response.data
				  
			  }).catch(error=>{
				  console.log(error.response)
			  })
		  }
		
		
	  }
  })
  </script>
</body>
</html>