<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int dan = Integer.parseInt(request.getParameter("dan"));

	String res = "";
	
	for(int i = 1; i <= 9 ; i++){
		res += dan + " * " + i + " = " + (dan*i) + "<br>";
	}
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%= res %>
	</body>
</html>