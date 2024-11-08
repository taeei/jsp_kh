package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;


@WebServlet("/updSearch.do")
public class MemberUpdateAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		MemberVO vo = MemberDAO.getInstance().selectOne(idx);
		
		//vo를 request영역에 바인딩
		request.setAttribute("vo", vo);
		
		//포워딩
		RequestDispatcher disp = request.getRequestDispatcher("member_modify_form.jsp");
		disp.forward(request, response);
	}

}
