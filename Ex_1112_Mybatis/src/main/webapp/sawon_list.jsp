<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>	
			window.onload = function(){
				let deptno = document.getElementById("deptno");
				let dept_array = [0, 10, 20, 30, 40, 50];
			
				for( let i = 0; i < dept_array.length; i++ ){
					//sawonlist.do?deptno=20
					if( '${param.deptno}' == dept_array[i] ){
						
						//파라미터값으로 배열의 index를 찾아내서
						//그 index위치로 option태그를 강제선택
						deptno[i].selected = true;
						break;
					}
				}
			}
		
			function find(){
				let deptno = document.getElementById("deptno").value;
				
				location.href="sawonlist.do?deptno="+deptno;
				
			}
		
		</script>
	</head>
	
	
	<body>
		<div align="center">
			<select id="deptno">
				<option value="0">::: 부서를 선택하세요 :::</option>
				<option value="10">총무부</option>
				<option value="20">영업부</option>
				<option value="30">전산실</option>
				<option value="40">관리부</option>
				<option value="50">경리부</option>
			</select>
			
			<input type="button" value="검색" onclick="find();">
		</div>
	
		<table border="1">
			<caption>사원 목록</caption>
			<tr>
				<td colspan="6" align="center">
					<input type="button" value="남자">
					<input type="button" value="여자">
				</td>
			</tr>
			<tr>
				<th>사원번호</th>
				<th>사원이름</th>
				<th>성별</th>
				<th>입사일</th>
				<th>비고</th>
				<th>비고</th>
			</tr>
			
			<c:forEach var="vo" items="${ list }">
				<tr>
					<td>${ vo.sabun }</td>
					<td>${ vo.saname }</td>
					<td>${ vo.sagen }</td>
					
					<!-- 입사일 공백을 기준으로 1번째 방 시간 지우고 0번째 방 사용 -->
					<td>${ fn:split(vo.sahire, ' ')[0] }</td>
					
					<td>
						<input type="button" value="상세보기"
							   onclick="location.href='sawon_detail.do?sabun=${vo.sabun}'">
					</td>
					
					<td>
						<input type="button" value="수정"
							   onclick="location.href='sawon_modify.do?sabun=${vo.sabun}'">
						<input type="button" value="삭제"
							   onclick="location.href='sawon_delete.do?sabun=${vo.sabun}'">
					</td>
				</tr>
				
			</c:forEach>
			
			<tr>
				<td colspan="6" align="center">
					<input type="button" value="사원등록"
						   onclick="location.href='sawon_insert_form.jsp'">
				</td>
			</tr>
			
			
										
			
			
		</table>
	</body>
</html>