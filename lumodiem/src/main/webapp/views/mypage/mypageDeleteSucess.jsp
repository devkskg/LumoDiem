<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 성공</title>
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
	<%@ include file="/views/include/nav.jsp"%>
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div id="colorlib-main" class="container mt-5"
						style="justify-content: center;">
						<div class="mypage-box" style="max-width: 100%; margin: 0 auto;">
							<h3 class="text-primary text-center mb-4">회원 탈퇴 완료</h3>
							<p class="text-center" style="margin-bottom: 20px;">
								회원 탈퇴가 완료되었습니다.<br> 다시 만날 날을 기대하겠습니다~!
							</p>

							<a href="/" class="btn btn-outline-primary" style="width: 100%;">홈으로
								돌아가기</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>