package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.PhotoDAO;
import vo.PhotoVO;


@WebServlet("/insert.do")
public class PhotoInsertAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String web_path = "/upload/";
		
		ServletContext application = request.getServletContext();
		
		//상대경로 -> 절대경로
		String path = application.getRealPath(web_path);
		System.out.println("절대경로: " + path);
		
		int max_size = 1024 * 1024 * 100;
		
		MultipartRequest mr = 
				new MultipartRequest(
						request, 
						path,
						max_size,
						"utf-8",
						new DefaultFileRenamePolicy());
		
		String filename = "no_file";
		
		File f = mr.getFile("photo");

		if( f != null ) {
			filename = f.getName();
			System.out.println(filename);
		}
		
		String title = mr.getParameter("title");
		String pwd = mr.getParameter("pwd");
		//ip는 request로 호출
		String ip = request.getRemoteAddr();
		
		PhotoVO vo = new PhotoVO();
		vo.setTitle(title);
		vo.setFilename(filename);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		request.setAttribute("vo", vo);
		
		int res = PhotoDAO.getInstance().insert(vo);
		
		response.sendRedirect("list.do");
		
	}

}
