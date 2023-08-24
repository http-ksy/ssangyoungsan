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
 <div class="container">
	 <div class="row">
     <h1 class="text-left"><b>찜 목록</b></h1>
     </div>
     
     
      <br>
      
      <table class="table">
       <tr>
        <th>이름</th>
        <th>구분</th>
        <th>소재지</th>
        
        <th>중개사</th>
        <th>가격</th>
        <th>영구 정지</th>
       </tr>
       <tr v-for="vo in zimlist">
        <td><a :href="'../zip/zip_detail.do?no='+vo.no" type="button" class="genric-btn success circle btn" style="color:black;background-color:white">{{vo.name}}</a></td>
        <td>{{vo.type}}</td>
        <td>{{vo.addr}}</td>
       
        <td>{{vo.manager}}</td>
        <td>{{vo.dprice}}</td>
        <td>
    <input type="button" class="genric-btn success circle btn" value="취소" style="background-color:red" @click="zimDelete(vo.no)"> 
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
			zimlist:[],
			page_list:{},
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0,
			zimImg:[],
			id:'${sessionScope.id}',
			no:''
			
			
			
		},
		mounted:function(){
			 this.zipzimList()	
		},
		methods:{
			zipzimList:function(){
				axios.get('../member/zipZim_list.do',{
					params:{
						id:this.id,
						page:this.curpage
					}
				}).then(response=>{
					console.log(response.data)
					this.zimlist=response.data
					this.zimImg=this.zimlist.img.split('^')
				}).catch(error=>{
					console.log(error.response)
				})
				axios.get('../member/zim_page.do',{
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
				  this.zipzimList();
			  },
			  prev:function(){
				  this.curpage=this.startPage-1;
				  this.zipzimList();
			  },
			  next:function(){
				  this.curpage=this.endPage+1;
				  this.zipzimList();
			  },
			zimDelete:function(no){
				
				
				axios.get('../member/zimZim_delete.do',{
					params:{
						id:this.id,
						no:no
					}
				}).then(response=>{
					console.log(response.data)
					if(response.data=='yes')
					{
						alert('찜이 취소가 되었습니다')
						location.href="../member/zipzim.do";
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