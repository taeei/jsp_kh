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
				let id = f.id.value;
				
				if( name === '' ){
					alert("이름을 입력하세요");
					//커서가 name입력상자로 옮겨짐
					f.name.focus();
					return;
				}
				
				if( id === '' ){
					alert("아이디를 입력하세요");
					f.id.focus();
					return;
				}
				
				f.method = "post";
				f.action = "insFin.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form>
			<table border="1">
				<caption>:::학생추가:::</caption>
				<tr>
					<th>이름</th>
					<th><input name="name"></th>
				</tr>
				
				<tr>
					<th>아이디</th>
					<th><input name="id"></th>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<th><input name="pwd" type="password"></th>
				</tr>
				
				<tr>
					<th>이메일</th>
					<th><input name="email"></th>
				</tr>
				
				<tr>
					<th>주소</th>
					<th><input name="addr"></th>
				</tr>
				
				<tr>				
					<td colspan="2">
					<input type="button" value="등록"
						   onclick="send(this.form);">
					
					<input type="button" value="취소"
						   onclick="history.back();">
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>