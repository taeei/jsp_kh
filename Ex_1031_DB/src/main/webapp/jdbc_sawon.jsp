<%@page import="vo.SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	//톰캣이 참조할 자원(JDNI) 검색	
	InitialContext ic = new InitialContext();
	
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	
	System.out.println("--db연결 성공--");
	
	String sql = "select * from sawon";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	ResultSet rs = pstmt.executeQuery();
	
	List<SawonVO> sawon_list = new ArrayList<SawonVO>();
	
	while( rs.next() ){
		SawonVO vo = new SawonVO();
		
		vo.setSabun(rs.getInt("sabun"));
		vo.setSaname(rs.getString("saname"));
		vo.setSagen(rs.getString("sagen"));
		vo.setDeptno(rs.getInt("deptno"));
		vo.setSajob(rs.getString("sajob"));
		vo.setSahire(rs.getString("sahire"));
		vo.setSamgr(rs.getString("samgr"));
		vo.setSapay(rs.getString("sapay"));
		
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
		사원목록
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>성벌</th>
				<th>부서번호</th>
				<th>직급</th>
				<th>입사일</th>
				<th>상사번호</th>
				<th>급여</th>
			</tr>
			
			<%for( SawonVO vo : sawon_list ){ %>
				<tr>
					<td><%=vo.getSabun() %></td>
					<td><%=vo.getSaname() %></td>
					<td><%=vo.getSagen() %></td>
					<td><%=vo.getDeptno() %></td>
					<td><%=vo.getSajob() %></td>
					<td><%=vo.getSahire() %></td>
					<td><%=vo.getSamgr() %></td>
					<td><%=vo.getSapay() %></td>
				</tr>
			<%} %>
		</table>
	</body>
</html>