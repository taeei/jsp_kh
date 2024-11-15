package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import vo.CartVO;

@WebServlet("/cart_update.do")
public class CartUpdAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//cart_update.do?c_idx=1&c_cnt=1
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		int c_cnt = Integer.parseInt(request.getParameter("c_cnt"));
		
		CartVO vo = new CartVO();
		vo.setC_idx(c_idx);
		vo.setC_cnt(c_cnt);
	
		int res = CartDAO.getInstance().update_cnt(vo);
		
		//위에서 수정한 결과를 통해 총계를 새로 구해야 하므로
		//cart_list.do를 호출한다
		response.sendRedirect("cart_list.do");
		
	}

}
