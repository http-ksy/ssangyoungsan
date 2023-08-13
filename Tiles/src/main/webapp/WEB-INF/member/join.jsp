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
      	     <input type=text ref="id" size=15 class="input-sm" v-model="id">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">Password</td>
      	   <td width=80%>
      	     <input type=password ref="pwd" size=15 class="input-sm" v-model="pwd">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">Name</td>
      	   <td width=80%>
      	     <input type=text ref="name" size=15 class="input-sm" v-model="name">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">Nickname</td>
      	   <td width=80%>
      	     <input type=text ref="nickname" size=15 class="input-sm" v-model="nickname">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">email</td>
      	   <td width=80%>
      	     <input type=text ref="email" size=15 class="input-sm" v-model="email">
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
      	     <input type="radio" value="관리자" ref="admin" name="admin" v-model="admin">관리자
      	     <input type="radio" value="사장님" ref="admin" name="admin" v-model="admin">사장님
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">birthday</td>
      	   <td width=80%>
      	     <input type=text ref="birthday" size=15 class="input-sm" v-model="birthday">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">phone</td>
      	   <td width=80%>
      	     <input type=text ref="phone" size=15 class="input-sm" v-model="phone">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">addr1</td>
      	   <td width=80%>
      	     <input type=text ref="addr1" size=15 class="input-sm" v-model="addr1">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=20% class="text-right">addr2</td>
      	   <td width=80%>
      	     <input type=text ref="birthday" size=15 class="input-sm" v-model="addr2">
      	   </td>
      	 </tr>
      	 <tr>
      	   <td width=20% class="text-right">post</td>
      	   <td width=80%>
      	     <input type=text ref="post" size=15 class="input-sm" v-model="post">
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
    		pwd:'',
    		name:'',
    		nickname:'',
    		email:'',
    		sex:'남자',
    		admin:'사용자',
    		birthday:'',
    		phone:'',
    		addr1:'',
    		addr2:'',
    		post:''
    	},
    	methods:{
    		join:function(){
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
    			}
    			let phone=this.$refs.phone.value;
    			if(phone.trim()==="")
    			{
    				this.$refs.phone.focus()
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
    			axios.post('http://localhost/web/member/join_ok.do',null,{
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
    					alert("회원 가입 실패");
    					this.id='';
    					this.pwd='';
    					this.name='';
    					this.nickname='',
    					this.email='',
    					this.sex='남자',
    					this.admin='사용자',
    					this.birthday='',
    					this.phone='',
    					this.addr1='',
    					this.addr2='',
    					this.post='';
    					this.$refs.id.focus()
    				}
    				else
    				{
    					location.href="../main/main.do";
    				}
    			})
    		}
    	}
    })
   </script>
</body>
</html>