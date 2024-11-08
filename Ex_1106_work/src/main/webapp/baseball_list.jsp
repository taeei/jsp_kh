<%@page import="java.util.ArrayList"%>
<%@page import="vo.BaseballVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.BaseballDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	BaseballDAO dao = BaseballDAO.getInstance();
	List<BaseballVO> player_list = dao.selectList();
	
	request.setAttribute("player_list", player_list);
%>  

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<caption>:::야구선수 정보:::</caption>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>팀명</th>
				<th>홈런</th>
				<th>비고</th>
			</tr>
			
			<c:forEach var="p" items="${ player_list }">
				<tr>
					<td>${ p.idx }</td>
					<td>${ p.name }</td>
					<td>${ p.age }</td>
					<td>${ p.team }</td>
					<td>${ p.homerun }</td>
					
					<td>
						<input type="button" value="수정">
						
						<input type="button" value="삭제">
					</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="6" align="center">
					<input type="button" value="추가"
						   onclick="location.href='ins_bForm.jsp'">
				</td>
			</tr>
			
		</table>
	</body>
</html>