<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send( f ){
				let kor = f.kor.value;
				let number = /^[0-9]*$/;
				
				//국어점수 유효성 체크
				if( !number.test(kor) || kor === '' ){
					alert("국어점수는 정수로 입력하세요");
					return;
				}
				
				if( kor > 100 || kor < 0 ){
					alert("0 ~ 100 사이의 값을 입력하세요");
					return;
				}
				
				f.action = "insFin.jsp";
				f.submit();
			}
		</script>
	</head>
	<body>
		<form>
			<table>
				<caption>:::학생추가:::</caption>
				
				<tr>
					<th>이름</th>
					<th><input name="name"></th>
				</tr>
				
				<tr>
					<th>국어</th>
					<th><input name="kor"></th>
				</tr>
				
				<tr>
					<th>영어</th>
					<th><input name="eng"></th>
				</tr>
				
				<tr>
					<th>수학</th>
					<th><input name="mat"></th>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="등록"
							   onclick="send(this.form);">
							   
						<input type="button" value="취소"
							   onclick="history.back();">
							   <!--onclick="location.href='stundent.jsp'"  -->				
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>