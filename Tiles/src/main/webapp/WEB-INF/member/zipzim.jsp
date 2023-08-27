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
      
        </table>
        
      </div>
    </b-sidebar>
  </div>
</template>
  </div>
	 <div class="row">
     <h1 class="text-left"><b>찜 목록</b></h1>
     </div>
       
       <div class="container">
        <ul class="nav nav-tabs">
			 <li class="active"><a data-toggle="tab" href="#zip">부동산 찜</a></li>
			 <li><a data-toggle="tab" href="#inte" >인테리어</a></li>
			 <li><a data-toggle="tab" href="#move" >이사</a></li>
			 <li><a data-toggle="tab" href="#clean" >청소</a></li>
	    </ul>
     
      <br>
      <div class="tab-content">
      <div class="tab-pane fade in active" id="zip">
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
	  
	  <div class="tab-pane fade" id="inte">
     <table class="table">
       <tr>
       
        <th>사진</th>
       
        <th>인테리어</th>
        
        <th>소재지</th>
       
        <th>구분</th>
        
        <th>찜 취소</th>
       </tr>
       <tr v-for="vo in intezimlist">
        <td><img :src="vo.poster" style="width:40px;height:40px;"></td>
        <td><a :href="'../inte/inte_detail.do?ino='+vo.ino" type="button" class="genric-btn success circle btn" style="color:black;background-color:white">{{vo.title}}</a></td>
        <td>{{vo.jiyoek}}</td>
        <td>{{vo.gubun}}</td>
        <td>
    <input type="button" class="genric-btn success circle btn" value="취소" style="background-color:red" @click="intezimDelete(vo.ino)"> 
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
         <li v-if="istartPage>1"><a href="#" @click="prev2()">이전</a></li>
         <li v-for="i in range2(istartPage,iendPage)" :class="i==icurpage?'active':''">
         <a href="#" @click="pageChange2(i)">{{i}}</a></li>
         <li v-if="iendPage<itotalpage"><a href="#" @click="next2()">다음</li>
        </ul>
     
      </div>
	  </div>
	  
	 <div class="tab-pane fade" id="move">
	  <table class="table">
       <tr>
       
        <th>사진</th>
       
        <th>업체명</th>
        
        <th>구분</th>
       
        <th>지역</th>
        
        <th>찜 취소</th>
       </tr>
       <tr v-for="vo in movezimlist">
        <td><img :src="vo.poster" style="width:40px;height:40px;"></td>
        <td><a :href="'../move/detail.do?mno='+vo.mno" type="button" class="genric-btn success circle btn" style="color:black;background-color:white">{{vo.title}}</a></td>
        <td>{{vo.category}}</td>
        <td>{{vo.address}}</td>
        <td>
    <input type="button" class="genric-btn success circle btn" value="취소" style="background-color:red" @click="movezimDelete(vo.mno)"> 
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
         <li v-if="mstartPage>1"><a href="#" @click="prev3()">이전</a></li>
         <li v-for="i in range3(mstartPage,mendPage)" :class="i==mcurpage?'active':''">
         <a href="#" @click="pageChange3(i)">{{i}}</a></li>
         <li v-if="mendPage<mtotalpage"><a href="#" @click="next3()">다음</li>
        </ul>
     
      </div>
      </div>
	  <div class="tab-pane fade" id="clean">
	   <table class="table">
       <tr>
       
        <<th>사진</th>
       
        <th>업체명</th>
        
        <th>구분</th>
       
        <th>지역</th>
        
        <th>찜 취소</th>
       </tr>
       <tr v-for="vo in cleanzimlist">
        <td><img :src="vo.poster" style="width:40px;height:40px;"></td>
        <td><a :href="'../clean/detail.do?cno='+vo.cno" type="button" class="genric-btn success circle btn" style="color:black;background-color:white">{{vo.title}}</a></td>
        <td>{{vo.category}}</td>
        <td>{{vo.address}}</td>
        <td>
    <input type="button" class="genric-btn success circle btn" value="취소" style="background-color:red" @click="cleanzimDelete(vo.cno)"> 
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
         <li v-if="cstartPage>1"><a href="#" @click="prev4()">이전</a></li>
         <li v-for="i in range4(cstartPage,cendPage)" :class="i==ccurpage?'active':''">
         <a href="#" @click="pageChange4(i)">{{i}}</a></li>
         <li v-if="cendPage<ctotalpage"><a href="#" @click="next4()">다음</li>
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
			zimlist:[], // 부동산
			intezimlist:[], // 인테
			movezimlist:[], // 이사
			cleanzimlist:[],// 청소
			page_list:{}, // 부동산 페이지
			ipage_list:{}, // 인테 페이지
			mpage_list:{}, // 이사 페이지
			cpage_list:{},
			curpage:1,
			totalpage:0,
			startPage:0,
			endPage:0,
			///////////////////
			icurpage:1,
			itotalpage:0,
			istartPage:0,
			iendPage:0,
			////////////////////
			mcurpage:1,
			mtotalpage:0,
			mstartPage:0,
			mendPage:0,
			////////////////////
			ccurpage:1,
			ctotalpage:0,
			cstartPage:0,
			cendPage:0,
			////////////////////
			
			zimImg:[],
			id:'${sessionScope.id}',
			no:''
			
			
			
		},
		mounted:function(){
			 this.zipzimList()	
			 this.iintezimList()
			 this.mmovezimList()
			 this.ccleanzimList()
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
			},
			iintezimList:function(){
				axios.get('../member/inteZim_list.do',{
					params:{
						id:this.id,
						page:this.icurpage
					}
				}).then(response=>{
					console.log(response.data)
					
					this.intezimlist=response.data
					
				}).catch(error=>{
					console.log(error.response)
				})
				axios.get('../member/inte_zim_page.do',{
					params:{
						page:this.icurpage,
						id:this.id
					}
				}).then(response=>{
					console.log(response.data);
					this.ipage_list=response.data
					this.icurpage=this.ipage_list.curpage
					this.itotalpage=this.ipage_list.totalpage
					this.istartPage=this.ipage_list.startPage
					this.iendPage=this.ipage_list.endPage
				})
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
				  this.icurpage=page
				  this.iintezimList();
			  },
			  prev2:function(){
				  this.icurpage=this.istartPage-1;
				  this.iintezimList();
			  },
			  next2:function(){
				  this.icurpage=this.iendPage+1;
				  this.iintezimList();
			  },
			  intezimDelete:function(ino){
		
					axios.get('../member/inteZim_delete.do',{
						params:{
							id:this.id,
							ino:ino
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
				},
				mmovezimList:function(){
					axios.get('../member/moveZim_list.do',{
						params:{
							id:this.id,
							page:this.mcurpage
						}
					}).then(response=>{
						console.log(response.data)
						
						this.movezimlist=response.data
						
					}).catch(error=>{
						console.log(error.response)
					})
					axios.get('../member/movezim_page.do',{
						params:{
							page:this.mcurpage,
							id:this.id
						}
					}).then(response=>{
						console.log(response.data);
						this.mpage_list=response.data
						this.mcurpage=this.mpage_list.curpage
						this.mtotalpage=this.mpage_list.totalpage
						this.mstartPage=this.mpage_list.startPage
						this.mendPage=this.mpage_list.endPage
					})
				},
				 range3:function(start,end){
					  let arr=[];
					  let length= end-start;
					  for(let i=0;i<=length;i++)
					   {
						arr[i]=start
						start++;
					   }
					  return arr;
				  },
				  pageChange3:function(page){
					  this.mcurpage=page
					  this.mmovezimList();
				  },
				  prev3:function(){
					  this.mcurpage=this.mstartPage-1;
					  this.mmovezimList();
				  },
				  next3:function(){
					  this.mcurpage=this.mendPage+1;
					  this.mmovezimList();
				  },
				  movezimDelete:function(mno){
			
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
								location.href="../member/zipzim.do";
							}
							else
							{
							   alert("찜 취소 불가")	
							}
						})
					},
					ccleanzimList:function(){
						axios.get('../member/cleanZim_list.do',{
							params:{
								id:this.id,
								page:this.ccurpage
							}
						}).then(response=>{
							console.log(response.data)
							
							this.cleanzimlist=response.data
							
						}).catch(error=>{
							console.log(error.response)
						})
						axios.get('../member/cleanzim_page.do',{
							params:{
								page:this.ccurpage,
								id:this.id
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
					 range4:function(start,end){
						  let arr=[];
						  let length= end-start;
						  for(let i=0;i<=length;i++)
						   {
							arr[i]=start
							start++;
						   }
						  return arr;
					  },
					  pageChange4:function(page){
						  this.ccurpage=page
						  this.ccleanzimList();
					  },
					  prev4:function(){
						  this.ccurpage=this.cstartPage-1;
						  this.ccleanzimList();
					  },
					  next4:function(){
						  this.ccurpage=this.cendPage+1;
						  this.ccleanzimList();
					  },
					  cleanzimDelete:function(cno){
							
							axios.get('../member/cleanZim_delete.do',{
								params:{
									id:this.id,
									cno:cno
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