<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
			
				<form action="/accountCreateMove" method="post">
					<button class="selectBtn" name="select" value="M">참여자</button>
					<button class="selectBtn" name="select" value="H">주최자</button>
				</form>
			
			</div>
		</section>
	</div>
	
	
	
	
	
	
	
	
	
</body>
</html>