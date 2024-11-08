<%@page import="java.util.List"%>
<%@page import="dao.MeDAO"%>
<%@page import="vo.MeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	MeDAO dao = MeDAO.getInstance();
	List<MeVO> mem_list = dao.selectlist();
	
	request.setAttribute("mem_list", mem_list);
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function del(idx){
				
				// confirm 함수 : 확인(true), 취소(false)
				if( confirm("정말 삭제하시겠습니까?") == false){
					return;
				}
				
				// body에서 onclick="location.href='del_memberFin.jsp?idx='<>''"
				// 로 보내는 대신에 
				location.href="del_memberFin.jsp?idx="+idx;
			}
		
			function modify(idx){
				location.href='modify_form.jsp?idx='+idx;
			}
		</script>
	</head>
	<body>
		<form>
			<table border="1">
				<caption>:::회원정보:::</caption>
				
				<tr>
					<th>번호</th>	
					<th>이름</th>	
					<th>아이디</th>	
					<th>비밀번호</th>	
					<th>이메일</th>	
					<th>주소</th>	
					<th>비고</th>	
				</tr>
				
				<c:forEach var="p" items="${ mem_list }">
					<tr>
						<td>${ p.idx }</td>
						<td>${ p.name }</td>
						<td>${ p.id }</td>
						<td>${ p.pwd }</td>
						<td>${ p.email }</td>
						<td>${ p.addr }</td>
						
						<td>
						<input type="button" value="삭제"
							   onclick="del(${ p.idx })">
						<input type="button" value="수정"
							   onclick="modify('${ p.idx }')">   
						
						</td>
					</tr>
					
				</c:forEach>
				
				<%--
				<%for( MeVO vo : mem_list ) {%>
				<tr>
					<td><%=vo.getIdx() %></td>
					<td><%=vo.getName() %></td>
					<td><%=vo.getId() %></td>
					<td><%=vo.getPwd() %></td>
					<td><%=vo.getEmail() %></td>
					<td><%=vo.getAddr() %></td>
					
					<td>
						<input type="button" value="삭제"
							   onclick="del(<%=vo.getIdx()%>)">
						<input type="button" value="수정"
							   onclick="modify('<%=vo.getIdx()%>')">   
						
					</td>
				</tr>
				<%} %>
				  --%>
				
				<tr>
					<td colspan="7">
						<input type="button" value="추가" 
							   onclick="location.href='insForm.jsp'">
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>








