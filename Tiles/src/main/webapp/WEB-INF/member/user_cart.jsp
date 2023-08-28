<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/>
	<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
	<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
	<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
	<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
       <tr style="height:30px;">
        <td>
        <a href="../member/zipbuy.do" class="genric-btn success circle btn" >부동산🏦</a>
        </td>
      </tr>  
      <tr style="height:30px;">
        <td>
        <a href="../member/inte_reserve.do" class="genric-btn success circle btn" >예약📝</a>
        </td>
      </tr>  
       <tr style="height:30px;">
        <td>
           <a href="../member/zipzim.do" class="genric-btn success circle btn" >찜💕</a>
        </td>
      </tr> 
      <tr style="height:30px;">
        <td>
           <a href="../member/mypage.do" class="genric-btn success circle btn" >my🤷‍♂️</a>
        </td>
      </tr> 
      <tr style="height:30px;">
        <td>
           <a href="../member/zipqna.do" class="genric-btn success circle btn" >부동산문의🕵️</a>
        </td>
      </tr> 
       <tr style="height:30px;">
        <td>
           <a href="../member/user_cart.do" class="genric-btn success circle btn" >장바구니🛒</a>
        </td>
      </tr> 
      <tr style="height:30px;">
        <td>
       <a href="../member/user_purchase.do" class="genric-btn success circle btn" >구매내역🛍️</a>
        </td>
      </tr> 
        </table>
        
      </div>
    </b-sidebar>
  </div>
</template>
  </div>
  <div class="row">
     <h1 class="text-left"><b>장바구니</b></h1>
     </div>
     <div class="container">
    
  <table class="table">
       <tr>
       
        <th>사진</th>
        <th>물건명</th>
        <th>가격</th>
        
        <th>수량</th>
       
        <th>아이디</th>
        <th>삭제</th>
        
       </tr>
       <tr v-for="vo in cart_list">
        <td><img :src="vo.poster" style="width:40px;height:40px;"></td>
        <td><a :href="'../product/product_detail.do?no='+vo.no+'&type='+vo.type" type="button" class="genric-btn success circle btn" style="color:black;background-color:white">{{vo.title}}</a></td>
        <td>{{vo.total_pri}}원</a></td>
        <td>{{vo.amount}}개</td>
        <td>{{vo.id}}회원님</td>
         <td>
    <input type="button" class="genric-btn success circle btn" value="취소" style="background-color:red" @click="cartDelete(vo.cno)"> 
<!--             <b-button  v-b-modal.modal-lg2 variant="primary" class="genric-btn info-border circle arrow btn" >정지</b-button> -->
<!-- 			<b-modal  id="modal-lg2" size="lg" title="회원 탈퇴"  hide-footer> -->
<!-- 			<div> -->
<!-- 			<input type="password" size=20 > -->
<!-- 			<a href="#" @click="memberDelete()" class="genric-btn info-border circle" >확인</a> -->
<!-- 			</div>  -->
<!-- 			</b-modal> -->
        </td>
       </tr>
      </table>
      <div class="justify-content-center">
      
        <ul class="pagination" style="margin-left:400px;">
         <li v-if="startPage>1"><a href="#" @click="prev()">이전</a></li>
         <li v-for="i in range(startPage,endPage)" :class="i==curpage?'active':''">
         <a href="#" @click="pageChange(i)">{{i}}</a></li>
         <li v-if="endPage<totalpage"><a href="#" @click="next()">다음</li>
        </ul>
     
      </div>
      </div>
 </div>
 <script>
 new Vue({
	 el:'.container',
	 data:{
		 cart_list:[],
		 page_list:{},
		 curpage:1,
		 totalpage:0,
		 startPage:0,
		 endPage:0,
		 id:'${sessionScope.id}'
	 },
	 mounted:function(){
		 this.cart()
	 },
	 methods:{
		 cart:function(){
			 axios.get('../member/user_cart.do',{
				 params:{
					 id:this.id,
					 page:this.curpage
				 }
			 }).then(response=>{
				 console.log(response.data)
				 this.cart_list=response.data
			 }).catch(error=>{
				 console.log(error.response)
			 })
			 axios.get('../member/user_cart_page.do',{
				 params:{
					 id:this.id,
					 page:this.curpage
				 }
			 }).then(response=>{
				 console.log(response.data);
				 this.page_list=response.data
				 this.curpage=this.page_list.curpage
				 this.totalpage=this.page_list.totalpage
				 this.startPage=this.page_list.startPage
				 this.endPage=this.page_list.endPage
			 })
			 
		 },	
		 range:function(start,end){
				let arr=[];
				let length=end-start;
				for(let i=0;i<=length;i++)
				{
					arr[i]=start
					start++;
				}
				return arr;
			},
			pageChange:function(page){
				this.curpage=page
				this.cart();
			},
			prev:function(){
				this.curpage=this.startPage-1;
				this.cart();
			},
			next:function(){
				this.curpage=this.endPage+1;
				this.cart();
			},
		cartDelete:function(cno){

				axios.get('../member/user_cart_delete.do',{
					params:{
						id:this.id,
						cno:cno
					}
				}).then(response=>{
					console.log(response.data)
					if(response.data=='yes')
					{
						alert('장바구니 취소')
						location.href="../member/user_cart.do";
					}
					else
					{
					   alert("찜 취소 불가")	
					}
				})
			}
	 }
	
 })
 </script>
</body>
</html>