<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.PersonVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<PersonVO> pList = new ArrayList<PersonVO>();
	
	PersonVO p1 = new PersonVO();
	p1.setName("홍길동");
	p1.setAge(20);
	p1.setTel("010-111-1111");
	
	PersonVO p2 = new PersonVO();
	p2.setName("박길동");
	p2.setAge(30);
	p2.setTel("010-222-2222");
	
	PersonVO p3 = new PersonVO();
	p3.setName("조길동");
	p3.setAge(35);
	p3.setTel("017-444-5555");
	
	pList.add(p1);
	pList.add(p2);
	pList.add(p3);
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	</head>
	
	
	<body>
		:::개인정보 목록:::
		<table border="1">
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>전호번호</th>
			</tr>
			<%for(int i=0; i<pList.size(); i++){ 
				PersonVO p = pList.get(i);
			%>
				<tr>
					<td><%=p.getName() %></td>
					<td><%=p.getAge() %></td>
					<td><%=p.getTel() %></td>
				</tr>
			<%} %>
			
		</table>
	</body>
</html>