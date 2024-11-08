<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//updForm.jsp?no=1&name=일길동&kor=77&eng=88&mat=99
	int no = Integer.parseInt( request.getParameter("no") );
	String name = request.getParameter("name");
	int kor = Integer.parseInt( request.getParameter("kor") );
	int eng = Integer.parseInt( request.getParameter("eng") );
	int mat = Integer.parseInt( request.getParameter("mat") );
	
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send( f ){
				
				let name = f.name.value;
				if( name === '' ){
					alert("이름을 입력하세요");
					return;
				}
				
				//국어점수 유효성 체크
				let kor = f.kor.value;
				let num_patt = /^[0-9]*$/;
				if( !num_patt.test( kor ) ){
					alert("점수는 정수로 입력하세요");
					return;
				}
				
				if( kor === '' ){
					alert("점수는 반드시 입력해야 합니다");
					return;
				}
				
				if( kor < 0 || kor > 100 ){
					alert("0 ~ 100사이의 값을 입력하세요");
					return;
				}
				
				f.action = "updFin.jsp";
				f.submit();
				
			}
		</script>
		
	</head>
	
	<body>
		<form>
		
			<input type="hidden" name="no" value="<%= no %>">
		
			<table border="1">
				<caption>:::학생정보 수정:::</caption>
				<tr>
					<th>이름</th>
					<td>
						<input name="name" value="<%= name %>">
					</td>
				</tr>
				
				<tr>
					<th>국어</th>
					<td>
						<input name="kor" value="<%= kor %>">
					</td>
				</tr>
				
				<tr>
					<th>영어</th>
					<td>
						<input name="eng" value="<%= eng %>">
					</td>
				</tr>
				
				<tr>
					<th>수학</th>
					<td>
						<input name="mat" value="<%= mat %>">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="확인"
						       onclick="send(this.form);">
						
						<input type="button" value="이전" 
						       onclick="location.href='student.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>



















