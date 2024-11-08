package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.DeptVO;

public class DeptDAO {
	
	//DAO(Data Acces Object) :
	//DB에서 자원을 검색하거나 수정하기 위한 작업을 하는 클래스
	
	static DeptDAO single = null;
	public static DeptDAO getInstance() {
		if( single == null ) {
			single = new DeptDAO();
		}
		
		return single;
	}
	
	public List<DeptVO> selectList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<DeptVO> list = new ArrayList<DeptVO>();
		
		String sql = "select * from dept";
		
		try {
			
			conn = DBService.getInstance().getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				DeptVO vo = new DeptVO();
				vo.setDeptno(rs.getInt("deptno"));
				vo.setDname(rs.getString("dname"));
				vo.setLoc(rs.getString("loc"));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		
		return list;
	}

}
