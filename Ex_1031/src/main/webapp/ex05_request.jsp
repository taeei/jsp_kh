<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//post타입으로 한글데이터가 전송되면 깨져서 출력되기 때문에 
	//이를 방지하기 위해 인코딩 설정을 해 두고 시작해야 한다
	request.setCharacterEncoding("utf-8");

	//ex_05_request.jsp?name=hong&age=20&tel=010-111-1111
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String tel = request.getParameter("tel");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%=name %> / <%=age %> / <%=tel %>
	</body>
</html>