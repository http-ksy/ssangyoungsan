<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script> -->
<!-- <script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script> -->
<!-- <script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script> -->
<!-- <script src="https://unpkg.com/axios/dist/axios.min.js"></script> -->
<script type="text/javascript">
// $(function(){
// 	$('#postBtn').click(function(){
// 		new daum.Postcode({
// 			oncomplete:function(data) {
// 				$('#post').val(data.zonecode)
// 				$('#addr1').val(data.address)
// 			}
// 		}).open()
// 	})
// })
</script>

</head>
<body >
 
   <div class="container">
  <div class="row">
  <template>
  <div>
    <b-button v-b-toggle.sidebar-border1 class="genric-btn primary-border small">관리자페이지</b-button>
    <b-sidebar id="sidebar-border1" title="ADMIN!" sidebar-class="border-right border-danger" width="250px">
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
        <input type="button" class="genric-btn success circle btn" value="예약현황">
        </td>
      </tr>  
       <tr style="height:30px;">
        <td>
           <input type="button" class="genric-btn success circle btn" value="구매현황">
        </td>
      </tr>  
       <tr style="height:30px;">
        <td>
           <input type="button" class="genric-btn success circle btn" value="찜 목록">
        </td>
      </tr> 
      <tr style="height:30px;">
        <td>
           <input type="button" class="genric-btn success circle btn" value="장바구니">
        </td>
      </tr> 
       <tr style="height:30px;">
        <td>
           <input type="button" class="genric-btn success circle btn" value="문의하기">
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
     <div class="row">

     <h1 class="text-center"><b>회원정보</b></h1>
     <div class="row">
      <table class="table">
       <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>닉네임</th>
        <th>생년월일</th>
        <th>이메일</th>
        <th>우편번호</th>
        <th>영구 정지</th>
       </tr>
       <tr v-for="vo in member_list">
        <td>{{vo.id}}</td>
        <td>{{vo.name}}</td>
        <td>{{vo.nickname}}</td>
        <td>{{vo.birthday}}</td>
        <td>{{vo.email}}</td>
        <td>{{vo.post}}</td>
        <td>
        <input type="button" class="genric-btn success circle btn" value="정지">
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
   </div>
<script type="text/javascript">
new Vue({
	el:'.container',
	data:{
	 col:'all',
	 member_list:[],
	 mpage_list:{},
	 curpage:1,
	 totalpage:0,
	 startPage:0,
	 endPage:0
	 
	},
	mounted:function(){
		this.memData();
	},
	methods:{
		memData:function(){
		   axios.get('../member/member_find.do',{
			   params:{
				   col:this.col,
				   fd:this.fd,
				   page:this.curpage
			   }
		   }).then(response=>{
			   console.log(response.data)
			   this.member_list=response.data
		   })
		   axios.get('../member/member_page.do',{
			   params:{
				   col:this.col,
				   fd:this.fd,
				   page:this.curpage
			   }
		   }).then(response=>{
			   console.log(response.data);
			   this.mpage_list=response.data
			   this.curpage=this.mpage_list.curpage
			   this.totalpage=this.mpage_list.totalpage
			   this.startPage=this.mpage_list.startPage
			   this.endPage=this.mpage_list.endPage
		   })
		},search:function(){
			this.curpage=1;
			this.memData();
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
			this.memData();
		},
		prev:function(){
			this.curpage=this.startPage-1;
			this.memData();
		},
		next:function(){
			this.curpage=this.endPage+1;
			this.memData();
		}
	}
})
</script>   
</body>
</html>