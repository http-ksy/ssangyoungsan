<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.single-input{
	display: inline;
}
</style>
</head>
<body>
<div class="section-top-border">
											<div class="row">
<div class="col-lg-8 col-md-8">
														
													<h1 class="mb-30 text-center">✍️글쓰기</h1>
													<div class="input-group-icon mt-10">
															<div class="icon"><b>🛹</b></div>
															<div class="form-select" id="default-select">
																<select>
																	<option value="1">자유게시판</option>
																	<option value="2">부동산</option>
																	<option value="3">가구</option>
																	<option value="4">청소/이사</option>
																	<option value="5">인테리어</option>
																</select>
															</div>
														</div>
													<div style="display: flex;">
													<div class="mt-10" style="width: 30%">
															<div class="form-select" id="default-select" >
																<select>
																	<option value="1">Country</option>
																	<option value="1">Bangladesh</option>
																	<option value="1">India</option>
																	<option value="1">England</option>
																	<option value="1">Srilanka</option>
																</select>
															</div>
													</div>&nbsp;
													<div class="mt-10" style="width: 100%">
															<input type="text" name="first_name" placeholder="First Name"
															onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" required
															class="single-input" >
													</div>
													</div>
															<!-- <input type="text" name="first_name" placeholder="First Name"
															onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" required
															class="single-input" style="width: 30%"> -->
															

														
														<div class="mt-10">
															<input type="text" name="Title" placeholder="Title 제목"
															onfocus="this.placeholder = ''" onblur="this.placeholder = 'Title 제목'" required
															class="single-input">
														</div>
														<!-- <div class="mt-10">
															<input type="text" name="last_name" placeholder="Last Name"
															onfocus="this.placeholder = ''" onblur="this.placeholder = 'Last Name'" required
															class="single-input">
														</div> -->
														<!-- <div class="mt-10">
															<input type="email" name="EMAIL" placeholder="Email address"
															onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address'" required
															class="single-input">
														</div> -->
														<!-- <div class="input-group-icon mt-10">
															<div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
															<input type="text" name="address" placeholder="Address" onfocus="this.placeholder = ''"
															onblur="this.placeholder = 'Address'" required class="single-input">
														</div> -->
														<!-- <div class="input-group-icon mt-10">
															<div class="icon"><i class="fa fa-plane" aria-hidden="true"></i></div>
															<div class="form-select" id="default-select">
																<select>
																	<option value=" 1">City</option>
																	<option value="1">Dhaka</option>
																	<option value="1">Dilli</option>
																	<option value="1">Newyork</option>
																	<option value="1">Islamabad</option>
																</select>
															</div>
														</div> -->
														<!-- <div class="input-group-icon mt-10">
															<div class="icon"><i class="fa fa-globe" aria-hidden="true"></i></div>
															<div class="form-select" id="default-select" style="width: 30%">
																<select>
																	<option value=" 1">Country</option>
																	<option value="1">Bangladesh</option>
																	<option value="1">India</option>
																	<option value="1">England</option>
																	<option value="1">Srilanka</option>
																</select>
															</div>
														</div> -->
														<div class="mt-10">
															<textarea class="single-textarea" placeholder="Message" onfocus="this.placeholder = ''"
															onblur="this.placeholder = 'Message'" required></textarea>
														</div>
														<div class="mt-10">
															<input type="text" name="first_name" placeholder="Primary color"
															onfocus="this.placeholder = ''" onblur="this.placeholder = 'Primary color'" required
															class="single-input-primary">
														</div>
														<div class="mt-10">
															<input type="text" name="first_name" placeholder="Accent color"
															onfocus="this.placeholder = ''" onblur="this.placeholder = 'Accent color'" required
															class="single-input-accent">
														</div>
														<div class="mt-10">
															<input type="text" name="first_name" placeholder="Secondary color"
															onfocus="this.placeholder = ''" onblur="this.placeholder = 'Secondary color'"
															required class="single-input-secondary">
														</div>
												</div>
												</div>
												</div>
<script>
new Vue({
	el:'.section-top-border',
	data:{
		boardtype:1
	}
})
</script>
</body>
</html>