
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			window.onload = function(){
				let search = document.getElementById("search");
				search.value='${param.search}';
			}
		
			function search(){
				let search = document.getElementById("search").value;
				
				location.href="gogek_list.do?search="+search;
				
			}
		</script>
	</head>
	<body>
		
		지역:<input id="search">
		<input type="button" value="검색"
			   onclick="search();">
		
		<hr>
	
		<table border="1">
			<caption>고객 테이블 조회</caption>
			
			<tr>
				<th>번호</th>
				<th>담당자</th>
				<th>이름</th>
				<th>주소</th>
				<th>주민번호</th>
			</tr>
			
			<c:forEach var="vo" items="${ list }">
				<tr>
					<td>${ vo.gobun }</td>
					<td>${ vo.godam }</td>
					<td>${ vo.goname }</td>
					<td>${ vo.goaddr }</td>
					<td>${ vo.gojumin }</td>
				</tr>
			</c:forEach>
			
		</table>
	</body>
</html>