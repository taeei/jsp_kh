<%@page import="dao.SjDAO"%>
<%@page import="vo.SjVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	SjVO vo = new SjVO();
	vo.setName(name);
	vo.setKor(kor);
	vo.setEng(eng);
	vo.setMat(mat);
	
	SjDAO dao =SjDAO.getInstance();
	int res = dao.insert(vo);
	
	//추가하고 student.jsp로 가기
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