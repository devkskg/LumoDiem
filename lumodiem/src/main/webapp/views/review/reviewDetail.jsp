<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.lumodiem.board.memberboard.vo.*"  %>
<%Review review = (Review)request.getAttribute("review"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script>
<title>클래스 조회</title>
</head>
<body>
<%@ include file="/views/include/nav.jsp" %>
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
	<h3>리뷰 상세 정보</h3>
	<!-- 이건 나중에 작성 -->
	<div class="review">
		<ul>
			<li>
				<img src="${request.getContextPath}/filePath?attach_no=${review.attachNo}" style="width:300px" > 
			</li> 
			<li>
				<table>
					<tr>
						<td>제목</td>
						<td>${review.reviewName}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>${review.reviewTxt}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${review.accountNickname}</td>
					</tr>
					<tr>
						<td>등록일</td>
						<td>${review.reviewRegDate}</td>
					</tr>
					<tr>
						<td>수정일</td>
						<td>${review.reviewModDate}</td>
					</tr>
					<tr>
						<td colspan="2">
							<c:choose>
								<c:when test="${myLikeCount eq 0 }">
									<div class="icon"><span class="icon-heart-o" id="unlikeToLike">${totalLikeCount }</span></div>
								</c:when>
								<c:otherwise>
									<div class="icon"><span class="icon-heart" id="likeToUnlike">${totalLikeCount }</span></div>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
			</li>
		</ul> 
		<hr>
		<div class="reivew_cmt_list">
		<form>
			<table border="1">
				<thead>
					<tr>
						<th>내용</th>
						<th>닉네임</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty reviewCmt }">
						
							<c:forEach var="list" items="${reviewCmt }" varStatus="vs">
							
							<tr>
								<td>
									<input type="hidden" class="review_cmt_no" value="${list.reviewCmtNo}">
									<textarea class="review_cmt_txt" readonly="readonly" >${list.reviewCmtTxt}</textarea>
								</td>
								<td>
									<input type="text" class="account_nickname" value="${list.accountNickname}" readonly="readonly">
								</td>
								
								<%-- <td>${list.accountNickname}</td>  --%>
								<c:choose>
									<c:when test="${list.accountNo eq account.accountNo}">
										<td>
											<input class="a" type="button" value="수정">
											 <input type="button" class="delete_btn" value="삭제" style="display:none;">
										</td>
										<!-- <td><button class="a" type="button" >수정</button></td> -->
									</c:when>
								</c:choose>
								
							</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<td colspan="5">작성된 리뷰가 없습니다.</td>
						</c:otherwise>					
					
					</c:choose>
					
				</tbody>
			</table>
		</form>
		</div>
		
		<form action="<c:url value='/createCommentEnd'/>" method="post">
			<input type="text" value="${account.accountNo}" style="display: none" name="account_no">
			<input type="hidden" name="account_no" value="${review.accountNo }">
			<input type="hidden" name="review_no" value="${review.reviewNo }">
			<input type="text" name="review_cmt_txt" placeholder="내용을 입력하세요.">
			<input type="submit" value="등록">
			<!-- <input type="reset" value="취소"> -->
		</form>
	</div>
	<div>
	<c:choose>
		<c:when test="${review.accountNo eq account.accountNo }">
			<button type="button" id="updateBtn" name="updateBtn">
				<a href="/updateReviewPage?review_no=${review.reviewNo}">수정</a>
			</button>
			<button type="button" id="deleteBtn" name="deleteBtn">
				삭제
			</button>
		</c:when>
	</c:choose>
	</div>
	<script>
		$('#deleteBtn').click(function(){
			const reviewNo = ${review.reviewNo};
			const attachNo = ${review.attachNo};
			const check = confirm("삭제하시겠습니까?");
			if(check){
				$.ajax({
					url : "/deleteReviewPage",
					type : "post",
					data : {"review_no" : reviewNo
							,"attach_no" : attachNo},
					dataType : "json",
					success : function(data){
						alert(data.res_msg);
						if(data.res_code == "200"){
							location.href="/reviewBoard";
						}else{
							location.href="/";
						}
					}
				});
			}
		})
	</script>
					<div class="col-xl-8 py-5 px-md-5">
				</div>
			</div>
		</div>
	</section>
</div>



	<script>
		$(function(){
			let reviewNumber = "${review.reviewNo}";
			let unlikeToLike = "unlikeToLike";
			let likeToUnlike = "likeToUnlike";
			$(document).on('click', '#unlikeToLike', function(){
				$.ajax({
					url : "/reviewLikeChange",
					type : "post",
					data : {
						"review_no" : reviewNumber,
						"like" : unlikeToLike
					},
					dataType : 'json',
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data){
						if(data.res_code == "200"){
							alert('좋아요!');
							$('#unlikeToLike').text(data.newTotalLikeCount);
							$('#unlikeToLike').attr("id", "likeToUnlike").removeClass('icon-heart-o').addClass('icon-heart');
						} else{
							alert('오류. 홈페이지로 이동합니다.');
							location.href="/";
						}
					},
					error : function(){
						alert('ajax 실패1');
					}
				});
			});
			$(document).on('click', '#likeToUnlike', function(){
				$.ajax({
					url : "/reviewLikeChange",
					type : "post",
					data : {
						"review_no" : reviewNumber,
						"like" : likeToUnlike
						},
					dataType : 'json',
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data){
						if(data.res_code == "200"){
							alert('좋아요를 취소합니다.');
							$('#likeToUnlike').text(data.newTotalLikeCount);
							$('#likeToUnlike').attr("id", "unlikeToLike").removeClass('icon-heart').addClass('icon-heart-o');
						} else{
							alert('오류. 홈페이지로 이동합니다.');
							location.href="/";
						}
					},
					error : function(){
						alert('ajax 실패2');
					}
				});
			});
		})
		$(document).on('click', '.a', function () {
			    const row = $(this).closest('tr'); // 클릭한 버튼이 속한 <tr> 찾기
			    const textarea = row.find('.review_cmt_txt'); // 해당 <tr> 내부의 textarea 찾기
			
			    if (textarea.length) {
			        textarea.removeAttr("readonly"); 
			        textarea.focus(); 
			    }
			
			    $(this).removeClass('a');
			    $(this).addClass('b'); // 'a' 클래스를 제거하고 'b' 추가
			    $(this).val("저장");
			    row.find('.delete_btn').show();
			    alert('수정하십시오');
			});
			

			 $(document).on('click', '.b', function (){
	            const row = $(this).closest('tr');
	            const reviewCmtNo = row.find('.review_cmt_no').val(); 
	            const reviewCmtTxt = row.find('.review_cmt_txt').val(); 
	    			$.ajax({
	    				url : "/updateReviewCommentEnd",
	    				type : "post",
	    				data : {"review_cmt_no":reviewCmtNo,
	    					"review_cmt_txt":reviewCmtTxt},
	    				dataType : "JSON",
	    				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	    				success:function(data){
	    					alert(data.res_msg);
	    					
	    					if(data.res_code==200){
	    						location.reload();
	    					}else{
	    						location.reload();
	    					}
	    				}
	    			});
	        })
	        $(document).on('click','.delete_btn', function(){
	        	const row = $(this).closest('tr');
	        	const reviewCmtNo = row.find('.review_cmt_no').val(); 
				$.ajax({
					url : "/deleteReviewCommentEnd",
					type : "post",
					data : {"review_cmt_no":reviewCmtNo},
					dataType : "JSON",
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					
					success:function(data){
						alert(data.res_msg);
						
						if(data.res_code==200){
							location.reload();
						}else{
							location.reload();
						}
				}
			});
		})
		
		
		
	</script>
</body>
</html>