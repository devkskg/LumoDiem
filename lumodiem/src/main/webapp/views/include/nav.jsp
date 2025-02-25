<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet"> -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<c:url value='/css/open-iconic-bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/animate.css'/>">
    
    <link rel="stylesheet" href="<c:url value='/css/owl.carousel.min.css'/>">
    
    <link rel="stylesheet" href="<c:url value='/css/owl.theme.default.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/magnific-popup.css'/>">

    <link rel="stylesheet" href="<c:url value='/css/aos.css'/>">

    <link rel="stylesheet" href="<c:url value='/css/ionicons.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/css/bootstrap-datepicker.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/jquery.timepicker.css'/>">

    
    <link rel="stylesheet" href="<c:url value='/css/flaticon.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/icomoon.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    

	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight" >
		
			<%-- <c:url value="/views/include/nav.jsp" var="nav"/>
			<c:import url="${nav}"/> --%>
			<!-- c태그 이상시 아래의 include 태그 활성화 -->
			<%-- <%@ include file="/views/include/nav.jsp" %> --%>
			<nav id="colorlib-main-menu" role="navigation">
	<ul>
		<li class="colorlib-active">
			<a href="/">홈</a>
		</li>
		<li>
			<a href="/klassBoard">클래스 게시판</a>
		</li>
		<li>
			<a href="/reviewBoard">리뷰 게시판</a>
		</li>
		<c:choose>
			<c:when test="${empty account}">
				<li>
					<a href="/accountCreateSelect">회원가입</a>
				</li>
				<li>
					<a href="/login">로그인</a>
				</li>
				<li>
					<a>게스트</a>
				</li>
			</c:when>
			
			<c:when test="${account.accountGrade eq  'M'}">
				<li>
					<a href="/memberMyPage">마이페이지</a>
				</li>
				<li>
					<a>참여자</a>
				</li>
			</c:when>
			
			<c:when test="${account.accountGrade eq 'H' }">
				<li>
					<a href="/hostMyPage">마이페이지</a>
				</li>
				<li>
					<a>주최자</a>
				</li>
			</c:when>
			
			<c:when test="${account.accountGrade eq 'A' }">
				<li>
					<a href="/adminPage">관리자 페이지</a>
				</li>
				<li>
					<a>관리자</a>
				</li>
			</c:when>
		</c:choose>
		<c:if test="${not empty account}">
				<li>
					<a href="/logout">로그아웃</a>
				</li>
		</c:if>
	</ul>
</nav>
			
			
			<!-- 왼쪽 네비게이션바 -->
			<div class="colorlib-footer">
				<h1 id="colorlib-logo" class="mb-4"><a href="index.html"
						style="background-image: url(images/bg_1.jpg);">Lumo Diem<span>Moore</span></a></h1>
				<div class="mb-4">
					<h3>Subscribe for newsletter</h3>

					<form action="#" class="colorlib-subscribe-form">
						<div class="form-group d-flex">
							<input type="text" class="form-control" placeholder="Enter Email Address">
							<div class="icon"><span class="icon-paper-plane"></span></div>
						</div>
					</form>

				</div>
				<p class="pfooter">
					Copyright &copy;
					<script>document.write(new Date().getFullYear());</script> 
						LumoDiem 원데이 클래스
					<i class="icon-heart" aria-hidden="true"></i> by 
					<a href="https://colorlib.com" target="_blank">응애 로켓단</a>
				</p>
			</div>
		</aside>
	</div>











	
	<!-- 로더 -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
	</div>


	<script src="<c:url value='/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/js/jquery-migrate-3.0.1.min.js'/>"></script>
	<script src="<c:url value='/js/popper.min.js'/>"></script>
	<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/js/jquery.easing.1.3.js'/>"></script>
	<script src="<c:url value='/js/jquery.waypoints.min.js'/>"></script>
	<script src="<c:url value='/js/jquery.stellar.min.js'/>"></script>
	<script src="<c:url value='/js/owl.carousel.min.js'/>"></script>
	<script src="<c:url value='/js/jquery.magnific-popup.min.js'/>"></script>
	<script src="<c:url value='/js/aos.js'/>"></script>
	<script src="<c:url value='/js/jquery.animateNumber.min.js'/>"></script>
	<script src="<c:url value='/js/scrollax.min.js'/>"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="<c:url value='/js/google-map.js'/>"></script>
	<script src="<c:url value='/js/main.js'/>"></script>
