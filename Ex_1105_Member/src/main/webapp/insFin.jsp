<%@page import="dao.MeDAO"%>
<%@page import="vo.MeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//한글데이터가 POST타입으로 전송되면 깨져서 넘어오기 때문에
	//이것을 방지하기 위해 문자 인코딩이 필요하다
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String addr = request.getParameter("addr");
	
	MeVO vo = new MeVO();
	vo.setName(name);
	vo.setId(id);
	vo.setPwd(pwd);
	vo.setEmail(email);
	vo.setAddr(addr);
	
	MeDAO dao = MeDAO.getInstance();
	int res = dao.insert(vo);
	
	response.sendRedirect("member.jsp");
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


