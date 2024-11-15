package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import vo.CartVO;


@WebServlet("/cart_list.do")
public class CartListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//cart_insert.do?idx=4
		int m_idx = 1; //1번 회원이 로그인 한 상태라고 가정
		
		//회원별 장바구니 조회
		List<CartVO> list = CartDAO.getInstance().select(m_idx);
		
		//장바구니 총 합
		int total_amount = 
				CartDAO.getInstance().selectTotalAmount(m_idx);
		
		request.setAttribute("list", list);
		request.setAttribute("total_amount", total_amount);
		
		RequestDispatcher disp = 
				request.getRequestDispatcher("cartList.jsp");
		disp.forward(request, response);
		
	}

}
