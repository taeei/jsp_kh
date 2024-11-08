<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>el 표기법 2</title>
	</head>
	<body>
		EL표기법 : 산술연산자<br>	
		\${ 1 + 1 } = ${ 1 + 1 }<br>
		\${ 2 - 2 } = ${ 2 - 2 }<br>
		\${ 2 * 5 } = ${ 2 * 5 }<br>
		\${ 10 / 3 } or \${ 10 div 3 } = ${ 10 div 3 }<br>
		\${ 10 % 3 } or \${ 10 mod 3 } = ${ 10 mod 3 }<br>
		
		<hr>
		
		EL표기법 : 비교연산자<br>
		\${ 3 > 2 } = ${ 3 gt 2 }<br>
		\${ 3 < 2 } = ${ 3 lt 2 }<br>
		\${ 3 >= 2 } = ${ 3 ge 2 }<br>
		\${ 3 <= 2 } = ${ 3 le 2 }<br>
		\${ 3 == 2 } = ${ 3 eq 2 }<br>
		\${ 3 != 2 } = ${ 3 ne 2 }<br>
		
		<hr>
		
		EL표기법 : 삼항연산자(중요)<br>
		나의 파라미터 : ${ empty param.msg ? '값이 없다' : param.msg }<br>
		
		<hr>
		
		EL표기법 : 논리연산자<br>
					   <!-- el.jsp?  //  el.jsp?msg= -->
		파라미터 : ${ param.msg == null or param.msg == '' ? 'x' : param.msg }<br>
	</body>
</html>

