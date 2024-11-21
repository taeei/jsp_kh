package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;


@WebServlet("/modify.do")
public class BoardModifyAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String subject = request.getParameter("subject");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		
		
		BoardVO vo = new BoardVO();
		vo.setIdx(idx);
		vo.setSubject(subject);
		vo.setName(name);
		vo.setContent(content);
		
		int res = BoardDAO.getInstance().modify(vo);
		
		String str = "fail";
		
		if( res == 1 ) {
			str = "succ";
		}
		
		String result = String.format("[{'param':'%s'}]", str);
		response.getWriter().println(result);
	}

}
