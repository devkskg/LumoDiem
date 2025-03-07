<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script> --%>
<title>클래스 상세조회</title>
<link rel="stylesheet" href="<c:url value='/chatcss/chat.css'/>">
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script> -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Bundle (JS + Popper.js) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ include file="/views/include/nav.jsp" %>
<div id="colorlib-main">
	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row d-flex">
			
			
			
			
			
			
			
			
			
			
			
				<div class="col-xl-8 py-5 px-md-5">
					<div class="row pt-md-4">
					
	<div class="klass_detail">

	
		<form action="" name="detail_klass_form">
		<div>
			<c:choose>
				<c:when test="${klass.accountNo eq account.accountNo or account.accountGrade eq 'A' }">
				<a href="/klassBoardUpdate?klass_no=${klass.klassNo }">
					<button type="button" id="updateBtn" name="updateBtn">
						수정
					</button>
				</a>
				<button type="button" id="deleteBtn" name="deleteBtn">
					삭제
				</button>
				</c:when>
			
			</c:choose>
			
		</div>
		<div>
			<c:forEach var="list" items="${klassAttach }" varStatus="vs">
				<img src="<%=request.getContextPath()%>/klassFilePath?attach_no=${list.attachNo}" style="height: 255px">
			</c:forEach>
		</div>
		<hr>
		<input type="hidden" value="${klass.klassNo}" name="klass_no">
			<table>
				<tr>
					<th>클래스명</th>
					<td>${klass.klassName}</td>
				</tr>
				<tr>
					<th>주최자</th>
					<td>${klass.accountNickname}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${fn:substring(klass.klassTxt,0,5)}</td>
					<!--<td>${klass.klassTxt}</td> -->
				</tr>
				<tr>
					<th>일정</th>
					<td>
						<c:forEach var="li" items="${klassDate }" varStatus="vs">
							${fn:substring(li.klassStart,0,10)}<br>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>시간</th>
					<td>
						<c:forEach var="li" items="${klassDate }" varStatus="vs">
							${fn:substring(li.klassStart,11,19)}<br>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>최대(예약가능)</th>
					<%-- <td>${klass.klassMax}명(${klass.klassMax - klassDate.klassCount}명)</td> --%>
					<td>
						<c:forEach var="li" items="${klassDate }" varStatus="vs">
							${klass.klassMax}명(${klass.klassMax - li.klassCount}명)<br>
						</c:forEach>
					
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${klass.klassAddress }</td>
				</tr>
				<tr>
					<th>수업료</th>
					<td>${klass.klassPrice }원</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${klass.klassRegDate}</td>
				</tr>
				<%-- <tr>
					<th>상세 내용</th>
					<td>${klass.klassTxt}</td>
				</tr> --%>
				<tr>
					<td>
						<c:choose>
							<c:when test="${myLikeCount eq 0 }">
								<div class="icon"><span class="icon-heart-o" id="unlikeToLike">${totalLikeCount }</span></div>
							</c:when>
							<c:otherwise>
								<div class="icon"><span class="icon-heart" id="likeToUnlike">${totalLikeCount }</span></div>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<button type="button" class="btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
						🚨
						</button>
						<div class="modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
						  <div class="modal-dialog">
						    <div class="modal-content" >
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <!-- <label for="memberBirth">신고하기</label> -->
					              <!-- <input type="date" class="form-control" name="member_birth" id="memberBirth" value="yyyy-MM-dd"
				   					 min="1920-01-01"> -->
				   					 <input type="radio" name="reportKlass" id="abuse" value="욕설">
				   					 <label for="aduse">욕설</label><br>
				   					 <input type="radio" name="reportKlass" id="hateSpch" value="비하발언">
				   					 <label for="hateSpch">비하발언</label><br>
				   					 <input type="radio" name="reportKlass" id="improperNickname" value="부적절한 닉네임">
				   					 <label for="improperNickname">부적절한 닉네임</label><br>
				   					 <input type="radio" name="reportKlass" id="adv" value="광고">
				   					 <label for="adv">광고</label>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn-secondary" data-bs-dismiss="modal">취소</button>
						        <button type="button" class="btn-primary">신고</button>
						      </div>
						    </div>
						  </div>
						</div>
					</td>
				</tr>
			</table>		
		
		
		</form>

		<form>
		<c:choose >
			<c:when test="${account.accountGrade eq 'M'}">
			<a>클래스 예약 가능일 : </a>
			<select name="resKlassSelect" id="resKlassSelect">
				<c:forEach var="date" items="${klassDate}" varStatus="vs">
					<option value="${date.klassDateNo}">${date.klassStart} ~ ${fn:substring(date.klassEnd,11,19)}</option>
				</c:forEach>
			</select><br>
				<span id="minusSpan">➖</span>
				<span id="numberSpan">1</span>
				<span id="plusSpan">➕</span>
				<%-- <c:choose>     결제 되면 예약취소로
				<c:when test="${reservation.pay_status eq 'C'}"> --%>
				<button type="button" id="resBtn" name="resBtn">예약하기</button>
		           <button type="button" id="cnclBtn" name="cnclBtn">예약취소</button>
				<%-- </c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose> --%>
			</c:when>
		</c:choose>
			<%-- <c:when test="${account.accountGrade eq 'M' or account.accountGrade eq 'H'}"> --%>
				<!-- <a href="/klassReport">
					<button type="button" id="rptBtn" name="rptBtn">
						신고하기
					</button>
				</a> -->
			<%-- </c:when> --%>
			
	

		</form>

		<hr>
		<form>
			<div>
				${klass.klassTxt}
			</div>
		</form>
		<hr>
		<form>
			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>닉네임</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty review }">
						
							<c:forEach var="list" items="${review }" varStatus="vs">
							<tr>
								<td>${vs.count}</td>						
								<td>${list.reviewName}</td>
								<td>${list.reviewTxt}</td>
								<td>${list.accountNickname}</td>
								<td>${list.reviewRegDate}</td>
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
	

            <!-- 채팅 패널 (Bootstrap 5: 카드 형태로 대체) -->
            <!-- BootStrap 3 -> 5 버전으로 대체! -->
            <div class="container">
              <div class="row">
                <div class="col-md-6">
                  <div class="card border-primary">
                    <div class="card-header bg-primary text-white">
                      <span class="me-2">Chat</span>
                      <div class="btn-group float-end">
                        <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-bs-toggle="dropdown">
                          <span class="glyphicon glyphicon-chevron-down"></span> <!-- glyphicons는 별도 아이콘 필요 -->
                        </button>
                        <ul class="dropdown-menu">
                          <li>
                            <a id="refreshBtn" class="dropdown-item" style="cursor:pointer">
                              <span class="glyphicon glyphicon-refresh"></span> 새로고침
                            </a>
                          </li>
                          <li>
                            <a class="dropdown-item" target="_blank"
                               href="https://www.istockphoto.com/kr/%EC%82%AC%EC%A7%84/cute-corgi-dog-in-a-wildflower-cage-sits-on-a-summer-sunny-meadow-gm1967994177-558259453?utm_source=pixabay&utm_medium=affiliate&utm_campaign=sponsored_image&utm_content=srp_topbanner_media&utm_term=%EA%B7%80%EC%97%AC%EC%9A%B4+%EB%8F%99%EB%AC%BC">
                              😉빛나는 하루!😉
                            </a>
                          </li>
                        </ul>
                      </div>
                    </div>
                    <div class="card-body"  id="chatBody" style="display: flex; height: 400px; overflow-y: auto; justify-content: center; align-items: center;">
                      <button type="button" id="chatStartBtn" class="btn btn-primary">채팅방 입장하기</button>
                      <ul class="chat" id="chatUl" style="list-style:none; margin:0; padding:0;"></ul>
                    </div>
                    <div class="card-footer">
                      <div class="input-group">
                        <input id="sendInput" type="text" class="form-control" placeholder="메세지를 입력해주세요." />
                        <button type="button" class="btn btn-warning" id="sendBtn">Send</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>


					</div>
				</div>
			</div>
		</div>
	</section>
</div>

 <script>
		$('.btn-primary').click(function(){
			const klassNo = ${klass.klassNo};
			const accountNo = ${account.accountNo}
			let rp = $('.modal-body input[name="reportKlass"]:checked').val();
			console.log(rp);
			console.log(klassNo);
			console.log(accountNo);
			const rpCheck = confirm("신고하시겠습니까?");
			if(rpCheck){
				$.ajax({
					url : "/klassReport",
					type : "post",
					data : {"klass_no" : klassNo
							,"account" : accountNo
							,"report_klass_txt" : rp},
					datatype : "json",
					success : function(data){
						alert(data.res_msg);
						if(data.res_code == "200"){
							location.href="/klassBoardList";
						}else{
							location.href="/";
						}
					}
				});
			}
		})
	</script>
<script>
	$('#deleteBtn').click(function(){
		const klassNo = ${klass.klassNo}; 
		const check = confirm("삭제하시겠습니까?");
		const attachNo = ${klass.attachNo};
		if(check){
			$.ajax({
					url : "klassBoardDelete",
					type : "post",
					data : {"klass_no" : klassNo
						,"attach_no" : attachNo},
					dataType : "JSON",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data){
						if(data.res_code == "200"){
							alert(data.res_msg);
							location.href="/klassBoardList";
						} else{
							alert(data.res_msg);
							location.href='/klassDetail?klass_no='+klassNo;
						}
					}
			});
		}
	});
	$('#minusSpan').click(function(){
		let downPpl = document.getElementById('numberSpan').innerHTML;
		let downResCnt = Number(downPpl);
		if(downResCnt > 1){
			downResCnt --;
			document.getElementById('numberSpan').innerHTML = downResCnt;
		}
			
	});
	$('#plusSpan').click(function(){
		let upPpl = document.getElementById('numberSpan').innerHTML;
		let upRescnt = Number(upPpl);
		if(upRescnt < 4){
			upRescnt ++;
			document.getElementById('numberSpan').innerHTML = upRescnt;
		}
	});

	$(document).on('click','#resBtn',function(){
		const klassDateNo = $('#resKlassSelect').val();
		const resPpltxt = $('#numberSpan').text();
		const klassNo = ${klass.klassNo};
		resPpl = Number(resPpltxt);
		const ck = confirm("예약하시겠습니까?");
		if(ck){
			$.ajax({
				url : "/klassReservation",
				type : "post",
				data : {"klass_date_no" : klassDateNo
						,"res_ppl" : resPpl
						,"klass_no" : klassNo},
				dataType:'json',
				success : function(data){
					alert(data.res_msg);
					if(data.res_code == "200"){
						window.location.href = data.paymentResponse.next_redirect_pc_url;
					} else{
					}
				},
				error : function(a, b, c){
					alert('결제 요청 중 오류 발생' + "a: " + a + ", b: " + b + ", c:" + c);
				}
			});
			/* // URL에서 pg_token 추출
			function getPgTokenFromUrl() {
			    const urlParams = new URLSearchParams(window.location.search);
			    return urlParams.get("pg_token");
			} */
		
		}
	});
	
	
	
</script>
<script>
$(document).on('click','#cnclBtn',function(){
	const resNumber = ${res_no};
	// const kdn = "${reservation.klassDateNo}";
	console.log(resNumber);
	const deleteCheck = confirm("예약 취소하시겠습니까?");
	if(deleteCheck){
		$.ajax({
			url:"/cnclReservation",
			type:"post",
			data:{"res_no" : resNumber},
			dataType:"json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(data){
				alert(data.res_msg);
				if(data.res_code == "200"){
					location.href="/klassBoardList";
				} else{
					location.href='/';
				}
			}
		});
	}
	
}); 
</script>

	<script>
		/* 좋아요X -> 좋아요O */
		$(function(){
			let klassNumber = "${klass.klassNo}";
			let unlikeToLike = "unlikeToLike";
			let likeToUnlike = "likeToUnlike";
			$(document).on('click', '#unlikeToLike', function(){
				$.ajax({
					url : "/klassLikeChange",
					type : "post",
					data : {
						"klass_no" : klassNumber,
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
			/* 좋아요O -> 좋아요X */
			$(document).on('click', '#likeToUnlike', function(){
				$.ajax({
					url : "/klassLikeChange",
					type : "post",
					data : {
						"klass_no" : klassNumber,
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
		
		/* 채팅방 기능 AJAX */
		const chatAjax = function(klassNoPara, chatTxtPara, klassAccountNoPara){
			// console.log("test합니다.");
			return $.ajax({
				url : "/klassChat",
				type : "post",
				data : {
					"chatTxt" : chatTxtPara,
					"klassAccountNo" : klassAccountNoPara,
					"klassNo" : klassNoPara
					},
				dataType : 'json',
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data){
					$('#chatUl').html('');
					if(data.res_code == "200"){
						let val = "";
						for(let i = 0; i < data.chatList.length; i++){
							console.log(data.chatList[i].chatTxt);
							if(data.chatList[i].includes("(Member)")){
								val += '<li class="left clearfix"><div class="chat-body clearfix" style="text-align: right"><strong class="primary-font">' + '</strong><p style="text-align: right">' + data.chatList[i] + '</p></div></li>';									
							} else{
								val += '<li class="right clearfix"><div class="chat-body clearfix" style="text-align: left"><strong class="primary-font">' + '</strong><p style="text-align: left">' + data.chatList[i] + '</p></div></li>';
							}
						}
						$('#chatUl').append(val);
					} else{
						alert('오류. 홈페이지로 이동합니다.');
						location.href="/";
					}
				},
				error : function(){
					alert('채팅 불러오기에 실패했습니다.');
				}
			});
		};
		/* 채팅방 입력버튼(클릭) */
		$(function(){
			$(document).on('click', '#sendBtn', function(){
				let klassNo = "${klass.klassNo}";
				let klassAccountNo = "${klass.accountNo}";
				let chatTxt = $('#sendInput').val();
				$("#chatBody").css("display", "");
				
				if(chatTxt == ''){
					alert('메세지를 입력해주세요!');
				} else if(chatTxt.includes("(Host)") || chatTxt.includes("(Member)")){
					alert('금칙어 (Host), (Member) 가 들어있습니다.');
				} else{
					chatAjax(klassNo, chatTxt, klassAccountNo).done(function(){
						$('#sendInput').val('');
						
						$('#chatBody').scrollTop($('#chatBody')[0].scrollHeight);
						
					});
				}
			});
		})
		/* 채팅방 입력버튼(엔터) = 입력버튼 클릭과 연동 */
		$(function(){
			$(document).on('keyup', '#sendInput', function(){
				if(event.key == 'Enter'){
					$('#sendBtn').click();
				}
			});
		})
		/* 채팅방만! 새로고침 */
		$(function(){
			$(document).on('click', '#refreshBtn', function(){
				$("#chatBody").css("display", "");

				let klassNo = "${klass.klassNo}";
				chatAjax(klassNo).done(function(){
					
					$('#chatBody').scrollTop($('#chatBody')[0].scrollHeight);
					
				});
			});
		})
		/* 채팅방 입장하는 버튼 = 새로고침 버튼 클릭과 연동 */
		$(function(){
			$(document).on('click', '#chatStartBtn', function(){
				alert('채팅방에 입장합니다!');
				setInterval(function(){
					$('#refreshBtn').click();
				}, 3000);
			});
		})
		
		
		
			
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		$('#moveReviewDetail tr').click(function(){
			const reviewNum = $(this).data('review-no');
			location.href='/reviewDetail?review_no='+reviewNum;
		})
	</script>
</body>
</html>