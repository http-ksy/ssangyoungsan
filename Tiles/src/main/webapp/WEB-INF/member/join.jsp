<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
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
     <h3 class="text-center">회원가입</h3>
     <div class="row">
      <table class="table">
      	 <tr>
      	   <td width=20% class="text-right">ID</td>
      	   <td width=80%>
      	     <input type=text ref="id" size=30 class="input-sm" v-model="id" @keyup="idcheck=false">
      	     <input type="button" value="중복체크" @click="idCheck()">
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
      	   <td width=20% class="text-right">Name</td>
      	   <td width=80%>
      	     <input type=text ref="name" size=30 class="input-sm" v-model="name">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">Nickname</td>
      	   <td width=80%>
      	     <input type=text ref="nickname" size=30 class="input-sm" v-model="nickname" @keyup="nickcheck=false">
      	     <input type="button" value="중복체크" @click="nickCheck()">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">email</td>
      	   <td width=80%>
      	     <input type="email" ref="email" size=30 class="input-sm" v-model="email" @keyup="emailcheck=false" placeholder="xxxx@xxxx.xxx">
      	     <input type="button" value="중복체크" @click="emailCheck()" >
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">성별</td>
      	   <td width=80%>
      	     <input type="radio" value="남자" checked ref="sex" name="sex" v-model="sex">남자
      	     <input type="radio" value="여자" ref="sex" name="sex" v-model="sex">여자
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">사용자</td>
      	   <td width=80%>
      	     <input type="radio" value="사용자" checked ref="admin" name="admin" v-model="admin">사용자
      	     <input type="radio" value="사장님" ref="admin" name="admin" v-model="admin">사장님
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">birthday</td>
      	   <td width=80%>
      	   	<input type="text" ref="birthday" size=30 class="input-sm" v-model="birthday" placeholder="YYYY-MM-DD">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">phone</td>
      	   <td width=80%>
      	     <input type=text ref="phone" size=30 class="input-sm" v-model="phone" placeholder="010-0000-0000">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">addr1</td>
      	   <td width=80%>
      	     <input type=text ref="addr1" size=30 class="input-sm" v-model="addr1">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">addr2</td>
      	   <td width=80%>
      	     <input type=text ref="addr2" size=30 class="input-sm" v-model="addr2">
      	   </td>
      	 </tr>
      	 <tr>
      	   <td width=20% class="text-right">post</td>
      	   <td width=80%>
      	     <input type=text ref="post" size=30 class="input-sm" v-model="post">
      	   </td>
      	 </tr>
      	  <tr>
           <td colspan="2" class="text-center">
            <input type=button value="회원가입" class="btn btn-sm btn-danger" @click="join()">
             <input type=button value="취소" class="btn btn-sm btn-danger"
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
    		idcheck:false,
    		pwd:'',
    		pwdcheck:'',
    		name:'',
    		nickname:'',
    		nickcheck:false,
    		email:'',
    		emailcheck:false,
    		sex:'남자',
    		admin:'사용자',
    		birthday:'',
    		phone:'',
    		addr1:'',
    		addr2:'',
    		post:'',
    		pwdmsg:'',
    		colors:''
    	},
    	methods:{
    		join:function(){
    			let checkBirth = /^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$/
    			//  /^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$/
    			///[0-9]{8,8}$/
    			let checkPhone = /^\d{3}-\d{3,4}-\d{4}$/;
    				///[0-9]{11,11}$/
//     			let checkEmail = /^[A-Za-z0-9_\\.\\-]+@[A-Za-z0-9\\-]+\.[A-Za-z0-9\\-]+/
    			let id=this.$refs.id.value;
    			if(id.trim()==="")
    			{
    				this.$refs.id.focus()
    				return;
    			}
    			let pwd=this.$refs.pwd.value;
    			if(pwd.trim()==="")
    			{
    				this.$refs.pwd.focus()
    				return;
    			}
    			let name=this.$refs.name.value;
    			if(name.trim()==="")
    			{
    				this.$refs.name.focus()
    				return;
    			}
    			let nickname=this.$refs.nickname.value;
    			if(nickname.trim()==="")
    			{
    			  this.$refs.nickname.focus()
    			  return;
    			}
    			let email=this.$refs.email.value;
    			if(email.trim()==="")
    			{
    			  this.$refs.email.focus()
    			  return;
    			}
    			
    			let birthday=this.$refs.birthday.value;
    			if(birthday.trim()==="")
    			{
    			  this.$refs.birthday.focus()
    			  return;
    			} else if(!checkBirth.test(birthday)){
    				this.$refs.birthday.focus()
    				this.$refs.birthday.value=''
    				alert('생년월일을 다시입력해주세요')
    				return;
    				
    			}
    			let phone=this.$refs.phone.value;
    			if(phone.trim()==="")
    			{
    				this.$refs.phone.focus()
    				return;
    			} else if(!checkPhone.test(phone)){
    				this.$refs.phone.focus()
    				this.$refs.phone.value=''
    				alert('핸드폰번호를 다시 입력해주세용')
    				return;
    				
    			}
    			let addr1=this.$refs.addr1.value;
    			if(addr1.trim()==="")
    			{
    				this.$refs.addr1.focus()
    				return;
    			}
    			let addr2=this.$refs.addr2.value;
    			if(addr2.trim()==="")
    			{
    				this.$refs.addr2.focus()
    				return;
    			}
    			let post=this.$refs.post.value;
    			if(post.trim()==="")
    			{
    				this.$refs.post.focus()
    				return;
    			}
    			//alert(this.sex)
    			axios.post('../member/join_ok.do',null,{
    				params:{
    					id:this.id,
    					pwd:this.pwd,
    					name:this.name,
    					email:this.email,
    					nickname:this.nickname,
    					sex:this.sex,
    					admin:this.admin,
    					birthday:this.birthday,
    					phone:this.phone,
    					addr1:this.addr1,
    					addr2:this.addr2,
    					post:this.post
    				}
    			}).then(response=>{
    				let res=response.data;
    				console.log(res);
    				if(res==='NO')
    				{
    					alert("회원 가입 실패")
    					this.id=''
    					this.pwd=''
    					this.name=''
    					this.nickname=''
    					this.email=''
    					this.sex='남자'
    					this.admin='사용자'
    					this.birthday=''
    					this.phone=''
    					this.addr1=''
    					this.addr2=''
    					this.post=''
    					this.$refs.id.focus()
    				}
    				else
    				{
    					location.href="../main/main.do";
    				}
    			}).catch(error=>{
    				console.log(error.response)
    			})
    		},
    		equal:function(pwd,pwdcheck){
    			if(pwd==pwdcheck){
    				this.pwdmsg='비밀번호가 맞습니다.';
    			} else{
    				this.pwdmsg='비밀번호가 달라.';
    			}
    		},
    		idCheck:function(){
    			let id = this.id;
    			if(id.trim()==''){
    				alert('공백은 사용할 수 없습니다.')
    				return
    			}
    			axios.get('../member/id_check.do',{
    				params:{
    					/* 첫번쨰 아이디는 member/id_check.do?id */
    					id:id
    				}
    			}).then(response=>{
    				console.log(response.data);
    				let result = response.data // restController -> return yes,no
    				if(result=='yes'){
    					this.idcheck=true;
    					alert("사용가능한 아이디입니다.!!!!!")
    				} else {
    					alert("이미 사용중인 아이디입니다.!!!!!")
    					this.$refs.id.value=''
    					this.$refs.id.focus()
    				}
    			})
    		},
    		nickCheck:function(){
    			let nickname=this.nickname
    			if(nickname.trim()==''){
    				alert('공백안됨')
    				return
    			}
    			axios.get('../member/nick_check.do',{
    				params:{
    					nickname:nickname
    				}
    			}).then(response=>{
    				let result=response.data
    				if(result=='yes'){
    					this.nickcheck = true;
    					alert("사용가능한 닉네임입니다.")
    				} else{
    					alert("사용불가 닉네임입니다.")
    					this.$refs.nickname.value=''
    					this.$refs.nickname.focus()
    				}
    			})
    		},
    		emailCheck:function(){
    			let email=this.email
    			let emailck= /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/
    			if(!emailck.test(email)){
    				this.$refs.email.focus()
    				this.$refs.email.value=''
    				alert('이메일를 다시 입력해주세용')
    				return;
    				
    			}
    			if(email.trim()==''){
    				alert('공백안됨')
    				return
    			}
    			axios.get('../member/email_check.do',{
    				params:{
    					email:email
    				}
    			}).then(response=>{
    				let result=response.data
    				if(result=='yes'){
    					this.emailcheck = true;
    					alert("사용가능한 이메일입니다.")
    				} else{
    					alert("불가 이메일입니다.")
    					this.$refs.email.value=''
    					this.$refs.email.focus()
    				}
    			})
    		}
    	}
    })
   </script>
</body>
</html>