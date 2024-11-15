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

@WebServlet("/login.do")
public class LoginCheckIdAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String param = "";
		String result = "";
		
		// 아이디가 없는 경우
		if( vo == null ) {
			param = "no_id";
			result = String.format("[{'param':'%s'}]", param);
			response.getWriter().println(result);
			return;
		}

		// 아이디 o, 비밀번호 불일치
		if( !vo.getPwd().equals(pwd) ) {
			param = "no_pwd";
			result = String.format("[{'param':'%s'}]", param);
			response.getWriter().println(result);
			return;
		}
		
		// 아이디 o, 비밀번호 일치
		param = "clear";
		result = String.format("[{'param':'%s'}]", param);
		response.getWriter().println(result);
		
		request.setAttribute("vo", vo);
		RequestDispatcher disp = 
				request.getRequestDispatcher("list.do");
		disp.forward(request, response);
	}

}
