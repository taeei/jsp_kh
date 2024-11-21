<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	
	<body>
		<table width="700" align="center">
			<tr>
				<td><img src="img/title_04.gif"></td>
			</tr>
			
			<tr>
				<td width="50">번호</td>
				<td><img src="img/td_bg_01.gif"></td>
				
				<td width="300">제목</td>
				<td><img src="img/td_bg_01.gif"></td>
				
				<td width="90">작성자</td>
				<td><img src="img/td_bg_01.gif"></td>
				
				<td width="90">작성일</td>
				<td><img src="img/td_bg_01.gif"></td>
				
				<td width="60" >조회수</td>
			</tr>
			
			<c:forEach var="i" begin="1" end="5">
			<tr>
				<td>${ i }</td>
				<td><img src="img/td_bg_01.gif"></td>
				
				<td>제목${ i }</td>
				<td><img src="img/td_bg_01.gif"></td>
				
				<td>작성자${ i }</td>
				<td><img src="img/td_bg_01.gif"></td>
				
				<td>작성일${ i }</td>
				<td><img src="img/td_bg_01.gif"></td>
				
				<td align="center">0</td>
			</tr>
			</c:forEach>
			
			<tr>
				<td colspan="9" align="center">
				<img src="img/btn_prev.gif">
				1 2 3 4 5
				<img src="img/btn_next.gif">
				</td>
			</tr>
			
			<tr>
				<td colspan="9" align="right">
					<img src="img/btn_reg.gif"
						 style="cursor:pointer"> 
				</td>
			</tr>
		</table>
	</body>
</html>