package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;

@WebServlet("/cart_delete.do")
public class CartDelAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		//int m_idx = 1; //현재 로그인 된 유저의 일련번호
		
		int res = CartDAO.getInstance().delete(c_idx);
		
		//로그인 되어있는 회원번호로 장바구니 목록 조회
		response.sendRedirect("cart_list.do");
		
	}

}
