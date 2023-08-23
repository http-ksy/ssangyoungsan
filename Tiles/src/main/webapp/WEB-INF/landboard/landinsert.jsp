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
														
													<h1 class="mb-30 text-center">✍️글쓰기 </h1>
													<div class="input-group-icon mt-10">
														<div class="icon"><b>🛹</b></div>
															<div class="form-select" id="default-select">
																<select ref="bno">
																	<option disabled value="">게시판 선택</option>
																	<option value="1">자유게시판</option>
																	<option value="2">부동산</option>
																	<option value="3">가구</option>
																	<option value="4">청소/이사</option>
																	<option value="5">인테리어</option>
																</select>
															</div>
														</div>
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
															<input type="text" placeholder="Title 제목"
															onfocus="this.placeholder = ''" onblur="this.placeholder = 'Title 제목'" required
															class="single-input" v-model="title">
														</div>
														
														<div class="mt-10">
															<textarea class="single-textarea" placeholder="Message" onfocus="this.placeholder = ''"
															onblur="this.placeholder = 'Message'" required style="height: 300px" v-model="subject"></textarea>
														</div>
														 <b-form-group label="첨부파일" label-cols-sm="2" label-size="lg">
														  <b-form-file v-model="files" multiple id="file-large" size="lg" :file-name-formatter="formatNames" accept=".jpg, .png, .gif">
														  </b-form-file>
														</b-form-group>
														<div class="section-top-border text-right">
													<button class="genric-btn primary-border e-large" @click="boardInsert()">upload👍</button>
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
		title:'',
		subject:'',
		files:[],
		bno:'1'
	},
	mounted:function(){
		this.bno = this.$refs.bno.value;
	}
	,
	updated:function(){	
		/* this.selected = $('#default-select & div & span').val(); */
		this.bno = this.$refs.bno.value;
		console.log('title : '+this.title)
		console.log('files : '+this.files)
		console.log('subject : '+this.subject)
		/* console.log('current : '+this.current)
		console.log('selected : '+selected) */
		console.log('bno : '+ this.bno)
		console.log('length : '+ this.files.length)
		
		
	},methods:{
		formatNames(files) {
			let fileNames=[];
			if(files.length>1){
				for(let i=0; i < files.length;i++){
					fileNames[i] = files[i].name
				}
			} else{
				fileNames[0]=files[0].name
			}
	        return fileNames.toString()+' selected'
	      }
		,
		boardInsert:function(){
			if(this.title=='' || this.subject==''){
				alert('내용 or 제목을 입력하세요!');
				return
			}
			let boardData = new FormData()
			boardData.append("title",this.title)
			boardData.append("subject",this.subject)
			boardData.append("bno",this.bno)
			let leng = this.files.length
			if(leng >0){
				for(let i=0;i<leng;i++){
					boardData.append('files['+i+']',this.files[i])
				}
			}
			axios.post('http://localhost/web/landboard/landboard_insert.do',boardData,{
				headers:{
					'Content-Type':'multipart/form-data'
				}
			}).then(res=>{
				console.log(res.data)
				if(res.data=='yes'){
					location.href='../sotong/haeyo.do'
				} else {
					alert("글등록 실패")
				}
			}).catch(error=>{
				console.log(error.res)
			})
		}
	}
})
</script>
</body>
</html>