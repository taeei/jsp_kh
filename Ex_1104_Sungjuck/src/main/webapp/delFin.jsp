<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   
<%
	int no = Integer.parseInt(request.getParameter("no"));
	int res = SjDAO.getInstance().delete(no);
	
	response.sendRedirect("student.jsp");
	
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	</body>
</html>