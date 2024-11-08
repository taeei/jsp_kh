<%@page import="dao.MeDAO"%>
<%@page import="vo.MeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String addr = request.getParameter("addr");
	
	MeVO vo = new MeVO();
	vo.setIdx(idx);
	vo.setName(name);
	vo.setId(id);
	vo.setPwd(pwd);
	vo.setEmail(email);
	vo.setAddr(addr);
	
	int res = MeDAO.getInstance().update(vo);

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