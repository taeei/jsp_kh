<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				
				let deptno = f.deptno.value;
				let samgr = f.samgr.value;
				let sapay = f.sapay.value;
				
				let no_pattern = /^[0-9]{1,3}$/;
				if( !no_pattern.test( deptno ) ){
					alert("부서번호는 정수로 입력하세요");
					return;
				}
				
				if( !no_pattern.test( samgr ) ){
					alert("상사번호는 정수로 입력하세요");
					return;
				}
				
				let pay_pattern = /^[0-9]{4,8}$/;
				if( !pay_pattern.test( sapay ) ){
					alert("연봉은 4 ~ 8 자리의 정수");
					return;
				}
				
				f.method = "post";
				f.action = "sawon_insert.do";
				f.submit();
				
			}
		</script>
	</head>
	
	
	<body>
		<form>
			<table border="1">
				<caption>사원등록</caption>
				<tr>
					<th>이름</th>
					<td><input name="saname"></td>
				</tr>  
				
				<tr>
					<th>성별</th>
					<td><input name="sagen"></td>
				</tr>
				
				<tr>
					<th>부서번호</th>
					<td><input name="deptno"></td>
				</tr>
				
				<tr>
					<th>직책</th>
					<td><input name="sajob"></td>
				</tr>
				
				<tr>
					<th>상사번호</th>
					<td><input name="samgr"></td>
				</tr>
				
				<tr>
					<th>연봉</th>
					<td><input name="sapay"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록"
							   onclick="send(this.form);">
							   
						<input type="button" value="취소"
							   onclick="history.back()">
					</td>
				</tr>
			</table>		
		</form>
	</body>
</html>