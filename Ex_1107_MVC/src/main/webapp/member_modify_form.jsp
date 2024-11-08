<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			function modify(f){
				
				let url = "updateFin.do";
				
				// encodeURIComponent() : !, @ 등 특수문자가 들어가 있는 경우
				// 파라미터 전달에 문제가 생기지 않도록 인코딩하는 함수
				let param = "idx=" + f.idx.value +
							"&name=" + f.name.value +
							"&id=" + f.id.value +
							"&pwd=" + encodeURIComponent( f.pwd.value ) +
							"&email=" + encodeURIComponent( f.email.value )+
							"&addr=" + encodeURIComponent( f.addr.value );
				
				sendRequest( url, param, modifyFn, "get");
				
			}
			
			function modifyFn(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					
					//"[{'param':'succ'}, {'id':'one'}]"
					let data = xhr.responseText;
					
					let json = ( new Function('return '+data) )();
					
					if( json[0].param === 'succ' ){
						alert( json[1].id + '님 정보 수정 완료');
						location.href='member_list.do';
					}else{
						alert("수정 안됨");
					}
				}
			}
		</script>
	</head>
	<body>
		<form>
			<input type="hidden" name="idx" value="${ vo.idx }">
		
			<table border="1">
				<caption>::: 회원정보수정 :::</caption>
				
				<tr>
					<th>이름</th>
					<td><input name="name" value="${ vo.name }"></td>
				</tr>
				
				<tr>
					<th>아이디</th>
					<td><input name="id" value="${ vo.id }"></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password" value="${ vo.pwd }"></td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td><input name="email" value="${ vo.email }"></td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input name="addr" value="${ vo.addr }"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="수정"
							   onclick="modify(this.form);">
						
						<input type="button" value="취소"
							   onclick="history.back();">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>