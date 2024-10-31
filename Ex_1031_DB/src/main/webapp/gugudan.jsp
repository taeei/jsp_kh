<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		구구단
		<table border="1">
			<tr>
				<%for(int i = 1; i <=9; i++){  %>
					
					<%for(int j=2; j<=9; j++) { %>
						<td><%=j %> * <%=i %> = <%=j*i %></td>
					<%} %>
					</tr>
				<%} %>
			
		
		</table>
	</body>
</html>