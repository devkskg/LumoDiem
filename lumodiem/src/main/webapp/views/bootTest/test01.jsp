<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <title>부트스트랩 테스트</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet"> -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/css/animate.css">
    
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">

    <link rel="stylesheet" href="/css/aos.css">

    <link rel="stylesheet" href="/css/ionicons.min.css">

    <link rel="stylesheet" href="/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/css/flaticon.css">
    <link rel="stylesheet" href="/css/icomoon.css">
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
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
			
			<!-- 메인 -->
			<div id="colorlib-main">
				<section class="ftco-section ftco-no-pt ftco-no-pb">
					<div class="container">
						<div class="row d-flex">
							<div class="col-xl-8 py-5 px-md-5">
								<div class="row pt-md-4">
									
								
								
									<!-- (게시판 작성할때 한 줄이라고 생각 하면 됨!) -->
									<div class="col-md-12 ">
									<div class="mfp-title">
										Title 위치
									</div>
										<div class="blog-entry ftco-animate d-md-flex">
											<a href="single.html" class="img img-2" style="background-image: url();"><img alt="뚱이" src=""></a>
											<div class="text text-2 pl-md-4">
												<h3 class="mb-2"><a href="single.html">제목 겸 a태그</a></h3>
												<div class="meta-wrap">
													<p class="meta">
														<span><i class="icon-calendar mr-2"></i>날짜 넣기</span>
														<span><a href="single.html"><i class="icon-folder-o mr-2"></i>좋아요 아이콘 넣기</a></span>
														<span><i class="icon-comment2 mr-2"></i>댓글 수 : 5</span>
													</p>
												</div>
												<p class="mb-4">간단한 내용 의미 없게 길게 써보기 시작한다 가나다라마바사 A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
												<p><a href="#" class="btn-custom">더 보기.. (a태그 속성에 url 써주자)<span class="ion-ios-arrow-forward"></span></a></p>
											</div>
										</div>
									</div>
									<!-- 한 줄 끝! -->
									
									<!-- (게시판 작성할때 한 줄이라고 생각 하면 됨!) -->
									<div class="col-md-12">
										<div class="blog-entry ftco-animate d-md-flex">
											<a href="single.html" class="img img-2" style="background-image: url();"><img alt="뚱이" src=""></a>
											<div class="text text-2 pl-md-4">
												<h3 class="mb-2"><a href="single.html">제목 겸 a태그</a></h3>
												<div class="meta-wrap">
													<p class="meta">
														<span><i class="icon-calendar mr-2"></i>날짜 넣기</span>
														<span><a href="single.html"><i class="icon-folder-o mr-2"></i>좋아요 아이콘 넣기</a></span>
														<span><i class="icon-comment2 mr-2"></i>댓글 수 : 5</span>
													</p>
												</div>
												<p class="mb-4">간단한 내용</p>
												<p><a href="#" class="btn-custom">더 보기.. (a태그 속성에 url 써주자)<span class="ion-ios-arrow-forward"></span></a></p>
											</div>
										</div>
									</div>
									<!-- 한 줄 끝! -->
									
									<div>
										<label for="test123">sdf : </label><input type="text" id="test123">
									</div>
									
									
								</div>
							</div>
						</div>
					</div>
				</section>
				
				
				
				
			</div>
			<!-- 메인 내용 끝 -->
	</div>
	<!-- 페이지 완성 -->
	
	<!-- 로더 -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
		</svg>
	</div>


	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/js/popper.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	<script src="/js/jquery.easing.1.3.js"></script>
	<script src="/js/jquery.waypoints.min.js"></script>
	<script src="/js/jquery.stellar.min.js"></script>
	<script src="/js/owl.carousel.min.js"></script>
	<script src="/js/jquery.magnific-popup.min.js"></script>
	<script src="/js/aos.js"></script>
	<script src="/js/jquery.animateNumber.min.js"></script>
	<script src="/js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/js/google-map.js"></script>
	<script src="/js/main.js"></script>
</body>
</html>