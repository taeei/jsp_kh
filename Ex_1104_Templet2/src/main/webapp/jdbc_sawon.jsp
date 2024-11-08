<%@page import="vo.SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SawonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	//DAO생성 및 결과 list 받기
	SawonDAO dao = SawonDAO.getInstance();
	List<SawonVO> sawon_list = dao.selectList();
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<table border="1">
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>직책</th>
				<th>입사일</th>
				<th>급여</th>
			</tr>
			
			<%for( SawonVO vo : sawon_list ) { %>
				<tr>
					<td><%= vo.getSabun() %></td>
					<td><%= vo.getSaname() %></td>
					<td><%= vo.getSajob() %></td>
					<td><%= vo.getSahire() %></td>
					<td><%= vo.getSapay() %></td>
				</tr>
			<%} %>
		</table>
	</body>
</html>