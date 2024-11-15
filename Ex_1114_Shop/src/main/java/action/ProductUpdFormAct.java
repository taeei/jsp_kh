package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import vo.ProductVO;


@WebServlet("/updForm.do")
public class ProductUpdFormAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		ProductVO vo = ProductDAO.getInstance().updOne(idx);
		
		request.setAttribute("vo", vo);
		
		RequestDispatcher disp =
				request.getRequestDispatcher("updateForm.jsp");
		disp.forward(request, response);
		
	}

}
