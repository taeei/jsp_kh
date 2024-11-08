<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			
			let b_idCheck = false;
		
			function send(f){
				
				if( !b_idCheck ){
					alert("아이디 중복체크를 먼저 하세요");
					return;
				}
				
				let id = f.id.value;
				if( id === '' ){
					alert("아이디를 입력하세요");
					f.id.focus();
					return;
				}
				
				//비밀번호 비교
				let pwd = f.pwd.value;
				let pwd2 = f.pwd2.value;
				if( pwd != pwd2 ){
					alert("비밀번호를 다시 확인하세요");
					return;
				}
				
				f.method="post";
				f.action="insert.do";
				f.submit();
			}
			
			function check_id(){
				let id = document.getElementById("id").value;
				
				if( id === '' ){
					alert("아이디를 입력하세요");
					return;
				}
				
				let url = "check_id.do";
				let param = "id=" + id;
				
				sendRequest( url, param, resultFn, "get" );
			}
			
			//콜백함수
			function resultFn(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					
					let data = xhr.responseText;
					let json = ( new Function('return '+data) )();
					
					alert( json[2].id + json[1].res );
					
					//가입 가능
					if( json[0].r == 1 ){
						b_idCheck = true;
						
						//중복체크 후 아이디 변경 되지 않게 함   
						document.getElementById("id").readOnly=true;
					}

					
				}
			}
			
			function chk(){
				//아이디 입력상자의 값이 변경되면 호출되는 메서드
				//중복체크를 한 후 다시 id를 변경했을 때 
				//false로 만들어서 중복체크 다시 하라고 창 띄우기
				b_idCheck = false;
					
			}
		</script>
	</head>
	<body>
		<form enctype="multipart/form-data">
			<table border="1">
				<caption>::: 회원가입 :::</caption>
				<tr>
					<th>아이디</th>
					<td>
						<input name="id" size="9" id="id"
							   oninput="chk();">
						<input type="button" value="중복체크"
						       onclick="check_id();">
					</td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password"></td>
				</tr>
				
				<tr>
					<th>비밀번호확인</th>
					<td><input name="pwd2" type="password"></td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td><input name="name"></td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td><input name="email"></td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input name="addr"></td>
				</tr>
				
				<tr>
					<th>첨부</th>
					<td><input type="file" name="photo"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="회원가입"
							   onclick="send(this.form);">
							   
						<input type="button" value="취소"
							   onclick="history.back();">
					</td>
				</tr>
			</table>		
		</form>
	</body>
</html>