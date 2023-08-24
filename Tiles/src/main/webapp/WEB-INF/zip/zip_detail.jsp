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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
<div class="page-notification">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                                <li class="breadcrumb-item"><a href="../main/main.do">Home</a></li>
                                <li class="breadcrumb-item"><a href="../zip/zip_list.do">부동산 목록</a></li> 
                            </ol>
                        </nav>
                    </div>
                </div>

	<div class="row">
		<table class="table">
			<tr>
				<td class="text-center" v-for="img in estate_img">
				<img :src="img" style="width: 100%">
				</td>
			</tr>
		</table>
		<h1 class="text-center">매물 정보</h1>
	</div>
	<div class="row" style="width:440px;float:left">
		<table class="table">
			<tr>
				<th>이름</th>
				<td>{{estate_detail.name}}</td>
			</tr>
			<tr>
				<th>매물구분</th>
				<td>{{estate_detail.type}}</td>
			</tr>
			<tr>
				<th>소재지</th>
				<td>{{estate_detail.addr}}
				<input type="hidden" value="'estate_detail.addr'" class="addr">
				</td>				
			</tr>
			<tr>
				<th>면적</th>
				<td>{{estate_detail.area}}</td>
			</tr>
			<tr>
			<th>주차</th>
				<td>{{estate_detail.parking}}</td>
			</tr>		
			<tr>
				<th>계약상태</th>
				<td>{{estate_detail.state}}</td>
			</tr>
			<tr>
				<th>입주일</th>
				<td>{{estate_detail.moveday}}</td>
			</tr>
			<tr>
				<th>교통</th>
					<td>{{estate_detail.trafic}}</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>{{estate_detail.dprice}}</td>
			</tr>
		</table>
	</div>
	<div class="row" style="width:440px;float:left">
		<div class="page-sidebar">
			<div id="map" style="width:440px;height:340px;"></div>
		</div>
	</div>
<!-- #######################     딜러       ################################# -->
	<div class="row"style="height:20px;"></div>
	<div class="row" style="width:440px;margin-top:20px;float:left">
		<h3 class="text-center">공인중개사 정보</h3>
		<table class="table">
			<tr>
				<th>중개사</th>
				<td>{{estate_detail.manager}}</td>
			</tr>
		
			<tr>
				<th>공인중개사</th>
				<td >{{estate_detail.company}}</td>
			</tr>
			<tr>
				<th>소재지</th>
				<td>{{estate_detail.comaddr}}</td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td v-if="estate_detail.state!='매매진행완료'" class="text-center">
					<a :href="'../zip/zipsago.do?no='+estate_detail.no" class="genric-btn info-border">구매하기</a>
				</td>
				<td v-if="state!='OK'">
					<button class="genric-btn info-border" @click="zipZim()">찜</button>
				</td>
				<td v-if="state=='OK'">
					<button class="genric-btn info-border" @click="zipZim()">찜 취소</button>
				</td>
				<td>
					<button class="genric-btn info-border" type="button" onclick="javascript:history.back()">목록</button>
				</td>
			</tr>
		</table>
	</div>	
	<div class="row" style="width:440px;float:left">
           <div class="form-wrapper">
                <h3 class="text-center">공인중개사에게 질문하기</h3>
                <form id="contact-form" action="#" method="POST">
                    <div class="col-lg-12">
                         <div class="form-box message-icon mb-15">
                              <textarea ref="question" v-model="question"style="height:113px;"></textarea>
                         </div>
                         <div class="submit-info text-right">
                              <button class="genric-btn info-border" type="button" @click="zipQna()">Send Message</button>
                         </div>
                         
					</div>
				</form>
			</div> 
		</div>
		<div class="row" style="width:800px;float:left">
			<div class="form-wrapper">
			<h3 class="text-center">공인중개사 리뷰</h3>
			<table class="table" >
				<tr>
					<th width=20%>이름</th>
					<th width=60%>내용</th>
					<th width=20%>날짜</th>
				</tr>
				<tr v-for="vo in review">
					<td width=20%>{{vo.id}}</td>
					<td width=60%>{{vo.content}}</td>
					<td width=20%>{{vo.dbday}}</td>
				</tr>
			</table>
		</div> 
	</div>
</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2633d4b49e21c9b14bd17316553d25a2&libraries=services"></script>
<script>
	new Vue({
		el:'.container',
		data:{
			estate_detail:[],
			estate_img:[],
			no:${no},
			review:[],
			id:'${sessionScope.id}',
			state:'',
			company:'',
			question:''
		},
		mounted:function(){
			
			
			 this.estateDetailData(this.no)
			 this.reviewData(this.no)
			 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			 mapOption = {
			     center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			     level: 3 // 지도의 확대 레벨
			 };  

			 //지도를 생성합니다    
			 var map = new kakao.maps.Map(mapContainer, mapOption); 

			 //주소-좌표 변환 객체를 생성합니다
			 var geocoder = new kakao.maps.services.Geocoder();

			 //주소로 좌표를 검색합니다
			 geocoder.addressSearch('${addr}', function(result, status) {

			 // 정상적으로 검색이 완료됐으면 
			  if (status === kakao.maps.services.Status.OK) {

			     var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			     // 결과값으로 받은 위치를 마커로 표시합니다
			     var marker = new kakao.maps.Marker({
			         map: map,
			         position: coords
			     });

			     // 인포윈도우로 장소에 대한 설명을 표시합니다
			     var infowindow = new kakao.maps.InfoWindow({
			         content: '<div style="width:150px;text-align:center;padding:6px 0;">위치</div>'
			     });
			     infowindow.open(map, marker);

			     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			     map.setCenter(coords);
			 } 
			 });  
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
					this.company=this.estate_detail.company
				}).catch(error=>{
					console.log(error.response)
				})
			},
			reviewData:function(no){
				axios.get('../zip/review_list_vue.do',{
					params:{
						no:no
					}
				}).then(response=>{
					console.log(response.data)
					if(response.data!=null)
					{
						this.review=response.data
					}
					else
					{
						this.review=[]
					}
				}).catch(error=>{
					console.log(error.response)
				})
			},
			zipZim:function(){
				axios.get('../zip/zipZim_vue.do',{
					params:{
						no:this.no,
						id:this.id
					}
				}).then(response=>{
					console.log(response.data)
					this.state=response.data
					if(response.data==='OK')
					{
						alert("찜 완료")
					}
					else
					{
						alert("찜 취소")
					}
				}).catch(error=>{
					console.log(error.response)
				})
			},
			zipQna:function(){
				axios.get('../zip/zipQna_vue.do',{
					params:{
						cno:this.no,
						id:this.id,
						company:this.company,
						question:this.question
					}
				}).then(response=>{
					console.log(response.data)
					if(response.data==='ok')
					{
						alert("질문 완료")
						this.$refs.question.value='';
					}
				})
			}
		}
	})
</script>
</body>
</html>