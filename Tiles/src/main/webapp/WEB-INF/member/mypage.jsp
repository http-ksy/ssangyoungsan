<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.16/dist/vue.js"></script>
<script src="https://unpkg.com/babel-polyfill@latest/dist/polyfill.min.js"></script>
<script src="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
<style type="text/css">
.container{
 margin-top: 50px;
}
.row{
 margin: 0px auto;
 width: 900px;
}
</style>
</head>
<body>
   <div class="container">
     <h1 class="text-center"><b>회원정보</b></h1>
     <div class="row">
      <table class="table">
      	 <tr>
      	   <td width=40% class="text-center"><h2>ID</h2></td>
      	   <td width=60% class="text-left">
      	     <h1>{{myinfo.id}}</h1>
      	     
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>Name</h2></td>
      	   <td width=60% class="text-left">
      	     <h1>{{myinfo.name}}</h1>
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>Nickname</h2></td>
      	   <td width=60% class="text-left">
      	     <h1>{{myinfo.nickname}}</h1>
      	    
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>email</h2></td>
      	   <td width=60% class="text-left">
      	     <h1>{{myinfo.email}}</h1>
      	     
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>성별</h2></td>
      	   <td width=60% class="text-left">
      	     <h1>{{myinfo.sex}}</h1>
      	   </td>
      	 </tr>
      	  
      	  <tr>
      	   <td width=40% class="text-center"><h2>birthday</h2></td>
      	   <td width=60% class="text-left">
      	   	<h1>{{myinfo.birthday}}</h1>
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>phone</h2></td>
      	   <td width=60% class="text-left">
      	    <h1>{{myinfo.phone}}</h1>
      	   
      	   </td>
      	 </tr>
      	 <tr>
      	   <td width=40% class="text-center"><h2>post</h2></td>
      	   <td width=60% class="text-left">
      	    <h1>{{myinfo.post}}</h1>
      	  
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>addr1</h2></td>
      	   <td width=60% class="text-left">
      	     <h1>{{myinfo.addr1}}</h1>
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>addr2</h2></td>
      	   <td width=60% class="text-left">
      	     <h1>{{myinfo.addr2}}</h1>
      	   </td>
      	 </tr>
      	  <tr>
           <td colspan="2" class="text-center">
            <a href="../member/update.do"  class="genric-btn info-border circle">회원수정</a>

             <a href="../main/main.do" class="genric-btn info-border circle">🏠</a>
           </td>
         </tr>
      	 
      </table>
     </div>
   </div>
   <script>
   new Vue({
	   el:'.container',
	   data:{
		 myinfo:{},
		 id:'${sessionScope.id}'
		   
	   },
	   mounted:function(){
		   let id=String(this.id)
		 axios.get('../member/mypage_vue.do',{
			 params:{
				 id:id
			 }
		 }).then(response=>{
			 console.log(response.data)
			 this.myinfo=response.data
		 }).catch(error=>{
			 console.log(error.response)
		 })
	   }
   })
   </script>
</body>
</html>