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
     <h3 class="text-center">이메일을 입력해주세요</h3>
     <div class="row">
      <table class="table">
      	  <tr>
      	   <td width=20% class="text-right">Email</td>
      	    <td width=80%>
      	     <input type="email" ref="email" size=30 class="input-sm" v-model="email" placeholder="xxxx@xxxx.xxx">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td colspan="2" class="text-center"><h1>{{emailmsg}}</h1></td>
      	 </tr>
      	  <tr>
           <td colspan="2" class="text-center">
            <input type=button value="아이디 찾기" class="genric-btn info-border circle" @click="idfind()">
             <input type=button value="취소" class="genric-btn info-border circle"
              onclick="javascript:history.back()"
             >
           </td>
         </tr>
      </table>
     </div>
   </div>
   <script>
   new Vue({
	 el:'.container',
	 data:{
		 email:'',
		 emailmsg:''
	 },
	 methods:{
		 idfind:function(){
			 let email=this.$refs.email.value;
	   			if(email.trim()==="")
				{
	   				alert('이메일을 입력하세요')
					this.$refs.email.focus()
					
					return;
				}
	   			axios.post('../member/idfind.do',null,{
	   				params:{
	   					email:this.email
	   				}
	   			}).then(response=>{
	   				if(response==='이메일이 없습니다.')
	   				{
	   					this.emailmsg=response.data
	   				}
	   				else
	   				{
	   					this.emailmsg=response.data
	   				}
	   			})
		 }
	 }
   })
   		
   </script>
</body>
</html>