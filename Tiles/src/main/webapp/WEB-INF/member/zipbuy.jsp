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
		<table class="table">
			<tr>
				<th>이름</th>
				<th>매물구분</th>
				<th>소재지</th>
				<th>중개사</th>
				<th>가격</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<th>리뷰쓰기</th>
				<td>
					<textarea></textarea>
				</td>
			</tr>
		</table>
	</div>
</div>
<script>
new Vue({
	el:'.container',
	data:{
		estate_detail:[],
		estate_img:[],
		no:${no}
	},
	mounted:function(){
		 this.estateDetailData(this.no)	
	},
	methods:{
		estateDetailData:function(no){
			axios.get('../zip/zip_detail_vue.do',{
				params:{
					no:no
				}
			}).then(response=>{
				console.log(response.data)
				this.estate_detail=response.data
				this.estate_img=this.estate_detail.img.split('^')
			}).catch(error=>{
				console.log(error.response)
			})
		}
	}
})
</script>
</body>
</html>