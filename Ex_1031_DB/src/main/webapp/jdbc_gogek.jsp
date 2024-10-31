<%@page import="java.util.List"%>
<%@page import="vo.GogekVO"%>
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
	// 톰캣이 참조할 자원(JDNI) 검색
	InitialContext ic = new InitialContext();

	//Resource의 위치검색
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	//Resource파일로 접근
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	//DB연결객체 생성
	Connection conn = dataSource.getConnection();
	
	String sql = "select * from gogek";
	
	//명령처리 객체
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	// 쿼리문을 수행하여 얻어진 결과에서 데이터를 가져올 객체
	ResultSet rs = pstmt.executeQuery();
	
	//검색결과 조회할 arraylist생성
	List<GogekVO> gogek_list = new ArrayList<GogekVO>();
	
	while( rs.next() ){
		GogekVO vo= new GogekVO();
		
		// 현재 rs가 접근해 있는 row 컬럼값을 vo에 저장
		vo.setGobun(rs.getInt("gobun"));
		vo.setGoname(rs.getString("goname"));
		vo.setGoaddr(rs.getString("goaddr"));
		vo.setGojumin(rs.getString("gojumin"));
		
		gogek_list.add(vo);
	}
	
	//db접근에 관여한 객체들을 역순으로 닫는다
	rs.close();
	pstmt.close();
	//사용 완료된 DB는 반드시 연결을 해제하여
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
		고객테이블 조회
		<table border="1">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>주민번호</th>
			</tr>
			
			<%for( GogekVO vo : gogek_list ) {%>
				<tr>
				<td><%=vo.getGobun() %></td>
				<td><%=vo.getGoname() %></td>
				<td><%=vo.getGoaddr() %></td>
				<td><%=vo.getGojumin() %></td>
				
				</tr>
			<%} %>
			</tr>
		</table>
		
	</body>
</html>





