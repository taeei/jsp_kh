<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			function login(f){
			
				let id = f.id.value;
				let pwd = f.pwd.value;
				
				//유효성 체크
				if( id === '' ){
					alert("아이디를 입력하세요");
					return;
				}
				if( pwd === '' ){
					alert("비밀번호를 입력하세요");
					return;
				}
				
				let url = "login.do";
				let param = "id=" + encodeURIComponent(id) +
							"&pwd=" + encodeURIComponent(pwd);
				
				sendRequest( url, param, resultFn, "post" );
			}
			
			function resultFn(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					
					let data = xhr.responseText;
					let json = ( new Function('return '+data) )();
					
					if( json[0].param == "no_id" ){
						alert("아이디가 없습니다");
						return;
					}else if( json[0].param == "no_pwd" ){
						alert("비밀번호가 일치하지 않습니다");
						return;
					}else{
						alert("로그인 성공");
						return;
					}
					
					
				}
			}
			
			
		</script>
	</head>
	
	
	<body>
		<form>
			<table border="1" align="center"
				   style="border-collapse:collapse">
				<tr>
					<th colspan="2" bgcolor="lightgray">로그인</th>
				</tr>
				
				<tr>
					<th>아이디</th>
					<td><input name="id"></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="로그인"
							   onclick="login(this.form);">
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>


