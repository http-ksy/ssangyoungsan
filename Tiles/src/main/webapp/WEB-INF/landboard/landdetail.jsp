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
	<h1 style="color: #2d2d2d;"> {{landboard_detail.title}}
     </h1>
     <ul class="blog-info-link mt-3 mb-4">
       <li><b-icon icon="person-fill"></b-icon>&nbsp;{{landboard_detail.id}}</li>
       <li><b-icon icon="chat-square-dots-fill" ></b-icon>&nbsp;{{landboard_reply.length}} Comments</li>
       
       <li><b-icon icon="eye-fill" ></b-icon>&nbsp;{{landboard_detail.hit}}</li>
       <li><b-icon icon="hand-thumbs-up"></b-icon>좋아요</li>
       <li><b-icon icon="calendar-date"></b-icon>&nbsp;{{landboard_detail.dbday}}</li>
       <!-- calendar-date -->
     </ul>
     <hr>
     <div class="quote-wrapper">
       <div class="quotes">
       {{landboard_detail.subject}}
      </div>
    </div>
    <hr>
 <h4><b-icon icon="chat-square-dots-fill"></b-icon>&nbsp;댓글!!!</h4>
 <hr>
<div>
	<div class="row" style="width: 100%" v-for="rvo in landboard_reply">
		
		<div class="col-md-10" >
      	<span>{{rvo.nickname}}</span>
      	<span>{{rvo.dbday}}</span>
      	<div style="border: 1px solid black;margin: 5px;">
      <b-form-textarea
	    id="textarea-no-resize"
	    placeholder="Fixed height textarea"
	    rows="3"
	    no-resize
	    v-model="rvo.content"
	    readonly
	  ></b-form-textarea>
      </div>
      </div>
      <div class="col-md-2" v-if="id==rvo.id">
      <br>
	      <b-button v-b-toggle:my-collapse class="genric-btn danger small circle arrow" >수정<b-icon icon="hammer"></b-icon></b-button>
	      <b-button class="genric-btn info small circle arrow">삭제<b-icon icon="backspace-fill"></b-icon></b-button>
      </div>
      <br>
      <div>
      	 <b-collapse id="my-collapse">
	      	
    	</b-collapse>
      </div>
      <div v-if="id==rvo.id">
      	<b-button v-b-toggle="'collapse-'+rvo.no" class="m-1 genric-btn info-border small"><b-icon icon="arrow-return-right"></b-icon></b-button>
      		
      		<b-collapse :id="'collapse-'+rvo.no">
      		<div class="row">
			  <div class="col-md-8">
		      		<b-form-textarea
					    id="textarea-no-resize"
					    placeholder="댓글 입력하세요"
					    rows="3"
					    no-resize
		         	 ></b-form-textarea>
		      </div>
		      <div class="col-md-2">
		      	<b-button class="genric-btn warning small" style="width:100%; height:100%;"><b-icon icon="vector-pen"></b-icon></b-button>
		      </div>
		    </div>
		  </b-collapse>
      </div>
      </div>
		  
	 
		 <div>
		   
		
		  <!-- Using value -->
		  
		
		  <!-- Element to collapse -->
		  
		  <b-collapse id="collapse-2">
		  
		    <div class="row" style="width: 100%">

				<div class="col-md-10">
		      <b-form-textarea
					    id="textarea-no-resize"
					    placeholder="댓글 입력하세요"
					    rows="3"
					    no-resize
		          ></b-form-textarea>
		      </div>
		      <div class="col-md-2">
		      	<b-button class="genric-btn warning small" style="width:100%; height:100%;"><b-icon icon="vector-pen"></b-icon></b-button>
		      </div>
		      </div>
		  </b-collapse>
		</div>
</div>
<hr>
<div class="row" style="width: 100%">
<h2><b-badge href="#" variant="secondary" v-if="id=='' ? notice='로그인 후 사용해주세요': notice=id" v-model="notice">{{notice}}</b-badge></h2>
</div>
<div class="row" style="width: 100%">

		<div class="col-md-10">
      <b-form-textarea
			    id="textarea-no-resize"
			    placeholder="댓글 입력하세요"
			    rows="3"
			    no-resize
			    v-model="content"
          ></b-form-textarea>
      </div>
      <div class="col-md-2">
      	<b-button class="genric-btn warning small" style="width:100%; height:100%;" @click="boardreplyInsert()"><b-icon icon="vector-pen"></b-icon></b-button>
      </div>
      </div>
</div>
</div>
</div>


<script>
new Vue({
	el:'.section-top-border',
	data:{
		isHovered: false,
		landboard_detail:{},
		no:'${no}',
		notice:'',
		id:'${sessionScope.id}',
		landboard_reply:[],
		content:'',
		size:''
	},
	mounted:function(){
		console.log('id: '+this.id)
		
		axios.get('http://localhost/web/landboard/landboard_detail.do',{
			params:{
				no:this.no
			}
		}).then(response=>{
			console.log(response.data)
			this.landboard_detail=response.data
		}).catch(error=>{
			console.log(error.response)
		})
		this.reply_list();
		this.size=landboard_reply.length
	},
	methods: {
	      handleHover(hovered) {
	        this.isHovered = hovered
	      },
	      reply_list(){
	          axios.get('http://localhost/web/landboard/landboardreply_list.do',{
	  	          params:{
	  				  bno:this.no
	  			  }
	  		  }).then(response=>{
	  		      console.log(response.data)
	  			  this.landboard_reply=response.data
	  		  }).catch(error=>{
	  			  console.log(error.response)
	  		  })
	      },
	      boardreplyInsert:function(){
	    	  axios.post("http://localhost/web/landboard/landboardreply_insert.do",null,{
	    		  params:{
	    			  bno:this.no,
	    			  content:this.content,
	    			  id:this.id
	    		  }
	    	  }).then(response=>{
	    		  console.log(response.data)
	    		  this.landboard_reply=response.data
	    		  this.content=''
	    	  }).catch(error=>{
	    		  console.log(error.response)
	    	  })
	      }
	}
})
</script>
</body>
</html>