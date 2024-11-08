<%@page import="vo.PersonVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!-- JSTL(Jsp standard tag library)
	 날짜, 시간등의 데이터나 if, for등 제어문을 사용할 수 있도록 하는 라이브러리 -->   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	Date today = new Date();
	request.setAttribute("today", today);
	
	int money = 2000000000;
	request.setAttribute("money", money);
	
	String[] array = {"사과", "배", "오렌지", "포도"};
	request.setAttribute("arr", array);
	
	List<String> sido = new ArrayList<String>();
	sido.add("서울");
	sido.add("춘천");
	sido.add("인천");
	sido.add("부산");
	request.setAttribute("sido", sido);
	
	PersonVO p1 = new PersonVO();
	p1.setName("일길순");
	p1.setEmail("one@a.com");
	p1.setAge(35);
	
	PersonVO p2 = new PersonVO();
	p2.setName("이길동");
	p2.setEmail("two@a.com");
	p2.setAge(28);
	
	List<PersonVO> list = new ArrayList<PersonVO>();
	list.add(p1);
	list.add(p2);
	request.setAttribute("p_list", list);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		${ today }<br>
		
		<fmt:formatDate 
			value="${ today }"
			pattern="YYYY년 MM월 dd일. hh:mm:ss"/><br>
			
		&#8361;<fmt:formatNumber value="${ money }"/><br>
		
		<hr>
		
		<!-- switch느낌의 제어문 -->
		<c:choose>
			<c:when test="${ param.msg eq 10 }">나는 10이야</c:when>
			<c:when test="${ param.msg eq 11 }">나는 11이야</c:when>
			<c:otherwise>둘 다 아님</c:otherwise>
		</c:choose>
		
		<hr>
		
		<!-- for( int i = 1; i < 5; i++){ } -->
		<c:forEach var="i" begin="1" end="5" step="1"	>
			<c:if test="${ i mod 2 eq 0 }">
				${ i }<br>
			</c:if>
			
			<c:if test="${ i mod 2 eq 1 }">
				<font color="red">${ i }</font><br>
			</c:if>
		</c:forEach>
		
		<hr>
		
		<!-- 
		String[] array = {"사과", "배", "오렌지", "포도"};
		for( String str : array){
			syso(str);
		}
		 -->
		<c:forEach var="fruit" items="${ arr }">
			${ fruit }<br>
		</c:forEach>
		
		
		<hr>
		
		<ul>
			<c:forEach var="s" items="${ sido }">
				<li>${ s }</li>
			</c:forEach>
		</ul>
		
		<hr>
		
		<!-- varStatus="cnt"
			 cnt.count : 순번
			 cnt.index : 인덱스 번호 -->
		<ul>
			<c:forEach var="i" items="${ p_list }" varStatus="cnt">
				<li>${ cnt.count }. ${ i.name } / ${ i.email } / 
					${ i.age } / idx : ${ cnt.index }</li>
			</c:forEach>
		</ul>
	</body>
</html>




