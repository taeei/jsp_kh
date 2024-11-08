<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.PersonVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Map<String, String> map = new HashMap<String, String>();
	map.put("user", "test11"); 
	map.put("pwd", "1234");
	map.put("email", "aa@n.com");
	map.put("addr", "서울특별시");
	
	//map을 requestScope에 저장
	request.setAttribute("my_map", map);
	
	PersonVO p1 = new PersonVO();
	p1.setName("일길동");
	p1.setEmail("hong@k.com");
	p1.setAge(30);
	
	PersonVO p2 = new PersonVO();
	p2.setName("이길동");
	p2.setEmail("two@k.com");
	p2.setAge(35);
	
	request.setAttribute("person", p1);
	
	List<PersonVO> list = new ArrayList<PersonVO>();
	list.add(p1);
	list.add(p2);
	
	request.setAttribute("list", list);

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%= map.get("user") %><br>
		
		<!-- map의 key값으로 접근하는 방법 -->
		user : ${ requestScope.my_map.get("user") }<br>
		pwd : ${ my_map.get("pwd") }<br>
		email : ${ my_map['email'] }<br>
		addr : ${ my_map.addr }
		
		<hr>
		
		이름 : ${ person.getName() }<br>
		이메일 : ${ person['email'] }<br>
		나이 : ${ person.age }<br>
		
		<hr>
		
		이름1 : ${ list.get(0).name }<br>
		이메일1 : ${ list[0].name }<br>
		나이1 : ${ list[0	].age }<br>
		
	</body>
</html>