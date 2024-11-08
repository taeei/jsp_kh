package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;


@WebServlet("/check_id.do")
public class MemberCheckIdAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//check_id.do?id=one
		String id = request.getParameter("id");
		
		//id가 DB에 존재하지는 않는지 확인 
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String result = "";
		int res = 0;
		
		if( vo == null ) {
			// 가입이 가능한 상태 
			// DAO에서 중복된 아이디가 없으면 null 값 반환
			res = 1;
			result = String.format("[{'r':'%d'}, {'res':'은 가입 가능합니다'}, {'id':'%s'}]", res, id);
			
		}else {
			// 아이디가 중복된 상태 
			result = String.format("[{'r':'%d'}, {'res':'은 가입 불가'}, {'id':'%s'}]", res, id);
		}
		
		//json구조에 한글이 포함되어 있으면 콜백으로 전달될 때 깨져서
		//넘어가므로 이를 방지하기 위해 utf-8세팅이 필요함
		response.setContentType("text/plain;charset=UTF-8");
		
		//콜백메서드로 결과 전달
		response.getWriter().println(result);
	}

}
