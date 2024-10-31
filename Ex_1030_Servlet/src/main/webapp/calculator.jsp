<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				let su1 = f.su1.value;
				let su2 = f.su2.value;
				
				//유효성 체크
				let num_pattern = /^[0-9]*$/;
				if( !num_pattern.test( su1 ) ){
					alert("숫자만 입력하세요")
					return;
				}
				
				if( !num_pattern.test (su2) ){
					alert("숫자만 입력하세요");
					return;
				}
				
				if( su1 == '' ){
					alert("숫자를 입력하세요");
					return;
				}
				
				if( su2 == '' ){
					alert("숫자를 입력하세요");
					return;
				}
				
				f.action = "calc.do";
				f.method = "get";
				f.submit();
				
				
			}
		</script>
	</head>
	
	<body>
		<form>
			수1: <input name="su1" placeholder="수1"><br>
			수2: <input name="su2" placeholder="수2"><br>
			<input type="button" value="확인" onclick="send(this.form);">
		
		</form>
	</body>
</html>