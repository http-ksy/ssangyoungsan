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
<script src="//unpkg.com/bootstrap-vue@latest/dist/bootstrap-vue-icons.min.js"></script>
<style type="text/css">
.single-input{
	display: inline;
}
.btn::before{
	background: none;
}
</style>
</head>
<body>
<div class="section-top-border">
<div class="row">
<div class="col-lg-12 col-md-12" style="border: 1px solid gray; border-radius: 30px; padding:35px">
	<template>
	  <div>
	    <div v-b-hover="handleHover" class="py-3 px-4" style="width: 180px" onclick="javascript:history.back()">
	      <b-icon v-if="isHovered" icon="arrow-left-circle-fill" scale="2"></b-icon>
	      <b-icon v-else icon="arrow-left-circle" scale="2"></b-icon>
	      <span class="ml-2" :class="isHovered ? 'text-info' : ''" >&nbsp;목록으로!!!</span>
	    </div>
	  </div>
	</template>
	<br>
	<h1 style="color: #2d2d2d;"> {{landnotice_detail.subject}}
     </h1>
     <ul class="blog-info-link mt-3 mb-4">
       <li><b-icon icon="person-fill"></b-icon>&nbsp;{{landnotice_detail.id}}</li>       
       <li><b-icon icon="eye-fill" ></b-icon>&nbsp;{{landnotice_detail.hit}}</li>
       <li><b-icon icon="calendar-date"></b-icon>&nbsp;{{landnotice_detail.dbday}}</li>
       <!-- calendar-date -->
     </ul>
     <hr>
     <div class="quote-wrapper">
       <div class="quotes">
       {{landnotice_detail.content}}
      </div>
    </div>
    <div class="text-right">
    	<!-- dddddddddd -->
    	<h2 v-if="${sessionScope.admin=='관리자' }"><b-badge variant="light" :href="'../noticeboard/notificationUpdate.do?no='+landnotice_detail.no">수정<b-icon icon="hammer"></b-icon></b-badge>&nbsp;&nbsp;<b-badge href="#" variant="light" @click="boardDelete()">삭제<b-icon icon="trash-fill" ></b-icon></b-badge></h2>
    </div>
 <!-- 댓글 출력 !!! -->


</div>
</div>
</div>


<script>
new Vue({
	el:'.section-top-border',
	data:{
		isHovered: false,
		landnotice_detail:{},
		no:'${no}',
		id:'${sessionScope.id}'
	},
	mounted:function(){
		console.log('id: '+this.id)
		console.log('no: '+this.no)
		axios.get('../noticeboard/boardnotice_detail.do',{
			params:{
				no:this.no
			}
		}).then(response=>{
			console.log(response.data)
			this.landnotice_detail=response.data
		}).catch(error=>{
			console.log(error.response)
		})
	},
	methods:{
	      handleHover(hovered) {
	        this.isHovered = hovered
	      },
	      boardDelete:function(){
	    	  axios.get('../noticeboard/boardnotice_delete.do',{
	    		  params:{
	    			  no:this.no
	    		  }
	    	  }).then(response=>{
	    		  alert('삭제완료')
	    		  location.href="../noticeboard/notificationboard.do"
	    	  }).catch(error=>{
	    		  console.log(error.response)
	    	  })
	      }
	}
})
</script>
</body>
</html>