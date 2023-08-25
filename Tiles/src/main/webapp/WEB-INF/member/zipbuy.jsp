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
        <input type="button" class="genric-btn success circle btn" value="예약현황">
        </td>
      </tr>  
       <tr style="height:30px;">
        <td>
           <input type="button" class="genric-btn success circle btn" value="구매현황">
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
       <tr style="height:30px;">
        <td>
           <a href="../member/zipbuy.do" class="genric-btn success circle btn" >리뷰쓰기</a>
        </td>
      </tr> 
      <tr style="height:30px;">
        <td>
           <a href="../member/zipqna.do" class="genric-btn success circle btn" >문의하기</a>
        </td>
      </tr> 
        </table>
        <img src="https://www.google.com/url?sa=i&url=https%3A%2F%2Ftwitter.com%2FSpongebob_UIB%2Fstatus%2F990890566706544642&psig=AOvVaw1omWyfKchCYw-55p5W7WlE&ust=1692613764838000&source=images&cd=vfe&opi=89978449&ved=0CA4QjRxqFwoTCPD08-SD64ADFQAAAAAdAAAAABAD" fluid thumbnail>
      </div>
    </b-sidebar>
  </div>
</template>
  </div>
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