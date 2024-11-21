package action;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardReplyAct
 */
@WebServlet("/reply.do")
public class BoardReplyAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String page = request.getParameter("page");
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");

		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String ip = request.getRemoteAddr();
		
		if( ip.equals("192.168.0.15") || 
				ip.equals("192.168.0.18") || 
				ip.equals("192.168.0.22")) {
			return;
		}
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//기준글의 idx를 이용하여 게시글 정보 얻어오기
		BoardVO baseVO = dao.selectOne(idx);
		
		//기준글의 step보다 큰 값을 +1처리
		int res = dao.update_step(baseVO);
		
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		vo.setRef( baseVO.getRef() );
		vo.setStep( baseVO.getStep() + 1 );
		vo.setDepth( baseVO.getDepth() + 1 );
		
		//댓글 등록
		res = dao.reply(vo);
		
		String encode = URLEncoder.encode(search_text, "UTF-8");
		response.sendRedirect("list.do?page="+page+"&search="+search+"&search_text="+encode);
	}

}





