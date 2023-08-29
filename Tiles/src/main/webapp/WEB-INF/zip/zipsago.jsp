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
</head>
<body>
<style type="text/css">
.container{
 margin-top: 50px;
}
.row{
 margin: 0px auto;
 width: 900px;
}
</style>
</head>
<body>
   <div class="container">
     <div class="row">
      <table class="table" style="width:100%">
      	 <tr>
      	   <td style="width:885px;height:800px"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MjhfMTQ2%2FMDAxNjIyMTg4MDQwNTAw.yCUNQkyK4Wx4TUoLf_i2L2tEEzQGyZsahqHjH9qPCmAg.7JEeRK7HfMSq7DjfDPi2yTqA0ef-tex-6mFWf2gj7fQg.PNG.happydaen%2Fimage.png&type=sc960_832" style="width:100%;height:800px"></td>
		 </tr>
      	  <tr>
           <td class="text-center">
            <a class="genric-btn info-border circle" v-model="no" @click="zipsagomove(no)">계약하기</a>
             <input type=button value="취소" class="genric-btn info-border circle"
              onclick="javascript:history.back()">
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
		no:${no},
		id:'${sessionScope.id}'
	},
	mounted:function(){
		 console.log(this.id)
	},
	methods:{
		zipsagomove:function(no){
			axios.get('../zip/zipsago_vue.do',{
				params:{
					no:no,
					id:this.id
				}
			}).then(response=>{
				console.log(response.data)
				if(response.data==="OK")
				{
					alert("거래완료")
					location.href='../zip/zip_detail.do?no='+this.no
				}
				else
				{
					alert("실패")
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