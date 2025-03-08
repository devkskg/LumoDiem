<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${approveCode eq 'A' }">
		<title>승인 완료 클래스</title>
	</c:when>
	<c:when test="${approveCode eq 'S' }">
		<title>승인 대기 클래스</title>
	</c:when>
	<c:when test="${approveCode eq 'D' }">
		<title>반려된 클래스</title>
	</c:when>
</c:choose>
<style>
    .list-group-item a {
        color: #000 !important;  /* 글자 색상 검은색 강제 변경 */
        text-decoration: none;   /* 링크 밑줄 제거 */
    }

    h3.text-primary {
        color: #000 !important;  /* "마이페이지" 글자 검은색 */
    }

    .list-group-item {
        border-bottom: 1px solid #ddd; /* 밑줄 추가 */
        display: flex;
        align-items: center; /* 세로 정렬 */
    }

    .list-group-item .badge {
        margin-left: auto; /* "+" 기호만 우측 정렬 */
    }

    /* TD 정렬 설정 */
    td:first-child {
        text-align: left;  /* 첫 번째 <td> 왼쪽 정렬 */
    }

    td:last-child {
        text-align: right;  /* 두 번째 <td> 오른쪽 정렬 */
    }
    .clickable-row:hover {
	    background-color: #E8F7DC; /* 마우스 오버 시 색상 변경 */
	    cursor: pointer;           /* 커서를 포인터로 변경 */
	}
    a.btn-outline-danger {
	    background-color: #F1948A !important;  /* 배경색 강제 적용 */
	    color: #fff !important;                /* 글자 색상 강제 적용 */
	    border: none;                          /* 부트스트랩의 기본 테두리 제거 */
	}
    a.btn-outline-primary {
	    background-color: #E8DAEF !important;  /* 배경색 강제 적용 */
	    color: #4A235A !important;                /* 글자 색상 강제 적용 */
	    border: none;                          /* 부트스트랩의 기본 테두리 제거 */
	}
	.mypage-box {
	    background-color: #FFFFEF;  /* 연한 살구색 */
	    border: 1px solid #E6B0AA;  /* 은은한 로즈 컬러 테두리 */
	    border-radius: 10px;
	    padding: 20px;
	    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); /* 은은한 그림자 */
	}

	
	    
</style>
</head>
<body>
	<%@ include file="/views/include/nav.jsp"%>


	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
							<div>
								<h3 class="sidebar-heading">Categories</h3>
							</div>

						</div>
						<div class="meta-wrap">
							<ul class="categories">
								<li>1</li>
								<li>2</li>
								<li>3</li>
								<li>4</li>
							</ul>
						</div>



						<div>
						
						
						
							<c:choose>

								<c:when test="${not empty approveList }">

									<c:forEach var="list" varStatus="vs" items="${approveList }">
										<div>
											<ul>
												<li>
													<a href="<c:url value='/klassDetail?klass_no=${list.klassNo }'/>">${list.klassName}${list.accountNickname}
													${list.klassTxt }</a>
												</li>
											</ul>
										</div>
									</c:forEach>
									
								</c:when>
								
								
								<c:otherwise>
									<div>해당되는 게시글이 존재하지 않습니다.</div>
								</c:otherwise>
							</c:choose>
							
							
							
							
						</div>



					</div>




				</div>
			</div>
		</section>
	</div>
	
	
	
	
	
	
	
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
				    <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
				        <div class="mypage-box" style="max-width: 60%; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); ">
				            <h3 class="text-primary text-center mb-4">
				            	<c:choose>
									<c:when test="${approveCode eq 'A' }">
										승인 완료 클래스
									</c:when>
									<c:when test="${approveCode eq 'S' }">
										승인 대기 클래스
									</c:when>
									<c:when test="${approveCode eq 'D' }">
										반려된 클래스
									</c:when>
								</c:choose>
				            </h3>
							<ul class="list-group mb-4">
							    
							    
							    
								<li class="list-group-item" style="background-color: #F8FFEF;">
								    <table style="width: 100%; border-collapse: collapse;">
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row">
								        	<th>No.</th>
								        	<th>클래스명</th>
								        	<th>작성자 닉네임</th>
								        </tr>
								        
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/hostMypageApproveKlass?approve_code=S'/>" style="cursor: pointer;">
								        
								        </tr>
								        
								        
								        
								        
								        
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/hostMypageApproveKlass?approve_code=S'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">승인 대기 클래스</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/hostMypageApproveKlass?approve_code=D'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">반려된 클래스</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/hostMypageReview'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">클래스 리뷰 조회</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/mypageLike'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">좋아요 목록 조회</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/mypageCmt'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">작성 댓글 조회</td>
								            <td style="padding: 8px;">(+)</td>
								            
								       	<tr style="font-weight: bold;"> 
									    	<td style=" padding: 8px; ">
										        <a href='<c:url value="/mypageUpdateDelete?val=update"/>' class="btn btn-outline-primary" style="font-weight: bold;">
										            회원정보 수정
										        </a>
										    </td>
										    <td style="padding: 8px; ">
										        <a href='<c:url value="/mypageUpdateDelete?val=delete"/>' class="btn btn-outline-danger" style="font-weight: bold;">
										            회원 탈퇴
										        </a>
										    </td>
										</tr>
							
								    </table>
								</li>

							</ul>
				        </div>
				    </div>
		    	</div>
		    </div>
	    </section>
    </div>
    
<script>
    document.querySelectorAll('.clickable-row').forEach(row => {
        row.addEventListener('click', function() {
            const url = row.getAttribute('data-url');
            if (url) {
                window.location.href = url;
            }
        });
    });
</script>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


</body>
</html>