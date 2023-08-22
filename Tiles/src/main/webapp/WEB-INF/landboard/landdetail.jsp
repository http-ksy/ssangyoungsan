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
	    <div v-b-hover="handleHover" class="py-3 px-4" style="width: 180px">
	      <b-icon v-if="isHovered" icon="arrow-left-circle-fill" scale="2"></b-icon>
	      <b-icon v-else icon="arrow-left-circle" scale="2"></b-icon>
	      <span class="ml-2" :class="isHovered ? 'text-info' : ''">&nbsp;목록으로!!!</span>
	    </div>
	  </div>
	</template>
	<br>
	<h2 style="color: #2d2d2d;">Second divided from form fish beast made every of seas
       all gathered us saying he our
     </h2>
     <ul class="blog-info-link mt-3 mb-4">
       <li><a href="#"><i class="fa fa-user"></i> Travel, Lifestyle</a></li>
       <li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
     </ul>
     <hr>
     <div class="quote-wrapper">
       <div class="quotes">
        MCSE boot camps have its supporters and its detractors. Some people do not understand why you
        should have to spend money on boot camp when you can get the MCSE study materials yourself at
        a fraction of the camp price. However, who has the willpower to actually sit through a
        self-imposed MCSE training.
      </div>
    </div>
    <hr>
    <p class="like-info"><span class="align-middle"><i class="fa fa-heart"></i></span> Lily and 4
  people like this</p>
 <h4><b-icon icon="chat-left"></b-icon>&nbsp;댓글!!!</h4>
 <hr>
<div>
<b-media>
      <template #aside>
      </template>

      <h5 class="mt-0">Media Title</h5>
      <p>
        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.
        Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc
        ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
      </p>
      <b-media>
        <template #aside>
          <b-icon icon="battery"></b-icon>
        </template>

        <h5 class="mt-0">Nested Media</h5>
        <p class="mb-0">
          Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in
          faucibus.
        </p>
      </b-media>
    </b-media>
</div>
</div>
</div>
</div>

<script>
new Vue({
	el:'.section-top-border',
	data:{
		isHovered: false,
		
	},
	methods: {
	      handleHover(hovered) {
	        this.isHovered = hovered
	      }
	    }
})
</script>
</body>
</html>