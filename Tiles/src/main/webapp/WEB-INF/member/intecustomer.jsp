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
<!--    <div class="row"> -->
<!--   <template> -->
<!--   <div> -->
<!--     <b-button v-b-toggle.sidebar-border class="genric-btn primary-border small">Mypage</b-button> -->
<!--     <b-sidebar id="sidebar-border" title="MYPAGE!!" sidebar-class="border-right border-danger" width="250px"> -->
<!--       <div class="px-3 py-2"> -->
<!--       <table> -->
<!--       <tr style="height:30px;"> -->
<!--       </tr> -->
<!--       <tr style="height:30px;"> -->
<!--       </tr> -->
<!--       <tr style="height:30px;"> -->
<!--       </tr> -->
<!--       <tr style="height:30px;"> -->
<!--       </tr> -->
<!--       <tr style="height:30px;"> -->
<!--         <td> -->
<!--         <input type="button" class="genric-btn success circle btn" value="예약현황"> -->
<!--         </td> -->
<!--       </tr>   -->
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
<!--       <tr style="height:30px;"> -->
<!--         <td> -->
<!--            <input type="button" class="genric-btn success circle btn" value="장바구니"> -->
<!--         </td> -->
<!--       </tr>  -->
<!--        <tr style="height:30px;"> -->
<!--         <td> -->
<!--            <input type="button" class="genric-btn success circle btn" value="문의하기"> -->
<!--         </td> -->
<!--       </tr>  -->
<!--         </table> -->
<!--         <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Ftwitter.com%2FSpongebob_UIB%2Fstatus%2F990890566706544642&psig=AOvVaw1omWyfKchCYw-55p5W7WlE&ust=1692613764838000&source=images&cd=vfe&opi=89978449&ved=0CA4QjRxqFwoTCPD08-SD64ADFQAAAAAdAAAAABAD" fluid thumbnail> -->
<!--       </div> -->
<!--     </b-sidebar> -->
<!--   </div> -->
<!-- </template> -->
<!--   </div> -->

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
      <div class="container">
      <div class="row">
     <h1 class="text-left"><b>내 매물 검색</b></h1>
     </div>
     
     <div class="container ">
        
           
           <div class="input-group mb-4">
           <select name="select" class="nice-select " ref="col" style="width:200px; ">
            <option value="all">전체</option>
            <option value="name">건물</option>
           
           
           </select>
           <input type=text ref="fd" class="form-control" size=20 v-model="fd" style="width:200px; height:40px;">
           <input type="button" class="genric-btn info-border" value="🔍︎" @click="search()" style="height:40px;">
        	</div>
      </div >
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
       <tr v-for="vo in zip_list">
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
  <script>
  new Vue({
	  el:'.container',
	  data:{
		  col:'all',
		  zip_list:[],
		  page_list:{},
		  curpage:1,
		  totalpage:0,
		  startPage:0,
		  endpage:0,
		  name:'${sessionScope.name}',
		  fd:''
	  },
	  mounted:function(){
		  this.zipData();
	  },
	  methods:{
		  zipData:function(){
			  axios.get('../member/customer_zip.do',{
				  params:{
					  col:this.col,
					  fd:this.fd,
					  page:this.curpage,
					  name:this.name
				  }
			  }).then(response=>{
				  console.log(this.name)
				  console.log(response.data)
				  this.zip_list=response.data
			  })
			  axios.get('../member/customer_page.do',{
				  params:{
					  col:this.col,
					  fd:this.fd,
					  page:this.curpage,
					  name:this.name
				  }
			  }).then(response=>{
				  console.log(response.data);
				  this.page_list=response.data
				  this.curpage=this.page_list.curpage
				  this.totalpage=this.page_list.totalpage
				  this.startPage=this.page_list.startPage
				  this.endPage=this.page_list.endPage
			  })
		  },search:function(){
			  console.log(this.fd)
			  
			  this.col=this.$refs.col.value
			  console.log(this.col)
			  this.curpage=1;
			  this.zipData();
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
			  this.zipData();
		  },
		  prev:function(){
			  this.curpage=this.startPage-1;
			  this.zipData();
		  },
		  next:function(){
			  this.curpage=this.endPage+1;
			  this.zipData();
		  }
	  }
  })
  </script>
</body>
</html>
</head>
<body>

</body>
</html>