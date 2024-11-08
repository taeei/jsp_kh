<%@page import="vo.MeVO"%>
<%@page import="dao.MeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//modify_form.jsp?idx=12
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	//파라미터로 받은 수정을 원하는 회원의 idx를
	//DAO로 전달해서 그 사람의 정보를 모두 가져온다
	MeVO vo = MeDAO.getInstance().selectOne(idx);
	
	request.setAttribute("name", vo.getName());
	request.setAttribute("id", vo.getId());


%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				
				let name = f.name.value;
				if( name === ''){
					alert("이름은 필수입니다");
					return;
				}
				
				f.method ="post";
				f.action = "modify_fin.jsp";
				f.submit();
				
			}
		</script>
	</head>
	<body>
		<form>
			
			<input type="hidden" name="idx" value="<%=idx%>">
		
			<table border="1">
				<caption>:::회원 정보 수정:::</caption>
				
				<tr>
					<th>이름</th>
					<th><input name="name" value="${ name }"></th>
				</tr>
				
				<tr>
					<th>아이디</th>
					<th><input name="id" value="${ id }"></th>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<th><input type="password"
							   name="pwd" value="<%= vo.getPwd() %>"></th>
				</tr>
				
				<tr>
					<th>이메일</th>
					<th><input name="email" value="<%= vo.getEmail() %>"></th>
				</tr>
				
				<tr>
					<th>주소</th>
					<th><input name="addr" value="<%= vo.getAddr() %>"></th>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="확인"
						  	 onclick="send(this.form)">
							   
						<input type="button" value="취소"
					 		   onclick="location.href='member.jsp'">
					      
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>