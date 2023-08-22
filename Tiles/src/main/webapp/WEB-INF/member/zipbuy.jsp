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
</head>
<body>
<div class="container">
	<div class="row">
		<table class="table" >
			<tr>
				<th>이름</th>
				<th>매물구분</th>
				<th>소재지</th>
				<th>중개사</th>
				<th>가격</th>
				<th>리뷰쓰기</th>
			</tr>
			<tr v-for="vo in ziplist">
				<td>{{vo.name}}</td>
				<td>{{vo.type}}</td>
				<td>{{vo.addr}}</td>
				<td>{{vo.manager}}</td>
				<td>{{vo.dprice}}</td>
				<td><textarea ref="content" v-model="content" name="content"></textarea></td>
				<td>
					<input type="button" class="genric-btn info-border circle" @click="reviewInsert(vo.no)" value="저장">
				<td>
			</tr>
		</table>
	</div>
</div>
<script>
new Vue({
	el:'.container',
	data:{
		ziplist:[],
		zipImg:[],
		id:'${sessionScope.id}',
		content:''
		
	},
	mounted:function(){
		 this.zipbuyList()	
	},
	methods:{
		zipbuyList:function(){
			axios.get('../member/zipbuy_vue.do',{
				params:{
					id:this.id
				}
			}).then(response=>{
				console.log(response.data)
				this.ziplist=response.data
				this.zipImg=this.ziplist.img.split('^')
			}).catch(error=>{
				console.log(error.response)
			})
		},
		reviewInsert:function(no){
			axios.get('../zip/review_insert_vue.do',{
				params:{
					no:no,
					id:this.id,
					content:this.content
				}
			}).then(response=>{
				console.log(response.data)
				if(response.data==="OK")
				{
					alert("저장 완료")
					location.href='../zip/zip_detail.do?no='+no
				}
				else
				{
					alert("저장 실패")
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