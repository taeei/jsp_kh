<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	
	<body>
		<!-- 로그인이 됐을 때만 보여지고 싶을 때 작성 -->
		<jsp:include page="check_login.jsp"/>
		여기는 로그인이 됐을 때만 접근 가능합니다
		${ sessionScope.user.name }님 환영합니다<br>
		<input type="button" value="로그아웃" onclick="location.href='logout.do'">
	</body>
</html>