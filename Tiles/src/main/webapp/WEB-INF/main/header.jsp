<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- vue script  start-->


<link type="text/css" rel="stylesheet" href="https://unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue.css"/>
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
<!-- vue script end -->
</head>
<body>
	    <header>
        <!-- Header Start -->
        <div class="header-area ">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="menu-wrapper d-flex align-items-center justify-content-between">
                        <div class="header-left d-flex align-items-center">
                            <!-- Logo -->
                            <div class="logo">
                                <a href="../main/main.do"><img src="../assets/img/logo/logo.png" style="width:120px;"></a>
                            </div>
                            <!-- Main-menu -->
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a href="../main/main.do">home</a></li> 
                                        <li><a href="../zip/zip_list.do">.zip 사러가기</a></li>
                                        <li><a href="../inte/inte_list.do">.zip 인테리어하기 </a></li>
                                        <li><a href="#">.zip 스토어 </a>
										  <ul class="submenu">
                                            <li><a href="../product/product_list.do?type=1">.zip 가구</a></li>
                                            <li><a href="../product/product_list.do?type=2">.zip 패브릭</a></li>
                                            <li><a href="../product/product_list.do?type=3">.zip 조명</a></li>
                                          </ul>
                                        </li>
                                        <li><a href="#">.zip 마무리하기</a>
                                         <ul class="submenu">
                                                <li><a href="../clean/list.do">.zip 청소하기</a></li>
                                                <li><a href="../move/list.do">.zip 이사하기</a></li>
                                            </ul>
                                             </li>
                                        <li><a href="#">.zip 커뮤니티</a>
                                        	<ul class="submenu">
                                            <li><a href="../sotong/haeyo.do">소통게시판</a></li>
                                            <li><a href="../landboard/notificationboard.do">공지게시판</a></li>
                                            <li><a href="../landboard/qna.do">묻고답하기</a></li>
                                          </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>   
                        </div>
                        
                        <div class="header-right1 d-flex align-items-center" v-if="!bool">
                        <!-- login Button  session = ''  bool => false  v-if => true 출력  !bool ->  true -->
                        
                          <b-button class="genric-btn info-border circle arrow" v-b-modal.modal-lg >login</b-button>
								  <b-modal id="modal-lg" title="로그인" hide-footer>
								    <table class="table">
								        <tr>
								          <th width=25% class="text-right">ID</th>
								          <td width=75%>
								            <input type=text  ref="id" size=15 class="input-sm" v-model="id" >
								          </td>
								        </tr>
								        <tr>
								          <th width=25% class="text-right">Password</th>
								          <td width=75%>
								            <input type=password ref="pwd" size=15 class="input-sm" v-model="pwd">
								          </td>
								        </tr>
								        <tr>
								          <th width=25% class="text-right">아이디 저장</th> <!-- 아직 미완성 -->
								           
								          <td width=75% >
								            <input type=checkbox  size=15 class="input-sm" ref="ck" v-model="ck" >
								          </td>
								        </tr>
								        <tr>
								          <td colspan="2" class="text-center">
								           <input type=button value="로그인" class="genric-btn info-border circle arrow" v-on:click="login()">
								           <a href="../member/find.do" class="genric-btn info-border circle arrow">아이디/비밀번호 찾기</a>
								          </td>
								        </tr>
								      </table>
								  </b-modal>&nbsp;
								  <!-- 조인 버튼 -->
<!-- 								  <b-button class="genric-btn info-border circle arrow">--><a href="../member/join.do" class="genric-btn info-border circle arrow btn">join</a> 
								  
								  <!-- 로그인 버튼 끝 -->
                            </div>
                          
                            
                             <div class="header-right1 d-flex align-items-center" v-if="bool">
                             <!-- sessionck ='' bool =>false sessionck='hong' => bool true  -->
                             <div v-if="sessionck=='관리자'"><a href="../member/admin.do" class="genric-btn info-border circle arrow btn">${sessionScope.name }님(${sessionScope.admin })</a></div>
                             <div v-if="sessionck=='사용자'"><a href="../member/mypage.do" class="genric-btn info-border circle arrow btn">${sessionScope.name }님(${sessionScope.admin })</a></div>
                             <div v-if="sessionck=='사장님'&&sessionname!='쌍용인테리어'"><a href="../member/customer.do" class="genric-btn info-border circle arrow btn">${sessionScope.name }님(${sessionScope.admin })</a></div>
                             <div v-if="sessionck=='사장님'&&sessionname=='쌍용인테리어'"><a href="../member/intecustomer.do" class="genric-btn info-border circle arrow btn">${sessionScope.name }님(${sessionScope.admin })</a></div>
<!--                              <a href="#" v-if="sessionck=='사용자'">My🏠</a> -->
<!--                              <a href="#" v-if="sessionck=='사장님'">C🏠</a> -->
                             &nbsp;<a href="../member/logout.do" class="genric-btn info-border circle arrow btn">logout</a>
                             
                             </div>
                             
                            <!-- Search Box -->
                            <div class="search d-none d-md-block">
                                <ul class="d-flex align-items-center">
                                    <li class="mr-15">
                                        <div class="nav-search search-switch">
                                            <i class="ti-search"></i>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="card-stor">
                                            <img src="../assets/img/gallery/card.svg" alt="">
                                            <span>0</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
    <!-- header end -->
    <!--? Search model Begin -->
<div class="search-model-box">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-btn">+</div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Searching key.....">
        </form>
    </div>
</div>
<script>
new Vue({
	el:'.header-area',
	data:{
		id:'${id}',
		pwd:'',
		sessionck:'',
		bool:false,
		ck:false,
		sessionname:''
	},
	mounted:function(){
		this.sessionname='${sessionScope.name}'
		this.sessionck= '${sessionScope.admin}'
		console.log(this.sessionck);
		this.bool = this.sessionck==''? false:true;
		console.log(this.bool);
		//console.log(this.$refs.ck)
		
	},
	methods:{
		login:function(){
			let id= this.id;
			let pwd= this.pwd;
    		
			
// 			alert("ck="+this.ck)
			this.ck=this.$refs.ck.checked
			
			if(id.trim()=='')
			{
				this.$refs.id.focus()
				alert('아이디 입력해주세용')
				return
			}
			if(pwd.trim()=='')
			{
				this.$refs.pwd.focus()
				alert('비밀번호 입려가세요')
				return
			}
			axios.post('../member/login_ok.do',null,{
				params:{
					id:id,
					pwd:pwd,
					ck:this.ck
				}
			}).then(response=>{
				let res=response.data;
				// yes nopwd , noid
				if(res=='yes'){
					
					
					location.reload();
					
				}
				else if(res=='noid')
				{
				   alert('id가없습니다')
				   this.$refs.id.value=''
				   this.$refs.id.focus()
				   return;
				}
				else 
				{
					  alert('pwd가없습니다')
					   this.$refs.pwd.value=''
					   this.$refs.pwd.focus()
					   return
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