package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;


@WebServlet("/updateFin.do")
public class MemberModifyAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		
		MemberVO vo = new MemberVO();
		vo.setIdx(idx);
		vo.setName(name);
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setEmail(email);
		vo.setAddr(addr);
		
		int res = MemberDAO.getInstance().update(vo);
		
		String str = "fail";
		if( res > 0 ) {
			str = "succ";
		}
		
		String result = String.format("[{'param':'%s'}, {'id':'%s'}]", str, id);
		response.getWriter().println(result);
		
		//response.sendRedirect("member_list.do");
	}

}
