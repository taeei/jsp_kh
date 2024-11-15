package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.DeptVO;

public class DeptDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DeptDAO single = null;

	public static DeptDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DeptDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	private DeptDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	//전체 부서 가져오기
	public List<DeptVO> select(){
		SqlSession sqlSession = factory.openSession();
		List<DeptVO> list = sqlSession.selectList("dept.dept_list");
		sqlSession.close();
		
		return list;
	}
	
	//검색된 부서 가져오기
	public List<DeptVO> search(String dname){
		SqlSession sqlSession = factory.openSession();
		List<DeptVO> list = sqlSession.selectList("dept.search_dname", dname);
		sqlSession.close();
		
		return list;
	}
}
