package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.SawonVO;

public class SawonDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;

	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	private SawonDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	//전체 사원 조회
	public List<SawonVO> selectSawon(){
		SqlSession sqlSession = factory.openSession();
		List<SawonVO> list = sqlSession.selectList("sawon.sawon_list");
		
		sqlSession.close();
		
		return list;
	}
	
	//사원 한 명 조회
	public SawonVO selectSawon(int sabun) {
		SqlSession sqlSession = factory.openSession();
		//mapper에게 보내고 싶은 데이터 입력. 여러개 보내기 불가능
		SawonVO vo = sqlSession.selectOne("sawon.one_sawon", sabun);
			
		sqlSession.close();
		return vo;
	}
	
	//사원 추가
	public int insertSawon(SawonVO vo) {
		SqlSession sqlSession = factory.openSession(true); 
		
		//쿼리
		int cnt = sqlSession.insert("sawon.insert_sawon", vo);
		
		//sqlSession.commit(); 을 사용하거나 factory.openSession(true); 사용
		sqlSession.close();
		
		return cnt;
		
	}
	
	//사원 삭제
	public int deleteSawon(int sabun) {
		SqlSession sqlSession = factory.openSession(true);
		
		int cnt = sqlSession.delete("sawon.delete_sawon", sabun);
		
		sqlSession.close();
		return cnt;
	}
	
	//사원 수정
	public int updateSawon(SawonVO vo) {
		SqlSession sqlSession = factory.openSession(true);

		int cnt = sqlSession.update("sawon.update_sawon", vo);

		sqlSession.close();
		return cnt;
	}
	
	//부서별 사원 조회
	public List<SawonVO> selectSawonDept(int deptno){
		SqlSession sqlSession = factory.openSession();
		List<SawonVO> list = sqlSession.selectList("sawon.list_deptno", deptno);
		sqlSession.close();
		
		return list;
	}
	
}
