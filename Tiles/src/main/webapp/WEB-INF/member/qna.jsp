<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
     <h1 class="text-left"><b>질문 답변</b></h1>
     </div>
      <br>
      
      <table class="table">
       <tr>
       
        <th>번호</th>
        <th>질문자</th>
        <th>질문내용</th>
        <th>상태</th> <!-- answer를 출력하는 줄 -->
        <th>인풋타입텍스트</th>
       </tr>
       <tr >
<!--         <td><a :href="'../zip/zip_detail.do?no='+vo.no" type="button" class="genric-btn success circle btn" style="color:black;background-color:white">{{vo.name}}</a></td> -->
        <td>번호</td>
        <td>질문자</td>
        <td>질문내용</td>
        <td>상태</td>
        <td>
         <textarea ref="content" v-model="content" name="content"></textarea>
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
<!--       <div class="justify-content-center"> -->
      
<!--         <ul class="pagination" style="margin-left:400px;"> -->
<!--          <li v-if="startPage>1"><a href="#" @click="prev()">이전</a></li> -->
<!--          <li v-for="i in range(startPage,endPage)" :class="i==curpage?'active':''"> -->
<!--          <a href="#" @click="pageChange(i)">{{i}}</a></li> -->
<!--          <li v-if="endPage<totalpage"><a href="#" @click="next()">다음</li> -->
<!--         </ul> -->
     
<!--       </div> -->
      </div>
  </div>
  </div>
</body>
</html>