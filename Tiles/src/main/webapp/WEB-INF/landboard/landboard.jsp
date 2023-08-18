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
<div class="section-top-border">
<h1 class="mb-30 text-center">소통해요</h1>
	<div class="text-right">
	
													
														<div class="default-select" id="default-select">
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
														</div>

													&nbsp;
	
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
													<div class="table-row">
														<div class="serial">01</div>
														<div class="percentage">Canada</div>
														<div class="serial">645032</div>
														<div class="serial">22-12-21</div>
														<div class="serial text-right !important ">작성자</div>
													</div>
													<div class="table-row">
														<div class="serial">01</div>
														<div class="percentage">Canada</div>
														<div class="serial">645032</div>
														<div class="serial">22-12-21</div>
														<div class="serial">작성자</div>
													</div>
													<div class="table-row">
														<div class="serial">01</div>
														<div class="percentage">Canada</div>
														<div class="serial">645032</div>
														<div class="serial">22-12-21</div>
														<div class="serial">작성자</div>
													</div>
													<div class="table-row">
														<div class="serial">01</div>
														<div class="percentage">Canada</div>
														<div class="serial">645032</div>
														<div class="serial">22-12-21</div>
														<div class="serial">작성자</div>
													</div>
													<div class="table-row">
														<div class="serial">01</div>
														<div class="percentage">Canada</div>
														<div class="serial">645032</div>
														<div class="serial">22-12-21</div>
														<div class="serial">작성자</div>
													</div>
													
												</div>
											</div>
<template >
  <div class="overflow-auto">
    <b-pagination
      v-model="currentPage"
      :total-rows="rows"
      :per-page="perPage"
      aria-controls="my-table"
      align="center"
    ></b-pagination>

    <p class="mt-3">Current Page: {{ currentPage }}</p>

    <b-table
      id="my-table"
      :items="items"
      :per-page="perPage"
      :current-page="currentPage"
      small
    ></b-table>
  </div>
</template>
</div>
<script>
new Vue({
	el:'.section-top-border',
	data:{
		currentPage:1
	}
})
</script>
</body>
</html>