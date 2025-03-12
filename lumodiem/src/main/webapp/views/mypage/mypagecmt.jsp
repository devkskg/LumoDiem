<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 댓글 조회</title>
<style>
    .list-group-item a {
        color: #000 !important;  
        text-decoration: none;   
    }

    h3.text-primary {
        color: #000 !important;  
    }

    .list-group-item {
        border-bottom: 1px solid #ddd; 
        display: flex;
        align-items: center; 
    }

    .list-group-item .badge {
        margin-left: auto; 
    }
    
    
    
    
    
	table {
	    border: 1px solid #ddd !important;
	    border-spacing: 0 10px !important; 
	    border-collapse: separate !important; 
	}
	th{
		padding: 8px !important;
	}
	
	td{
		padding: 8px !important;
	}
	tr{
		background-color: #E8DAEF;
		font-weight: bold; 
		
	}
	
	tr:first-child{
		background-color: #D1B5E0;
	}

    .clickable-row:hover {
	    background-color: #D1B5E0; 
	    cursor: pointer;          
	}
    a.btn-outline-danger {
	    background-color: #F1948A !important; 
	    color: #fff !important;              
	    border: none;                         
	}
    a.btn-outline-primary {
	    background-color: #E8DAEF !important;
	    color: #4A235A !important;             
	    border: none;                        
	}
	.mypage-box {
	    background-color: #FFFFFF;
	    border: 1px solid #ddd;
	    border-radius: 10px;
	    padding: 20px;
	    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
	}

	
	    
</style>
</head>
<body>
	<%@ include file="/views/include/nav.jsp"%>
	
	
	
	
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
				    <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
				        <div class="mypage-box" style="max-width: 80%; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); ">
				            <h3 class="text-primary text-center mb-4">
									작성한 댓글 목록
				            </h3>
							<ul class="list-group mb-4">
							    
								<li class="list-group-item">
								    <table style="width: 100%; border-collapse: collapse; text-align: center;">
								    	<tbody>
								        <tr style="border-bottom: 1px solid #ddd; width: 100%; border-collapse: separate; border-spacing: 0 5px; text-align: center; border: 1px solid #ddd;">
								        	<th>No.</th>
								        	<th>댓글명</th>
								        </tr>
											<c:choose>
												<c:when test="${not empty reviewCmtList }">
													<c:set var="startNo" value="${(paging.nowPage - 1) * paging.numPerPage}" />
													<c:forEach var="list1" varStatus="vs" items="${reviewCmtList }">
								       					<tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/reviewDetail?review_no=${list1.reviewNo}'/>" style="cursor: pointer;">
								       					
															<td>${startNo + vs.index + 1}</td>
															<td>${list1.reviewCmtTxt}</td>
															
												        </tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="2">작성한 댓글이 없습니다.</td>
													</tr>
												</c:otherwise>
											</c:choose>							        
								        </tbody>
								    </table>
							<!-- 페이징 시작 -->
							<form style="text-align: center;">
									<c:if test="${not empty paging}">
											
										<c:if test="${paging.prev}">
											<c:url var="testUrl1" value="/mypageCmt">
												<c:param name="nowPage" value="${paging.pageBarStart - 1}"/>
											</c:url>
											<a style="color: #724AA9;" href="${testUrl1}">&laquo;</a>
										</c:if>
										
										
										<c:forEach var="i" begin="${paging.pageBarStart }" end="${paging.pageBarEnd }" varStatus="vs">
											<a class="pagingNumber" style="color: #724AA9;" href="/mypageCmt?nowPage=${i}">${i}</a>
										</c:forEach>
										
										
										<c:if test="${paging.next }">
											<a style="color: #724AA9;" href="/mypageCmt=${paging.pageBarEnd + 1}">&raquo;</a>
										</c:if>
												
									</c:if>
							</form>
							<!-- 페이징 끝 -->	
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