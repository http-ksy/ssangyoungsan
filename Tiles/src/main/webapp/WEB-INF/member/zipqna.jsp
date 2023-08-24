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
      <br>
      <div class="container">
      <div class="row">
     <h1 class="text-left"><b>질문 답변</b></h1>
     </div>
      <br>
      
      <table class="table">
       <tr>
       
        <th>번호</th>
        <th>부동산</th>
        <th>답변</th> <!-- answer를 출력하는 줄 -->
        <th>상태</th>
       </tr>
       <tr v-for="vo in question_list">
<!--         <td><a :href="'../zip/zip_detail.do?no='+vo.no" type="button" class="genric-btn success circle btn" style="color:black;background-color:white">{{vo.name}}</a></td> -->
        <td>{{vo.no}}</td>
        <td>{{vo.company}}</td>
        <td>{{vo.answer}}</td>
        <td>답변완료</td>
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
		  question_list:[],
		  page_list:{},
		  curpage:1,
		  totalpage:0,
		  startPage:0,
		  endPage:0,
		  id:'${sessionScope.id}',
		  answer:''
	  },mounted:function(){
		  this.question()
	  },
	  methods:{
		  question:function(){
			  axios.get('../member/question.do',{
				  params:{
					  id:this.id,
					  page:this.curpage
				  }
			  }).then(response=>{
				  console.log(response.data)
				  this.answer=response.answer
				  this.question_list=response.data
			  }).catch(error=>{
				  console.log(error.response)
			  })
			  axios.get('../member/question_page.do',{
				  params:{
					  page:this.curpage,
					  id:this.id
				  }
			  }).then(response=>{
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
			   this.question();
		   },
		   prev:function(){
			   this.curpage=this.startPage-1;
			   this.question();
		   },
		   next:function(){
			   this.curpage=this.endPage+1;
			   this.question();
		   }
	  }
  })
  </script>
</body>
</html>