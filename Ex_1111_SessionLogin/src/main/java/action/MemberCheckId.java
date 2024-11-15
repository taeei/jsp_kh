package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;


@WebServlet("/login.do")
public class MemberCheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String result = "";
		int res = 0;
		if( vo != null ) {
			// 중복된 아이디 있음 로그인 가능
			
			if( vo.getPwd().equals(pwd) ) {
				//비밀번호 일치
				res=1;
				result = String.format("[{'r':'%d'}]", res);
				
				//로그인 성공
				//유저 정보(vo)를 세션스코프에 저장(바인딩)
				//세션은 서버의 메모리(ram)을 사용하기 때문에 많이 사용할 수록 브라우저를
				//느리게 만들고 그에따른 비용 상승을 유발하기 때문에 꼭 필요한 곳에서만
				//사용해야 한다!
				HttpSession session = request.getSession();
				session.setAttribute("user", vo);
				
				//세션 유지시간(기본 30분) -> 1시간으로 변경
				session.setMaxInactiveInterval( 3600 );
				
			}else {
				//비밀번호 일치 x
				res=2;
				result = String.format("[{'r':'%d'}]", res);
			}
			
		}else {
			// 중복된 아이디 x 로그인 불가능
			result = String.format("[{'r':'%d'}]", res);
		}
		
		response.getWriter().println(result);
		
	}

}
