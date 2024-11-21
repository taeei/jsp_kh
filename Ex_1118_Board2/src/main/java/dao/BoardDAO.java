package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BoardVO;

public class BoardDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static BoardDAO single = null;

	public static BoardDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new BoardDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	public BoardDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}
	
	//전체 게시글 조회
	public List<BoardVO> selectList( Map<String, Object> map ){
		
		SqlSession sqlSession = factory.openSession();
		List<BoardVO> list = sqlSession.selectList("b.board_list", map);
		sqlSession.close();
		
		return list;
	}
	
	//새 글 등록
	public int insert( BoardVO vo ) {
		SqlSession sqlSession = factory.openSession();
		int res = sqlSession.insert("b.board_insert", vo);
		sqlSession.commit();
		sqlSession.close();
		
		return res;
	}
	
	//상세보기를 위한 게시글 조회
	public BoardVO selectOne( int idx ) {

		SqlSession sqlSession = factory.openSession();
		BoardVO vo = sqlSession.selectOne("b.board_one", idx);
		sqlSession.close();
		
		return vo;
		
	}
	
	//조회수 증가
	public int update_readhit( int idx ) {
		SqlSession sqlSession = factory.openSession();
		int res = sqlSession.update("b.board_update_readhit", idx);
		sqlSession.commit();
		sqlSession.close();
		
		return res;
	}
	
	//댓글 처리를 위한 step + 1
	public int update_step( BoardVO baseVO ) {
		SqlSession sqlSession = factory.openSession();
		int res = sqlSession.update("b.board_update_step", baseVO);
		sqlSession.commit();
		sqlSession.close();
		
		return res;
	}
	
	//댓글등록
	public int reply(BoardVO vo) {
		SqlSession sqlSession = factory.openSession();
		int res = sqlSession.insert("b.board_reply", vo);
		sqlSession.commit();
		sqlSession.close();
		
		return res;
	}
	
	//삭제(된 것 처럼 업데이트)
	public int del_update( int idx ) {
		SqlSession sqlSession = factory.openSession();
		int res = sqlSession.update("b.board_del_update", idx);
		sqlSession.commit();
		sqlSession.close();
		return res;
	}
	
	
	//게시판의 전체 게시글 수
	public int getRowTotal( Map<String, Object> map ) {
		SqlSession sqlSession = factory.openSession();
		int cnt = sqlSession.selectOne("b.board_count", map);
		
		sqlSession.close();
		return cnt;
	}
	
	//게시글 수정
	public int modify(BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.update("b.modify", vo);
		sqlSession.close();
		
		return res;
	}
}


















































