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
.single-input{
	display: inline;
}
</style>
</head>
<body>
<div class="section-top-border">
<div class="row">
<div class="col-lg-12 col-md-12">
														
													<h1 class="mb-30 text-center">✍️공지쓰기 </h1>
														<!-- 태그 : 이름  -->
													<!-- <div style="display: flex;">
													<div class="mt-10" style="width: 30%">
															<div class="form-select" id="default-select" >
																<select ref="column">
																	<option value="Country">Country</option>
																	<option value="Bangladesh">Bangladesh</option>
																	<option value="India">India</option>
																	<option value="England">England</option>
																	<option value="Srilanka">Srilanka</option>
																</select>
															</div>
													</div>&nbsp;
													<div class="mt-10" style="width: 100%">
															<input type="text" name="first_name" placeholder="First Name"
															onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" required
															class="single-input" v-model="column">
													</div>
													</div> -->
															<!-- <input type="text" name="first_name" placeholder="First Name"
															onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" required
															class="single-input" style="width: 30%"> -->
															<!-- 태그 : 제목 end -->

														
														<div class="mt-10">
															<input type="text" placeholder="공지 제목"
															onfocus="this.placeholder = ''" onblur="this.placeholder = 'Title 제목'" required
															class="single-input" v-model="subject">
														</div>
														
														<div class="mt-10">
															<textarea class="single-textarea" placeholder="Message" onfocus="this.placeholder = ''"
															onblur="this.placeholder = 'Message'" required style="height: 300px" v-model="content"></textarea>
														</div>
														<div class="section-top-border text-right">
													<button class="genric-btn primary-border e-large" @click="noticeInsert()">upload👍</button>
													&nbsp;
													<button class="genric-btn danger-border e-large" onclick="javascript:history.back()">cancel👎</button>
												</div>
												</div>
												</div>
												
												</div>
<script>
new Vue({
	el:'.row',
	data:{
		id:'${sessionScope.id}',
		subject:'',
		content:'',
	},
	mounted:function(){
	}
	,
	updated:function(){	
	},methods:{
		noticeInsert:function(){
			console.log(this.id)
			if(this.subject=='' || this.content==''){
				alert('내용 or 제목을 입력하세요!');
				return
			}
			axios.post('../noticeboard/boardnotice_insert.do',null,{
				params:{
					id:this.id,
					subject:this.subject,
					content:this.content
				}
			}).then(res=>{
				console.log(res.data)
				alert("공지 등록!!")
				location.href='../noticeboard/notificationboard.do'
				
			}).catch(error=>{
				console.log(error.res)
			})
		}
	}
})
</script>
</body>
</html>