package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhotoDAO;
import vo.PhotoVO;


@WebServlet("/delete.do")
public class PhotoDelAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		// 파일명만 가져오기
		String filename = PhotoDAO.getInstance().selectOne(idx).getFilename();
	
		String web_path = "/upload";
		ServletContext app = request.getServletContext();
		String path = app.getRealPath(web_path);
		
		//삭제 ( res=0 : 지우기 실패, res=1 : 지우기 성공 )
		int res = PhotoDAO.getInstance().delete(idx);
		
		String param="no";
		if( res > 0  ) {
			//지우기 성공
			// 절대경로와 지우고싶은 파일명까지 확인
			File f = new File(path, filename);
			if( f.exists() ) {
				//물리적으로 경로가 존재 시 if문으로 들어옴
				f.delete(); // path경로의 파일을 삭제
				
			}
			
			param="yes";
		}
		
		String resultStr = String.format("[{'param':'%s'}]", param);
		response.getWriter().println(resultStr);
		
	}

}


