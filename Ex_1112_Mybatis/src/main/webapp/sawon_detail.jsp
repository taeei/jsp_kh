<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	
	<body>
		사번 : ${ vo.sabun }<br>
		이름 : ${ vo.saname }<br>
		성별 : ${ vo.sagen }<br>
		부서번호 : ${ vo.deptno }<br>
		직책 : ${ vo.sajob }<br>
		입사일 : ${ fn:split(vo.sahire, ' ')[0] }<br>
		상사번호 : ${ vo.samgr }<br>
		연봉 : ${ vo.sapay }<br>
	</body>
</html>