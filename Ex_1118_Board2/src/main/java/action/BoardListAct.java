package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Common;
import dao.BoardDAO;
import util.Paging;
import vo.BoardVO;

/**
 * Servlet implementation class BoardListAct
 */
@WebServlet("/list.do")
public class BoardListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");
		
		//list.do?page=1
		//list.do? <--- null
		//list.do?page= <--- empty
		//정상적으로 파라미터가 넘어오면 페이지 지정
		int nowPage = 1;	
		String page = request.getParameter("page");
		if( page != null && !page.isEmpty() ){
			nowPage = Integer.parseInt(page);
		}
		
		//한 페이지에 표시할 게시글의 시작과 끝번호 계산
		//1page = 1부터 시작 ~ 10
		//2page = 11부터 시작 ~ 20
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;
		
		//start와 end를 map에 저장
		//vo에 없고 묶어서 보내야 할 경우 map사용
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		//검색어 관련 
		if( search != null && !search.equals("all") ) {
			switch( search ) {
			case "name_subject_content":
				map.put("name", search_text);
				map.put("subject", search_text);
				map.put("content", search_text);
				break;
				
			case "name":
				map.put("name", search_text);
				break;
				
			case "subject": 
				map.put("subject", search_text);
				break;
				
			case "content": 
				map.put("content", search_text);
				break;
			}//switch
		}
	
		
		//전체 게시글 조회
		List<BoardVO> list = null; 
		BoardDAO dao = BoardDAO.getInstance();
		list = dao.selectList( map );
	
		//전체 게시글 수. 검색된 리스트의 paging처리를 다시 해야되기 때문에 map을 보냄
		int row_total = dao.getRowTotal( map );
		
		String search_param = String.format(
				"search=%s&search_text=%s",	search, search_text);
		
		//페이지 메뉴 생성
		String pageMenu = Paging.getPaging(
				"list.do", nowPage, row_total,
				search_param,
				Common.Board.BLOCKLIST,
				Common.Board.BLOCKPAGE );
		
		
		
		//list를 바인딩
		request.setAttribute("list", list);
		//페이지 메뉴 바인딩
		request.setAttribute("pageMenu", pageMenu);
		
		//조회수 기록을 위해 세션에 저장해뒀던 show정보를 없앤다
		HttpSession session = request.getSession();
		session.removeAttribute("show");
		
		RequestDispatcher disp = 
				request.getRequestDispatcher("board_list.jsp");
		disp.forward(request, response);
		
	}

}



