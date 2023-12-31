<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
/* .row{ */
/* 	width: 100%; */
/* } */
</style>
</head>
<body>      
	<footer>
    <!-- Footer Start-->
    <div class="footer-area footer-padding">
        <div class="container-fluid ">
            <div class="row d-flex justify-content-between" style="width:100%">
                <div class="col-xl-3 col-lg-3 col-md-8 col-sm-8">
                 <div class="single-footer-caption mb-50">
                   <div class="single-footer-caption mb-30">
                      <!-- logo -->
                      <div class="footer-logo mb-35">
                       <a href="index.html"><img src="../assets/img/logo/logo2_footer.png" style="width:120px;"></a>
                   </div>
                   <div class="footer-tittle">
                       <div class="footer-pera">
                       </div>
                   </div>
                   <!-- social -->
                   <div class="footer-social">
                </div>
            </div>
        </div> 
    </div>
    <div class="col-xl-2 col-lg-2 col-md-4 col-sm-4">
        <div class="single-footer-caption mb-50">
            <div class="footer-tittle">
                <h4>.zip사기 베스트 Top7</h4>
			      <ul class="nospace linklist">
			        <c:forEach var="vo" items="${elist}">
			        <li><a href="../zip/zip_detail.do?no=${vo.no }">${vo.name}<br>(${vo.dprice})</a></li>
			        
					</c:forEach>
			      </ul>
            </div>
        </div>
    </div>
    <div class="col-xl-2 col-lg-2 col-md-4 col-sm-4">
        <div class="single-footer-caption mb-50">
            <div class="footer-tittle">
                <h4>인테리어 베스트 TOP7</h4>
                <ul>
                <c:forEach var="vo" items="${iList }">
                    <li><a href="../inte/inte_detail.do?ino=${vo.ino }">${vo.title}<br>(${vo.price})</a></li>
                </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-xl-2 col-lg-2 col-md-4 col-sm-4">
        <div class="single-footer-caption mb-50">
            <div class="footer-tittle">
                <h4>스토어 가구 TOP7</h4>
                <ul>
                <c:forEach var="vo" items="${gList }">
                    <li><a href="../product/product_detail.do?no=${vo.no }&type=1">${vo.title}<br>(${vo.priced_sale}원)</a></li>
                </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div class="col-xl-2 col-lg-3 col-md-4 col-sm-4">
        <div class="single-footer-caption mb-50">
            <div class="footer-tittle">
                <h4>이사잘하는 집 TOP7</h4>
                <ul>
                <c:forEach var="vo" items="${cList }">
                    <li><a href="../clean/detail.do?cno=${vo.cno }">${vo.title } &nbsp;(${vo.score})</a></li>
                </c:forEach>
                </ul>
                <br>
                <h4>청소잘하는 집 TOP7</h4>
                <ul>
                <c:forEach var="vo" items="${mList }">
                    <li><a href="../move/detail.do?mno=${vo.mno }">${vo.title } &nbsp;(${vo.score})</a></li>
                </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    
    
</div>
</div>

<!-- footer-bottom area -->
<div class="footer-bottom-area">
    <div class="container">
        <div class="footer-border">
           <div class="row d-flex align-items-center">
               <div class="col-xl-12 ">
                   <div class="footer-copy-right text-center">
                       <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                          Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                          <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  </div>
  <!-- Footer End-->
</footer>
<!-- Search model end -->
<!-- Scroll Up -->
<div id="back-top" >
    <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
</div>
</body>
</html>