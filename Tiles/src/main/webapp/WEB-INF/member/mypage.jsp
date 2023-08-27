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

</head>
<body >
 
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
        <a href="../member/inte_reserve.do" class="genric-btn success circle btn" >예약현황</a>
        </td>
      </tr>  
       <tr style="height:30px;">
        <td>
           <a href="../member/zipzim.do" class="genric-btn success circle btn" >부동산 찜목록</a>
        </td>
      </tr> 
      <tr style="height:30px;">
        <td>
           <a href="../member/intezim.do" class="genric-btn success circle btn" >인테리어 찜목록</a>
        </td>
      </tr> 
       <tr style="height:30px;">
        <td>
           <a href="../member/cleanzim.do" class="genric-btn success circle btn" >청소 찜목록</a>
        </td>
      </tr> 
      <tr style="height:30px;">
        <td>
           <a href="../member/movezim.do" class="genric-btn success circle btn" >이사 찜목록</a>
        </td>
      </tr> 
      <tr style="height:30px;">
        <td>
           <input type="button" class="genric-btn success circle btn" value="장바구니">
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
     <div class="row">

     <h1 class="text-center"><b>회원정보</b></h1>
      <table class="table">
      	 <tr>
      	   <td width=40% class="text-center"><h2>ID</h2></td>
      	   <td width=60% class="text-left">
      	     <h1 v-if="readck==false">{{myinfo.id}}</h1>
      	     <input v-if="readck==true" type=text ref="id" size=30 class="input-sm" v-model="id" readonly style="background-color:#F2E0F7" >
      	   </td>
      	 </tr>
      	 <tr v-if="readck==true">
      	   <td width=40% class="text-center"><h2>Password</h2></td>
      	   <td width=60% class="text-left">
      	     <input type=password ref="pwd" size=30 class="input-sm" v-model="pwd" @keyup="equal(pwd,pwdcheck)">
      	   </td>
      	 </tr>
      	 <tr v-if="readck==true">
      	   <td width=40% class="text-center"><h2>Password check</h2></td>
      	   <td width=60%>
      	     <input type=password ref="pwdcheck" size=30 class="input-sm" v-model="pwdcheck" @keyup="equal(pwd,pwdcheck)">
      	     <h4 v-if="pwd==pwdcheck ? colors='color:blue' : colors='color:red'" :style="colors">
      	     {{pwdmsg}}</h4>
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>Name</h2></td>
      	   <td width=60% class="text-left">
      	     <h1 v-if="readck==false">{{myinfo.name}}</h1>
      	     <input v-if="readck==true" type=text  ref="name" size=30 class="input-sm" v-model="myinfo.name" readonly style="background-color:#F2E0F7">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>Nickname</h2></td>
      	   <td width=60% class="text-left">
      	     <h1 v-if="readck==false">{{myinfo.nickname}}</h1>
      	     <input v-if="readck==true" type=text  ref="nickname" size=30 class="input-sm" v-model="myinfo.nickname" @keyup="nickcheck=false" v-bind:readonly="lock1">
      	     <input v-if="readck==true" type="button" value="중복체크" @click="nickCheck()" class="genric-btn info-border circle">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>email</h2></td>
      	   <td width=60% class="text-left">
      	     <h1 v-if="readck==false">{{myinfo.email}}</h1>
      	     <input v-if="readck==true" type=text  ref="email" size=30 class="input-sm" v-model="myinfo.email" v-model="email" @keyup="emailcheck=false" v-bind:readonly="lock2"
      	     v-if="lock2==true ? colors3='background-color:#F2E0F7;color:black':'color:red'" :style="colors3">
      	     <input v-if="readck==true" type="button" value="중복체크" @click="emailCheck()" class="genric-btn info-border circle">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>성별</h2></td>
      	   <td width=60% class="text-left">
      	     <h1 v-if="readck==false">{{myinfo.sex}}</h1>
      	     <input v-if="readck==true" type=text  ref="sex" size=30 class="input-sm" v-model="myinfo.sex" readonly style="background-color:#F2E0F7">
      	   </td>
      	 </tr>
      	  
      	  <tr>
      	   <td width=40% class="text-center"><h2>birthday</h2></td>
      	   <td width=60% class="text-left">
      	   	<h1 v-if="readck==false">{{myinfo.birthday}}</h1>
      	   	<input v-if="readck==true" type=text  ref="birthday" size=30 class="input-sm" v-model="myinfo.birthday" readonly style="background-color:#F2E0F7">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>phone</h2></td>
      	   <td width=60% class="text-left">
      	    <h1 v-if="readck==false">{{myinfo.phone}}</h1>
      	   <input v-if="readck==true" type=text  ref="phone" size=30 class="input-sm" v-model="myinfo.phone" @keyup="phonecheck=false" v-bind:readonly="lock3">
      	   <input v-if="readck==true" type="button" value="중복체크" @click="phoneCheck()" class="genric-btn info-border circle">
      	   </td>
      	 </tr>
      	 <tr>
      	   <td width=40% class="text-center"><h2>post</h2></td>
      	   <td width=60% class="text-left">
      	    <h1 v-if="readck==false">{{myinfo.post}}</h1>
      	  <input v-if="readck==true" type=text  ref="post" size=30 class="input-sm" v-model="myinfo.post" >
      	  <input v-if="readck==true" type=button class="genric-btn info-border circle" value="우편번호검색" id="postBtn" @click="findPost()">
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>addr1</h2></td>
      	   <td width=60% class="text-left">
      	     <h1 v-if="readck==false">{{myinfo.addr1}}</h1>
      	     <input v-if="readck==true" type=text  ref="addr1" size=30 class="input-sm" v-model="myinfo.addr1" >
      	   </td>
      	 </tr>
      	  <tr>
      	   <td width=40% class="text-center"><h2>addr2</h2></td>
      	   <td width=60% class="text-left" >
      	     <h1 v-if="readck==false">{{myinfo.addr2}}</h1>
      	     <input v-if="readck==true" type=text  ref="addr2" size=30 class="input-sm" v-model="myinfo.addr2" >
      	   </td>
      	 </tr>
      	  <tr>
           <td colspan="2" class="text-center">
            <b-button v-if="readck==false" v-b-modal.modal-lg variant="primary" class="genric-btn info-border circle arrow btn">회원수정</b-button>
			<b-modal id="modal-lg" size="lg" title="회원수정"  hide-footer>
			<div>
			<input type="password" size=20 ref="pwd" v-model="pwd">
			<a href="#" @click="pwdCheck()" class="genric-btn info-border circle" >확인</a>
			</div> 
			</b-modal>
			<b-button v-if="readck==false" v-b-modal.modal-lg2 variant="primary" class="genric-btn info-border circle arrow btn" >회원탈퇴</b-button>
			<b-modal v-if="hwakin==true" id="modal-lg2" size="lg" title="회원 탈퇴"  hide-footer>
			<div>
			<input type="password" size=20 ref="pwd" v-model="pwd">
			<a href="#" @click="memberDelete()" class="genric-btn info-border circle" >확인</a>
			</div> 
			</b-modal>
			<input v-if="readck==true" type=button value="수정하기" class="genric-btn info-border circle arrow btn" v-on:click="update()">
             <a href="../main/main.do" class="genric-btn info-border circle btn">🏠</a>
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
		 id:'${sessionScope.id}',
		 pwdmsg:'',
		 pwdcheck:'',
		 colors:'',
		 pwd:'',
		 lock2:false,
		 colors3:'',
 		readck:false,
 		nickcheck:false,
 		lock1:false,
 		phonecheck:false,
 		lock3:false,
 		hwakin:true
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
	   },
	   methods:{
		   update:function(){
   			
   			let pwd=this.$refs.pwd.value;
   			let pwdcheck=this.$refs.pwdcheck.value;
   			if(pwd.trim()==="")
   			{
   				this.$refs.pwd.focus()
   				return;
   			}
   			if(pwdcheck.trim()==="")
   			{
   				this.$refs.pwdcheck.focus()
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
   			let phone=this.$refs.phone.value;
   			if(phone.trim()==="")
   			{
   				this.$refs.phone.focus()
   				return;
    		} 
   			let post=this.$refs.post.value;
   			if(post.trim()==="")
   			{
   				this.$refs.post.focus()
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
   			axios.post('../member/update.do',null,{
   				params:{
   					id:this.myinfo.id,
					pwd:this.pwd,
					name:this.myinfo.name,
					email:this.myinfo.email,
					nickname:this.myinfo.nickname,
					sex:this.myinfo.sex,
					admin:this.myinfo.admin,
					birthday:this.myinfo.birthday,
					phone:this.myinfo.phone,
					addr1:this.myinfo.addr1,
					addr2:this.myinfo.addr2,
					post:this.myinfo.post
   					
   				}
   			}).then(response=>{
   				let res=response.data;
   				console.log(res);
   				if(res==='no')
   				{
   					alert("회원 수정 실패")
   					
   				}
   				else
   				{
   					location.href="../member/mypage.do";
   				}
   			}).catch(error=>{
   				console.log(error.response)
   			})
   		},
		   pwdCheck:function(){
			   let id=this.id
			   let pwd=this.pwd
			   if(pwd.trim()=='')
				{
					this.$refs.pwd.focus()
					alert('비밀번호 입려가세요')
					return
				}
			   axios.post('../member/pwd_ok.do',null,{
				   params:{
					   id:id,
					   pwd:pwd
				   }
			   }).then(response=>{
				   let res=response.data
				   if(res=='yes'){
						
						
// 						alert('야호')
						this.readck=true
						this.hwakin=false
						
						return
					}
				   else{
					   alert('비밀번호를 다시 입력하세요')
					   this.$refs.pwd.value=''
					   this.$refs.pwd.focus()
					   return
				   }
			   }).catch(error=>{
				   console.log(error.response)
			   })
		   },
		   memberDelete:function(){
			   let id=this.id
			   let pwd=this.pwd
			   this.hwakin=true
			   if(pwd.trim()=='')
				{
					this.$refs.pwd1.focus()
					alert('비밀번호 입려가세요')
					return
				}
			   axios.post('../member/delete_ok.do',null,{
				   params:{
					   id:id,
					   pwd:pwd
				   }
			   }).then(response=>{
				   let res=response.data
				   if(res=='yes'){
						
						
						alert('회원 탈퇴 되셨습니다')
						location.href="../main/main.do";
					}
				   else{
					   alert('비밀번호를 다시 입력하세요')
					   this.$refs.pwd.value=''
					   this.$refs.pwd.focus()
					   return
				   }
			   }).catch(error=>{
				   console.log(error.response)
			   })
		   },
		   findPost:function(){
				let _this=this;
				new daum.Postcode({
				oncomplete:function(data) {
					console.log(data.zonecode)
		 				_this.myinfo.post=data.zonecode
		 			   _this.myinfo.addr1=data.address
		 			}
		 		}).open()
			},
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
    				this.pwdmsg='비밀번호는 공백없이 입력해라'
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
    				this.pwdmsg='비밀번호가 달라.';
    				return;
    			}
    		},
    		emailCheck:function(){
    			let email=this.myinfo.email
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
    					this.lock2 = true;
    				} else{
    					alert("사용중인 이메일입니다.")
    					this.$refs.email.value=''
    					this.$refs.email.focus()
    				}
    			})
    		},
    		nickCheck:function(){
    			let nickname=this.myinfo.nickname
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
    					this.lock1 = true;
    				} else{
    					alert("사용불가 닉네임입니다.")
    					this.$refs.nickname.value=''
    					this.$refs.nickname.focus()
    				}
    			})
    		},
    		phoneCheck:function(){
    			let phone =this.myinfo.phone
    			let phoneck = /^\d{3}\d{3,4}\d{4}$/
    			if(!phoneck.test(phone)){
    				this.$refs.phone.focus()
    				this.$refs.phone.value=''
    				alert('핸드폰번호를 다시 입력해주세용')
    				return;
    				
    			}
    			if(phone.trim()==''){
    				alert('공백안됨')
    				return
    			}
    			axios.get('../member/phone_check.do',{
    				params:{
    					phone:phone
    				}
    			}).then(response=>{
    				let result=response.data
    				if(result=='yes'){
    					this.phonecheck = true;
    					alert("사용가능한 번호입니다.")
    					this.lock3 = true;
    				} else{
    					alert("이미 가입된 번호 입니다.")
    					this.$refs.phone.value=''
    					this.$refs.phone.focus()
    				}
    			})
    		},
	   }
   })
   </script>
</body>
</html>