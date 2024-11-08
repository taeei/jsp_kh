<%@page import="dao.SjDAO"%>
<%@page import="vo.SjVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int no = Integer.parseInt( request.getParameter("no") );
	String name = request.getParameter("name");
	int kor = Integer.parseInt( request.getParameter("kor") );
	int eng = Integer.parseInt( request.getParameter("eng") );
	int mat = Integer.parseInt( request.getParameter("mat") );
	
	//파라미터로 받은 정보들을 VO로 저장
	SjVO vo = new SjVO();
	vo.setNo(no);
	vo.setName(name);
	vo.setKor(kor);
	vo.setEng(eng);
	vo.setMat(mat);
	
	//vo를 DAO에게 전달
	SjDAO dao = SjDAO.getInstance();
	int res = dao.update( vo );       
	System.out.println("결과 : " + res);
	
	//수정이 완료되었으므로 화면을 student.jsp로 전환
	response.sendRedirect("student.jsp");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	나는 DB로 수정할 vo를 보내고 있어요
</body>
</html>








