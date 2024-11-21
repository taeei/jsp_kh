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

import common.Common;
import dao.CommentDAO;
import util.PagingComment;
import vo.CommentVO;

@WebServlet("/comment_list.do")
public class CommListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//댓글 페이징 처리를 위한 변수
		int nowPage = 1;
		String page = request.getParameter("page");
		if( page != null && !page.isEmpty() ) {
			nowPage = Integer.parseInt(page);
		}
		
		int start = (nowPage - 1) * Common.Comment.BLOCKLIST + 1;
		int end = start + Common.Comment.BLOCKLIST - 1;
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		//댓글 페이지를 위한 변수를 map에 저장
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("idx", idx);
		map.put("start", start);
		map.put("end", end);
				
		List<CommentVO> list = CommentDAO.getInstance().selectList(map);
		
		int row_total = CommentDAO.getInstance().getRowTotal(idx);
		//System.out.println( "댓글 수 : " + row_total);
		
		String pageMenu = 
				PagingComment.getPaging(
							"comment_list.do", 
							nowPage, 
							row_total, 
							Common.Comment.BLOCKLIST, 
							Common.Comment.BLOCKPAGE);
		
		request.setAttribute("list", list);
		request.setAttribute("pageMenu", pageMenu);
		
		RequestDispatcher disp =
				request.getRequestDispatcher("comment_list.jsp");
		disp.forward(request, response);
		
	}

}
