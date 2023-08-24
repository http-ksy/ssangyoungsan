<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<thead><h3>예약정보</h3></thead>
	<table class="table">
  			<tr>
  				<c:forTokens items="${fvo.poster }" delims="^" var="img">
  					<td>
  						<img src="${img }" style="width: 100%">
  					</td>
  				</c:forTokens>
  			</tr>
  			<table class="table">
  				<tr>
  					<td colspan="2">
  						<h3>${fvo.title }&nbsp;<span style="color: orange;">${fvo.score }</span></h3>
  					</td>
  				</tr>
  				<tr>
  					<th width="20%" class="text-center">주소</th>
  					<td width="80%">${fvo.address }
  					</td>
  				</tr>
  				<tr>
  					<th width="20%" class="text-center">전화</th>
  					<td width="80%">${fvo.tel }</td>
  				</tr>
  				<tr>
  					<th width="20%" class="text-center">음식종류</th>
  					<td width="80%">${fvo.type }</td>
  				</tr>
  				<tr>
  					<th width="20%" class="text-center">가격대</th>
  					<td width="80%">${fvo.price }</td>
  				</tr>
  				<tr>
  					<th width="20%" class="text-center">주차</th>
  					<td width="80%">${fvo.parking }</td>
  				</tr>
  				<c:if test="${fvo.menu!='no' }">
  				<tr>
  					<th width="20%" class="text-center">메뉴</th>
  					<td width="80%">${fvo.menu }
  						<ul>
  							<c:forTokens items="${fvo.menu }" delims="원" var="m">
  								<li>${m }</li>
  							</c:forTokens>
  						</ul>
  					</td>
  				</tr>
  				</c:if>
  			</table>
  			<table class="table">
  				
  				<tr>
  					<th width="20%" class="text-center">예약번호</th>
  					<td width="30%" class="text-center">${rfvo.fno }</td>
  					<th width="20%" class="text-center">예약일</th>
  					<td width="30%" class="text-center">${rfvo.frday }</td>
  				</tr>
  				<tr>
  					<th width="20%" class="text-center">예약시간</th>
  					<td width="30%" class="text-center">${rfvo.frtime }</td>
  					<th width="20%" class="text-center">예약인원</th>
  					<td width="30%" class="text-center">${rfvo.finwon }</td>
  				</tr>
  				<tr>
  					<th width="20%" class="text-center">등록일</th>
  					<td colspan="3" class="text-left">${rfvo.fdbday }</td>
  				</tr>
  			</table>
  	</table>
</body>
</html>