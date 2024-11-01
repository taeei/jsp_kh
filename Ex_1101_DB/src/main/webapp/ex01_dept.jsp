<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	InitialContext ic = new InitialContext();

	Context ctx = (Context)ic.lookup("java:comp/env");
	
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	
	String sql = "select * from dept";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	List<DeptVO> dept_list = new ArrayList<DeptVO>();
	
	while( rs.next() ){
		DeptVO vo = new DeptVO();
		
		vo.setDeptno(rs.getInt("deptno"));
		vo.setDname(rs.getString("dname"));
		vo.setLoc(rs.getString("loc"));
		
		dept_list.add(vo);
	}
	
	rs.close();
	pstmt.close();
	
	conn.close();
	
%>   
   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			
		
		</script>
	</head>
	
	<body>
		<p>부서목록</p>
		<table border="1">
			<tr>
				<th>부서번호</th>
				<th>부서이름</th>
				<th>부서위치</th>
			</tr>
			
			<%for(int i=0; i<dept_list.size(); i++) {
				DeptVO vo = dept_list.get(i);%>
				<tr>
					<td><%=vo.getDeptno() %></td>
					<td>
						<a href="ex01_sawon.jsp?deptno=<%= vo.getDeptno() %>">
						<%=vo.getDname() %>
						</a>
					</td>
					<td><%=vo.getLoc() %></td>
				</tr>	
			<%} %>
		</table>
	</body>
</html>



