<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ include file="/views/include/nav.jsp" %>
<script src="<c:url value='/views/jquery-3.7.1.js'/>"></script>
</head>
<body>
	
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
			
				<form name="create_member_form" action="">
					<input name="account_grade" style="display: none" value=${select}><br>
					<label for="account_id">아이디 : </label><input name="account_id" id="account_id" type="text"><br>
					<label for="account_pw">비밀번호 : </label><input name="account_pw" id="account_pw" type="text"><br>
					<label for="account_pw_check">비밀번호 확인 : </label><input name="account_pw_check" id="account_pw_check" type="text"><br>
					<label for="account_name">이름 : </label><input name="account_name" id="account_name" type="text"><br>
					<label for="account_nickname">닉네임 : </label><input name="account_nickname" id="account_nickname" type="text"><br>
					<label for="account_ssn">주민등록번호 : </label><input name="account_ssn" id="account_ssn" type="text"><br>
					<label for="account_phone">전화번호 : </label><input name="account_phone" id="account_phone" type="text"><br>
					<label for="account_address">주소 : </label><input name="account_address" id="account_address" type="text"><br>
					<label for="account_email">이메일 : </label><input name="account_email" id="account_email" type="text"><br>
					<button type="button" id="submitBtn">가입하기</button>
					<button type="button"><a href="/" style="color: black">홈으로 돌아가기</a></button>
				</form>
			
			</div>
		</section>
	</div>
	
	
	<!-- 이후에 쓸 것 -->
	<script>
		$(function(){
			const form = document.create_member_form;
			
			$('#submitBtn').click(function(){
				if(!form.account_id.value){
					alert("아이디를 입력하세요.");
					form.account_id.focus();
				} else if(!form.account_pw.value){
					alert("비밀번호를 입력하세요.");
					form.account_pw.focus();
				} else if(!form.account_pw_check.value){
					alert("비밀번호 확인을 입력하세요.")
					form.account_pw_check.focus();
				} else if(form.account_pw.value != form.account_pw_check.value){
					alert("비밀번호가 일치하지 않습니다.")
					form.account_pw_check.focus();
				} else if(!form.account_name.value){
					alert("이름을 입력하세요.")
					form.account_name.focus();
				} else if(!form.account_nickname.value){
					alert("닉네임을 입력하세요.")
					form.account_nickname.focus();
				} else if(!form.account_ssn.value){
					alert("주민등록번호를 입력하세요.")
					form.account_ssn.focus();
				} else if(!form.account_phone.value){
					alert("전화번호을 입력하세요.")
					form.account_phone.focus();
				} else if(!form.account_address.value){
					alert("주소를 입력하세요.")
					form.account_address.focus();
				}  else if(!form.account_email.value){
					alert("이메일을 입력하세요.")
					form.account_email.focus();
				} else{
					$.ajax({
						url : "/accountCreateEnd",
						type : "post",
						data : {"account_grade" : form.account_grade.value,
								"account_id" : form.account_id.value,
								"account_pw" : form.account_pw.value,
								"account_name" : form.account_name.value,
								"account_nickname" : form.account_nickname.value,
								"account_ssn" : form.account_ssn.value,
								"account_phone" : form.account_phone.value,
								"account_address" : form.account_address.value,
								"account_email" : form.account_email.value,
						},
						dataType : "JSON",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data){
							alert(data.res_msg);
							if(data.res_code == "200"){
								location.href="/";
							} else{
								location.href="/";
							}
						}
					});
				}
			})
		})
	</script>
	
	
</body>
</html>