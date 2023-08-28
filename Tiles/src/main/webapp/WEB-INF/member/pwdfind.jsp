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
     <h3 class="text-center">새 비밀번호를 입력해주세요</h3>
     <div class="row">
      <table class="table">
      	 <tr>
      	   <td width=20% class="text-right">ID</td>
      	   <td width=80%>
      	     <input type=text ref="id" size=30 class="input-sm" v-model="id" >
      	    
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">Password</td>
      	   <td width=80%>
      	     <input type=password ref="pwd" size=30 class="input-sm" v-model="pwd" @keyup="equal(pwd,pwdcheck)">
      	   </td>
      	 </tr>
      	 <tr>
      	   <td width=20% class="text-right">Password check</td>
      	   <td width=80%>
      	     <input type=password ref="pwdcheck" size=30 class="input-sm" v-model="pwdcheck" @keyup="equal(pwd,pwdcheck)">
      	     <h4 v-if="pwd==pwdcheck ? colors='color:blue' : colors='color:red'" :style="colors">
      	     {{pwdmsg}}</h4>
      	   </td>
      	 </tr>
      	
      	 
      	  <tr>
           <td colspan="2" class="text-center">
            <input type=button value="비밀번호 수정" class="genric-btn info-border circle" @click="pwdupdate()">
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
   			id:'',
   			pwd:'',
   			pwdcheck:'',
   			pwdmsg:''
   		},
   		methods:{
   			
   			equal:function(pwd,pwdcheck){
    			let pwdck = String(pwd);
    			let num = pwdck.search(/[0-9]/g)
    			let eng = pwdck.search(/[a-z]/ig)
    			if(pwdck.length<8 || pwd.length>20)
    			{
    				this.pwdmsg='비밀번호는 8자리~20자리 이내로 입력하세요'
    				return;
    				
    			}
    			else if(pwdck.search(/\s/)!=-1)
    			{
    				this.pwdmsg='비밀번호는 공백없이 입력하세요'
    				return;
    			}
    			else if(num<0 || eng<0)
    			{
    				this.pwdmsg='비밀번호는 영문,숫자를 혼합해서 써야돼요'
    				return;
    			}
    			else if(pwd==pwdcheck){
    				this.pwdmsg='비밀번호가 맞습니다.';
    				return;
    				
    			} else if(pwd!=pwdcheck){
    				this.pwdmsg='비밀번호가 다릅니다.';
    				return;
    			}
   		},
   		pwdupdate:function(){
   			let id=this.$refs.id.value;
   			if(id.trim()==="")
			{
   				alert('아이디를 입력하세요')
				this.$refs.id.focus()
				
				return;
			}
   			/////////
   			let pwdck = String(this.pwd);
			let num = pwdck.search(/[0-9]/g)
			let eng = pwdck.search(/[a-z]/ig)
			if(pwdck.length<8 || this.pwd.length>20)
			{
				alert('비밀번호는 8자리~20자리 이내로 입력하세요')
				return;
				
			}
			else if(pwdck.search(/\s/)!=-1)
			{
				alert('비밀번호는 공백없이 입력하세요')
				return;
			}
			else if(num<0 || eng<0)
			{
				alert('비밀번호는 영문,숫자를 혼합해서 써야돼요')
				return;
			}
			 else if(this.pwd!=this.pwdcheck){
				alert('비밀번호가 다릅니다.')	
				return;
			}
   			/////////
			let pwd=this.$refs.pwd.value;
			if(pwd.trim()==="")
			{
				
				this.$refs.pwd.focus()
				return;
			}
			axios.post('../member/pwd_update.do',null,{
				params:{
					id:this.id,
					pwd:this.pwd
				}
			}).then(response=>{
				let res=response.data;
				console.log(res);
				if(res==='no')
				{
					alert("비밀번호 수정 실패")
					this.id=''
					this.pwd=''
					this.$refs.id.focus()
				}
				else if(res==='yes') 
				{
					location.href="../main/main.do";
				}
				else if(res==='noid')
				{
					alert("아이디가 없습니다")
					this.id=''
					this.pwd=''
					this.$refs.id.focus()
				}
			}).catch(error=>{
				console.log(error.response)
			})
   		}
   	  }
   	})
   </script>
</body>
</html>