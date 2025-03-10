<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정 성공</title>
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

    .clickable-row:hover {
	    background-color: #E8F7DC;
	    cursor: pointer;          
	}
	.mypage-box {
	    background-color: #FFFFFF;
	    border: 1px solid #ddd;
	    border-radius: 10px;
	    padding: 20px;
	    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); 
	}
    a.btn-outline-danger {
	    background-color: #F0F2EF !important; 
	    color: #000000 !important;               
	    border: 1px solid #ccc !important;                
	}
	.btn-outline-primary {
	    color: #ffffff !important;
	    border: solid thin !important;
	    border-color: #D1B5E0 !important;
	    background-color: #D1B5E0 !important;
	    
	}
	div a{
		color: #724AA9;
	}
	div a:hover{
		color: #724AA9;
	}
</style>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	<div id="colorlib-main">
	    <section class="ftco-section ftco-no-pt ftco-no-pb">
	        <div class="container">
	            <div class="row d-flex">
	                <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
	                    <div class="mypage-box text-center" style="max-width: 500px; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);">
	                        <h3 class="text-primary text-center mb-4">비밀번호 재설정 완료</h3>
	                        <p class="text-center" style="margin-bottom: 20px;">
	                            아이디 : "<strong>${accountResetPw.accountId}</strong>"님의 비밀번호가 재설정 되었습니다.<br>
	                            로그인 페이지로 이동하시겠습니까?
	                        </p>
	                        <div class="d-flex justify-content-between">
	                            <form action="/login" method="post" style="width: 48%;">
	                                <input type="hidden" value="${accountResetPw.accountId}" name="searchId">
	                                <button class="btn btn-outline-primary" style="width: 100%;">로그인</button>
	                            </form>
	                            <a href="/" class="btn btn-outline-danger" style="width: 48%;">홈으로 돌아가기</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	</div>
	
</body>
</html>