<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap/dist/css/bootstrap.min.css"/>
	<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
	<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
	<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
	<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
        <a href="../member/zipbuy.do" class="genric-btn success circle btn" >부동산구매현황</a>
        </td>
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
           <a href="../member/zipzim.do" class="genric-btn success circle btn" >부동산 찜목록</a>
        </td>
      </tr> 
      <tr style="height:30px;">
        <td>
           <a href="../member/intezim.do" class="genric-btn success circle btn" >인테리어 찜목록</a>
        </td>
      </tr> 
       <tr style="height:30px;">
        <td>
           <a href="../member/cleanzim.do" class="genric-btn success circle btn" >청소 찜목록</a>
        </td>
      </tr> 
      <tr style="height:30px;">
        <td>
           <a href="../member/movezim.do" class="genric-btn success circle btn" >이사 찜목록</a>
        </td>
      </tr> 
      <tr style="height:30px;">
        <td>
           <input type="button" class="genric-btn success circle btn" value="장바구니">
        </td>
      </tr> 
       <tr style="height:30px;">
        <td>
           <a href="../member/zipbuy.do" class="genric-btn success circle btn" >리뷰쓰기</a>
        </td>
      </tr> 
      <tr style="height:30px;">
        <td>
           <a href="../member/zipqna.do" class="genric-btn success circle btn" >문의하기</a>
        </td>
      </tr> 
        </table>
        <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Ftwitter.com%2FSpongebob_UIB%2Fstatus%2F990890566706544642&psig=AOvVaw1omWyfKchCYw-55p5W7WlE&ust=1692613764838000&source=images&cd=vfe&opi=89978449&ved=0CA4QjRxqFwoTCPD08-SD64ADFQAAAAAdAAAAABAD" fluid thumbnail>
      </div>
    </b-sidebar>
  </div>
</template>
  </div>
     
	 <div class="row">
     <h1 class="text-left"><b>이사찜 목록</b></h1>
     </div>

      <br>
      
      <table class="table">
       <tr>
       
        <th>사진</th>
       
        <th>업체명</th>
        
        <th>구분</th>
       
        <th>지역</th>
        
        <th>찜 취소</th>
       </tr>
       <tr v-for="vo in zimlist">
        <td><img :src="vo.poster" style="width:40px;height:40px;"></td>
        <td><a :href="'../move/detail.do?mno='+vo.mno" type="button" class="genric-btn success circle btn" style="color:black;background-color:white">{{vo.title}}</a></td>
        <td>{{vo.category}}</td>
        <td>{{vo.address}}</td>
        <td>
    <input type="button" class="genric-btn success circle btn" value="취소" style="background-color:red" @click="zimDelete(vo.mno)"> 
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
 <script>
 new Vue({
		el:'.container',
		data:{
			zimlist:[],
			page_list:{},
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0,
			id:'${sessionScope.id}'
			
			
			
			
			
		},
		mounted:function(){
			 this.movezimList()	
		},
		methods:{
			movezimList:function(){
				axios.get('../member/moveZim_list.do',{
					params:{
						id:this.id,
						page:this.curpage
					}
				}).then(response=>{
					console.log(response.data)
					
					this.zimlist=response.data
					
				}).catch(error=>{
					console.log(error.response)
				})
				axios.get('../member/movezim_page.do',{
					params:{
						page:this.curpage,
						id:this.id
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
				  let length= end-start;
				  for(let i=0;i<=length;i++)
				   {
					arr[i]=start
					start++;
				   }
				  return arr;
			  },
			  pageChange:function(page){
				  this.curpage=page
				  this.movezimList();
			  },
			  prev:function(){
				  this.curpage=this.startPage-1;
				  this.movezimList();
			  },
			  next:function(){
				  this.curpage=this.endPage+1;
				  this.movezimList();
			  },
			  zimDelete:function(mno){
		
					axios.get('../member/moveZim_delete.do',{
						params:{
							id:this.id,
							mno:mno
						}
					}).then(response=>{
						console.log(response.data)
						if(response.data=='yes')
						{
							alert('찜이 취소가 되었습니다')
							location.href="../member/movezim.do";
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