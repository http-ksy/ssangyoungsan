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
</head>
<body>
<div class="section-top-border">
<h1 class="mb-30 text-center">🙋🏾소통해요🙋🏼‍♂️</h1>
														<!-- <div class="default-select" id="default-select">
															<select>
																<option value="1">부동산</option>
																<option value="1">인테리어</option>
																<option value="1">가구</option>
																<option value="1">청소</option>
																<option value="1">이사</option>
															</select>
															<a class="genric-btn danger-border circle arrow text-right"
															href="../landboard/landinsert.do"
															>new 글</a>
														</div> -->
<div>
  <b-tabs content-class="mt-3" fill align="left" style="color:black;">
    <b-tab title="자유게시판" title-link-class="text-primary" @click="getList(1)"></b-tab>
    <b-tab title="부동산" title-link-class="text-primary" @click="getList(2)"></b-tab>
    <b-tab title="이사/청소" title-link-class="text-primary" @click="getList(3)"></b-tab>
    <b-tab title="가구" title-link-class="text-primary" @click="getList(4)"></b-tab>
    <b-tab title="인테리어" title-link-class="text-primary" @click="getList(5)"></b-tab>
  </b-tabs>
</div>
											<div class="progress-table-wrap">
												<div class="progress-table table-striped">
													<div class="table-head">
														<div class="serial">글번호</div>
														<div class="percentage">글제목</div>
														<div class="serial">작성자</div>
														<div class="serial">등록일</div>
														<div class="serial">조회수</div>
													</div>
													<div class="table-row" v-for="vo,index in landboard_list">
														<div class="serial">{{vo.no}}</div>
														<div class="percentage"><a :href="'../landboard/detail.do?no='+vo.no" style="color: black">{{vo.title}}</a></div>
														<div class="serial">{{vo.id}}</div>
														<div class="serial">{{vo.dbday}}</div>
														<div class="serial text-right !important ">{{vo.hit}}</div>
													</div>													
												</div>
											</div>
											<hr>
<div class="text-right">
	<a v-if="${sessionScope.id!=null }" class="genric-btn danger-border circle arrow text-right" href="../landboard/landinsert.do">🐦‍⬛글</a>
</div>
<template>
  <div class="overflow-auto">
    <b-pagination
      v-model="currentPage"
      :per-page="perPage"
      first-text="First"
      :total-rows="rows"
      prev-text="Prev"
      next-text="Next"
      last-text="Last"
      align="center"
    ></b-pagination>
  </div>
  <template>
  	currentPage : {{currentPage}}
  </template>
</template>
</div>
<script>
new Vue({
	el:'.section-top-border',
	data:{
		currentPage:1,
		boardno:1,
		landboard_list:[],
		pageList:{},
        perPage:10,  // 전체 페이지 수
        rows:0
	},
	mounted:function(){
		this.getList(this.boardno)
	},
	updated:function(){
		this.getList(this.boardno)
	},
	methods:{
		getList:function(bno){
			this.boardno=bno;
			axios.get('http://localhost/web/landboard/landboard_list.do',{
				params:{
					bno:bno,
					page:this.currentPage
				}
			}).then(res=>{
				console.log(res.data)
				this.landboard_list=res.data
				this.rows=this.landboard_list.length
			}).catch(error=>{
				console.log(error.res)
			})
			axios.get('http://localhost/web/landboard/landboard_page.do',{
				params:{
					bno:bno,
					page:this.currentPage
				}
			}).then(response=>{
				console.log(response.data)
				this.pageList=response.data
				this.perPage=this.pageList.totalpage
				this.curPage=this.pageList.curpage
			})
		}
	}
})
</script>
</body>
</html>