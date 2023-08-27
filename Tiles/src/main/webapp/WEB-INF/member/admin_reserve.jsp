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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
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
       <a href="../member/admin_reserve.do" class="genric-btn success circle btn" >예약현황</a>
        </td>
      </tr>  
<!--        <tr style="height:30px;"> -->
<!--         <td> -->
<!--            <input type="button" class="genric-btn success circle btn" value="구매현황"> -->
<!--         </td> -->
<!--       </tr>   -->
<!--        <tr style="height:30px;"> -->
<!--         <td> -->
<!--            <input type="button" class="genric-btn success circle btn" value="찜 목록"> -->
<!--         </td> -->
<!--       </tr>  -->
      <tr style="height:30px;">
        <td>
           <input type="button" class="genric-btn success circle btn" value="장바구니">
        </td>
      </tr> 
      <tr style="height:30px;">
        <td>
       <a href="../member/admin.do" class="genric-btn success circle btn" >회원정보</a>
        </td>
      </tr>  
<!--        <tr style="height:30px;"> -->
<!--         <td> -->
<!--            <input type="button" class="genric-btn success circle btn" value="문의하기"> -->
<!--         </td> -->
<!--       </tr>  -->
        </table>
     
      </div>
    </b-sidebar>
  </div>
</template>
  </div>
    <div class="row">
     <h1 class="text-left"><b>예약 목록</b></h1>
     </div>
   <div class="container">
      <ul class="nav nav-tabs">
			 <li class="active"><a data-toggle="tab" href="#move">이사</a></li>
			 <li><a data-toggle="tab" href="#clean" >청소</a></li>
	    </ul>
     
      <br>
      <div class="tab-content">
      <div class="tab-pane fade in active" id="move">
      <table class="table">
       <tr>
       
        <th>예약번호</th>
        <th>이사</th>
        <th>아이디</th>
        
        <th>예약일</th>
       
        <th>예약시간</th>
        
        
       </tr>
       <tr v-for="vo in reserve_list">
        <td>{{vo.no}}</td>
        <td><a :href="'../move/detail.do?mno='+vo.mno" type="button" class="genric-btn success circle btn" style="color:black;background-color:white">{{vo.title}}</a></td>
        <td>{{vo.id}}</a></td>
        <td>{{vo.rday}}</td>
        <td>{{vo.rtime}}</td>
        
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
      
      <div class="tab-pane fade" id="clean">
      <table class="table">
       <tr>
       
        <th>예약번호</th>
        <th>이사</th>
        <th>아이디</th>
        
        <th>예약일</th>
       
        <th>예약시간</th>
        
        
       </tr>
       <tr v-for="vo in clean_reserve_list">
        <td>{{vo.no}}</td>
        <td><a :href="'../clean/detail.do?cno='+vo.cno" type="button" class="genric-btn success circle btn" style="color:black;background-color:white">{{vo.title}}</a></td>
        <td>{{vo.id}}</a></td>
        <td>{{vo.rday}}</td>
        <td>{{vo.rtime}}</td>
        
       </tr>
      </table>
      <div class="justify-content-center">
      
        <ul class="pagination" style="margin-left:400px;">
         <li v-if="cstartPage>1"><a href="#" @click="prev2()">이전</a></li>
         <li v-for="i in range2(cstartPage,cendPage)" :class="i==ccurpage?'active':''">
         <a href="#" @click="pageChange2(i)">{{i}}</a></li>
         <li v-if="cendPage<ctotalpage"><a href="#" @click="next2()">다음</li>
        </ul>
     
      </div>
      </div>
    </div>
 </div>
 </div>
 <script>
 new Vue({
	 el:'.container',
	 data:{
		 reserve_list:[],
		 clean_reserve_list:[],
		 page_list:{},
		 curpage:1,
		 totalpage:0,
		 startPage:0,
		 endPage:0,
		 cpage_list:{},
		 ccurpage:1,
		 ctotalpage:0,
		 cstartPage:0,
		 cendPage:0
		 
	 },
	 mounted:function(){
		 this.reserve()
		 this.clean_reserve()
	 },
	 methods:{
		 reserve:function(){
			 axios.get("../member/move_admin_reserve.do",{
				 params:{
					 page:this.curpage
				 }
			 }).then(response=>{
				 console.log(response.data)
				 this.reserve_list=response.data
			 }).catch(error=>{
				 console.log(error.response)
			 })
			 axios.get('../member/move_admin_reserve_page.do',{
					params:{
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
			clean_reserve:function(){
				 axios.get("../member/clean_admin_reserve.do",{
					 params:{
						 page:this.ccurpage
					 }
				 }).then(response=>{
					 console.log(response.data)
					 this.clean_reserve_list=response.data
				 }).catch(error=>{
					 console.log(error.response)
				 })
				 axios.get('../member/clean_admin_reserve_page.do',{
						params:{
							page:this.ccurpage
							
						}
					}).then(response=>{
						console.log(response.data);
						this.cpage_list=response.data
						this.ccurpage=this.cpage_list.curpage
						this.ctotalpage=this.cpage_list.totalpage
						this.cstartPage=this.cpage_list.startPage
						this.cendPage=this.cpage_list.endPage
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
				 
				  this.reserve();
				  
			  },
			  prev:function(){
				  this.curpage=this.startPage-1;
				 
				  this.reserve();
				  
			  },
			  next:function(){
				  this.curpage=this.endPage+1;
				  
				  this.reserve();
				  
			  },
			  range2:function(start,end){
				  let arr=[];
				  let length= end-start;
				  for(let i=0;i<=length;i++)
				   {
					arr[i]=start
					start++;
				   }
				  return arr;
			  },
			  pageChange2:function(page){
				  this.ccurpage=page
				 
				  
				  this.clean_reserve();
			  },
			  prev2:function(){
				  this.ccurpage=this.cstartPage-1;
				 
				  
				  this.clean_reserve();
			  },
			  next2:function(){
				  this.ccurpage=this.cendPage+1;
				  
				  
				  this.clean_reserve();
			  }
			 
		 }
	 
 })
 </script>
</body>
</html>