<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				
				let name = f.name.value;
				let team = f.team.value;
				
				if( name === ''){
					alert("이름을 입력하세요");
					f.name.focus();
					return;
				}
				
				if(team === ''){
					alert("팀을 입력하세요");
					f.team.focus();
					return;
				}
				
				f.method="get"
				f.action="ins_bFin.jsp";
				f.submit();
			}
		
		</script>
	</head>
	<body>
		<table border="1">
			<tr>
				<th>이름</th>
				<th><input name="name"></th>
			</tr>
			
			<tr>
				<th>나이</th>
				<th><input name="age"></th>
			</tr>
			
			<tr>
				<th>팀명</th>
				<th><input name="team"></th>
			</tr>
			
			<tr>
				<th>홈런</th>
				<th><input name="homerun"></th>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="등록"
					   onclick="send(this.form)">
					   
				<input type="button" value="취소"
					   onclick="history.back()">
				</td>
			</tr>
			
			
		</table>
	</body>
</html>