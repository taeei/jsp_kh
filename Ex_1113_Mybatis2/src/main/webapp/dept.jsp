<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			/* 테이블의 스타일을 저장해두지 않으면 나중에
			display를 none, block으로 변경하는 과정에서 모양이 틀어지기 때문에
			미리 스타일을 적용하여 문제를 방지 */
			
			table{width:300px;
				  border-collapse:collapse;
				  border:0 solid black;}
				  
			td{width:100px;}
		</style>
		
		<script src="js/httpRequest.js"></script>
	
		<script>
			function send(f){
				let dname = f.dname.value;
				
				if( dname === '' ){
					let ori_table = document.getElementById("ori_table");
					ori_table.style.display = 'block';
					
					document.getElementById("comment_disp")
								.style.display = 'none';
					return;
					
				}
				
				let url = "search_name.do";
				let param = "dname=" + dname;
				sendRequest( url, param, resultFn,"get" );
				
			}
			
			//콜백
			function resultFn(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					let data = xhr.responseText;
					
					// 받아온 데이터 부서목록 테이블 아래에 출력
					let comm = document.getElementById("comment_disp");
					comm.style.display = 'block';
					comm.innerHTML = data;
					
					let ori_table = document.getElementById("ori_table");
					ori_table.style.display = 'none';
				}
			}
		</script>
	</head>
	
	
	<body>
		<form>
			<input name="dname">
			<input type="button" value="검색"
				   onclick="send(this.form)">
			<table border="1" id="ori_table">
				<caption>부서목록</caption>
				
				<tr>
					<th>부서번호</th>
					<th>부서이름</th>
					<th>부서위치</th>
				</tr>
				
				<c:forEach var="vo" items="${ list }">
					<tr>
						<td>${ vo.deptno }</td>
						<td>${ vo.dname }</td>
						<td>${ vo.loc }</td>
					</tr>
				</c:forEach>
			</table>
			
			<!-- 나중에 원본 테이블은 숨기고
				 검색된 결과만 보여주시 위한 div -->
			<div id="comment_disp"></div>
		</form>
	</body>
</html>