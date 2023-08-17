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
<div>
	<div class="container">
		<div class="row">
			<table class="table">
				<tr>
					<td class="text-center" v-for="img in apt_img">
					<img :src="img" style="width: 100%">
					</td>
				</tr>
			</table>
			<h1 class="text-center">매물 정보</h1>
		</div>
		<div class="row" style="width:440px;float:left">
			<table class="table">
				<tr>
					<th>name</th>
					<td>{{apt_detail.name}}</td>
				</tr>
				<tr>
					<th>type</th>
					<td>{{apt_detail.type}}</td>
				</tr>
				<tr>
					<th>completion</th>
					<td>{{apt_detail.completion}}</td>
				</tr>
				<tr>
					<th>room</th>
					<td>{{apt_detail.room}}</td>
				</tr>
				<tr>
					<th>floor</th>
					<td>{{apt_detail.floor}}</td>
				</tr>
				<tr>
					<th>addr</th>
					<td>{{apt_detail.addr1}}/{{apt_detail.addr2}}</td>
				</tr>
				<tr>
					<th>area</th>
					<td>{{apt_detail.area}}</td>
				</tr>
				<tr>
					<th>structure</th>
					<td>{{apt_detail.structure}}</td>
				</tr>
			</table>
		</div>
		<div class="row" style="width:440px;float:left">
			<table class="table">
				<tr>
					<th>parking</th>
					<td>{{apt_detail.parking}}</td>
				</tr>
				<tr>
					<th>heating</th>
					<td>{{apt_detail.heating}}</td>
				</tr>
				<tr>
					<th>state</th>
					<td>{{apt_detail.state}}</td>
				</tr>
				<tr>
					<th>moveday</th>
					<td>{{apt_detail.moveday}}</td>
				</tr>
				<tr>
					<th>bathroom</th>
					<td>{{apt_detail.bathroom}}</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<th>img</th> -->
<!-- 					<td>{{apt_detail.img}}</td> -->
<!-- 				</tr> -->
				<tr>
					<th>trafic</th>
					<td>{{apt_detail.trafic}}</td>
				</tr>
				<tr>
					<th>payment</th>
					<td>{{apt_detail.payment}}</td>
				</tr>
			</table>
		</div>
<!-- #######################     딜러       ################################# -->
		<div class="row"style="height:20px;"></div>
		<div class="row" style="width:440px;margin-top:20px;float:left">
			<h3 class="text-center">공인중개사 정보</h3>
			<table class="table">
				<tr>
					<th>people</th>
					<td>{{apt_detail.people}}</td>
				</tr>
				<tr>
					<th>tel</th>
					<td>{{apt_detail.tel}}</td>
				</tr>
				<tr>
					<th>email</th>
					<td>{{apt_detail.email}}</td>
				</tr>
				<tr>
					<th>phone</th>
					<td>{{apt_detail.phone}}</td>
				</tr>
				<tr>
					<th>compony</th>
					<td>{{apt_detail.compony}}</td>
				</tr>
				<tr>
					<th>reg</th>
					<td>{{apt_detail.reg}}</td>
				</tr>
			</table>
		</div>
		<div class="row" style="width:440px;float:left">
            <div class="form-wrapper">
                 <h3 class="text-center">공인중개사에게 질문하기</h3>
                 <form id="contact-form" action="#" method="POST">
                     <div class="col-lg-12">
                          <div class="form-box user-icon mb-15">
                               <input type="text" name="name" placeholder="Your name">
                          </div>
                     </div>
                     <div class="col-lg-12">
                          <div class="form-box email-icon mb-15">
                               <input type="text" name="email" placeholder="Email address">
                          </div>
                     </div>
                     <div class="col-lg-12">
                          <div class="form-box message-icon mb-15">
                               <textarea name="message" id="message" placeholder="Comment"></textarea>
                          </div>
                          <div class="submit-info">
                               <button class="submit-btn2" type="submit">Send Message</button>
                          </div>
                     </div>
                     </form>
               </div> 
          </div>
     </div>
</div>
<script>
	new Vue({
		el:'.container',
		data:{
			apt_detail:[],
			apt_img:[],
			no:${no}
		},
		mounted:function(){
			 this.aptDetailData(this.no)
		},
		methods:{
			aptDetailData:function(no){
				axios.get('../zip/zip_detail_vue.do',{
					params:{
						no:no
					}
				}).then(response=>{
					console.log(response.data)
					this.apt_detail=response.data
					this.apt_img=this.apt_detail.img.split('^')
				}).catch(error=>{
					console.log(error.response)
				})
			}
			
		}
	})
</script>
</body>
</html>