<%@page import="java.util.ArrayList"%>
<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	//톰캣이 참조할 자원(JNDI) 검색
	InitialContext ic = new InitialContext();
	
	//Resource의 위치 검색
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	//Resource파일로 접근					context.xml의 name 가져다 사용
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	//DB연결객체 생성
	Connection conn = dataSource.getConnection();
	
	System.out.println("--db연결 성공--");
	
	String sql = "select * from dept";
	//명령처리 객체
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	// 쿼리문을 수행하여 얻어진 결과에서 데이터를 가져올 객체
	ResultSet rs = pstmt.executeQuery();
	
	//검색결과 조회
	// next() 실행될 때마다 테이블의 다음 행(row)으로 넘어간다
	List<DeptVO> dept_list = new ArrayList<DeptVO>();
	
	while( rs.next() ){
		DeptVO vo = new DeptVO();
		
		// 현재 rs가 접근해 있는 row의 컬럼값을 vo에 저장
		vo.setDeptno( rs.getInt("deptno") );
		vo.setDname( rs.getString("dname") );
		vo.setLoc( rs.getString("loc") );
		
		// 저장된 vo값을 dept_list에 담는다
		dept_list.add(vo);
	}
	
	//db접근에 관여한 객체들을 역순으로 닫는다
	rs.close();
	pstmt.close();
	//사용이 완료된 DB는 반드시 연결을 해제하여
	//다른 사용자가 접속할 수 있도록 해야 한다.
	conn.close();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		부서목록
		<table border="1">
			<tr>
				<th>부서번호</th>
				<th>부서명</th>
				<th>부서위치</th>
			</tr>
			<%for( DeptVO vo : dept_list ) {%>
				<tr>
					<td><%=vo.getDeptno() %></td>
					<td><%=vo.getDname() %></td>
					<td><%=vo.getLoc() %></td>
				</tr>
			<% } %>
		</table>
	</body>
</html>