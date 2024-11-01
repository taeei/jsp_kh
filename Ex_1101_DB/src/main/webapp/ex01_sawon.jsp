<%@page import="vo.SawonVO"%>
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
	int deptno = Integer.parseInt(request.getParameter("deptno"));

	InitialContext ic = new InitialContext();
	
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	
	String sql = "select * from sawon where deptno="+deptno;
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	List<SawonVO> sawon_list = new ArrayList<SawonVO>();
	
	while( rs.next() ){
		SawonVO vo = new SawonVO();
		
		vo.setDeptno(rs.getInt("deptno"));
		// vo.setDeptno(deptno);도 가능
		vo.setSabun(rs.getInt("sabun"));
		vo.setSajob(rs.getString("sajob"));
		vo.setSaname(rs.getString("saname"));
		
		sawon_list.add(vo);
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
	</head>
	<body>
		<table border="1">
			<tr>
				<th>부서번호</th>
				<th>사원번호</th>
				<th>직종</th>
				<th>사원이름</th>
			</tr>
			
			<%for( SawonVO vo : sawon_list) { %>
				<tr>
					<td><%=vo.getDeptno() %></td>
					<td><%=vo.getSabun() %></td>
					<td><%=vo.getSajob() %></td>
					<td>
					<a href="ex01_gogek.jsp?sabun=<%=vo.getSabun()%>&saname=<%=vo.getSaname()%>">
					<%=vo.getSaname() %>
					</a>
					</td>
				</tr>
			<%} %>
		</table>
		
	</body>
</html>







