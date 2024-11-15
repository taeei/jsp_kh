package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;


@WebServlet("/sawon_update.do")
public class SawonUpdAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int sabun = Integer.parseInt(request.getParameter("sabun"));
		int deptno = Integer.parseInt(request.getParameter("deptno"));
		int samgr = Integer.parseInt(request.getParameter("samgr"));
		int sapay = Integer.parseInt(request.getParameter("sapay"));
		String saname = request.getParameter("saname");
		String sagen = request.getParameter("sagen");
		String sajob = request.getParameter("sajob");
		String sahire = request.getParameter("sahire");
		
		SawonVO vo = new SawonVO();
		vo.setSabun(sabun);
		vo.setDeptno(deptno);
		vo.setSamgr(samgr);
		vo.setSapay(sapay);
		vo.setSaname(saname);
		vo.setSagen(sagen);
		vo.setSajob(sajob);
		vo.setSahire(sahire);
		
		int res = SawonDAO.getInstance().updateSawon(vo);
		
		String str = "fail";
		if( res > 0 ) {
			str = "succ";
		}
		
		String result = String.format("[{'param':'%s'}]", str);
		response.getWriter().println(result);
		
		
	}

}
