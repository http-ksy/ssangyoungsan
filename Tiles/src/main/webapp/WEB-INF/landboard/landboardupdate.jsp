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
														
													<h1 class="mb-30 text-center">✍️글수정하기 </h1>
														<!-- 태그 : 이름  -->
														<div class="mt-10">
															<input type="text" placeholder="Title 제목"
															onfocus="this.placeholder = ''" onblur="this.placeholder = 'Title 제목'" required
															class="single-input" v-model="title">
														</div>
														<div class="mt-10">
															<textarea class="single-textarea" placeholder="Message" onfocus="this.placeholder = ''"
															onblur="this.placeholder = 'Message'" required style="height: 300px" v-model="subject"></textarea>
														</div>
														<div class="section-top-border text-right">
													<button class="genric-btn primary-border e-large" @click="boardUpdate()">update👍</button>
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
		no:'${no}'
	},
	mounted:function(){
		axios.get("../landboard/landboard_detail.do",{
			params:{
				no:this.no
			}
		}).then(response=>{
			console.log(response.data)
			this.title=response.data.title
			this.subject=response.data.subject
		}).catch(error=>{
			console.log(error.response)
		})
	}
	,
	updated:function(){	
		/* this.selected = $('#default-select & div & span').val(); */
		console.log('title : '+this.title)
		console.log('subject : '+this.subject)
		/* console.log('current : '+this.current)
		console.log('selected : '+selected) */
		console.log('no : '+ this.no)		
	},methods:{
		boardUpdate:function(){
			if(this.title=='' || this.subject==''){
				alert('내용 or 제목을 입력하세요!');
				return
			}
			axios.post('../landboard/landboardUpdate.do',null,{
				params:{
					no:this.no,
					title:this.title,
					subject:this.subject
				}
			}).then(response=>{
				console.log(response.data)
				if(response.data=='yes'){
					location.href='../landboard/detail.do?no='+this.no
				} else {
					alert("글수정 실패")
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