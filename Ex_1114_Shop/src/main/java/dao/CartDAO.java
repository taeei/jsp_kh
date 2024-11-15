package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CartVO;

public class CartDAO {
	
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static CartDAO single = null;

	public static CartDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new CartDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	private CartDAO() {
		factory = MyBatisConnector.getInstance().getFactory();
	}

	//회원별 장바구니 목록
	public List<CartVO> select( int m_idx ){
		SqlSession sqlSession = factory.openSession();
		List<CartVO> list = sqlSession.selectList("c.cart_list", m_idx);
		sqlSession.close();
		
		return list;
	}
	
	//회원별 장바구니 상품의 총 합
	public int selectTotalAmount( int m_idx ) {
		SqlSession sqlSession = factory.openSession();
		int total = sqlSession.selectOne("c.cart_total_amount", m_idx);
		sqlSession.close();
		
		return total;
	}
	
	//장바구니 상품 수량 변경
	public int update_cnt( CartVO vo ) {
		SqlSession sqlSession = factory.openSession();
		int res = sqlSession.update("c.cart_cnt_upd", vo);
		sqlSession.commit();
		sqlSession.close();
		
		return res;
	}
}
