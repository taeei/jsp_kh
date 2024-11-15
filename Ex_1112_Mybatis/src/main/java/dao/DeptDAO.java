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
	
	//전체목록 가져오기
	public List<DeptVO> select() {
		
		//factory를 통해서 처리객체 얻어온다.
		SqlSession sqlSession = factory.openSession();
		// namespace가 dept, id가 dept_list인 mapper로 접근
		List<DeptVO> list = sqlSession.selectList("dept.dept_list");
		
		//사용한 DB접근 객체는 닫아준다
		sqlSession.close();
		
		return list;
	}
}
