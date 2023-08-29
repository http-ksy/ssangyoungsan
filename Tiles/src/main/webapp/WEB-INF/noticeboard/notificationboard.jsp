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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<div class="section-top-border">
<h1 class="mb-30 text-center">🙋🏾공지합니다🙋🏼‍♂️</h1>
											<div class="progress-table-wrap">
												<div class="progress-table table-striped">
													<div class="table-head">
														<div class="serial">글번호</div>
														<div class="percentage">글제목</div>
														<div class="serial">작성자</div>
														<div class="serial">등록일</div>
														<div class="serial">조회수</div>
													</div>
													<div class="table-row" v-for="vo in boardnotice_list">
														<div class="serial">{{vo.no}}</div>
														<div class="percentage"><a :href="'../noticeboard/notificationDetail.do?no='+vo.no" style="color: black">{{vo.subject}}</a></div>
														<div class="serial">{{vo.id}}</div>
														<div class="serial">{{vo.dbday}}</div>
														<div class="serial text-right !important ">{{vo.hit}}</div>
													</div>													
												</div>
											</div>
											<hr>
<div class="text-right">
	<a v-if="${sessionScope.admin=='admin' }" class="genric-btn danger-border circle arrow text-right" href="../noticeboard/notificationInsert.do">🐦‍⬛글</a>
</div>
		<div class="text-center">
         <ul class="pagination">
		   <li v-if="startPage>1"><a href="#" v-on:click="prev()">&laquo; Previous</a></li>
		   <li v-for="i in range(startPage,endPage)" :class="i==curpage?'active':''"><a href="#" v-on:click="pageChange(i)">{{i}}</a></li>
		   <li v-if="endPage<totalpage"><a href="#" @click="next()">Next &raquo;</a></li>
		 </ul>
        </div>
</div>
<script>
new Vue({
	el:'.section-top-border',
	data:{
		boardnotice_list:[],
		pageList:{},
		curpage:1,
		totalpage:0,
		startPage:0,
		endPage:0
	},
	mounted:function(){
		this.getList()
	},
	methods:{
		getList:function(){
			axios.get('../noticeboard/landnotice_list.do',{
				params:{
					page:this.curpage
				}
			}).then(res=>{
				console.log(res.data)
				this.boardnotice_list=res.data
			}).catch(error=>{
				console.log(error.res)
			})
			// page
			/* axios.get('../noticeboard/boardnotice_page.do',{
				params:{
					page:this.curpage
				}
			}).then(response=>{
				console.log(response.data)
				this.pageList=response.data
				this.perPage=this.pageList.totalpage
				this.curPage=this.pageList.curpage
			}) */
			axios.get('../noticeboard/boardnotice_page.do',{
				params:{
				   page:this.curpage
				}
			}).then(response=>{
				console.log(response.data)
				this.page_list=response.data
				this.curpage=this.page_list.curpage
				this.totalpage=this.page_list.totalpage
				this.startPage=this.page_list.startPage
				this.endPage=this.page_list.endPage;
			}).catch(error=>{
				console.log(error.response)
			})
		},
	
	// page notice
		range:function(start,end){
			let arr=[];
			
			if(end>this.totalpage){
				end=this.totalpage
			}
			let length=end-start;
			console.log('length :'+length)
			for(let i=0;i<=length;i++)
			{
			   arr[i]=start;
			   start++;
			}
			return arr;
		},
		pageChange:function(page){
			this.curpage=page;
			this.getList()
		},
		prev:function(){
			this.curpage=this.startPage-1;
			this.getList()
		},
		next:function(){
			this.curpage=this.endPage+1;
			this.getList()
		}
	}
})
</script>
</body>
</html>