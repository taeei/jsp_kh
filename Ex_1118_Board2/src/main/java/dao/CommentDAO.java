package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CommentVO;

public class CommentDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static CommentDAO single = null;

	public static CommentDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new CommentDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	public CommentDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	//댓글 조회
	public List<CommentVO> selectList( Map<String, Integer> map ){
		SqlSession sqlSession = factory.openSession();
		List<CommentVO> list = sqlSession.selectList("c.comment_list_page", map);
		sqlSession.close();
		
		return list;
	}
	
	//댓글 갯수
	public int getRowTotal( int idx ) {
		SqlSession sqlSession = factory.openSession();
		int cnt = sqlSession.selectOne("c.comment_idx_count", idx);
		sqlSession.close();
		
		return cnt;
	}
	
	//댓글 추가
	public int insert(CommentVO vo)	{
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("c.comment_insert", vo);
		sqlSession.close();
		
		return res;
	}
	
	//댓글 삭제
	public int delete(int c_idx) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.delete("c.comment_delete", c_idx);
		sqlSession.close();
		
		return res;
	}
	
	

}
